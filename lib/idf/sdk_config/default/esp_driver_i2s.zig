const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_driver_i2s";

pub const Config = struct {
    /// Kconfig key: `CONFIG_I2S_ENABLE_DEBUG_LOG`.
    /// Controls whether I2S enable debug LOG is enabled for the `esp_driver_i2s` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    i2s_enable_debug_log: bool = false,
    /// Kconfig key: `CONFIG_I2S_ISR_IRAM_SAFE`.
    /// Controls whether I2S ISR IRAM SAFE is enabled for the `esp_driver_i2s` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    i2s_isr_iram_safe: bool = false,
    /// Kconfig key: `CONFIG_I2S_SUPPRESS_DEPRECATE_WARN`.
    /// Controls whether I2S suppress deprecate WARN is enabled for the `esp_driver_i2s` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    i2s_suppress_deprecate_warn: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 3);
        entries[0] = sdkconfig.Entry.flag("CONFIG_I2S_ENABLE_DEBUG_LOG", cfg.i2s_enable_debug_log);
        entries[1] = sdkconfig.Entry.flag("CONFIG_I2S_ISR_IRAM_SAFE", cfg.i2s_isr_iram_safe);
        entries[2] = sdkconfig.Entry.flag("CONFIG_I2S_SUPPRESS_DEPRECATE_WARN", cfg.i2s_suppress_deprecate_warn);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
