const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_driver_rmt";

pub const Config = struct {
    /// Kconfig key: `CONFIG_RMT_ENABLE_DEBUG_LOG`.
    /// Controls whether RMT enable debug LOG is enabled for the `esp_driver_rmt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    rmt_enable_debug_log: bool = false,
    /// Kconfig key: `CONFIG_RMT_ISR_IRAM_SAFE`.
    /// Controls whether RMT ISR IRAM SAFE is enabled for the `esp_driver_rmt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    rmt_isr_iram_safe: bool = false,
    /// Kconfig key: `CONFIG_RMT_RECV_FUNC_IN_IRAM`.
    /// Controls whether RMT RECV FUNC IN IRAM is enabled for the `esp_driver_rmt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    rmt_recv_func_in_iram: bool = false,
    /// Kconfig key: `CONFIG_RMT_SUPPRESS_DEPRECATE_WARN`.
    /// Controls whether RMT suppress deprecate WARN is enabled for the `esp_driver_rmt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    rmt_suppress_deprecate_warn: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 4);
        entries[0] = sdkconfig.Entry.flag("CONFIG_RMT_ENABLE_DEBUG_LOG", cfg.rmt_enable_debug_log);
        entries[1] = sdkconfig.Entry.flag("CONFIG_RMT_ISR_IRAM_SAFE", cfg.rmt_isr_iram_safe);
        entries[2] = sdkconfig.Entry.flag("CONFIG_RMT_RECV_FUNC_IN_IRAM", cfg.rmt_recv_func_in_iram);
        entries[3] = sdkconfig.Entry.flag("CONFIG_RMT_SUPPRESS_DEPRECATE_WARN", cfg.rmt_suppress_deprecate_warn);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
