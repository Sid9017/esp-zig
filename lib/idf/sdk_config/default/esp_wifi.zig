const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_wifi";

pub const Config = struct {
    /// Kconfig key: `CONFIG_ESP32_WIFI_AMPDU_RX_ENABLED`.
    /// Controls whether esp32 WIFI ampdu RX enabled is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp32_wifi_ampdu_rx_enabled: bool = true,
    /// Kconfig key: `CONFIG_ESP32_WIFI_AMPDU_TX_ENABLED`.
    /// Controls whether esp32 WIFI ampdu TX enabled is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp32_wifi_ampdu_tx_enabled: bool = true,
    /// Kconfig key: `CONFIG_ESP32_WIFI_CSI_ENABLED`.
    /// Controls whether esp32 WIFI CSI enabled is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp32_wifi_csi_enabled: bool = false,
    /// Kconfig key: `CONFIG_ESP32_WIFI_DYNAMIC_RX_BUFFER_NUM`.
    /// Sets the numeric value for esp32 WIFI dynamic RX buffer NUM in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `32`.
    esp32_wifi_dynamic_rx_buffer_num: i64 = 32,
    /// Kconfig key: `CONFIG_ESP32_WIFI_DYNAMIC_TX_BUFFER`.
    /// Controls whether esp32 WIFI dynamic TX buffer is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp32_wifi_dynamic_tx_buffer: bool = true,
    /// Kconfig key: `CONFIG_ESP32_WIFI_DYNAMIC_TX_BUFFER_NUM`.
    /// Sets the numeric value for esp32 WIFI dynamic TX buffer NUM in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `32`.
    esp32_wifi_dynamic_tx_buffer_num: i64 = 32,
    /// Kconfig key: `CONFIG_ESP32_WIFI_ENABLED`.
    /// Controls whether esp32 WIFI enabled is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp32_wifi_enabled: bool = true,
    /// Kconfig key: `CONFIG_ESP32_WIFI_ENABLE_WPA3_OWE_STA`.
    /// Controls whether esp32 WIFI enable WPA3 OWE STA is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp32_wifi_enable_wpa3_owe_sta: bool = true,
    /// Kconfig key: `CONFIG_ESP32_WIFI_ENABLE_WPA3_SAE`.
    /// Controls whether esp32 WIFI enable WPA3 SAE is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp32_wifi_enable_wpa3_sae: bool = true,
    /// Kconfig key: `CONFIG_ESP32_WIFI_IRAM_OPT`.
    /// Controls whether esp32 WIFI IRAM OPT is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp32_wifi_iram_opt: bool = true,
    /// Kconfig key: `CONFIG_ESP32_WIFI_MGMT_SBUF_NUM`.
    /// Sets the numeric value for esp32 WIFI MGMT SBUF NUM in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `32`.
    esp32_wifi_mgmt_sbuf_num: i64 = 32,
    /// Kconfig key: `CONFIG_ESP32_WIFI_NVS_ENABLED`.
    /// Controls whether esp32 WIFI NVS enabled is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp32_wifi_nvs_enabled: bool = true,
    /// Kconfig key: `CONFIG_ESP32_WIFI_RX_BA_WIN`.
    /// Sets the numeric value for esp32 WIFI RX BA WIN in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `6`.
    esp32_wifi_rx_ba_win: i64 = 6,
    /// Kconfig key: `CONFIG_ESP32_WIFI_RX_IRAM_OPT`.
    /// Controls whether esp32 WIFI RX IRAM OPT is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp32_wifi_rx_iram_opt: bool = true,
    /// Kconfig key: `CONFIG_ESP32_WIFI_SOFTAP_BEACON_MAX_LEN`.
    /// Sets the numeric value for esp32 WIFI softap beacon MAX LEN in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `752`.
    esp32_wifi_softap_beacon_max_len: i64 = 752,
    /// Kconfig key: `CONFIG_ESP32_WIFI_STATIC_RX_BUFFER_NUM`.
    /// Sets the numeric value for esp32 WIFI static RX buffer NUM in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `10`.
    esp32_wifi_static_rx_buffer_num: i64 = 10,
    /// Kconfig key: `CONFIG_ESP32_WIFI_STATIC_TX_BUFFER`.
    /// Controls whether esp32 WIFI static TX buffer is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp32_wifi_static_tx_buffer: bool = false,
    /// Kconfig key: `CONFIG_ESP32_WIFI_TASK_PINNED_TO_CORE_0`.
    /// Controls whether esp32 WIFI TASK pinned TO CORE 0 is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp32_wifi_task_pinned_to_core_0: bool = true,
    /// Kconfig key: `CONFIG_ESP32_WIFI_TASK_PINNED_TO_CORE_1`.
    /// Controls whether esp32 WIFI TASK pinned TO CORE 1 is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp32_wifi_task_pinned_to_core_1: bool = false,
    /// Kconfig key: `CONFIG_ESP32_WIFI_TX_BA_WIN`.
    /// Sets the numeric value for esp32 WIFI TX BA WIN in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `6`.
    esp32_wifi_tx_ba_win: i64 = 6,
    /// Kconfig key: `CONFIG_ESP32_WIFI_TX_BUFFER_TYPE`.
    /// Sets the numeric value for esp32 WIFI TX buffer TYPE in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    esp32_wifi_tx_buffer_type: i64 = 1,
    /// Kconfig key: `CONFIG_ESP_WIFI_11KV_SUPPORT`.
    /// Controls whether ESP WIFI 11KV support is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_11kv_support: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_11R_SUPPORT`.
    /// Controls whether ESP WIFI 11R support is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_11r_support: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_AMPDU_RX_ENABLED`.
    /// Controls whether ESP WIFI ampdu RX enabled is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_ampdu_rx_enabled: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_AMPDU_TX_ENABLED`.
    /// Controls whether ESP WIFI ampdu TX enabled is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_ampdu_tx_enabled: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_CSI_ENABLED`.
    /// Controls whether ESP WIFI CSI enabled is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_csi_enabled: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_DEBUG_PRINT`.
    /// Controls whether ESP WIFI debug print is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_debug_print: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_DPP_SUPPORT`.
    /// Controls whether ESP WIFI DPP support is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_dpp_support: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_DYNAMIC_RX_BUFFER_NUM`.
    /// Sets the numeric value for ESP WIFI dynamic RX buffer NUM in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `32`.
    esp_wifi_dynamic_rx_buffer_num: i64 = 32,
    /// Kconfig key: `CONFIG_ESP_WIFI_DYNAMIC_RX_MGMT_BUF`.
    /// Sets the numeric value for ESP WIFI dynamic RX MGMT BUF in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `0`.
    esp_wifi_dynamic_rx_mgmt_buf: i64 = 0,
    /// Kconfig key: `CONFIG_ESP_WIFI_DYNAMIC_RX_MGMT_BUFFER`.
    /// Controls whether ESP WIFI dynamic RX MGMT buffer is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_dynamic_rx_mgmt_buffer: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_DYNAMIC_TX_BUFFER`.
    /// Controls whether ESP WIFI dynamic TX buffer is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_dynamic_tx_buffer: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_DYNAMIC_TX_BUFFER_NUM`.
    /// Sets the numeric value for ESP WIFI dynamic TX buffer NUM in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `32`.
    esp_wifi_dynamic_tx_buffer_num: i64 = 32,
    /// Kconfig key: `CONFIG_ESP_WIFI_ENABLED`.
    /// Controls whether ESP WIFI enabled is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_enabled: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_ENABLE_SAE_PK`.
    /// Controls whether ESP WIFI enable SAE PK is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_enable_sae_pk: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_ENABLE_WPA3_OWE_STA`.
    /// Controls whether ESP WIFI enable WPA3 OWE STA is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_enable_wpa3_owe_sta: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_ENABLE_WPA3_SAE`.
    /// Controls whether ESP WIFI enable WPA3 SAE is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_enable_wpa3_sae: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_ENTERPRISE_SUPPORT`.
    /// Controls whether ESP WIFI enterprise support is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_enterprise_support: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_ENT_FREE_DYNAMIC_BUFFER`.
    /// Controls whether ESP WIFI ENT FREE dynamic buffer is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_ent_free_dynamic_buffer: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_ESPNOW_MAX_ENCRYPT_NUM`.
    /// Sets the numeric value for ESP WIFI espnow MAX encrypt NUM in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `7`.
    esp_wifi_espnow_max_encrypt_num: i64 = 7,
    /// Kconfig key: `CONFIG_ESP_WIFI_EXTERNAL_COEXIST_ENABLE`.
    /// Controls whether ESP WIFI external coexist enable is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_external_coexist_enable: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_EXTRA_IRAM_OPT`.
    /// Controls whether ESP WIFI extra IRAM OPT is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_extra_iram_opt: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_FTM_ENABLE`.
    /// Controls whether ESP WIFI FTM enable is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_ftm_enable: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_GCMP_SUPPORT`.
    /// Controls whether ESP WIFI GCMP support is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_gcmp_support: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_GMAC_SUPPORT`.
    /// Controls whether ESP WIFI GMAC support is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_gmac_support: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_IRAM_OPT`.
    /// Controls whether ESP WIFI IRAM OPT is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_iram_opt: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_MBEDTLS_CRYPTO`.
    /// Controls whether ESP WIFI mbedtls crypto is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_mbedtls_crypto: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_MBEDTLS_TLS_CLIENT`.
    /// Controls whether ESP WIFI mbedtls TLS client is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_mbedtls_tls_client: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_MBO_SUPPORT`.
    /// Controls whether ESP WIFI MBO support is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_mbo_support: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_MGMT_SBUF_NUM`.
    /// Sets the numeric value for ESP WIFI MGMT SBUF NUM in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `32`.
    esp_wifi_mgmt_sbuf_num: i64 = 32,
    /// Kconfig key: `CONFIG_ESP_WIFI_NVS_ENABLED`.
    /// Controls whether ESP WIFI NVS enabled is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_nvs_enabled: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_RX_BA_WIN`.
    /// Sets the numeric value for ESP WIFI RX BA WIN in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `6`.
    esp_wifi_rx_ba_win: i64 = 6,
    /// Kconfig key: `CONFIG_ESP_WIFI_RX_IRAM_OPT`.
    /// Controls whether ESP WIFI RX IRAM OPT is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_rx_iram_opt: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_RX_MGMT_BUF_NUM_DEF`.
    /// Sets the numeric value for ESP WIFI RX MGMT BUF NUM DEF in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `5`.
    esp_wifi_rx_mgmt_buf_num_def: i64 = 5,
    /// Kconfig key: `CONFIG_ESP_WIFI_SLP_BEACON_LOST_OPT`.
    /// Controls whether ESP WIFI SLP beacon LOST OPT is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_slp_beacon_lost_opt: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_SLP_DEFAULT_MAX_ACTIVE_TIME`.
    /// Sets the numeric value for ESP WIFI SLP default MAX active TIME in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `10`.
    esp_wifi_slp_default_max_active_time: i64 = 10,
    /// Kconfig key: `CONFIG_ESP_WIFI_SLP_DEFAULT_MIN_ACTIVE_TIME`.
    /// Sets the numeric value for ESP WIFI SLP default MIN active TIME in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `50`.
    esp_wifi_slp_default_min_active_time: i64 = 50,
    /// Kconfig key: `CONFIG_ESP_WIFI_SLP_DEFAULT_WAIT_BROADCAST_DATA_TIME`.
    /// Sets the numeric value for ESP WIFI SLP default WAIT broadcast DATA TIME in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `15`.
    esp_wifi_slp_default_wait_broadcast_data_time: i64 = 15,
    /// Kconfig key: `CONFIG_ESP_WIFI_SLP_IRAM_OPT`.
    /// Controls whether ESP WIFI SLP IRAM OPT is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_slp_iram_opt: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_SOFTAP_BEACON_MAX_LEN`.
    /// Sets the numeric value for ESP WIFI softap beacon MAX LEN in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `752`.
    esp_wifi_softap_beacon_max_len: i64 = 752,
    /// Kconfig key: `CONFIG_ESP_WIFI_SOFTAP_SAE_SUPPORT`.
    /// Controls whether ESP WIFI softap SAE support is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_softap_sae_support: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_SOFTAP_SUPPORT`.
    /// Controls whether ESP WIFI softap support is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_softap_support: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_STATIC_RX_BUFFER_NUM`.
    /// Sets the numeric value for ESP WIFI static RX buffer NUM in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `10`.
    esp_wifi_static_rx_buffer_num: i64 = 10,
    /// Kconfig key: `CONFIG_ESP_WIFI_STATIC_RX_MGMT_BUFFER`.
    /// Controls whether ESP WIFI static RX MGMT buffer is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_static_rx_mgmt_buffer: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_STATIC_TX_BUFFER`.
    /// Controls whether ESP WIFI static TX buffer is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_static_tx_buffer: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_STA_DISCONNECTED_PM_ENABLE`.
    /// Controls whether ESP WIFI STA disconnected PM enable is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_sta_disconnected_pm_enable: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_SUITE_B_192`.
    /// Controls whether ESP WIFI suite B 192 is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_suite_b_192: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_TASK_PINNED_TO_CORE_0`.
    /// Controls whether ESP WIFI TASK pinned TO CORE 0 is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_wifi_task_pinned_to_core_0: bool = true,
    /// Kconfig key: `CONFIG_ESP_WIFI_TASK_PINNED_TO_CORE_1`.
    /// Controls whether ESP WIFI TASK pinned TO CORE 1 is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_task_pinned_to_core_1: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_TESTING_OPTIONS`.
    /// Controls whether ESP WIFI testing options is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_testing_options: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_TX_BA_WIN`.
    /// Sets the numeric value for ESP WIFI TX BA WIN in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `6`.
    esp_wifi_tx_ba_win: i64 = 6,
    /// Kconfig key: `CONFIG_ESP_WIFI_TX_BUFFER_TYPE`.
    /// Sets the numeric value for ESP WIFI TX buffer TYPE in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    esp_wifi_tx_buffer_type: i64 = 1,
    /// Kconfig key: `CONFIG_ESP_WIFI_WAPI_PSK`.
    /// Controls whether ESP WIFI WAPI PSK is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_wapi_psk: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_WPS_PASSPHRASE`.
    /// Controls whether ESP WIFI WPS passphrase is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_wps_passphrase: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_WPS_SOFTAP_REGISTRAR`.
    /// Controls whether ESP WIFI WPS softap registrar is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_wps_softap_registrar: bool = false,
    /// Kconfig key: `CONFIG_ESP_WIFI_WPS_STRICT`.
    /// Controls whether ESP WIFI WPS strict is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_wifi_wps_strict: bool = false,
    /// Kconfig key: `CONFIG_WIFI_PROV_AUTOSTOP_TIMEOUT`.
    /// Sets the numeric value for WIFI PROV autostop timeout in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `30`.
    wifi_prov_autostop_timeout: i64 = 30,
    /// Kconfig key: `CONFIG_WIFI_PROV_SCAN_MAX_ENTRIES`.
    /// Sets the numeric value for WIFI PROV SCAN MAX entries in the `esp_wifi` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `16`.
    wifi_prov_scan_max_entries: i64 = 16,
    /// Kconfig key: `CONFIG_WIFI_PROV_STA_ALL_CHANNEL_SCAN`.
    /// Controls whether WIFI PROV STA ALL channel SCAN is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    wifi_prov_sta_all_channel_scan: bool = true,
    /// Kconfig key: `CONFIG_WIFI_PROV_STA_FAST_SCAN`.
    /// Controls whether WIFI PROV STA FAST SCAN is enabled for the `esp_wifi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    wifi_prov_sta_fast_scan: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 80);
        entries[0] = sdkconfig.Entry.flag("CONFIG_ESP32_WIFI_AMPDU_RX_ENABLED", cfg.esp32_wifi_ampdu_rx_enabled);
        entries[1] = sdkconfig.Entry.flag("CONFIG_ESP32_WIFI_AMPDU_TX_ENABLED", cfg.esp32_wifi_ampdu_tx_enabled);
        entries[2] = sdkconfig.Entry.flag("CONFIG_ESP32_WIFI_CSI_ENABLED", cfg.esp32_wifi_csi_enabled);
        entries[3] = sdkconfig.Entry.int("CONFIG_ESP32_WIFI_DYNAMIC_RX_BUFFER_NUM", cfg.esp32_wifi_dynamic_rx_buffer_num);
        entries[4] = sdkconfig.Entry.flag("CONFIG_ESP32_WIFI_DYNAMIC_TX_BUFFER", cfg.esp32_wifi_dynamic_tx_buffer);
        entries[5] = sdkconfig.Entry.int("CONFIG_ESP32_WIFI_DYNAMIC_TX_BUFFER_NUM", cfg.esp32_wifi_dynamic_tx_buffer_num);
        entries[6] = sdkconfig.Entry.flag("CONFIG_ESP32_WIFI_ENABLED", cfg.esp32_wifi_enabled);
        entries[7] = sdkconfig.Entry.flag("CONFIG_ESP32_WIFI_ENABLE_WPA3_OWE_STA", cfg.esp32_wifi_enable_wpa3_owe_sta);
        entries[8] = sdkconfig.Entry.flag("CONFIG_ESP32_WIFI_ENABLE_WPA3_SAE", cfg.esp32_wifi_enable_wpa3_sae);
        entries[9] = sdkconfig.Entry.flag("CONFIG_ESP32_WIFI_IRAM_OPT", cfg.esp32_wifi_iram_opt);
        entries[10] = sdkconfig.Entry.int("CONFIG_ESP32_WIFI_MGMT_SBUF_NUM", cfg.esp32_wifi_mgmt_sbuf_num);
        entries[11] = sdkconfig.Entry.flag("CONFIG_ESP32_WIFI_NVS_ENABLED", cfg.esp32_wifi_nvs_enabled);
        entries[12] = sdkconfig.Entry.int("CONFIG_ESP32_WIFI_RX_BA_WIN", cfg.esp32_wifi_rx_ba_win);
        entries[13] = sdkconfig.Entry.flag("CONFIG_ESP32_WIFI_RX_IRAM_OPT", cfg.esp32_wifi_rx_iram_opt);
        entries[14] = sdkconfig.Entry.int("CONFIG_ESP32_WIFI_SOFTAP_BEACON_MAX_LEN", cfg.esp32_wifi_softap_beacon_max_len);
        entries[15] = sdkconfig.Entry.int("CONFIG_ESP32_WIFI_STATIC_RX_BUFFER_NUM", cfg.esp32_wifi_static_rx_buffer_num);
        entries[16] = sdkconfig.Entry.flag("CONFIG_ESP32_WIFI_STATIC_TX_BUFFER", cfg.esp32_wifi_static_tx_buffer);
        entries[17] = sdkconfig.Entry.flag("CONFIG_ESP32_WIFI_TASK_PINNED_TO_CORE_0", cfg.esp32_wifi_task_pinned_to_core_0);
        entries[18] = sdkconfig.Entry.flag("CONFIG_ESP32_WIFI_TASK_PINNED_TO_CORE_1", cfg.esp32_wifi_task_pinned_to_core_1);
        entries[19] = sdkconfig.Entry.int("CONFIG_ESP32_WIFI_TX_BA_WIN", cfg.esp32_wifi_tx_ba_win);
        entries[20] = sdkconfig.Entry.int("CONFIG_ESP32_WIFI_TX_BUFFER_TYPE", cfg.esp32_wifi_tx_buffer_type);
        entries[21] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_11KV_SUPPORT", cfg.esp_wifi_11kv_support);
        entries[22] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_11R_SUPPORT", cfg.esp_wifi_11r_support);
        entries[23] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_AMPDU_RX_ENABLED", cfg.esp_wifi_ampdu_rx_enabled);
        entries[24] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_AMPDU_TX_ENABLED", cfg.esp_wifi_ampdu_tx_enabled);
        entries[25] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_CSI_ENABLED", cfg.esp_wifi_csi_enabled);
        entries[26] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_DEBUG_PRINT", cfg.esp_wifi_debug_print);
        entries[27] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_DPP_SUPPORT", cfg.esp_wifi_dpp_support);
        entries[28] = sdkconfig.Entry.int("CONFIG_ESP_WIFI_DYNAMIC_RX_BUFFER_NUM", cfg.esp_wifi_dynamic_rx_buffer_num);
        entries[29] = sdkconfig.Entry.int("CONFIG_ESP_WIFI_DYNAMIC_RX_MGMT_BUF", cfg.esp_wifi_dynamic_rx_mgmt_buf);
        entries[30] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_DYNAMIC_RX_MGMT_BUFFER", cfg.esp_wifi_dynamic_rx_mgmt_buffer);
        entries[31] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_DYNAMIC_TX_BUFFER", cfg.esp_wifi_dynamic_tx_buffer);
        entries[32] = sdkconfig.Entry.int("CONFIG_ESP_WIFI_DYNAMIC_TX_BUFFER_NUM", cfg.esp_wifi_dynamic_tx_buffer_num);
        entries[33] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_ENABLED", cfg.esp_wifi_enabled);
        entries[34] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_ENABLE_SAE_PK", cfg.esp_wifi_enable_sae_pk);
        entries[35] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_ENABLE_WPA3_OWE_STA", cfg.esp_wifi_enable_wpa3_owe_sta);
        entries[36] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_ENABLE_WPA3_SAE", cfg.esp_wifi_enable_wpa3_sae);
        entries[37] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_ENTERPRISE_SUPPORT", cfg.esp_wifi_enterprise_support);
        entries[38] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_ENT_FREE_DYNAMIC_BUFFER", cfg.esp_wifi_ent_free_dynamic_buffer);
        entries[39] = sdkconfig.Entry.int("CONFIG_ESP_WIFI_ESPNOW_MAX_ENCRYPT_NUM", cfg.esp_wifi_espnow_max_encrypt_num);
        entries[40] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_EXTERNAL_COEXIST_ENABLE", cfg.esp_wifi_external_coexist_enable);
        entries[41] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_EXTRA_IRAM_OPT", cfg.esp_wifi_extra_iram_opt);
        entries[42] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_FTM_ENABLE", cfg.esp_wifi_ftm_enable);
        entries[43] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_GCMP_SUPPORT", cfg.esp_wifi_gcmp_support);
        entries[44] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_GMAC_SUPPORT", cfg.esp_wifi_gmac_support);
        entries[45] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_IRAM_OPT", cfg.esp_wifi_iram_opt);
        entries[46] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_MBEDTLS_CRYPTO", cfg.esp_wifi_mbedtls_crypto);
        entries[47] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_MBEDTLS_TLS_CLIENT", cfg.esp_wifi_mbedtls_tls_client);
        entries[48] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_MBO_SUPPORT", cfg.esp_wifi_mbo_support);
        entries[49] = sdkconfig.Entry.int("CONFIG_ESP_WIFI_MGMT_SBUF_NUM", cfg.esp_wifi_mgmt_sbuf_num);
        entries[50] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_NVS_ENABLED", cfg.esp_wifi_nvs_enabled);
        entries[51] = sdkconfig.Entry.int("CONFIG_ESP_WIFI_RX_BA_WIN", cfg.esp_wifi_rx_ba_win);
        entries[52] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_RX_IRAM_OPT", cfg.esp_wifi_rx_iram_opt);
        entries[53] = sdkconfig.Entry.int("CONFIG_ESP_WIFI_RX_MGMT_BUF_NUM_DEF", cfg.esp_wifi_rx_mgmt_buf_num_def);
        entries[54] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_SLP_BEACON_LOST_OPT", cfg.esp_wifi_slp_beacon_lost_opt);
        entries[55] = sdkconfig.Entry.int("CONFIG_ESP_WIFI_SLP_DEFAULT_MAX_ACTIVE_TIME", cfg.esp_wifi_slp_default_max_active_time);
        entries[56] = sdkconfig.Entry.int("CONFIG_ESP_WIFI_SLP_DEFAULT_MIN_ACTIVE_TIME", cfg.esp_wifi_slp_default_min_active_time);
        entries[57] = sdkconfig.Entry.int("CONFIG_ESP_WIFI_SLP_DEFAULT_WAIT_BROADCAST_DATA_TIME", cfg.esp_wifi_slp_default_wait_broadcast_data_time);
        entries[58] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_SLP_IRAM_OPT", cfg.esp_wifi_slp_iram_opt);
        entries[59] = sdkconfig.Entry.int("CONFIG_ESP_WIFI_SOFTAP_BEACON_MAX_LEN", cfg.esp_wifi_softap_beacon_max_len);
        entries[60] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_SOFTAP_SAE_SUPPORT", cfg.esp_wifi_softap_sae_support);
        entries[61] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_SOFTAP_SUPPORT", cfg.esp_wifi_softap_support);
        entries[62] = sdkconfig.Entry.int("CONFIG_ESP_WIFI_STATIC_RX_BUFFER_NUM", cfg.esp_wifi_static_rx_buffer_num);
        entries[63] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_STATIC_RX_MGMT_BUFFER", cfg.esp_wifi_static_rx_mgmt_buffer);
        entries[64] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_STATIC_TX_BUFFER", cfg.esp_wifi_static_tx_buffer);
        entries[65] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_STA_DISCONNECTED_PM_ENABLE", cfg.esp_wifi_sta_disconnected_pm_enable);
        entries[66] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_SUITE_B_192", cfg.esp_wifi_suite_b_192);
        entries[67] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_TASK_PINNED_TO_CORE_0", cfg.esp_wifi_task_pinned_to_core_0);
        entries[68] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_TASK_PINNED_TO_CORE_1", cfg.esp_wifi_task_pinned_to_core_1);
        entries[69] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_TESTING_OPTIONS", cfg.esp_wifi_testing_options);
        entries[70] = sdkconfig.Entry.int("CONFIG_ESP_WIFI_TX_BA_WIN", cfg.esp_wifi_tx_ba_win);
        entries[71] = sdkconfig.Entry.int("CONFIG_ESP_WIFI_TX_BUFFER_TYPE", cfg.esp_wifi_tx_buffer_type);
        entries[72] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_WAPI_PSK", cfg.esp_wifi_wapi_psk);
        entries[73] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_WPS_PASSPHRASE", cfg.esp_wifi_wps_passphrase);
        entries[74] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_WPS_SOFTAP_REGISTRAR", cfg.esp_wifi_wps_softap_registrar);
        entries[75] = sdkconfig.Entry.flag("CONFIG_ESP_WIFI_WPS_STRICT", cfg.esp_wifi_wps_strict);
        entries[76] = sdkconfig.Entry.int("CONFIG_WIFI_PROV_AUTOSTOP_TIMEOUT", cfg.wifi_prov_autostop_timeout);
        entries[77] = sdkconfig.Entry.int("CONFIG_WIFI_PROV_SCAN_MAX_ENTRIES", cfg.wifi_prov_scan_max_entries);
        entries[78] = sdkconfig.Entry.flag("CONFIG_WIFI_PROV_STA_ALL_CHANNEL_SCAN", cfg.wifi_prov_sta_all_channel_scan);
        entries[79] = sdkconfig.Entry.flag("CONFIG_WIFI_PROV_STA_FAST_SCAN", cfg.wifi_prov_sta_fast_scan);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
