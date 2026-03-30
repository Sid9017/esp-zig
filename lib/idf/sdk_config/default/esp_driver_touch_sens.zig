const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_driver_touch_sens";

pub const Config = struct {
    /// Kconfig key: `CONFIG_TOUCH_CTRL_FUNC_IN_IRAM`.
    /// Controls whether touch CTRL FUNC IN IRAM is enabled for the `esp_driver_touch_sens` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    touch_ctrl_func_in_iram: bool = false,
    /// Kconfig key: `CONFIG_TOUCH_ENABLE_DEBUG_LOG`.
    /// Controls whether touch enable debug LOG is enabled for the `esp_driver_touch_sens` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    touch_enable_debug_log: bool = false,
    /// Kconfig key: `CONFIG_TOUCH_ISR_IRAM_SAFE`.
    /// Controls whether touch ISR IRAM SAFE is enabled for the `esp_driver_touch_sens` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    touch_isr_iram_safe: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 3);
        entries[0] = sdkconfig.Entry.flag("CONFIG_TOUCH_CTRL_FUNC_IN_IRAM", cfg.touch_ctrl_func_in_iram);
        entries[1] = sdkconfig.Entry.flag("CONFIG_TOUCH_ENABLE_DEBUG_LOG", cfg.touch_enable_debug_log);
        entries[2] = sdkconfig.Entry.flag("CONFIG_TOUCH_ISR_IRAM_SAFE", cfg.touch_isr_iram_safe);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
