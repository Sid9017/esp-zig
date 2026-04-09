const std = @import("std");
const esp = @import("esp");

const Module = std.Build.Module;
const Component = esp.idf.Component;
const BuildContext = esp.idf.BuildContext.BuildContext;

const default_build_config_path = "board/esp32s3_devkit/build_config.zig";
const default_bsp_path = "board/esp32s3_devkit/bsp.zig";

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{});
    buildEsp(b, optimize);
}

fn buildEsp(b: *std.Build, optimize: std.builtin.OptimizeMode) void {
    const esp_app_context = resolveEspAppContext(b);
    const embed_esp = importEmbedZig(b, esp_app_context.context.target, optimize);
    wireEspRuntimeImports(esp_app_context.esp_imports, embed_esp, esp_app_context.build_config_module);

    const use_uart1 = resolveUseUart1(b);
    const at_opts = b.addOptions();
    at_opts.addOption(bool, "use_uart1", use_uart1);

    const app_root_module = b.createModule(.{
        .root_source_file = b.path("src/esp_main.zig"),
        .target = esp_app_context.context.target,
        .optimize = optimize,
        .imports = &.{
            .{ .name = "esp_embed", .module = esp_app_context.esp_imports.esp_embed },
            .{ .name = "at", .module = embed_esp.at },
        },
    });
    app_root_module.addOptions("at_dce_options", at_opts);

    const extra_components: []const *Component = if (use_uart1)
        &.{createAtUart1HelperComponent(b)}
    else
        &.{};

    const app = esp.idf.addApp(b, "at_dce", .{
        .context = esp_app_context.context,
        .entry = .{
            .symbol = "zig_esp_main",
            .module = app_root_module,
        },
        .components = extra_components,
    });

    registerAppSteps(b, app);
}

fn resolveEspAppContext(b: *std.Build) struct {
    build_config_module: *Module,
    context: BuildContext,
    esp_imports: EspZigImports,
} {
    const build_config_module = createBuildConfigModule(b, b.dependency("esp", .{}).module("esp_idf"));
    const context = esp.idf.resolveBuildContext(b, .{
        .build_config = build_config_module,
    });
    applyEspSysroot(b, context);
    return .{
        .build_config_module = build_config_module,
        .context = context,
        .esp_imports = importEspZig(b),
    };
}

const EspZigImports = struct {
    idf: *Module,
    esp_embed: *Module,
    esp_binding: *Module,
};

fn importEspZig(b: *std.Build) EspZigImports {
    const esp_idf_dep = b.dependency("esp", .{});
    const esp_dep = b.dependency("esp", .{});
    return .{
        .idf = esp_idf_dep.module("esp_idf"),
        .esp_embed = esp_dep.module("esp_embed"),
        .esp_binding = esp_dep.module("esp_binding"),
    };
}

fn importEmbedZig(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
) EmbedImports {
    const dep = b.dependency("embed_zig", .{
        .target = target,
        .optimize = optimize,
    });
    return .{
        .embed = dep.module("embed"),
        .context = dep.module("context"),
        .net = dep.module("net"),
        .sync = dep.module("sync"),
        .at = dep.module("at"),
    };
}

const EmbedImports = struct {
    embed: *Module,
    context: *Module,
    net: *Module,
    sync: *Module,
    at: *Module,
};

fn createBuildConfigModule(b: *std.Build, idf_module: *Module) *Module {
    const build_config_path = b.option([]const u8, "build_config", "Project build_config file path") orelse
        default_build_config_path;
    _ = b.option([]const u8, "bsp", "Project BSP file path") orelse
        default_bsp_path;

    return b.createModule(.{
        .root_source_file = b.path(build_config_path),
        .imports = &.{
            .{ .name = "esp_idf", .module = idf_module },
        },
    });
}

fn applyEspSysroot(b: *std.Build, build_ctx: BuildContext) void {
    if (build_ctx.toolchain_sysroot) |sysroot| {
        b.sysroot = sysroot.root;
    }
}

fn wireEspRuntimeImports(
    esp_imports: EspZigImports,
    embed_imports: EmbedImports,
    build_config_module: *Module,
) void {
    esp_imports.esp_binding.addImport("embed", embed_imports.embed);
    esp_imports.esp_binding.addImport("sync", embed_imports.sync);
    esp_imports.esp_binding.addImport("build_config", build_config_module);
    esp_imports.esp_binding.addImport("esp_idf", esp_imports.idf);

    esp_imports.esp_embed.addImport("embed", embed_imports.embed);
    esp_imports.esp_embed.addImport("context", embed_imports.context);
    esp_imports.esp_embed.addImport("net", embed_imports.net);
    esp_imports.esp_embed.addImport("sync", embed_imports.sync);
    esp_imports.esp_embed.addImport("esp_binding", esp_imports.esp_binding);
}

fn resolveUseUart1(b: *std.Build) bool {
    const at_transport = b.option(
        []const u8,
        "at_transport",
        "AT I/O: usb (stdin/stdout, default) or uart1 (115200, TX GPIO17 / RX GPIO18)",
    ) orelse "usb";
    if (std.mem.eql(u8, at_transport, "usb")) return false;
    if (std.mem.eql(u8, at_transport, "uart1")) return true;
    std.debug.panic("invalid -Dat_transport={s}: expected usb or uart1", .{at_transport});
}

fn createAtUart1HelperComponent(b: *std.Build) *Component {
    const component = Component.create(b, .{ .name = "at_dce_uart1" });
    component.addCSourceFiles(.{
        .root = b.path("uart1_helper"),
        .files = &.{"at_dce_uart1.c"},
    });
    component.addRequire("esp_driver_uart");
    return component;
}

fn registerAppSteps(b: *std.Build, app: esp.idf.App) void {
    const build_step = b.step("build", "Build at_dce firmware");
    build_step.dependOn(app.combine_binaries);
    build_step.dependOn(app.elf_layout);
    b.default_step = build_step;

    const flash_step = b.step("flash", "Flash at_dce to ESP32-S3");
    flash_step.dependOn(app.flash);

    const monitor_step = b.step("monitor", "Serial monitor");
    monitor_step.dependOn(app.monitor);

    const flash_monitor_step = b.step("flash_monitor", "Flash then monitor");
    flash_monitor_step.dependOn(app.flash_monitor);
}
