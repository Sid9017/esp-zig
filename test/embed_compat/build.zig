const std = @import("std");
const host_app = @import("build/host_app.zig");
const esp_app = @import("build/esp_app.zig");

pub fn build(b: *std.Build) void {
    const build_esp = b.option(
        bool,
        "esp",
        "Build the ESP app instead of the default host test runner",
    ) orelse false;
    const host_target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    if (build_esp) {
        esp_app.build(b, optimize);
    } else {
        host_app.build(b, host_target, optimize);
    }
}
