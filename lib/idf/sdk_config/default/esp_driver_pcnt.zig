const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_driver_pcnt";

pub const Config = struct {
    /// Kconfig key: `CONFIG_PCNT_CTRL_FUNC_IN_IRAM`.
    /// Controls whether PCNT CTRL FUNC IN IRAM is enabled for the `esp_driver_pcnt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    pcnt_ctrl_func_in_iram: bool = false,
    /// Kconfig key: `CONFIG_PCNT_ENABLE_DEBUG_LOG`.
    /// Controls whether PCNT enable debug LOG is enabled for the `esp_driver_pcnt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    pcnt_enable_debug_log: bool = false,
    /// Kconfig key: `CONFIG_PCNT_ISR_IRAM_SAFE`.
    /// Controls whether PCNT ISR IRAM SAFE is enabled for the `esp_driver_pcnt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    pcnt_isr_iram_safe: bool = false,
    /// Kconfig key: `CONFIG_PCNT_SUPPRESS_DEPRECATE_WARN`.
    /// Controls whether PCNT suppress deprecate WARN is enabled for the `esp_driver_pcnt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    pcnt_suppress_deprecate_warn: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 4);
        entries[0] = sdkconfig.Entry.flag("CONFIG_PCNT_CTRL_FUNC_IN_IRAM", cfg.pcnt_ctrl_func_in_iram);
        entries[1] = sdkconfig.Entry.flag("CONFIG_PCNT_ENABLE_DEBUG_LOG", cfg.pcnt_enable_debug_log);
        entries[2] = sdkconfig.Entry.flag("CONFIG_PCNT_ISR_IRAM_SAFE", cfg.pcnt_isr_iram_safe);
        entries[3] = sdkconfig.Entry.flag("CONFIG_PCNT_SUPPRESS_DEPRECATE_WARN", cfg.pcnt_suppress_deprecate_warn);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
