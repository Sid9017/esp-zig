const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_driver_gptimer";

pub const Config = struct {
    /// Kconfig key: `CONFIG_GPTIMER_CTRL_FUNC_IN_IRAM`.
    /// Controls whether gptimer CTRL FUNC IN IRAM is enabled for the `esp_driver_gptimer` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    gptimer_ctrl_func_in_iram: bool = false,
    /// Kconfig key: `CONFIG_GPTIMER_ENABLE_DEBUG_LOG`.
    /// Controls whether gptimer enable debug LOG is enabled for the `esp_driver_gptimer` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    gptimer_enable_debug_log: bool = false,
    /// Kconfig key: `CONFIG_GPTIMER_ISR_HANDLER_IN_IRAM`.
    /// Controls whether gptimer ISR handler IN IRAM is enabled for the `esp_driver_gptimer` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    gptimer_isr_handler_in_iram: bool = true,
    /// Kconfig key: `CONFIG_GPTIMER_ISR_IRAM_SAFE`.
    /// Controls whether gptimer ISR IRAM SAFE is enabled for the `esp_driver_gptimer` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    gptimer_isr_iram_safe: bool = false,
    /// Kconfig key: `CONFIG_GPTIMER_SUPPRESS_DEPRECATE_WARN`.
    /// Controls whether gptimer suppress deprecate WARN is enabled for the `esp_driver_gptimer` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    gptimer_suppress_deprecate_warn: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 5);
        entries[0] = sdkconfig.Entry.flag("CONFIG_GPTIMER_CTRL_FUNC_IN_IRAM", cfg.gptimer_ctrl_func_in_iram);
        entries[1] = sdkconfig.Entry.flag("CONFIG_GPTIMER_ENABLE_DEBUG_LOG", cfg.gptimer_enable_debug_log);
        entries[2] = sdkconfig.Entry.flag("CONFIG_GPTIMER_ISR_HANDLER_IN_IRAM", cfg.gptimer_isr_handler_in_iram);
        entries[3] = sdkconfig.Entry.flag("CONFIG_GPTIMER_ISR_IRAM_SAFE", cfg.gptimer_isr_iram_safe);
        entries[4] = sdkconfig.Entry.flag("CONFIG_GPTIMER_SUPPRESS_DEPRECATE_WARN", cfg.gptimer_suppress_deprecate_warn);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
