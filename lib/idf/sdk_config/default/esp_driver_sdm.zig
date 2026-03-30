const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_driver_sdm";

pub const Config = struct {
    /// Kconfig key: `CONFIG_SDM_CTRL_FUNC_IN_IRAM`.
    /// Controls whether SDM CTRL FUNC IN IRAM is enabled for the `esp_driver_sdm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    sdm_ctrl_func_in_iram: bool = false,
    /// Kconfig key: `CONFIG_SDM_ENABLE_DEBUG_LOG`.
    /// Controls whether SDM enable debug LOG is enabled for the `esp_driver_sdm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    sdm_enable_debug_log: bool = false,
    /// Kconfig key: `CONFIG_SDM_SUPPRESS_DEPRECATE_WARN`.
    /// Controls whether SDM suppress deprecate WARN is enabled for the `esp_driver_sdm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    sdm_suppress_deprecate_warn: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 3);
        entries[0] = sdkconfig.Entry.flag("CONFIG_SDM_CTRL_FUNC_IN_IRAM", cfg.sdm_ctrl_func_in_iram);
        entries[1] = sdkconfig.Entry.flag("CONFIG_SDM_ENABLE_DEBUG_LOG", cfg.sdm_enable_debug_log);
        entries[2] = sdkconfig.Entry.flag("CONFIG_SDM_SUPPRESS_DEPRECATE_WARN", cfg.sdm_suppress_deprecate_warn);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
