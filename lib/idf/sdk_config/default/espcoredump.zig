const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "espcoredump";

pub const Config = struct {
    /// Kconfig key: `CONFIG_ESP_COREDUMP_ENABLE_TO_FLASH`.
    /// Controls whether ESP coredump enable TO flash is enabled for the `espcoredump` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_coredump_enable_to_flash: bool = false,
    /// Kconfig key: `CONFIG_ESP_COREDUMP_ENABLE_TO_NONE`.
    /// Controls whether ESP coredump enable TO NONE is enabled for the `espcoredump` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_coredump_enable_to_none: bool = true,
    /// Kconfig key: `CONFIG_ESP_COREDUMP_ENABLE_TO_UART`.
    /// Controls whether ESP coredump enable TO UART is enabled for the `espcoredump` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_coredump_enable_to_uart: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 3);
        entries[0] = sdkconfig.Entry.flag("CONFIG_ESP_COREDUMP_ENABLE_TO_FLASH", cfg.esp_coredump_enable_to_flash);
        entries[1] = sdkconfig.Entry.flag("CONFIG_ESP_COREDUMP_ENABLE_TO_NONE", cfg.esp_coredump_enable_to_none);
        entries[2] = sdkconfig.Entry.flag("CONFIG_ESP_COREDUMP_ENABLE_TO_UART", cfg.esp_coredump_enable_to_uart);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
