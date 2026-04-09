//! **DCE** AT smoke firmware: **`AtStream`** → **`at.Peer.Config.with`** + **`at.Peer.init`**, then
//! **`canned_dce.runForever`** (see `canned_dce.zig`).
//!
//! - `-Dat_transport=usb` (default): USB Serial/JTAG console.
//! - `-Dat_transport=uart1`: UART1 @ 115200, TX GPIO17 / RX GPIO18.
//! Host: embed-zig **`dte_serial_host`**.

const at = @import("at");
const at_peer_options = @import("at_peer_options");
const esp_embed = @import("esp_embed");
const canned_dce = @import("canned_dce.zig");
const std = esp_embed.std;

const Thread = std.Thread;
const idle_poll_ns: u64 = 1 * std.time.ns_per_ms;
const uart_poll_ns: u64 = 1 * std.time.ns_per_ms;

const use_uart1 = at_peer_options.use_uart1;

const AtPeer = at.Peer.make(esp_embed.std);

export fn zig_esp_main() callconv(.c) void {
    if (use_uart1) {
        if (at_peer_uart1_init() != 0) {
            std.log.scoped(.at_peer).err("UART1 init failed (GPIO17 TX / GPIO18 RX)", .{});
            @panic("at_peer uart1");
        }
    }

    responderMain() catch |err| {
        std.log.scoped(.at_peer).err("responder failed: {s}", .{@errorName(err)});
        @panic("at_peer");
    };
}

extern fn at_peer_uart1_init() callconv(.c) i32;

const stdin_fd: std.posix.fd_t = 0;
const stdout_fd: std.posix.fd_t = 1;

const uart_num: c_int = 1;
const portMAX_DELAY: u32 = 0xffff_ffff;

extern fn uart_read_bytes(uart_num_param: c_int, buf: [*]u8, length: u32, ticks_to_wait: u32) callconv(.c) c_int;
extern fn uart_write_bytes(uart_num_param: c_int, src: [*]const u8, length: usize) callconv(.c) c_int;
extern fn uart_flush_input(uart_num_param: c_int) callconv(.c) c_int;

const AtStream = struct {
    mode: enum { usb, uart1 },
    read_deadline_ns: ?i64 = null,
    write_deadline_ns: ?i64 = null,

    fn init() AtStream {
        return .{ .mode = if (use_uart1) .uart1 else .usb };
    }

    fn readPastDeadline(self: *const AtStream) bool {
        const d = self.read_deadline_ns orelse return false;
        return std.time.milliTimestamp() * 1_000_000 > d;
    }

    fn writePastDeadline(self: *const AtStream) bool {
        const d = self.write_deadline_ns orelse return false;
        return std.time.milliTimestamp() * 1_000_000 > d;
    }

    pub fn read(self: *AtStream, buf: []u8) at.Transport.ReadError!usize {
        switch (self.mode) {
            .uart1 => return readUart(self, buf),
            .usb => return readUsb(self, buf),
        }
    }

    fn readUart(self: *AtStream, buf: []u8) at.Transport.ReadError!usize {
        if (buf.len == 0) return 0;
        if (self.read_deadline_ns == null) {
            const n = uart_read_bytes(uart_num, buf.ptr, @intCast(buf.len), portMAX_DELAY);
            if (n < 0) return error.HwError;
            if (n == 0) return error.Unexpected;
            return @intCast(n);
        }
        while (!self.readPastDeadline()) {
            const n = uart_read_bytes(uart_num, buf.ptr, @intCast(buf.len), 0);
            if (n < 0) return error.HwError;
            if (n > 0) return @intCast(n);
            Thread.sleep(uart_poll_ns);
        }
        return error.Timeout;
    }

    fn readUsb(self: *AtStream, buf: []u8) at.Transport.ReadError!usize {
        if (buf.len == 0) return 0;
        while (true) {
            if (self.readPastDeadline()) return error.Timeout;
            const rd = std.posix.read(stdin_fd, buf) catch |err| switch (err) {
                error.WouldBlock => {
                    Thread.sleep(idle_poll_ns);
                    continue;
                },
                else => return error.Unexpected,
            };
            if (rd == 0) {
                Thread.sleep(idle_poll_ns);
                continue;
            }
            return rd;
        }
    }

    pub fn write(self: *AtStream, data: []const u8) at.Transport.WriteError!usize {
        switch (self.mode) {
            .uart1 => return writeUart(self, data),
            .usb => return writeUsb(self, data),
        }
    }

    fn writeUart(self: *AtStream, data: []const u8) at.Transport.WriteError!usize {
        var off: usize = 0;
        while (off < data.len) {
            if (self.writePastDeadline()) return error.Timeout;
            const n = uart_write_bytes(uart_num, data.ptr + off, data.len - off);
            if (n < 0) return error.HwError;
            if (n == 0) return error.Unexpected;
            off += @intCast(n);
        }
        return data.len;
    }

    fn writeUsb(self: *AtStream, data: []const u8) at.Transport.WriteError!usize {
        var off: usize = 0;
        while (off < data.len) {
            if (self.writePastDeadline()) return error.Timeout;
            const n = std.posix.write(stdout_fd, data[off..]) catch |err| switch (err) {
                error.WouldBlock => {
                    Thread.sleep(idle_poll_ns);
                    continue;
                },
                else => return error.Unexpected,
            };
            if (n == 0) return error.Unexpected;
            off += n;
        }
        return data.len;
    }

    pub fn flushRx(self: *AtStream) void {
        switch (self.mode) {
            .uart1 => _ = uart_flush_input(uart_num),
            .usb => {},
        }
    }

    pub fn reset(self: *AtStream) void {
        _ = self;
    }

    pub fn deinit(self: *AtStream) void {
        _ = self;
    }

    pub fn setReadDeadline(self: *AtStream, deadline_ns: ?i64) void {
        self.read_deadline_ns = deadline_ns;
    }

    pub fn setWriteDeadline(self: *AtStream, deadline_ns: ?i64) void {
        self.write_deadline_ns = deadline_ns;
    }
};

fn responderMain() !void {
    var stream = AtStream.init();
    var peer_cfg = AtPeer.Config.with(&stream);
    peer_cfg.append_crlf = false;
    peer_cfg.transport_read_timeout_ms = 120_000;
    peer_cfg.transport_write_timeout_ms = 10_000;
    peer_cfg.command_timeout_ms = 120_000;
    var peer = AtPeer.init(peer_cfg);

    if (use_uart1) {
        std.log.scoped(.at_peer).info("AT peer + canned_dce: UART1 115200 (TX17/RX18); logs on USB", .{});
    } else {
        std.log.scoped(.at_peer).info("AT peer + canned_dce: USB console; pairs with dte_serial_host", .{});
    }

    try canned_dce.runForever(esp_embed.std, &peer);
}
