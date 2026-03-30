const std = @import("std");

// Re-export build helpers for downstream `@import("esp").idf`.
pub const idf = @import("lib/idf.zig");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const embed_dep = b.dependency("embed_zig", .{});
    const embed_module = embed_dep.module("embed");
    const context_module = embed_dep.module("context");
    const sync_module = embed_dep.module("sync");
    const net_module = embed_dep.module("net");

    const binding_module = b.addModule("esp_binding", .{
        .root_source_file = b.path("lib/binding.zig"),
        .imports = &.{
            .{ .name = "embed", .module = embed_module },
            .{ .name = "sync", .module = sync_module },
        },
    });
    _ = b.addModule("esp_embed", .{
        .root_source_file = b.path("lib/embed.zig"),
        .imports = &.{
            .{ .name = "embed", .module = embed_module },
            .{ .name = "context", .module = context_module },
            .{ .name = "net", .module = net_module },
            .{ .name = "sync", .module = sync_module },
            .{ .name = "esp_binding", .module = binding_module },
        },
    });
    _ = b.addModule("esp_idf", .{
        .root_source_file = b.path("lib/idf.zig"),
    });

    const idf_tests = b.addTest(.{
        .root_module = b.createModule(.{
            .root_source_file = b.path("lib/idf.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });
    const run_idf_tests = b.addRunArtifact(idf_tests);
    const test_step = b.step("test", "Run IDF tests");
    test_step.dependOn(&run_idf_tests.step);
}
