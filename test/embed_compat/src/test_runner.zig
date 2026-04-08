const embed = @import("embed");

pub fn run(comptime lib: type) !void {
    const rtstd = lib.std;
    const app_log = rtstd.log.scoped(.embed_compat);

    try lib.setup();
    defer lib.teardown();

    app_log.info("starting embed-zig test runners", .{});

    var runner = embed.testing.T.new(rtstd, .embed_compat);
    defer runner.deinit();

    runner.parallel();
    runner.timeout(240 * rtstd.time.ns_per_s);

    runner.run("embed/unit", embed.tests.test_runner.embed.make(rtstd));
    runner.run("context/unit", embed.tests.test_runner.context.make(rtstd));
    runner.run("sync/integration", lib.sync.test_runner.integration.make(rtstd, lib.Channel));
    runner.run("net/integration", lib.net.test_runner.integration.make(rtstd));
    runner.run("lvgl", embed.lvgl.test_runner.integration.make(rtstd));
    runner.run("stb_truetype", embed.stb_truetype.test_runner.stb_truetype.make(rtstd));
    runner.run("ogg", embed.ogg.test_runner.ogg.make(rtstd));
    runner.run("opus", embed.opus.test_runner.opus.make(rtstd));

    const passed = runner.wait();
    app_log.info("embed-zig test runners finished", .{});
    if (!passed) return error.TestsFailed;
}

test "embed compat native runner" {
    @import("std").testing.log_level = .info;

    const NativePlatform = struct {
        pub const std = embed.embed_std.std;
        pub const Channel = embed.embed_std.sync.Channel;
        pub const net = embed.net;
        pub const sync = embed.sync;
        pub const testing_api = embed.testing;

        pub fn setup() !void {}
        pub fn teardown() void {}
    };

    try run(NativePlatform);
}
