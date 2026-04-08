const std = @import("std");
const esp = @import("esp");
const embed_pkg = @import("embed_pkg.zig");
const esp_pkg = @import("esp_pkg.zig");

const Module = std.Build.Module;
const Compile = std.Build.Step.Compile;
const Component = esp.idf.Component;
const BuildContext = esp.idf.BuildContext.BuildContext;
const EmbedImports = embed_pkg.Modules;

const default_build_config_path = "board/compile/build_config.zig";
const default_bsp_path = "board/compile/bsp.zig";

const Imports = struct {
    idf: *Module,
    esp_embed: *Module,
    esp_binding: *Module,
};

const AppContext = struct {
    build_config_module: *Module,
    context: BuildContext,
    imports: Imports,
};

pub fn build(b: *std.Build, optimize: std.builtin.OptimizeMode) void {
    const esp_app_context = resolveAppContext(b);
    const app_options_module = createAppOptionsModule(b);

    const embed_esp = embed_pkg.createEmbedModule(b, esp_app_context.context.target, optimize);
    wireRuntimeImports(esp_app_context.imports, embed_esp, esp_app_context.build_config_module);
    const esp_module = esp_pkg.addEspModule(b);

    const app_root_module = createAppRootModule(
        b,
        esp_app_context.context.target,
        optimize,
        esp_module,
        embed_esp.module,
        app_options_module,
    );

    const lvgl_osal_artifact = createLvglOsalArtifact(
        b,
        esp_app_context.context.target,
        optimize,
        esp_app_context.imports.esp_embed,
        embed_esp.lvgl_osal,
    );
    embed_esp.lvgl_artifact.root_module.addObject(lvgl_osal_artifact);

    const ogg_component = createArchiveComponent(b, "ogg", embed_esp.ogg_artifact);
    const opus_component = createArchiveComponent(b, "opus", embed_esp.opus_artifact);
    const stb_truetype_component = createArchiveComponent(b, "stb_truetype", embed_esp.stb_truetype_artifact);
    const lvgl_component = createArchiveComponent(b, "lvgl", embed_esp.lvgl_artifact);
    const esp_main_helper = createEspMainHelperComponent(b);

    const app = esp.idf.addApp(b, "embed_compat", .{
        .context = esp_app_context.context,
        .entry = .{
            .symbol = "zig_esp_main",
            .module = app_root_module,
        },
        .components = &.{ ogg_component, opus_component, lvgl_component, stb_truetype_component, esp_main_helper },
    });

    registerAppSteps(b, app);
}

fn resolveAppContext(b: *std.Build) AppContext {
    const build_config_module = createBuildConfigModule(b, b.dependency("esp", .{}).module("esp_idf"));
    const context = esp.idf.resolveBuildContext(b, .{
        .build_config = build_config_module,
    });
    applyEspSysroot(b, context);
    return .{
        .build_config_module = build_config_module,
        .context = context,
        .imports = importModules(b),
    };
}

fn importModules(b: *std.Build) Imports {
    const esp_idf_dep = b.dependency("esp", .{});
    const esp_dep = b.dependency("esp", .{});
    return .{
        .idf = esp_idf_dep.module("esp_idf"),
        .esp_embed = esp_dep.module("esp_embed"),
        .esp_binding = esp_dep.module("esp_binding"),
    };
}

fn wireRuntimeImports(
    esp_imports: Imports,
    embed_imports: anytype,
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

fn createAppOptionsModule(b: *std.Build) *Module {
    const wifi_ssid = b.option([]const u8, "wifi_ssid", "WiFi SSID for embed_compat ESP build") orelse
        @panic("missing -Dwifi_ssid=<ssid> for ESP build");
    const wifi_password = b.option([]const u8, "wifi_password", "WiFi password for embed_compat ESP build") orelse
        @panic("missing -Dwifi_password=<password> for ESP build");

    const write_files = b.addWriteFiles();
    const source = write_files.add("embed_compat_app_options.zig", b.fmt(
        \\pub const wifi_ssid: [*:0]const u8 = "{f}";
        \\pub const wifi_password: [*:0]const u8 = "{f}";
        \\
    , .{
        std.zig.fmtString(wifi_ssid),
        std.zig.fmtString(wifi_password),
    }));

    return b.createModule(.{
        .root_source_file = source,
    });
}

fn createAppRootModule(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    esp_module: *Module,
    embed_module: *Module,
    app_options_module: *Module,
) *Module {
    return b.createModule(.{
        .root_source_file = b.path("src/esp_main.zig"),
        .target = target,
        .optimize = optimize,
        .imports = &.{
            .{ .name = "app_options", .module = app_options_module },
            .{ .name = "embed", .module = embed_module },
            .{ .name = "esp", .module = esp_module },
        },
    });
}

fn createLvglOsalArtifact(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
    esp_embed_module: *Module,
    lvgl_osal_module: *Module,
) *Compile {
    const module = b.createModule(.{
        .root_source_file = b.path("src/lvgl_osal_esp.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
        .imports = &.{
            .{ .name = "esp_embed", .module = esp_embed_module },
            .{ .name = "lvgl_osal", .module = lvgl_osal_module },
        },
    });
    return b.addObject(.{
        .name = "lvgl_osal_esp",
        .root_module = module,
    });
}

fn createArchiveComponent(b: *std.Build, name: []const u8, artifact: *Compile) *Component {
    const component = esp.idf.Component.create(b, .{
        .name = name,
    });
    component.addArtifact(artifact);
    return component;
}

fn createEspMainHelperComponent(b: *std.Build) *Component {
    const component = esp.idf.Component.create(b, .{
        .name = "esp_main_helper",
    });
    component.addCSourceFiles(.{
        .root = b.path("esp_main_helper"),
        .files = &.{"wifi.c"},
    });
    component.addRequire("esp_event");
    component.addRequire("esp_netif");
    component.addRequire("esp_wifi");
    component.addRequire("freertos");
    component.addRequire("nvs_flash");
    return component;
}

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
