const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_gdbstub";

pub const Config = struct {
    /// Kconfig key: `CONFIG_ESP_GDBSTUB_ENABLED`.
    /// Controls whether ESP gdbstub enabled is enabled for the `esp_gdbstub` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_gdbstub_enabled: bool = true,
    /// Kconfig key: `CONFIG_ESP_GDBSTUB_MAX_TASKS`.
    /// Sets the numeric value for ESP gdbstub MAX tasks in the `esp_gdbstub` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `32`.
    esp_gdbstub_max_tasks: i64 = 32,
    /// Kconfig key: `CONFIG_ESP_GDBSTUB_SUPPORT_TASKS`.
    /// Controls whether ESP gdbstub support tasks is enabled for the `esp_gdbstub` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_gdbstub_support_tasks: bool = true,
    /// Kconfig key: `CONFIG_GDBSTUB_MAX_TASKS`.
    /// Sets the numeric value for gdbstub MAX tasks in the `esp_gdbstub` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `32`.
    gdbstub_max_tasks: i64 = 32,
    /// Kconfig key: `CONFIG_GDBSTUB_SUPPORT_TASKS`.
    /// Controls whether gdbstub support tasks is enabled for the `esp_gdbstub` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    gdbstub_support_tasks: bool = true,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 5);
        entries[0] = sdkconfig.Entry.flag("CONFIG_ESP_GDBSTUB_ENABLED", cfg.esp_gdbstub_enabled);
        entries[1] = sdkconfig.Entry.int("CONFIG_ESP_GDBSTUB_MAX_TASKS", cfg.esp_gdbstub_max_tasks);
        entries[2] = sdkconfig.Entry.flag("CONFIG_ESP_GDBSTUB_SUPPORT_TASKS", cfg.esp_gdbstub_support_tasks);
        entries[3] = sdkconfig.Entry.int("CONFIG_GDBSTUB_MAX_TASKS", cfg.gdbstub_max_tasks);
        entries[4] = sdkconfig.Entry.flag("CONFIG_GDBSTUB_SUPPORT_TASKS", cfg.gdbstub_support_tasks);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
