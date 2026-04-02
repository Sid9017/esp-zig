const std = @import("std");
const esp = @import("esp");

const Module = std.Build.Module;
const BuildContext = esp.idf.BuildContext.BuildContext;
const Component = esp.idf.Component;

const default_build_config_path = "board/h106_tiga_v4/build_config.zig";

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{});

    const build_config_module = b.createModule(.{
        .root_source_file = b.path(default_build_config_path),
        .imports = &.{
            .{ .name = "esp_idf", .module = b.dependency("esp", .{}).module("esp_idf") },
        },
    });

    const context = esp.idf.resolveBuildContext(b, .{
        .build_config = build_config_module,
    });
    if (context.toolchain_sysroot) |sysroot| {
        b.sysroot = sysroot.root;
    }

    const target = context.target;
    const app_module = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const lcd_component = lcdSolidComponent(b);

    const app = esp.idf.addApp(b, "lcd_solid", .{
        .context = context,
        .entry = .{
            .symbol = "zig_esp_main",
            .module = app_module,
        },
        .components = &.{lcd_component},
    });

    const build_step = b.step("build", "Build lcd_solid ST7789 solid-fill firmware (H106 TIGA V4 BSP)");
    build_step.dependOn(app.combine_binaries);
    build_step.dependOn(app.elf_layout);
    b.default_step = build_step;

    const flash_step = b.step("flash", "Flash firmware");
    flash_step.dependOn(app.flash);

    const monitor_step = b.step("monitor", "Serial monitor");
    monitor_step.dependOn(app.monitor);

    const flash_monitor_step = b.step("flash_monitor", "Flash then monitor");
    flash_monitor_step.dependOn(app.flash_monitor);
}

fn lcdSolidComponent(b: *std.Build) *Component {
    const c = Component.create(b, .{ .name = "lcd_st7789" });
    c.addCSourceFiles(.{
        .root = b.path("st7789_helper"),
        .files = &.{"lcd_st7789.c"},
    });
    c.addIncludePath(b.path("st7789_helper"));
    c.addRequire("esp_lcd");
    c.addRequire("esp_driver_spi");
    c.addRequire("esp_driver_gpio");
    c.addRequire("esp_driver_ledc");
    c.addRequire("freertos");
    return c;
}
