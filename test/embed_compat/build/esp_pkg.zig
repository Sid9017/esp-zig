const std = @import("std");

const Module = std.Build.Module;

pub fn addEspModule(
    b: *std.Build,
) *Module {
    const esp_dep = b.dependency("esp", .{});
    return b.createModule(.{
        .root_source_file = b.path("pkg/esp.zig"),
        .imports = &.{.{ .name = "esp_embed", .module = esp_dep.module("esp_embed") }},
    });
}
