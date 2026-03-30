const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "heap";

pub const Config = struct {
    /// Kconfig key: `CONFIG_HEAP_ABORT_WHEN_ALLOCATION_FAILS`.
    /// Controls whether HEAP abort WHEN allocation fails is enabled for the `heap` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    heap_abort_when_allocation_fails: bool = false,
    /// Kconfig key: `CONFIG_HEAP_PLACE_FUNCTION_INTO_FLASH`.
    /// Controls whether HEAP place function INTO flash is enabled for the `heap` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    heap_place_function_into_flash: bool = false,
    /// Kconfig key: `CONFIG_HEAP_POISONING_COMPREHENSIVE`.
    /// Controls whether HEAP poisoning comprehensive is enabled for the `heap` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    heap_poisoning_comprehensive: bool = false,
    /// Kconfig key: `CONFIG_HEAP_POISONING_DISABLED`.
    /// Controls whether HEAP poisoning disabled is enabled for the `heap` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    heap_poisoning_disabled: bool = true,
    /// Kconfig key: `CONFIG_HEAP_POISONING_LIGHT`.
    /// Controls whether HEAP poisoning light is enabled for the `heap` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    heap_poisoning_light: bool = false,
    /// Kconfig key: `CONFIG_HEAP_TASK_TRACKING`.
    /// Controls whether HEAP TASK tracking is enabled for the `heap` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    heap_task_tracking: bool = false,
    /// Kconfig key: `CONFIG_HEAP_TRACING_OFF`.
    /// Controls whether HEAP tracing OFF is enabled for the `heap` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    heap_tracing_off: bool = true,
    /// Kconfig key: `CONFIG_HEAP_TRACING_STANDALONE`.
    /// Controls whether HEAP tracing standalone is enabled for the `heap` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    heap_tracing_standalone: bool = false,
    /// Kconfig key: `CONFIG_HEAP_TRACING_TOHOST`.
    /// Controls whether HEAP tracing tohost is enabled for the `heap` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    heap_tracing_tohost: bool = false,
    /// Kconfig key: `CONFIG_HEAP_USE_HOOKS`.
    /// Controls whether HEAP USE hooks is enabled for the `heap` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    heap_use_hooks: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 10);
        entries[0] = sdkconfig.Entry.flag("CONFIG_HEAP_ABORT_WHEN_ALLOCATION_FAILS", cfg.heap_abort_when_allocation_fails);
        entries[1] = sdkconfig.Entry.flag("CONFIG_HEAP_PLACE_FUNCTION_INTO_FLASH", cfg.heap_place_function_into_flash);
        entries[2] = sdkconfig.Entry.flag("CONFIG_HEAP_POISONING_COMPREHENSIVE", cfg.heap_poisoning_comprehensive);
        entries[3] = sdkconfig.Entry.flag("CONFIG_HEAP_POISONING_DISABLED", cfg.heap_poisoning_disabled);
        entries[4] = sdkconfig.Entry.flag("CONFIG_HEAP_POISONING_LIGHT", cfg.heap_poisoning_light);
        entries[5] = sdkconfig.Entry.flag("CONFIG_HEAP_TASK_TRACKING", cfg.heap_task_tracking);
        entries[6] = sdkconfig.Entry.flag("CONFIG_HEAP_TRACING_OFF", cfg.heap_tracing_off);
        entries[7] = sdkconfig.Entry.flag("CONFIG_HEAP_TRACING_STANDALONE", cfg.heap_tracing_standalone);
        entries[8] = sdkconfig.Entry.flag("CONFIG_HEAP_TRACING_TOHOST", cfg.heap_tracing_tohost);
        entries[9] = sdkconfig.Entry.flag("CONFIG_HEAP_USE_HOOKS", cfg.heap_use_hooks);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
