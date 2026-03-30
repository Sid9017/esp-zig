const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_driver_mcpwm";

pub const Config = struct {
    /// Kconfig key: `CONFIG_MCPWM_CTRL_FUNC_IN_IRAM`.
    /// Controls whether mcpwm CTRL FUNC IN IRAM is enabled for the `esp_driver_mcpwm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mcpwm_ctrl_func_in_iram: bool = false,
    /// Kconfig key: `CONFIG_MCPWM_ENABLE_DEBUG_LOG`.
    /// Controls whether mcpwm enable debug LOG is enabled for the `esp_driver_mcpwm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mcpwm_enable_debug_log: bool = false,
    /// Kconfig key: `CONFIG_MCPWM_ISR_IN_IRAM`.
    /// Controls whether mcpwm ISR IN IRAM is enabled for the `esp_driver_mcpwm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mcpwm_isr_in_iram: bool = false,
    /// Kconfig key: `CONFIG_MCPWM_ISR_IRAM_SAFE`.
    /// Controls whether mcpwm ISR IRAM SAFE is enabled for the `esp_driver_mcpwm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mcpwm_isr_iram_safe: bool = false,
    /// Kconfig key: `CONFIG_MCPWM_SUPPRESS_DEPRECATE_WARN`.
    /// Controls whether mcpwm suppress deprecate WARN is enabled for the `esp_driver_mcpwm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mcpwm_suppress_deprecate_warn: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 5);
        entries[0] = sdkconfig.Entry.flag("CONFIG_MCPWM_CTRL_FUNC_IN_IRAM", cfg.mcpwm_ctrl_func_in_iram);
        entries[1] = sdkconfig.Entry.flag("CONFIG_MCPWM_ENABLE_DEBUG_LOG", cfg.mcpwm_enable_debug_log);
        entries[2] = sdkconfig.Entry.flag("CONFIG_MCPWM_ISR_IN_IRAM", cfg.mcpwm_isr_in_iram);
        entries[3] = sdkconfig.Entry.flag("CONFIG_MCPWM_ISR_IRAM_SAFE", cfg.mcpwm_isr_iram_safe);
        entries[4] = sdkconfig.Entry.flag("CONFIG_MCPWM_SUPPRESS_DEPRECATE_WARN", cfg.mcpwm_suppress_deprecate_warn);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
