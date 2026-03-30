const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "hal";

pub const Config = struct {
    /// Kconfig key: `CONFIG_HAL_ASSERTION_DISABLE`.
    /// Controls whether HAL assertion disable is enabled for the `hal` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    hal_assertion_disable: bool = false,
    /// Kconfig key: `CONFIG_HAL_ASSERTION_ENABLE`.
    /// Controls whether HAL assertion enable is enabled for the `hal` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    hal_assertion_enable: bool = false,
    /// Kconfig key: `CONFIG_HAL_ASSERTION_EQUALS_SYSTEM`.
    /// Controls whether HAL assertion equals system is enabled for the `hal` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    hal_assertion_equals_system: bool = true,
    /// Kconfig key: `CONFIG_HAL_ASSERTION_SILENT`.
    /// Controls whether HAL assertion silent is enabled for the `hal` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    hal_assertion_silent: bool = false,
    /// Kconfig key: `CONFIG_HAL_ASSERTION_SILIENT`.
    /// Controls whether HAL assertion silient is enabled for the `hal` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    hal_assertion_silient: bool = false,
    /// Kconfig key: `CONFIG_HAL_DEFAULT_ASSERTION_LEVEL`.
    /// Sets the numeric value for HAL default assertion level in the `hal` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    hal_default_assertion_level: i64 = 2,
    /// Kconfig key: `CONFIG_HAL_ECDSA_GEN_SIG_CM`.
    /// Controls whether HAL ecdsa GEN SIG CM is enabled for the `hal` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    hal_ecdsa_gen_sig_cm: bool = false,
    /// Kconfig key: `CONFIG_HAL_SPI_MASTER_FUNC_IN_IRAM`.
    /// Controls whether HAL SPI master FUNC IN IRAM is enabled for the `hal` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    hal_spi_master_func_in_iram: bool = true,
    /// Kconfig key: `CONFIG_HAL_SPI_SLAVE_FUNC_IN_IRAM`.
    /// Controls whether HAL SPI slave FUNC IN IRAM is enabled for the `hal` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    hal_spi_slave_func_in_iram: bool = true,
    /// Kconfig key: `CONFIG_HAL_WDT_USE_ROM_IMPL`.
    /// Controls whether HAL WDT USE ROM IMPL is enabled for the `hal` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    hal_wdt_use_rom_impl: bool = true,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 10);
        entries[0] = sdkconfig.Entry.flag("CONFIG_HAL_ASSERTION_DISABLE", cfg.hal_assertion_disable);
        entries[1] = sdkconfig.Entry.flag("CONFIG_HAL_ASSERTION_ENABLE", cfg.hal_assertion_enable);
        entries[2] = sdkconfig.Entry.flag("CONFIG_HAL_ASSERTION_EQUALS_SYSTEM", cfg.hal_assertion_equals_system);
        entries[3] = sdkconfig.Entry.flag("CONFIG_HAL_ASSERTION_SILENT", cfg.hal_assertion_silent);
        entries[4] = sdkconfig.Entry.flag("CONFIG_HAL_ASSERTION_SILIENT", cfg.hal_assertion_silient);
        entries[5] = sdkconfig.Entry.int("CONFIG_HAL_DEFAULT_ASSERTION_LEVEL", cfg.hal_default_assertion_level);
        entries[6] = sdkconfig.Entry.flag("CONFIG_HAL_ECDSA_GEN_SIG_CM", cfg.hal_ecdsa_gen_sig_cm);
        entries[7] = sdkconfig.Entry.flag("CONFIG_HAL_SPI_MASTER_FUNC_IN_IRAM", cfg.hal_spi_master_func_in_iram);
        entries[8] = sdkconfig.Entry.flag("CONFIG_HAL_SPI_SLAVE_FUNC_IN_IRAM", cfg.hal_spi_slave_func_in_iram);
        entries[9] = sdkconfig.Entry.flag("CONFIG_HAL_WDT_USE_ROM_IMPL", cfg.hal_wdt_use_rom_impl);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
