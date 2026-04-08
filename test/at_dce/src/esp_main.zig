//! Minimal **AT DCE** for USB-CDC / VFS console: read lines (`\n`-terminated), reply like a modem.
//! Pairs with **embed-zig** host test `integration_tests/at/dte_serial_host` (Mac DTE).

const esp_embed = @import("esp_embed");
const std = esp_embed.std;
const Dce = @import("at").Dce;

const Thread = std.Thread;
const idle_poll_ns: u64 = 1 * std.time.ns_per_ms;

export fn zig_esp_main() callconv(.c) void {
    dceLoop() catch |err| {
        std.log.scoped(.at_dce).err("dce loop failed: {s}", .{@errorName(err)});
        @panic("at_dce");
    };
}

const stdin_fd: std.posix.fd_t = 0;
const stdout_fd: std.posix.fd_t = 1;

fn dceLoop() !void {
    var line: [256]u8 = undefined;
    var len: usize = 0;

    std.log.scoped(.at_dce).info("AT DCE ready (lines end with LF); matches embed-zig dte_serial_host", .{});

    while (true) {
        var one: [1]u8 = undefined;
        const n = std.posix.read(stdin_fd, &one) catch |err| switch (err) {
            error.WouldBlock => {
                Thread.sleep(idle_poll_ns);
                continue;
            },
            else => |e| return e,
        };
        if (n == 0) continue;
        const byte = one[0];

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
    try writeStdoutAll(out[0..n]);
}

fn writeStdoutAll(data: []const u8) std.posix.WriteError!void {
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

fn trimWs(s: []const u8) []const u8 {
    var a: usize = 0;
    var b = s.len;
    while (a < b and (s[a] == ' ' or s[a] == '\t')) a += 1;
    while (b > a and (s[b - 1] == ' ' or s[b - 1] == '\t')) b -= 1;
    return s[a..b];
}
