const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_driver_i2c";

pub const Config = struct {
    /// Kconfig key: `CONFIG_I2C_ENABLE_DEBUG_LOG`.
    /// Controls whether I2C enable debug LOG is enabled for the `esp_driver_i2c` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    i2c_enable_debug_log: bool = false,
    /// Kconfig key: `CONFIG_I2C_ENABLE_SLAVE_DRIVER_VERSION_2`.
    /// Controls whether I2C enable slave driver version 2 is enabled for the `esp_driver_i2c` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    i2c_enable_slave_driver_version_2: bool = false,
    /// Kconfig key: `CONFIG_I2C_ISR_IRAM_SAFE`.
    /// Controls whether I2C ISR IRAM SAFE is enabled for the `esp_driver_i2c` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    i2c_isr_iram_safe: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 3);
        entries[0] = sdkconfig.Entry.flag("CONFIG_I2C_ENABLE_DEBUG_LOG", cfg.i2c_enable_debug_log);
        entries[1] = sdkconfig.Entry.flag("CONFIG_I2C_ENABLE_SLAVE_DRIVER_VERSION_2", cfg.i2c_enable_slave_driver_version_2);
        entries[2] = sdkconfig.Entry.flag("CONFIG_I2C_ISR_IRAM_SAFE", cfg.i2c_isr_iram_safe);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
