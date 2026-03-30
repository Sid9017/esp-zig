const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_https_ota";

pub const Config = struct {
    /// Kconfig key: `CONFIG_ESP_HTTPS_OTA_ALLOW_HTTP`.
    /// Controls whether ESP https OTA allow HTTP is enabled for the `esp_https_ota` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_https_ota_allow_http: bool = false,
    /// Kconfig key: `CONFIG_ESP_HTTPS_OTA_DECRYPT_CB`.
    /// Controls whether ESP https OTA decrypt CB is enabled for the `esp_https_ota` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_https_ota_decrypt_cb: bool = false,
    /// Kconfig key: `CONFIG_ESP_HTTPS_OTA_EVENT_POST_TIMEOUT`.
    /// Sets the numeric value for ESP https OTA event POST timeout in the `esp_https_ota` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2000`.
    esp_https_ota_event_post_timeout: i64 = 2000,
    /// Kconfig key: `CONFIG_OTA_ALLOW_HTTP`.
    /// Controls whether OTA allow HTTP is enabled for the `esp_https_ota` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    ota_allow_http: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 4);
        entries[0] = sdkconfig.Entry.flag("CONFIG_ESP_HTTPS_OTA_ALLOW_HTTP", cfg.esp_https_ota_allow_http);
        entries[1] = sdkconfig.Entry.flag("CONFIG_ESP_HTTPS_OTA_DECRYPT_CB", cfg.esp_https_ota_decrypt_cb);
        entries[2] = sdkconfig.Entry.int("CONFIG_ESP_HTTPS_OTA_EVENT_POST_TIMEOUT", cfg.esp_https_ota_event_post_timeout);
        entries[3] = sdkconfig.Entry.flag("CONFIG_OTA_ALLOW_HTTP", cfg.ota_allow_http);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
