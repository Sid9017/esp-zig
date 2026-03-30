const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_phy";

pub const Config = struct {
    /// Kconfig key: `CONFIG_ESP32_PHY_CALIBRATION_AND_DATA_STORAGE`.
    /// Controls whether esp32 PHY calibration AND DATA storage is enabled for the `esp_phy` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp32_phy_calibration_and_data_storage: bool = true,
    /// Kconfig key: `CONFIG_ESP32_PHY_INIT_DATA_IN_PARTITION`.
    /// Controls whether esp32 PHY INIT DATA IN partition is enabled for the `esp_phy` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp32_phy_init_data_in_partition: bool = false,
    /// Kconfig key: `CONFIG_ESP32_PHY_MAX_TX_POWER`.
    /// Sets the numeric value for esp32 PHY MAX TX power in the `esp_phy` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `20`.
    esp32_phy_max_tx_power: i64 = 20,
    /// Kconfig key: `CONFIG_ESP32_PHY_MAX_WIFI_TX_POWER`.
    /// Sets the numeric value for esp32 PHY MAX WIFI TX power in the `esp_phy` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `20`.
    esp32_phy_max_wifi_tx_power: i64 = 20,
    /// Kconfig key: `CONFIG_ESP_PHY_CALIBRATION_AND_DATA_STORAGE`.
    /// Controls whether ESP PHY calibration AND DATA storage is enabled for the `esp_phy` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_phy_calibration_and_data_storage: bool = true,
    /// Kconfig key: `CONFIG_ESP_PHY_CALIBRATION_MODE`.
    /// Sets the numeric value for ESP PHY calibration MODE in the `esp_phy` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `0`.
    esp_phy_calibration_mode: i64 = 0,
    /// Kconfig key: `CONFIG_ESP_PHY_ENABLED`.
    /// Controls whether ESP PHY enabled is enabled for the `esp_phy` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_phy_enabled: bool = true,
    /// Kconfig key: `CONFIG_ESP_PHY_ENABLE_CERT_TEST`.
    /// Controls whether ESP PHY enable CERT TEST is enabled for the `esp_phy` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_phy_enable_cert_test: bool = false,
    /// Kconfig key: `CONFIG_ESP_PHY_ENABLE_USB`.
    /// Controls whether ESP PHY enable USB is enabled for the `esp_phy` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_phy_enable_usb: bool = true,
    /// Kconfig key: `CONFIG_ESP_PHY_INIT_DATA_IN_PARTITION`.
    /// Controls whether ESP PHY INIT DATA IN partition is enabled for the `esp_phy` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_phy_init_data_in_partition: bool = false,
    /// Kconfig key: `CONFIG_ESP_PHY_MAX_TX_POWER`.
    /// Sets the numeric value for ESP PHY MAX TX power in the `esp_phy` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `20`.
    esp_phy_max_tx_power: i64 = 20,
    /// Kconfig key: `CONFIG_ESP_PHY_MAX_WIFI_TX_POWER`.
    /// Sets the numeric value for ESP PHY MAX WIFI TX power in the `esp_phy` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `20`.
    esp_phy_max_wifi_tx_power: i64 = 20,
    /// Kconfig key: `CONFIG_ESP_PHY_PLL_TRACK_DEBUG`.
    /// Controls whether ESP PHY PLL track debug is enabled for the `esp_phy` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_phy_pll_track_debug: bool = false,
    /// Kconfig key: `CONFIG_ESP_PHY_RECORD_USED_TIME`.
    /// Controls whether ESP PHY record USED TIME is enabled for the `esp_phy` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_phy_record_used_time: bool = false,
    /// Kconfig key: `CONFIG_ESP_PHY_REDUCE_TX_POWER`.
    /// Controls whether ESP PHY reduce TX power is enabled for the `esp_phy` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_phy_reduce_tx_power: bool = false,
    /// Kconfig key: `CONFIG_ESP_PHY_RF_CAL_FULL`.
    /// Controls whether ESP PHY RF CAL FULL is enabled for the `esp_phy` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_phy_rf_cal_full: bool = false,
    /// Kconfig key: `CONFIG_ESP_PHY_RF_CAL_NONE`.
    /// Controls whether ESP PHY RF CAL NONE is enabled for the `esp_phy` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_phy_rf_cal_none: bool = false,
    /// Kconfig key: `CONFIG_ESP_PHY_RF_CAL_PARTIAL`.
    /// Controls whether ESP PHY RF CAL partial is enabled for the `esp_phy` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_phy_rf_cal_partial: bool = true,
    /// Kconfig key: `CONFIG_REDUCE_PHY_TX_POWER`.
    /// Controls whether reduce PHY TX power is enabled for the `esp_phy` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    reduce_phy_tx_power: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 19);
        entries[0] = sdkconfig.Entry.flag("CONFIG_ESP32_PHY_CALIBRATION_AND_DATA_STORAGE", cfg.esp32_phy_calibration_and_data_storage);
        entries[1] = sdkconfig.Entry.flag("CONFIG_ESP32_PHY_INIT_DATA_IN_PARTITION", cfg.esp32_phy_init_data_in_partition);
        entries[2] = sdkconfig.Entry.int("CONFIG_ESP32_PHY_MAX_TX_POWER", cfg.esp32_phy_max_tx_power);
        entries[3] = sdkconfig.Entry.int("CONFIG_ESP32_PHY_MAX_WIFI_TX_POWER", cfg.esp32_phy_max_wifi_tx_power);
        entries[4] = sdkconfig.Entry.flag("CONFIG_ESP_PHY_CALIBRATION_AND_DATA_STORAGE", cfg.esp_phy_calibration_and_data_storage);
        entries[5] = sdkconfig.Entry.int("CONFIG_ESP_PHY_CALIBRATION_MODE", cfg.esp_phy_calibration_mode);
        entries[6] = sdkconfig.Entry.flag("CONFIG_ESP_PHY_ENABLED", cfg.esp_phy_enabled);
        entries[7] = sdkconfig.Entry.flag("CONFIG_ESP_PHY_ENABLE_CERT_TEST", cfg.esp_phy_enable_cert_test);
        entries[8] = sdkconfig.Entry.flag("CONFIG_ESP_PHY_ENABLE_USB", cfg.esp_phy_enable_usb);
        entries[9] = sdkconfig.Entry.flag("CONFIG_ESP_PHY_INIT_DATA_IN_PARTITION", cfg.esp_phy_init_data_in_partition);
        entries[10] = sdkconfig.Entry.int("CONFIG_ESP_PHY_MAX_TX_POWER", cfg.esp_phy_max_tx_power);
        entries[11] = sdkconfig.Entry.int("CONFIG_ESP_PHY_MAX_WIFI_TX_POWER", cfg.esp_phy_max_wifi_tx_power);
        entries[12] = sdkconfig.Entry.flag("CONFIG_ESP_PHY_PLL_TRACK_DEBUG", cfg.esp_phy_pll_track_debug);
        entries[13] = sdkconfig.Entry.flag("CONFIG_ESP_PHY_RECORD_USED_TIME", cfg.esp_phy_record_used_time);
        entries[14] = sdkconfig.Entry.flag("CONFIG_ESP_PHY_REDUCE_TX_POWER", cfg.esp_phy_reduce_tx_power);
        entries[15] = sdkconfig.Entry.flag("CONFIG_ESP_PHY_RF_CAL_FULL", cfg.esp_phy_rf_cal_full);
        entries[16] = sdkconfig.Entry.flag("CONFIG_ESP_PHY_RF_CAL_NONE", cfg.esp_phy_rf_cal_none);
        entries[17] = sdkconfig.Entry.flag("CONFIG_ESP_PHY_RF_CAL_PARTIAL", cfg.esp_phy_rf_cal_partial);
        entries[18] = sdkconfig.Entry.flag("CONFIG_REDUCE_PHY_TX_POWER", cfg.reduce_phy_tx_power);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
