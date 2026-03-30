const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_https_server";

pub const Config = struct {
    /// Kconfig key: `CONFIG_ESP_HTTPS_SERVER_ENABLE`.
    /// Controls whether ESP https server enable is enabled for the `esp_https_server` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_https_server_enable: bool = false,
    /// Kconfig key: `CONFIG_ESP_HTTPS_SERVER_EVENT_POST_TIMEOUT`.
    /// Sets the numeric value for ESP https server event POST timeout in the `esp_https_server` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2000`.
    esp_https_server_event_post_timeout: i64 = 2000,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 2);
        entries[0] = sdkconfig.Entry.flag("CONFIG_ESP_HTTPS_SERVER_ENABLE", cfg.esp_https_server_enable);
        entries[1] = sdkconfig.Entry.int("CONFIG_ESP_HTTPS_SERVER_EVENT_POST_TIMEOUT", cfg.esp_https_server_event_post_timeout);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
