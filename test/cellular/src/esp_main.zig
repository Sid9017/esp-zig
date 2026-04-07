//! H106 TIGA V4 cellular smoke over ESP-IDF UART — `cellular.test_runner.modem.runSmoke` (single linear flow).
//! GPIO6 = codec enable (modem DTR path); GPIO12 = MODEM_ENABLE; UART1 TX17/RX18 @ 115200.

const esp_embed = @import("esp_embed");
const cellular = @import("cellular");

const app_log = esp_embed.std.log.scoped(.cellular_test);

/// `BSP_GPIO_AUDIO_CODEC_ENABLE` — must be high for modem AT RX on TIGA V4.
const modem_codec_enable_gpio: i32 = 6;
const modem_enable_gpio: i32 = 12;
const modem_uart_tx_gpio: i32 = 17;
const modem_uart_rx_gpio: i32 = 18;
const modem_uart_baud: u32 = 115200;
const modem_boot_wait_ms: u32 = 2500;
const at_buf_size = 2048;

extern fn espz_cellular_uart_init(
    tx_io: i32,
    rx_io: i32,
    enable_io: i32,
    codec_enable_io: i32,
    baud: u32,
) callconv(.c) i32;
extern fn espz_cellular_uart_deinit() callconv(.c) void;
extern fn espz_cellular_uart_read(buf: [*]u8, len: i32) callconv(.c) i32;
extern fn espz_cellular_uart_write(buf: [*]const u8, len: i32) callconv(.c) i32;
extern fn espz_cellular_uart_rx_waiting() callconv(.c) i32;
extern fn espz_cellular_uart_set_baud(baud: u32) callconv(.c) i32;
extern fn espz_cellular_uart_drain_until_idle(quiet_ms: u32, cap_ms: u32) callconv(.c) void;

const ModemTime = struct {
    pub fn nowMs(_: ModemTime) u64 {
        const ms = esp_embed.std.time.milliTimestamp();
        if (ms < 0) return 0;
        return @intCast(ms);
    }

    pub fn sleepMs(_: ModemTime, ms_val: u32) void {
        esp_embed.std.Thread.sleep(@as(u64, ms_val) * esp_embed.std.time.ns_per_ms);
    }
};

const EspUartIo = struct {
    pub fn read(_: *EspUartIo, buf: []u8) cellular.io.Io.IoError!usize {
        if (buf.len == 0) return 0;
        const n = espz_cellular_uart_read(buf.ptr, @intCast(buf.len));
        if (n == -1) return error.WouldBlock;
        if (n < 0) return error.IoError;
        return @intCast(n);
    }

    pub fn write(_: *EspUartIo, buf: []const u8) cellular.io.Io.IoError!usize {
        if (buf.len == 0) return 0;
        const n = espz_cellular_uart_write(buf.ptr, @intCast(buf.len));
        if (n < 0) return error.IoError;
        return @intCast(n);
    }

    pub fn poll(_: *EspUartIo, _: i32) cellular.io.Io.PollFlags {
        const w = espz_cellular_uart_rx_waiting();
        return .{ .readable = w > 0, .writable = true };
    }
};

const Notify = cellular.modem.notify.ChannelNotify(esp_embed.std.Thread);
const Profile = cellular.modem.profiles.quectel;
const Driver = cellular.modem.driver.Modem(esp_embed.std, Notify, ModemTime, Profile, at_buf_size);

var g_uart_io: EspUartIo = .{};
var g_driver: Driver = undefined;

const EspCellularDevice = struct {
    pub fn modem(_: *EspCellularDevice) cellular.Modem {
        return cellular.Modem.make(&g_driver);
    }

    /// Called by `runSmoke` after `AT+IPR=<921600>`; must match modem line rate.
    /// Drains post-switch URCs so the following `AT` is not buried in unsolicited lines.
    pub fn setUartBaud(_: *EspCellularDevice, baud: u32) bool {
        if (espz_cellular_uart_set_baud(baud) != 0) return false;
        espz_cellular_uart_drain_until_idle(40, 500);
        return true;
    }
};

var g_device: EspCellularDevice = .{};

export fn zig_esp_main() callconv(.c) void {
    run() catch |err| {
        app_log.err("cellular test failed: {s} (halting main loop; not a memory fault)", .{@errorName(err)});
        while (true) {
            esp_embed.std.Thread.sleep(esp_embed.std.time.ns_per_s);
        }
    };
}

fn run() !void {
    app_log.info("cellular smoke: begin (codec_en={d} modem_en={d} tx={d} rx={d} baud={d} boot_wait_ms={d} at_rx_buf={d})", .{
        modem_codec_enable_gpio,
        modem_enable_gpio,
        modem_uart_tx_gpio,
        modem_uart_rx_gpio,
        modem_uart_baud,
        modem_boot_wait_ms,
        at_buf_size,
    });

    if (espz_cellular_uart_init(
        modem_uart_tx_gpio,
        modem_uart_rx_gpio,
        modem_enable_gpio,
        modem_codec_enable_gpio,
        modem_uart_baud,
    ) != 0) {
        app_log.err("modem UART init failed", .{});
        return error.UartInit;
    }
    defer espz_cellular_uart_deinit();

    app_log.info("waiting {d} ms for modem after power-on", .{modem_boot_wait_ms});
    const modem_tm: ModemTime = .{};
    modem_tm.sleepMs(modem_boot_wait_ms);

    g_driver = try Driver.init(.{
        .io = cellular.io.Io.fromUart(EspUartIo, &g_uart_io),
        .time = ModemTime{},
        .hardware = cellular.modem.driver.noopHardware(),
        .config = .{},
    });
    defer g_driver.deinit();

    app_log.info("cellular Driver.init ok (profile=quectel, noop hardware)", .{});

    // Main task stack is large in build_config — keep smoke on main task if stack overflows.
    try cellular.test_runner.modem.runSmoke(esp_embed.std, &g_device);

    app_log.info("cellular smoke passed", .{});
    while (true) {
        esp_embed.std.Thread.sleep(10 * esp_embed.std.time.ns_per_s);
    }
}
