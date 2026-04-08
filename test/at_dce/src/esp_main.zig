//! Minimal **AT DCE**: read lines (`\n`-terminated), reply like a modem.
//! - `-Dat_transport=usb` (default): stdin/stdout (USB Serial/JTAG console on DevKit).
//! - `-Dat_transport=uart1`: UART1 @ 115200, TX GPIO17 / RX GPIO18 (DevKitC-1 style).
//! Pairs with **embed-zig** host test `integration_tests/at/dte_serial_host` (POSIX serial).

const at_dce_options = @import("at_dce_options");
const esp_embed = @import("esp_embed");
const std = esp_embed.std;
const Dce = @import("at").Dce;

const Thread = std.Thread;
const idle_poll_ns: u64 = 1 * std.time.ns_per_ms;

const use_uart1 = at_dce_options.use_uart1;

export fn zig_esp_main() callconv(.c) void {
    if (use_uart1) {
        if (at_dce_uart1_init() != 0) {
            std.log.scoped(.at_dce).err("UART1 init failed (GPIO17 TX / GPIO18 RX)", .{});
            @panic("at_dce uart1");
        }
    }

    dceLoop() catch |err| {
        std.log.scoped(.at_dce).err("dce loop failed: {s}", .{@errorName(err)});
        @panic("at_dce");
    };
}

extern fn at_dce_uart1_init() callconv(.c) i32;

const stdin_fd: std.posix.fd_t = 0;
const stdout_fd: std.posix.fd_t = 1;

const uart_num: c_int = 1;
const portMAX_DELAY: u32 = 0xffff_ffff;

extern fn uart_read_bytes(uart_num_param: c_int, buf: [*]u8, length: u32, ticks_to_wait: u32) callconv(.c) c_int;
extern fn uart_write_bytes(uart_num_param: c_int, src: [*]const u8, length: usize) callconv(.c) c_int;

fn readAtByte() !u8 {
    if (use_uart1) {
        var one: [1]u8 = undefined;
        const n = uart_read_bytes(uart_num, &one, 1, portMAX_DELAY);
        if (n < 0) return error.UartRead;
        if (n == 0) return error.UartRead;
        return one[0];
    }
    while (true) {
        var one: [1]u8 = undefined;
        const rd = std.posix.read(stdin_fd, &one) catch |err| switch (err) {
            error.WouldBlock => {
                Thread.sleep(idle_poll_ns);
                continue;
            },
            else => |e| return e,
        };
        if (rd == 0) continue;
        return one[0];
    }
}

fn writeAtAll(data: []const u8) !void {
    if (use_uart1) {
        var off: usize = 0;
        while (off < data.len) {
            const n = uart_write_bytes(uart_num, data.ptr + off, data.len - off);
            if (n < 0) return error.UartWrite;
            if (n == 0) return error.InputOutput;
            off += @intCast(n);
        }
        return;
    }
    var off: usize = 0;
    while (off < data.len) {
        const n = std.posix.write(stdout_fd, data[off..]) catch |err| switch (err) {
            error.WouldBlock => {
                Thread.sleep(idle_poll_ns);
                continue;
            },
            else => |e| return e,
        };
        if (n == 0) return error.InputOutput;
        off += n;
    }
}

fn dceLoop() !void {
    var line: [256]u8 = undefined;
    var len: usize = 0;

    if (use_uart1) {
        std.log.scoped(.at_dce).info("AT DCE on UART1 115200 (TX GPIO17, RX GPIO18); log still on USB console", .{});
    } else {
        std.log.scoped(.at_dce).info("AT DCE on stdin/stdout (USB console); matches embed-zig dte_serial_host", .{});
    }

    while (true) {
        const byte = try readAtByte();

        if (byte == '\r') continue;
        if (byte == '\n') {
            try dispatchLine(line[0..len]);
            len = 0;
        } else if (len < line.len) {
            line[len] = byte;
            len += 1;
        } else {
            len = 0;
        }
    }
}

const Handlers = struct {
    /// Only exact `AT` (after Dce trim) is OK; longer `AT…` lines get ERROR here.
    fn bareAt(_: ?*anyopaque, line: []const u8, o: []u8) error{OutTooSmall}!usize {
        if (!std.mem.eql(u8, line, "AT")) {
            return Dce.respondCopy(null, "", o, "ERROR\r\n");
        }
        return Dce.respondCopy(null, "", o, "OK\r\n");
    }
    fn csq(_: ?*anyopaque, _: []const u8, o: []u8) error{OutTooSmall}!usize {
        const msg = "+CSQ: 99,99\r\nOK\r\n";
        if (o.len < msg.len) return error.OutTooSmall;
        @memcpy(o[0..msg.len], msg);
        return msg.len;
    }
    fn defaultErr(_: ?*anyopaque, _: []const u8, o: []u8) error{OutTooSmall}!usize {
        return Dce.respondCopy(null, "", o, "ERROR\r\n");
    }
};

const command_table = [_]Dce.CommandEntry{
    .{ .prefix = "AT+CSQ", .respond = Handlers.csq },
    .{ .prefix = "AT", .respond = Handlers.bareAt },
};

fn dispatchLine(raw: []const u8) !void {
    if (trimWs(raw).len == 0) return;

    var out: [256]u8 = undefined;
    const n = Dce.handleLine(&command_table, raw, &out, .{
        .default_respond = Handlers.defaultErr,
    }) catch |err| switch (err) {
        error.OutTooSmall => return error.OutOfMemory,
        error.NoMatchingPrefix => unreachable,
    };
    try writeAtAll(out[0..n]);
}

fn trimWs(s: []const u8) []const u8 {
    var a: usize = 0;
    var b = s.len;
    while (a < b and (s[a] == ' ' or s[a] == '\t')) a += 1;
    while (b > a and (s[b - 1] == ' ' or s[b - 1] == '\t')) b -= 1;
    return s[a..b];
}
