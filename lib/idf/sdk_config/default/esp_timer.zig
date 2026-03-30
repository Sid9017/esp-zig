const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_timer";

pub const Config = struct {
    /// Kconfig key: `CONFIG_ESP_TIMER_IMPL_SYSTIMER`.
    /// Controls whether ESP timer IMPL systimer is enabled for the `esp_timer` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_timer_impl_systimer: bool = true,
    /// Kconfig key: `CONFIG_ESP_TIMER_INTERRUPT_LEVEL`.
    /// Sets the numeric value for ESP timer interrupt level in the `esp_timer` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    esp_timer_interrupt_level: i64 = 1,
    /// Kconfig key: `CONFIG_ESP_TIMER_ISR_AFFINITY_CPU0`.
    /// Controls whether ESP timer ISR affinity CPU0 is enabled for the `esp_timer` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_timer_isr_affinity_cpu0: bool = true,
    /// Kconfig key: `CONFIG_ESP_TIMER_PROFILING`.
    /// Controls whether ESP timer profiling is enabled for the `esp_timer` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_timer_profiling: bool = false,
    /// Kconfig key: `CONFIG_ESP_TIMER_SHOW_EXPERIMENTAL`.
    /// Controls whether ESP timer SHOW experimental is enabled for the `esp_timer` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_timer_show_experimental: bool = false,
    /// Kconfig key: `CONFIG_ESP_TIMER_SUPPORTS_ISR_DISPATCH_METHOD`.
    /// Controls whether ESP timer supports ISR dispatch method is enabled for the `esp_timer` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_timer_supports_isr_dispatch_method: bool = false,
    /// Kconfig key: `CONFIG_ESP_TIMER_TASK_AFFINITY`.
    /// Sets the literal value for ESP timer TASK affinity in the `esp_timer` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `"0x0"`.
    esp_timer_task_affinity: []const u8 = "0x0",
    /// Kconfig key: `CONFIG_ESP_TIMER_TASK_AFFINITY_CPU0`.
    /// Controls whether ESP timer TASK affinity CPU0 is enabled for the `esp_timer` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_timer_task_affinity_cpu0: bool = true,
    /// Kconfig key: `CONFIG_ESP_TIMER_TASK_STACK_SIZE`.
    /// Sets the numeric value for ESP timer TASK stack SIZE in the `esp_timer` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3584`.
    esp_timer_task_stack_size: i64 = 3584,
    /// Kconfig key: `CONFIG_TIMER_TASK_PRIORITY`.
    /// Sets the numeric value for timer TASK priority in the `esp_timer` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    timer_task_priority: i64 = 1,
    /// Kconfig key: `CONFIG_TIMER_TASK_STACK_DEPTH`.
    /// Sets the numeric value for timer TASK stack depth in the `esp_timer` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2048`.
    timer_task_stack_depth: i64 = 2048,
    /// Kconfig key: `CONFIG_TIMER_TASK_STACK_SIZE`.
    /// Sets the numeric value for timer TASK stack SIZE in the `esp_timer` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3584`.
    timer_task_stack_size: i64 = 3584,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 12);
        entries[0] = sdkconfig.Entry.flag("CONFIG_ESP_TIMER_IMPL_SYSTIMER", cfg.esp_timer_impl_systimer);
        entries[1] = sdkconfig.Entry.int("CONFIG_ESP_TIMER_INTERRUPT_LEVEL", cfg.esp_timer_interrupt_level);
        entries[2] = sdkconfig.Entry.flag("CONFIG_ESP_TIMER_ISR_AFFINITY_CPU0", cfg.esp_timer_isr_affinity_cpu0);
        entries[3] = sdkconfig.Entry.flag("CONFIG_ESP_TIMER_PROFILING", cfg.esp_timer_profiling);
        entries[4] = sdkconfig.Entry.flag("CONFIG_ESP_TIMER_SHOW_EXPERIMENTAL", cfg.esp_timer_show_experimental);
        entries[5] = sdkconfig.Entry.flag("CONFIG_ESP_TIMER_SUPPORTS_ISR_DISPATCH_METHOD", cfg.esp_timer_supports_isr_dispatch_method);
        entries[6] = sdkconfig.Entry.raw("CONFIG_ESP_TIMER_TASK_AFFINITY", cfg.esp_timer_task_affinity);
        entries[7] = sdkconfig.Entry.flag("CONFIG_ESP_TIMER_TASK_AFFINITY_CPU0", cfg.esp_timer_task_affinity_cpu0);
        entries[8] = sdkconfig.Entry.int("CONFIG_ESP_TIMER_TASK_STACK_SIZE", cfg.esp_timer_task_stack_size);
        entries[9] = sdkconfig.Entry.int("CONFIG_TIMER_TASK_PRIORITY", cfg.timer_task_priority);
        entries[10] = sdkconfig.Entry.int("CONFIG_TIMER_TASK_STACK_DEPTH", cfg.timer_task_stack_depth);
        entries[11] = sdkconfig.Entry.int("CONFIG_TIMER_TASK_STACK_SIZE", cfg.timer_task_stack_size);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
