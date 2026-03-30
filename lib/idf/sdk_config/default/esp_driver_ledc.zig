const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_driver_ledc";

pub const Config = struct {
    /// Kconfig key: `CONFIG_LEDC_CTRL_FUNC_IN_IRAM`.
    /// Controls whether LEDC CTRL FUNC IN IRAM is enabled for the `esp_driver_ledc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    ledc_ctrl_func_in_iram: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 1);
        entries[0] = sdkconfig.Entry.flag("CONFIG_LEDC_CTRL_FUNC_IN_IRAM", cfg.ledc_ctrl_func_in_iram);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
