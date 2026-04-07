const std = @import("std");
const esp = @import("esp");

const Module = std.Build.Module;
const BuildContext = esp.idf.BuildContext.BuildContext;
const Component = esp.idf.Component;

const default_build_config_path = "board/esp32s3_h106_tiga_v4/build_config.zig";

const EspZigImports = struct {
    idf: *Module,
    esp_embed: *Module,
    esp_binding: *Module,
};

const EmbedZigImports = struct {
    embed: *Module,
    context: *Module,
    net: *Module,
    sync: *Module,
    cellular: *Module,
};

const EspAppContext = struct {
    build_config_module: *Module,
    context: BuildContext,
    esp_imports: EspZigImports,
};

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{});
    buildEsp(b, optimize);
}

fn buildEsp(b: *std.Build, optimize: std.builtin.OptimizeMode) void {
    const esp_app_context = resolveEspAppContext(b);

    const embed_esp = importEmbedZig(b, esp_app_context.context.target, optimize);
    wireEspRuntimeImports(esp_app_context.esp_imports, embed_esp, esp_app_context.build_config_module);

    const app_root_module = createAppRootModule(
        b,
        esp_app_context.context.target,
        optimize,
        esp_app_context.esp_imports.esp_embed,
        embed_esp,
    );

    const modem_uart_component = createModemUartComponent(b);
    const app = esp.idf.addApp(b, "cellular_test", .{
        .context = esp_app_context.context,
        .entry = .{
            .symbol = "zig_esp_main",
            .module = app_root_module,
        },
        .components = &.{modem_uart_component},
    });

    registerAppSteps(b, app);
}

fn resolveEspAppContext(b: *std.Build) EspAppContext {
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
) EmbedZigImports {
    const dep = b.dependency("embed_zig", .{
        .target = target,
        .optimize = optimize,
    });
    return .{
        .embed = dep.module("embed"),
        .context = dep.module("context"),
        .net = dep.module("net"),
        .sync = dep.module("sync"),
        .cellular = dep.module("cellular"),
    };
}

fn createBuildConfigModule(b: *std.Build, idf_module: *Module) *Module {
    const build_config_path = b.option([]const u8, "build_config", "Project build_config file path") orelse
        default_build_config_path;

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
    embed_imports: EmbedZigImports,
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

fn createAppRootModule(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    esp_embed_module: *Module,
    embed_imports: EmbedZigImports,
) *Module {
    return b.createModule(.{
        .root_source_file = b.path("src/esp_main.zig"),
        .target = target,
        .optimize = optimize,
        .imports = &.{
            .{ .name = "esp_embed", .module = esp_embed_module },
            .{ .name = "cellular", .module = embed_imports.cellular },
        },
    });
}

fn createModemUartComponent(b: *std.Build) *Component {
    const component = esp.idf.Component.create(b, .{
        .name = "modem_uart",
    });
    component.addCSourceFiles(.{
        .root = b.path("modem_init"),
        .files = &.{"modem_uart.c"},
    });
    component.addRequire("driver");
    return component;
}

fn registerAppSteps(b: *std.Build, app: esp.idf.App) void {
    const build_step = b.step("build", "Build the ESP firmware");
    build_step.dependOn(app.combine_binaries);
    build_step.dependOn(app.elf_layout);
    b.default_step = build_step;

    const flash_step = b.step("flash", "Flash the ESP firmware");
    flash_step.dependOn(app.flash);

    const monitor_step = b.step("monitor", "Monitor the ESP serial output without flashing");
    monitor_step.dependOn(app.monitor);

    const flash_monitor_step = b.step("flash_monitor", "Flash the ESP firmware, then monitor serial output");
    flash_monitor_step.dependOn(app.flash_monitor);
}
