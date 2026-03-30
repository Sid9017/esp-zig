const lvgl = @import("lvgl");
const ogg = @import("ogg");
const opus = @import("opus");
const stb_truetype = @import("stb_truetype");
const integration = @import("integration");
const testing = @import("testing");

pub fn run(comptime lib: type) !void {
    const rtstd = lib.std;
    const Net = lib.net.make(rtstd);
    const app_log = rtstd.log.scoped(.embed_compat);

    try lib.setup();
    defer lib.teardown();

    app_log.info("starting embed-zig test runners", .{});

    var runner = testing.T.new(rtstd, .embed_compat);
    defer runner.deinit();

    runner.parallel();
    runner.timeout(240 * rtstd.time.ns_per_s);

    runner.run("sync/channel", lib.sync.test_runner.channel.make(rtstd, lib.Channel));
    runner.run("sync/racer", lib.sync.test_runner.racer.make(rtstd));
    runner.run("integration", integration.make(rtstd));
    runner.run("net/fd_stream", lib.net.test_runner.fd_stream.make(rtstd));
    runner.run("net/fd_packet", lib.net.test_runner.fd_packet.make(rtstd));
    runner.run("net/tcp", lib.net.test_runner.tcp.make(rtstd));
    runner.run("net/udp", lib.net.test_runner.udp.make(rtstd));
    runner.run("net/resolver", lib.net.test_runner.resolver.make(rtstd));
    runner.run("net/resolver_dns", lib.net.test_runner.resolver_dns.make(rtstd, &.{
        Net.Resolver.dns.ali.v4_1,
        Net.Resolver.dns.ali.v4_2,
    }, Net.Resolver.dns.ali.server_name));
    runner.run("net/tls", lib.net.test_runner.tls.make(rtstd));
    runner.run("net/tls_dial", lib.net.test_runner.tls_dial.make(rtstd, Net.Resolver.dns.ali.server_name));
    runner.run("net/ntp", lib.net.test_runner.ntp.make(rtstd));
    runner.run("net/http_transport", lib.net.test_runner.http_transport.make(rtstd));
    runner.run("net/https_transport", lib.net.test_runner.https_transport.make(rtstd));
    runner.run("lvgl", lvgl.test_runner.lvgl.make(rtstd));
    runner.run("stb_truetype", stb_truetype.test_runner.stb_truetype.make(rtstd));
    runner.run("ogg", ogg.test_runner.ogg.make(rtstd));
    runner.run("opus", opus.test_runner.opus.make(rtstd));

    const passed = runner.wait();
    app_log.info("embed-zig test runners finished", .{});
    if (!passed) return error.TestsFailed;
}

test "embed compat native runner" {
    @import("std").testing.log_level = .info;

    const NativePlatform = struct {
        const embed_std = @import("embed_std");
        const integration_mod = @import("integration");
        const net_mod = @import("net");
        const sync_mod = @import("sync");
        const testing_mod = @import("testing");
        pub const std = embed_std.std;
        pub const Channel = embed_std.sync.Channel;
        pub const integration = integration_mod;
        pub const net = net_mod;
        pub const sync = sync_mod;
        pub const testing_api = testing_mod;

        pub fn setup() !void {}
        pub fn teardown() void {}
    };

    try run(NativePlatform);
}
