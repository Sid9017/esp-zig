const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "bootloader";

pub const Config = struct {
    /// Kconfig key: `CONFIG_BOOTLOADER_APP_ROLLBACK_ENABLE`.
    /// Controls whether bootloader APP rollback enable is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bootloader_app_rollback_enable: bool = false,
    /// Kconfig key: `CONFIG_BOOTLOADER_APP_TEST`.
    /// Controls whether bootloader APP TEST is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bootloader_app_test: bool = false,
    /// Kconfig key: `CONFIG_BOOTLOADER_COMPILER_OPTIMIZATION_DEBUG`.
    /// Controls whether bootloader compiler optimization debug is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bootloader_compiler_optimization_debug: bool = false,
    /// Kconfig key: `CONFIG_BOOTLOADER_COMPILER_OPTIMIZATION_NONE`.
    /// Controls whether bootloader compiler optimization NONE is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bootloader_compiler_optimization_none: bool = false,
    /// Kconfig key: `CONFIG_BOOTLOADER_COMPILER_OPTIMIZATION_PERF`.
    /// Controls whether bootloader compiler optimization PERF is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bootloader_compiler_optimization_perf: bool = false,
    /// Kconfig key: `CONFIG_BOOTLOADER_COMPILER_OPTIMIZATION_SIZE`.
    /// Controls whether bootloader compiler optimization SIZE is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    bootloader_compiler_optimization_size: bool = true,
    /// Kconfig key: `CONFIG_BOOTLOADER_COMPILE_TIME_DATE`.
    /// Controls whether bootloader compile TIME DATE is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    bootloader_compile_time_date: bool = true,
    /// Kconfig key: `CONFIG_BOOTLOADER_CUSTOM_RESERVE_RTC`.
    /// Controls whether bootloader custom reserve RTC is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bootloader_custom_reserve_rtc: bool = false,
    /// Kconfig key: `CONFIG_BOOTLOADER_FACTORY_RESET`.
    /// Controls whether bootloader factory reset is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bootloader_factory_reset: bool = false,
    /// Kconfig key: `CONFIG_BOOTLOADER_FLASH_DC_AWARE`.
    /// Controls whether bootloader flash DC aware is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bootloader_flash_dc_aware: bool = false,
    /// Kconfig key: `CONFIG_BOOTLOADER_FLASH_XMC_SUPPORT`.
    /// Controls whether bootloader flash XMC support is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    bootloader_flash_xmc_support: bool = true,
    /// Kconfig key: `CONFIG_BOOTLOADER_LOG_COLORS`.
    /// Controls whether bootloader LOG colors is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bootloader_log_colors: bool = false,
    /// Kconfig key: `CONFIG_BOOTLOADER_LOG_LEVEL`.
    /// Sets the numeric value for bootloader LOG level in the `bootloader` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    bootloader_log_level: i64 = 3,
    /// Kconfig key: `CONFIG_BOOTLOADER_LOG_LEVEL_DEBUG`.
    /// Controls whether bootloader LOG level debug is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bootloader_log_level_debug: bool = false,
    /// Kconfig key: `CONFIG_BOOTLOADER_LOG_LEVEL_ERROR`.
    /// Controls whether bootloader LOG level error is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bootloader_log_level_error: bool = false,
    /// Kconfig key: `CONFIG_BOOTLOADER_LOG_LEVEL_INFO`.
    /// Controls whether bootloader LOG level INFO is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    bootloader_log_level_info: bool = true,
    /// Kconfig key: `CONFIG_BOOTLOADER_LOG_LEVEL_NONE`.
    /// Controls whether bootloader LOG level NONE is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bootloader_log_level_none: bool = false,
    /// Kconfig key: `CONFIG_BOOTLOADER_LOG_LEVEL_VERBOSE`.
    /// Controls whether bootloader LOG level verbose is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bootloader_log_level_verbose: bool = false,
    /// Kconfig key: `CONFIG_BOOTLOADER_LOG_LEVEL_WARN`.
    /// Controls whether bootloader LOG level WARN is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bootloader_log_level_warn: bool = false,
    /// Kconfig key: `CONFIG_BOOTLOADER_LOG_TIMESTAMP_SOURCE_CPU_TICKS`.
    /// Controls whether bootloader LOG timestamp source CPU ticks is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    bootloader_log_timestamp_source_cpu_ticks: bool = true,
    /// Kconfig key: `CONFIG_BOOTLOADER_OFFSET_IN_FLASH`.
    /// Sets the literal value for bootloader offset IN flash in the `bootloader` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `"0x0"`.
    bootloader_offset_in_flash: []const u8 = "0x0",
    /// Kconfig key: `CONFIG_BOOTLOADER_PROJECT_VER`.
    /// Sets the numeric value for bootloader project VER in the `bootloader` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    bootloader_project_ver: i64 = 1,
    /// Kconfig key: `CONFIG_BOOTLOADER_REGION_PROTECTION_ENABLE`.
    /// Controls whether bootloader region protection enable is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    bootloader_region_protection_enable: bool = true,
    /// Kconfig key: `CONFIG_BOOTLOADER_RESERVE_RTC_SIZE`.
    /// Sets the numeric value for bootloader reserve RTC SIZE in the `bootloader` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `0`.
    bootloader_reserve_rtc_size: i64 = 0,
    /// Kconfig key: `CONFIG_BOOTLOADER_SKIP_VALIDATE_ALWAYS`.
    /// Controls whether bootloader SKIP validate always is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bootloader_skip_validate_always: bool = false,
    /// Kconfig key: `CONFIG_BOOTLOADER_SKIP_VALIDATE_IN_DEEP_SLEEP`.
    /// Controls whether bootloader SKIP validate IN DEEP sleep is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bootloader_skip_validate_in_deep_sleep: bool = false,
    /// Kconfig key: `CONFIG_BOOTLOADER_SKIP_VALIDATE_ON_POWER_ON`.
    /// Controls whether bootloader SKIP validate ON power ON is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bootloader_skip_validate_on_power_on: bool = false,
    /// Kconfig key: `CONFIG_BOOTLOADER_VDDSDIO_BOOST_1_9V`.
    /// Controls whether bootloader vddsdio boost 1 9V is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    bootloader_vddsdio_boost_1_9v: bool = true,
    /// Kconfig key: `CONFIG_BOOTLOADER_WDT_DISABLE_IN_USER_CODE`.
    /// Controls whether bootloader WDT disable IN USER CODE is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bootloader_wdt_disable_in_user_code: bool = false,
    /// Kconfig key: `CONFIG_BOOTLOADER_WDT_ENABLE`.
    /// Controls whether bootloader WDT enable is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    bootloader_wdt_enable: bool = true,
    /// Kconfig key: `CONFIG_BOOTLOADER_WDT_TIME_MS`.
    /// Sets the numeric value for bootloader WDT TIME MS in the `bootloader` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `9000`.
    bootloader_wdt_time_ms: i64 = 9000,
    /// Kconfig key: `CONFIG_BOOT_ROM_LOG_ALWAYS_OFF`.
    /// Controls whether BOOT ROM LOG always OFF is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    boot_rom_log_always_off: bool = false,
    /// Kconfig key: `CONFIG_BOOT_ROM_LOG_ALWAYS_ON`.
    /// Controls whether BOOT ROM LOG always ON is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    boot_rom_log_always_on: bool = true,
    /// Kconfig key: `CONFIG_BOOT_ROM_LOG_ON_GPIO_HIGH`.
    /// Controls whether BOOT ROM LOG ON GPIO HIGH is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    boot_rom_log_on_gpio_high: bool = false,
    /// Kconfig key: `CONFIG_BOOT_ROM_LOG_ON_GPIO_LOW`.
    /// Controls whether BOOT ROM LOG ON GPIO LOW is enabled for the `bootloader` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    boot_rom_log_on_gpio_low: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 35);
        entries[0] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_APP_ROLLBACK_ENABLE", cfg.bootloader_app_rollback_enable);
        entries[1] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_APP_TEST", cfg.bootloader_app_test);
        entries[2] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_COMPILER_OPTIMIZATION_DEBUG", cfg.bootloader_compiler_optimization_debug);
        entries[3] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_COMPILER_OPTIMIZATION_NONE", cfg.bootloader_compiler_optimization_none);
        entries[4] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_COMPILER_OPTIMIZATION_PERF", cfg.bootloader_compiler_optimization_perf);
        entries[5] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_COMPILER_OPTIMIZATION_SIZE", cfg.bootloader_compiler_optimization_size);
        entries[6] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_COMPILE_TIME_DATE", cfg.bootloader_compile_time_date);
        entries[7] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_CUSTOM_RESERVE_RTC", cfg.bootloader_custom_reserve_rtc);
        entries[8] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_FACTORY_RESET", cfg.bootloader_factory_reset);
        entries[9] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_FLASH_DC_AWARE", cfg.bootloader_flash_dc_aware);
        entries[10] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_FLASH_XMC_SUPPORT", cfg.bootloader_flash_xmc_support);
        entries[11] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_LOG_COLORS", cfg.bootloader_log_colors);
        entries[12] = sdkconfig.Entry.int("CONFIG_BOOTLOADER_LOG_LEVEL", cfg.bootloader_log_level);
        entries[13] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_LOG_LEVEL_DEBUG", cfg.bootloader_log_level_debug);
        entries[14] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_LOG_LEVEL_ERROR", cfg.bootloader_log_level_error);
        entries[15] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_LOG_LEVEL_INFO", cfg.bootloader_log_level_info);
        entries[16] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_LOG_LEVEL_NONE", cfg.bootloader_log_level_none);
        entries[17] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_LOG_LEVEL_VERBOSE", cfg.bootloader_log_level_verbose);
        entries[18] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_LOG_LEVEL_WARN", cfg.bootloader_log_level_warn);
        entries[19] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_LOG_TIMESTAMP_SOURCE_CPU_TICKS", cfg.bootloader_log_timestamp_source_cpu_ticks);
        entries[20] = sdkconfig.Entry.raw("CONFIG_BOOTLOADER_OFFSET_IN_FLASH", cfg.bootloader_offset_in_flash);
        entries[21] = sdkconfig.Entry.int("CONFIG_BOOTLOADER_PROJECT_VER", cfg.bootloader_project_ver);
        entries[22] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_REGION_PROTECTION_ENABLE", cfg.bootloader_region_protection_enable);
        entries[23] = sdkconfig.Entry.int("CONFIG_BOOTLOADER_RESERVE_RTC_SIZE", cfg.bootloader_reserve_rtc_size);
        entries[24] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_SKIP_VALIDATE_ALWAYS", cfg.bootloader_skip_validate_always);
        entries[25] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_SKIP_VALIDATE_IN_DEEP_SLEEP", cfg.bootloader_skip_validate_in_deep_sleep);
        entries[26] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_SKIP_VALIDATE_ON_POWER_ON", cfg.bootloader_skip_validate_on_power_on);
        entries[27] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_VDDSDIO_BOOST_1_9V", cfg.bootloader_vddsdio_boost_1_9v);
        entries[28] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_WDT_DISABLE_IN_USER_CODE", cfg.bootloader_wdt_disable_in_user_code);
        entries[29] = sdkconfig.Entry.flag("CONFIG_BOOTLOADER_WDT_ENABLE", cfg.bootloader_wdt_enable);
        entries[30] = sdkconfig.Entry.int("CONFIG_BOOTLOADER_WDT_TIME_MS", cfg.bootloader_wdt_time_ms);
        entries[31] = sdkconfig.Entry.flag("CONFIG_BOOT_ROM_LOG_ALWAYS_OFF", cfg.boot_rom_log_always_off);
        entries[32] = sdkconfig.Entry.flag("CONFIG_BOOT_ROM_LOG_ALWAYS_ON", cfg.boot_rom_log_always_on);
        entries[33] = sdkconfig.Entry.flag("CONFIG_BOOT_ROM_LOG_ON_GPIO_HIGH", cfg.boot_rom_log_on_gpio_high);
        entries[34] = sdkconfig.Entry.flag("CONFIG_BOOT_ROM_LOG_ON_GPIO_LOW", cfg.boot_rom_log_on_gpio_low);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
