const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_event";

pub const Config = struct {
    /// Kconfig key: `CONFIG_ESP_EVENT_LOOP_PROFILING`.
    /// Controls whether ESP event LOOP profiling is enabled for the `esp_event` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_event_loop_profiling: bool = false,
    /// Kconfig key: `CONFIG_ESP_EVENT_POST_FROM_IRAM_ISR`.
    /// Controls whether ESP event POST FROM IRAM ISR is enabled for the `esp_event` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_event_post_from_iram_isr: bool = true,
    /// Kconfig key: `CONFIG_ESP_EVENT_POST_FROM_ISR`.
    /// Controls whether ESP event POST FROM ISR is enabled for the `esp_event` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_event_post_from_isr: bool = true,
    /// Kconfig key: `CONFIG_EVENT_LOOP_PROFILING`.
    /// Controls whether event LOOP profiling is enabled for the `esp_event` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    event_loop_profiling: bool = false,
    /// Kconfig key: `CONFIG_POST_EVENTS_FROM_IRAM_ISR`.
    /// Controls whether POST events FROM IRAM ISR is enabled for the `esp_event` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    post_events_from_iram_isr: bool = true,
    /// Kconfig key: `CONFIG_POST_EVENTS_FROM_ISR`.
    /// Controls whether POST events FROM ISR is enabled for the `esp_event` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    post_events_from_isr: bool = true,
    /// Kconfig key: `CONFIG_SYSTEM_EVENT_QUEUE_SIZE`.
    /// Sets the numeric value for system event queue SIZE in the `esp_event` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `32`.
    system_event_queue_size: i64 = 32,
    /// Kconfig key: `CONFIG_SYSTEM_EVENT_TASK_STACK_SIZE`.
    /// Sets the numeric value for system event TASK stack SIZE in the `esp_event` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2304`.
    system_event_task_stack_size: i64 = 2304,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 8);
        entries[0] = sdkconfig.Entry.flag("CONFIG_ESP_EVENT_LOOP_PROFILING", cfg.esp_event_loop_profiling);
        entries[1] = sdkconfig.Entry.flag("CONFIG_ESP_EVENT_POST_FROM_IRAM_ISR", cfg.esp_event_post_from_iram_isr);
        entries[2] = sdkconfig.Entry.flag("CONFIG_ESP_EVENT_POST_FROM_ISR", cfg.esp_event_post_from_isr);
        entries[3] = sdkconfig.Entry.flag("CONFIG_EVENT_LOOP_PROFILING", cfg.event_loop_profiling);
        entries[4] = sdkconfig.Entry.flag("CONFIG_POST_EVENTS_FROM_IRAM_ISR", cfg.post_events_from_iram_isr);
        entries[5] = sdkconfig.Entry.flag("CONFIG_POST_EVENTS_FROM_ISR", cfg.post_events_from_isr);
        entries[6] = sdkconfig.Entry.int("CONFIG_SYSTEM_EVENT_QUEUE_SIZE", cfg.system_event_queue_size);
        entries[7] = sdkconfig.Entry.int("CONFIG_SYSTEM_EVENT_TASK_STACK_SIZE", cfg.system_event_task_stack_size);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
