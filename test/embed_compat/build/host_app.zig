const std = @import("std");
const embed_pkg = @import("embed_pkg.zig");

const Module = std.Build.Module;
const Compile = std.Build.Step.Compile;
const Imports = embed_pkg.Modules;

pub fn build(
    b: *std.Build,
    host_target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
) void {
    const embed_native = embed_pkg.createEmbedModule(b, host_target, optimize);
    const native_test_module = createTestModule(b, host_target, optimize, embed_native);
    const native_tests = b.addTest(.{
        .root_module = native_test_module,
    });
    const lvgl_osal_artifact = createLvglOsalArtifact(
        b,
        host_target,
        optimize,
        embed_native,
    );
    embed_native.lvgl_artifact.root_module.addObject(lvgl_osal_artifact);
    native_tests.linkLibrary(embed_native.lvgl_artifact);

    const run_native_tests = b.addRunArtifact(native_tests);
    const test_step = b.step("test", "Run the host test runner");
    test_step.dependOn(&run_native_tests.step);
    b.default_step = test_step;
}

fn createTestModule(
    b: *std.Build,
    host_target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    embed_native: Imports,
) *Module {
    return b.createModule(.{
        .root_source_file = b.path("src/test_runner.zig"),
        .target = host_target,
        .optimize = optimize,
        .imports = &.{
            .{ .name = "embed", .module = embed_native.module },
        },
    });
}

fn createLvglOsalArtifact(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    embed_imports: Imports,
) *Compile {
    const impl_module = b.createModule(.{
        .root_source_file = embed_imports.dep.path("lib/embed_std/embed.zig"),
        .target = target,
        .optimize = optimize,
    });
    impl_module.addImport("embed", embed_imports.embed);

    const module = b.createModule(.{
        .root_source_file = b.path("src/lvgl_osal_host.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
        .imports = &.{
            .{ .name = "embed", .module = embed_imports.embed },
            .{ .name = "lvgl_osal_impl", .module = impl_module },
            .{ .name = "lvgl_osal", .module = embed_imports.lvgl_osal },
        },
    });
    return b.addObject(.{
        .name = "lvgl_osal_host",
        .root_module = module,
    });
}
