const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_driver_tsens";

pub const Config = struct {
    /// Kconfig key: `CONFIG_TEMP_SENSOR_ENABLE_DEBUG_LOG`.
    /// Controls whether TEMP sensor enable debug LOG is enabled for the `esp_driver_tsens` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    temp_sensor_enable_debug_log: bool = false,
    /// Kconfig key: `CONFIG_TEMP_SENSOR_SUPPRESS_DEPRECATE_WARN`.
    /// Controls whether TEMP sensor suppress deprecate WARN is enabled for the `esp_driver_tsens` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    temp_sensor_suppress_deprecate_warn: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 2);
        entries[0] = sdkconfig.Entry.flag("CONFIG_TEMP_SENSOR_ENABLE_DEBUG_LOG", cfg.temp_sensor_enable_debug_log);
        entries[1] = sdkconfig.Entry.flag("CONFIG_TEMP_SENSOR_SUPPRESS_DEPRECATE_WARN", cfg.temp_sensor_suppress_deprecate_warn);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
