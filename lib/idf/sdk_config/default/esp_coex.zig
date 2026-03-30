const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_coex";

pub const Config = struct {
    /// Kconfig key: `CONFIG_ESP_COEX_ENABLED`.
    /// Controls whether ESP COEX enabled is enabled for the `esp_coex` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_coex_enabled: bool = true,
    /// Kconfig key: `CONFIG_ESP_COEX_EXTERNAL_COEXIST_ENABLE`.
    /// Controls whether ESP COEX external coexist enable is enabled for the `esp_coex` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_coex_external_coexist_enable: bool = false,
    /// Kconfig key: `CONFIG_ESP_COEX_GPIO_DEBUG`.
    /// Controls whether ESP COEX GPIO debug is enabled for the `esp_coex` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_coex_gpio_debug: bool = false,
    /// Kconfig key: `CONFIG_EXTERNAL_COEX_ENABLE`.
    /// Controls whether external COEX enable is enabled for the `esp_coex` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    external_coex_enable: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 4);
        entries[0] = sdkconfig.Entry.flag("CONFIG_ESP_COEX_ENABLED", cfg.esp_coex_enabled);
        entries[1] = sdkconfig.Entry.flag("CONFIG_ESP_COEX_EXTERNAL_COEXIST_ENABLE", cfg.esp_coex_external_coexist_enable);
        entries[2] = sdkconfig.Entry.flag("CONFIG_ESP_COEX_GPIO_DEBUG", cfg.esp_coex_gpio_debug);
        entries[3] = sdkconfig.Entry.flag("CONFIG_EXTERNAL_COEX_ENABLE", cfg.external_coex_enable);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
