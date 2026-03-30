const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_http_client";

pub const Config = struct {
    /// Kconfig key: `CONFIG_ESP_HTTP_CLIENT_ENABLE_BASIC_AUTH`.
    /// Controls whether ESP HTTP client enable basic AUTH is enabled for the `esp_http_client` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_http_client_enable_basic_auth: bool = false,
    /// Kconfig key: `CONFIG_ESP_HTTP_CLIENT_ENABLE_CUSTOM_TRANSPORT`.
    /// Controls whether ESP HTTP client enable custom transport is enabled for the `esp_http_client` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_http_client_enable_custom_transport: bool = false,
    /// Kconfig key: `CONFIG_ESP_HTTP_CLIENT_ENABLE_DIGEST_AUTH`.
    /// Controls whether ESP HTTP client enable digest AUTH is enabled for the `esp_http_client` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_http_client_enable_digest_auth: bool = false,
    /// Kconfig key: `CONFIG_ESP_HTTP_CLIENT_ENABLE_HTTPS`.
    /// Controls whether ESP HTTP client enable https is enabled for the `esp_http_client` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_http_client_enable_https: bool = true,
    /// Kconfig key: `CONFIG_ESP_HTTP_CLIENT_EVENT_POST_TIMEOUT`.
    /// Sets the numeric value for ESP HTTP client event POST timeout in the `esp_http_client` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2000`.
    esp_http_client_event_post_timeout: i64 = 2000,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 5);
        entries[0] = sdkconfig.Entry.flag("CONFIG_ESP_HTTP_CLIENT_ENABLE_BASIC_AUTH", cfg.esp_http_client_enable_basic_auth);
        entries[1] = sdkconfig.Entry.flag("CONFIG_ESP_HTTP_CLIENT_ENABLE_CUSTOM_TRANSPORT", cfg.esp_http_client_enable_custom_transport);
        entries[2] = sdkconfig.Entry.flag("CONFIG_ESP_HTTP_CLIENT_ENABLE_DIGEST_AUTH", cfg.esp_http_client_enable_digest_auth);
        entries[3] = sdkconfig.Entry.flag("CONFIG_ESP_HTTP_CLIENT_ENABLE_HTTPS", cfg.esp_http_client_enable_https);
        entries[4] = sdkconfig.Entry.int("CONFIG_ESP_HTTP_CLIENT_EVENT_POST_TIMEOUT", cfg.esp_http_client_event_post_timeout);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
