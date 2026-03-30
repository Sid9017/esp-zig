const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "wpa_supplicant";

pub const Config = struct {
    /// Kconfig key: `CONFIG_WPA_11KV_SUPPORT`.
    /// Controls whether WPA 11KV support is enabled for the `wpa_supplicant` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    wpa_11kv_support: bool = false,
    /// Kconfig key: `CONFIG_WPA_11R_SUPPORT`.
    /// Controls whether WPA 11R support is enabled for the `wpa_supplicant` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    wpa_11r_support: bool = false,
    /// Kconfig key: `CONFIG_WPA_DEBUG_PRINT`.
    /// Controls whether WPA debug print is enabled for the `wpa_supplicant` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    wpa_debug_print: bool = false,
    /// Kconfig key: `CONFIG_WPA_DPP_SUPPORT`.
    /// Controls whether WPA DPP support is enabled for the `wpa_supplicant` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    wpa_dpp_support: bool = false,
    /// Kconfig key: `CONFIG_WPA_MBEDTLS_CRYPTO`.
    /// Controls whether WPA mbedtls crypto is enabled for the `wpa_supplicant` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    wpa_mbedtls_crypto: bool = true,
    /// Kconfig key: `CONFIG_WPA_MBEDTLS_TLS_CLIENT`.
    /// Controls whether WPA mbedtls TLS client is enabled for the `wpa_supplicant` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    wpa_mbedtls_tls_client: bool = true,
    /// Kconfig key: `CONFIG_WPA_MBO_SUPPORT`.
    /// Controls whether WPA MBO support is enabled for the `wpa_supplicant` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    wpa_mbo_support: bool = false,
    /// Kconfig key: `CONFIG_WPA_SUITE_B_192`.
    /// Controls whether WPA suite B 192 is enabled for the `wpa_supplicant` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    wpa_suite_b_192: bool = false,
    /// Kconfig key: `CONFIG_WPA_TESTING_OPTIONS`.
    /// Controls whether WPA testing options is enabled for the `wpa_supplicant` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    wpa_testing_options: bool = false,
    /// Kconfig key: `CONFIG_WPA_WAPI_PSK`.
    /// Controls whether WPA WAPI PSK is enabled for the `wpa_supplicant` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    wpa_wapi_psk: bool = false,
    /// Kconfig key: `CONFIG_WPA_WPS_SOFTAP_REGISTRAR`.
    /// Controls whether WPA WPS softap registrar is enabled for the `wpa_supplicant` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    wpa_wps_softap_registrar: bool = false,
    /// Kconfig key: `CONFIG_WPA_WPS_STRICT`.
    /// Controls whether WPA WPS strict is enabled for the `wpa_supplicant` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    wpa_wps_strict: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 12);
        entries[0] = sdkconfig.Entry.flag("CONFIG_WPA_11KV_SUPPORT", cfg.wpa_11kv_support);
        entries[1] = sdkconfig.Entry.flag("CONFIG_WPA_11R_SUPPORT", cfg.wpa_11r_support);
        entries[2] = sdkconfig.Entry.flag("CONFIG_WPA_DEBUG_PRINT", cfg.wpa_debug_print);
        entries[3] = sdkconfig.Entry.flag("CONFIG_WPA_DPP_SUPPORT", cfg.wpa_dpp_support);
        entries[4] = sdkconfig.Entry.flag("CONFIG_WPA_MBEDTLS_CRYPTO", cfg.wpa_mbedtls_crypto);
        entries[5] = sdkconfig.Entry.flag("CONFIG_WPA_MBEDTLS_TLS_CLIENT", cfg.wpa_mbedtls_tls_client);
        entries[6] = sdkconfig.Entry.flag("CONFIG_WPA_MBO_SUPPORT", cfg.wpa_mbo_support);
        entries[7] = sdkconfig.Entry.flag("CONFIG_WPA_SUITE_B_192", cfg.wpa_suite_b_192);
        entries[8] = sdkconfig.Entry.flag("CONFIG_WPA_TESTING_OPTIONS", cfg.wpa_testing_options);
        entries[9] = sdkconfig.Entry.flag("CONFIG_WPA_WAPI_PSK", cfg.wpa_wapi_psk);
        entries[10] = sdkconfig.Entry.flag("CONFIG_WPA_WPS_SOFTAP_REGISTRAR", cfg.wpa_wps_softap_registrar);
        entries[11] = sdkconfig.Entry.flag("CONFIG_WPA_WPS_STRICT", cfg.wpa_wps_strict);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
