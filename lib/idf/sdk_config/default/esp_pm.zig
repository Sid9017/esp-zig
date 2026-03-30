const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_pm";

pub const Config = struct {
    /// Kconfig key: `CONFIG_ESP_SLEEP_CACHE_SAFE_ASSERTION`.
    /// Controls whether ESP sleep cache SAFE assertion is enabled for the `esp_pm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_sleep_cache_safe_assertion: bool = false,
    /// Kconfig key: `CONFIG_ESP_SLEEP_DEBUG`.
    /// Controls whether ESP sleep debug is enabled for the `esp_pm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_sleep_debug: bool = false,
    /// Kconfig key: `CONFIG_ESP_SLEEP_DEEP_SLEEP_WAKEUP_DELAY`.
    /// Sets the numeric value for ESP sleep DEEP sleep wakeup delay in the `esp_pm` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2000`.
    esp_sleep_deep_sleep_wakeup_delay: i64 = 2000,
    /// Kconfig key: `CONFIG_ESP_SLEEP_FLASH_LEAKAGE_WORKAROUND`.
    /// Controls whether ESP sleep flash leakage workaround is enabled for the `esp_pm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_sleep_flash_leakage_workaround: bool = true,
    /// Kconfig key: `CONFIG_ESP_SLEEP_GPIO_ENABLE_INTERNAL_RESISTORS`.
    /// Controls whether ESP sleep GPIO enable internal resistors is enabled for the `esp_pm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_sleep_gpio_enable_internal_resistors: bool = true,
    /// Kconfig key: `CONFIG_ESP_SLEEP_GPIO_RESET_WORKAROUND`.
    /// Controls whether ESP sleep GPIO reset workaround is enabled for the `esp_pm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_sleep_gpio_reset_workaround: bool = true,
    /// Kconfig key: `CONFIG_ESP_SLEEP_MSPI_NEED_ALL_IO_PU`.
    /// Controls whether ESP sleep MSPI NEED ALL IO PU is enabled for the `esp_pm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_sleep_mspi_need_all_io_pu: bool = true,
    /// Kconfig key: `CONFIG_ESP_SLEEP_POWER_DOWN_FLASH`.
    /// Controls whether ESP sleep power DOWN flash is enabled for the `esp_pm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_sleep_power_down_flash: bool = false,
    /// Kconfig key: `CONFIG_ESP_SLEEP_RTC_BUS_ISO_WORKAROUND`.
    /// Controls whether ESP sleep RTC BUS ISO workaround is enabled for the `esp_pm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_sleep_rtc_bus_iso_workaround: bool = true,
    /// Kconfig key: `CONFIG_ESP_SLEEP_WAIT_FLASH_READY_EXTRA_DELAY`.
    /// Sets the numeric value for ESP sleep WAIT flash ready extra delay in the `esp_pm` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2000`.
    esp_sleep_wait_flash_ready_extra_delay: i64 = 2000,
    /// Kconfig key: `CONFIG_PM_ENABLE`.
    /// Controls whether PM enable is enabled for the `esp_pm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    pm_enable: bool = false,
    /// Kconfig key: `CONFIG_PM_POWER_DOWN_CPU_IN_LIGHT_SLEEP`.
    /// Controls whether PM power DOWN CPU IN light sleep is enabled for the `esp_pm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    pm_power_down_cpu_in_light_sleep: bool = true,
    /// Kconfig key: `CONFIG_PM_POWER_DOWN_TAGMEM_IN_LIGHT_SLEEP`.
    /// Controls whether PM power DOWN tagmem IN light sleep is enabled for the `esp_pm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    pm_power_down_tagmem_in_light_sleep: bool = true,
    /// Kconfig key: `CONFIG_PM_RESTORE_CACHE_TAGMEM_AFTER_LIGHT_SLEEP`.
    /// Controls whether PM restore cache tagmem after light sleep is enabled for the `esp_pm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    pm_restore_cache_tagmem_after_light_sleep: bool = true,
    /// Kconfig key: `CONFIG_PM_SLP_IRAM_OPT`.
    /// Controls whether PM SLP IRAM OPT is enabled for the `esp_pm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    pm_slp_iram_opt: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 15);
        entries[0] = sdkconfig.Entry.flag("CONFIG_ESP_SLEEP_CACHE_SAFE_ASSERTION", cfg.esp_sleep_cache_safe_assertion);
        entries[1] = sdkconfig.Entry.flag("CONFIG_ESP_SLEEP_DEBUG", cfg.esp_sleep_debug);
        entries[2] = sdkconfig.Entry.int("CONFIG_ESP_SLEEP_DEEP_SLEEP_WAKEUP_DELAY", cfg.esp_sleep_deep_sleep_wakeup_delay);
        entries[3] = sdkconfig.Entry.flag("CONFIG_ESP_SLEEP_FLASH_LEAKAGE_WORKAROUND", cfg.esp_sleep_flash_leakage_workaround);
        entries[4] = sdkconfig.Entry.flag("CONFIG_ESP_SLEEP_GPIO_ENABLE_INTERNAL_RESISTORS", cfg.esp_sleep_gpio_enable_internal_resistors);
        entries[5] = sdkconfig.Entry.flag("CONFIG_ESP_SLEEP_GPIO_RESET_WORKAROUND", cfg.esp_sleep_gpio_reset_workaround);
        entries[6] = sdkconfig.Entry.flag("CONFIG_ESP_SLEEP_MSPI_NEED_ALL_IO_PU", cfg.esp_sleep_mspi_need_all_io_pu);
        entries[7] = sdkconfig.Entry.flag("CONFIG_ESP_SLEEP_POWER_DOWN_FLASH", cfg.esp_sleep_power_down_flash);
        entries[8] = sdkconfig.Entry.flag("CONFIG_ESP_SLEEP_RTC_BUS_ISO_WORKAROUND", cfg.esp_sleep_rtc_bus_iso_workaround);
        entries[9] = sdkconfig.Entry.int("CONFIG_ESP_SLEEP_WAIT_FLASH_READY_EXTRA_DELAY", cfg.esp_sleep_wait_flash_ready_extra_delay);
        entries[10] = sdkconfig.Entry.flag("CONFIG_PM_ENABLE", cfg.pm_enable);
        entries[11] = sdkconfig.Entry.flag("CONFIG_PM_POWER_DOWN_CPU_IN_LIGHT_SLEEP", cfg.pm_power_down_cpu_in_light_sleep);
        entries[12] = sdkconfig.Entry.flag("CONFIG_PM_POWER_DOWN_TAGMEM_IN_LIGHT_SLEEP", cfg.pm_power_down_tagmem_in_light_sleep);
        entries[13] = sdkconfig.Entry.flag("CONFIG_PM_RESTORE_CACHE_TAGMEM_AFTER_LIGHT_SLEEP", cfg.pm_restore_cache_tagmem_after_light_sleep);
        entries[14] = sdkconfig.Entry.flag("CONFIG_PM_SLP_IRAM_OPT", cfg.pm_slp_iram_opt);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
