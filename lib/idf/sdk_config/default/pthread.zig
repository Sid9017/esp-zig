const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "pthread";

pub const Config = struct {
    /// Kconfig key: `CONFIG_PTHREAD_DEFAULT_CORE_0`.
    /// Controls whether pthread default CORE 0 is enabled for the `pthread` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    pthread_default_core_0: bool = false,
    /// Kconfig key: `CONFIG_PTHREAD_DEFAULT_CORE_1`.
    /// Controls whether pthread default CORE 1 is enabled for the `pthread` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    pthread_default_core_1: bool = false,
    /// Kconfig key: `CONFIG_PTHREAD_DEFAULT_CORE_NO_AFFINITY`.
    /// Controls whether pthread default CORE NO affinity is enabled for the `pthread` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    pthread_default_core_no_affinity: bool = true,
    /// Kconfig key: `CONFIG_PTHREAD_STACK_MIN`.
    /// Sets the numeric value for pthread stack MIN in the `pthread` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `768`.
    pthread_stack_min: i64 = 768,
    /// Kconfig key: `CONFIG_PTHREAD_TASK_CORE_DEFAULT`.
    /// Sets the numeric value for pthread TASK CORE default in the `pthread` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `-1`.
    pthread_task_core_default: i64 = -1,
    /// Kconfig key: `CONFIG_PTHREAD_TASK_NAME_DEFAULT`.
    /// Sets the literal value for pthread TASK NAME default in the `pthread` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `"pthread"`.
    pthread_task_name_default: []const u8 = "pthread",
    /// Kconfig key: `CONFIG_PTHREAD_TASK_PRIO_DEFAULT`.
    /// Sets the numeric value for pthread TASK PRIO default in the `pthread` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `5`.
    pthread_task_prio_default: i64 = 5,
    /// Kconfig key: `CONFIG_PTHREAD_TASK_STACK_SIZE_DEFAULT`.
    /// Sets the numeric value for pthread TASK stack SIZE default in the `pthread` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3072`.
    pthread_task_stack_size_default: i64 = 3072,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 8);
        entries[0] = sdkconfig.Entry.flag("CONFIG_PTHREAD_DEFAULT_CORE_0", cfg.pthread_default_core_0);
        entries[1] = sdkconfig.Entry.flag("CONFIG_PTHREAD_DEFAULT_CORE_1", cfg.pthread_default_core_1);
        entries[2] = sdkconfig.Entry.flag("CONFIG_PTHREAD_DEFAULT_CORE_NO_AFFINITY", cfg.pthread_default_core_no_affinity);
        entries[3] = sdkconfig.Entry.int("CONFIG_PTHREAD_STACK_MIN", cfg.pthread_stack_min);
        entries[4] = sdkconfig.Entry.int("CONFIG_PTHREAD_TASK_CORE_DEFAULT", cfg.pthread_task_core_default);
        entries[5] = sdkconfig.Entry.str("CONFIG_PTHREAD_TASK_NAME_DEFAULT", cfg.pthread_task_name_default);
        entries[6] = sdkconfig.Entry.int("CONFIG_PTHREAD_TASK_PRIO_DEFAULT", cfg.pthread_task_prio_default);
        entries[7] = sdkconfig.Entry.int("CONFIG_PTHREAD_TASK_STACK_SIZE_DEFAULT", cfg.pthread_task_stack_size_default);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
