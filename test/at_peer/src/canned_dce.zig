//! Minimal **DCE** smoke loop: **`readLine`** → canned **`writeRaw`** replies for host
//! **`dte_loopback`** / **`dte_serial_host`** (see `embed-zig` `lib/at/test_runner`).
//!
//! Kept in this firmware test app — not in `lib/at` — same idea as other ESP sample apps
//! keeping board-specific behavior next to `esp_main.zig`.

const at = @import("at");

pub const RunForeverError = error{OutOfMemory} || at.Transport.WriteError;

/// Block forever. Line buffer size matches **`at.Peer.max_line_len`** (256); raise that constant
/// in embed-zig if host and DCE must agree on a larger cap.
pub fn runForever(comptime lib: type, peer: anytype) RunForeverError!void {
    var line_buf: [at.Peer.max_line_len]u8 = undefined;
    var out: [256]u8 = undefined;

    while (true) {
        const body = peer.readLine(&line_buf, .{ .trim_spaces = true }) catch |err| {
            switch (err) {
                error.OutTooSmall, error.LineTooLong => peer.clearReader(),
                else => {},
            }
            continue;
        };
        if (body.len == 0) continue;

        const n: usize = blk: {
            if (lib.mem.startsWith(u8, body, "AT+CSQ")) {
                const msg = "+CSQ: 99,99\r\nOK\r\n";
                if (out.len < msg.len) return error.OutOfMemory;
                @memcpy(out[0..msg.len], msg);
                break :blk msg.len;
            }
            if (lib.mem.startsWith(u8, body, "AT+CGMR")) {
                const msg = "+CGMR: HVVDCE\r\nOK\r\n";
                if (out.len < msg.len) return error.OutOfMemory;
                @memcpy(out[0..msg.len], msg);
                break :blk msg.len;
            }
            if (lib.mem.startsWith(u8, body, "AT")) {
                if (!lib.mem.eql(u8, body, "AT")) {
                    const e = "ERROR\r\n";
                    if (out.len < e.len) return error.OutOfMemory;
                    @memcpy(out[0..e.len], e);
                    break :blk e.len;
                }
                const ok = "OK\r\n";
                if (out.len < ok.len) return error.OutOfMemory;
                @memcpy(out[0..ok.len], ok);
                break :blk ok.len;
            }
            const e = "ERROR\r\n";
            if (out.len < e.len) return error.OutOfMemory;
            @memcpy(out[0..e.len], e);
            break :blk e.len;
        };

        try peer.writeRaw(out[0..n]);
    }
}
