const std = @import("std");

const Module = std.Build.Module;
const Compile = std.Build.Step.Compile;

pub const Modules = struct {
    dep: *std.Build.Dependency,
    module: *Module,
    embed: *Module,
    context: *Module,
    net: *Module,
    sync: *Module,
    embed_std: *Module,
    tests: *Module,
    testing: *Module,
    ogg: *Module,
    ogg_artifact: *Compile,
    opus: *Module,
    opus_artifact: *Compile,
    lvgl: *Module,
    lvgl_osal: *Module,
    lvgl_artifact: *Compile,
    stb_truetype: *Module,
    stb_truetype_artifact: *Compile,
};

pub fn createEmbedModule(
    b: *std.Build,
    target: std.Build.ResolvedTarget,
    optimize: std.builtin.OptimizeMode,
) Modules {
    const dep = b.dependency("embed_zig", .{
        .target = target,
        .optimize = optimize,
        .ogg = true,
        .opus = true,
        .opus_config_header = b.path("opus_config.h"),
        .lvgl = true,
        .lvgl_config_header = b.path("lv_conf.h"),
        .stb_truetype = true,
    });

    const embed = dep.module("embed");
    const context = dep.module("context");
    const net = dep.module("net");
    const sync = dep.module("sync");
    const embed_std = dep.module("embed_std");
    const tests = dep.module("tests");
    const testing = dep.module("testing");

    const module = b.createModule(.{
        .root_source_file = b.path("pkg/embed.zig"),
        .target = target,
        .optimize = optimize,
    });
    module.addImport("embed", embed);
    module.addImport("context", context);
    module.addImport("net", net);
    module.addImport("sync", sync);
    module.addImport("testing", testing);
    module.addImport("embed_std", embed_std);
    module.addImport("tests", tests);
    module.addImport("ogg", dep.module("ogg"));
    module.addImport("opus", dep.module("opus"));
    module.addImport("lvgl", dep.module("lvgl"));
    module.addImport("stb_truetype", dep.module("stb_truetype"));

    return .{
        .dep = dep,
        .module = module,
        .embed = embed,
        .context = context,
        .net = net,
        .sync = sync,
        .embed_std = embed_std,
        .tests = tests,
        .testing = testing,
        .ogg = dep.module("ogg"),
        .ogg_artifact = dep.artifact("ogg"),
        .opus = dep.module("opus"),
        .opus_artifact = dep.artifact("opus"),
        .lvgl = dep.module("lvgl"),
        .lvgl_osal = dep.module("lvgl_osal"),
        .lvgl_artifact = dep.artifact("lvgl"),
        .stb_truetype = dep.module("stb_truetype"),
        .stb_truetype_artifact = dep.artifact("stb_truetype"),
    };
}
