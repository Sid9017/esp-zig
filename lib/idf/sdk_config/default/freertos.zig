const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "freertos";

pub const Config = struct {
    /// Kconfig key: `CONFIG_FREERTOS_UNICORE`.
    /// Controls whether FreeRTOS unicore mode is enabled.
    /// Default: `false`.
    unicore: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_HZ`.
    /// Sets FreeRTOS scheduler tick rate in Hz.
    /// Default: `1000`.
    tick_hz: u16 = 1000,
    /// Kconfig key: `CONFIG_FREERTOS_IDLE_TASK_STACKSIZE`.
    /// Sets idle task stack size in bytes.
    /// Default: `1536`.
    idle_task_stack_size: u16 = 1536,
    /// Kconfig key: `CONFIG_FREERTOS_MAX_TASK_NAME_LEN`.
    /// Sets max task name length.
    /// Default: `16`.
    max_task_name_len: u8 = 16,
    /// Kconfig key: `CONFIG_FREERTOS_TIMER_TASK_STACK_DEPTH`.
    /// Sets timer service task stack depth.
    /// Default: `2048`.
    timer_task_stack_depth: u16 = 2048,

    /// Kconfig key: `CONFIG_ENABLE_STATIC_TASK_CLEAN_UP_HOOK`.
    /// Enables legacy static task clean-up hook compatibility option.
    /// Default: `false`.
    enable_static_task_clean_up_hook: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_CHECK_MUTEX_GIVEN_BY_OWNER`.
    /// Enables runtime check for mutex give-by-owner correctness.
    /// Default: `true`.
    freertos_check_mutex_given_by_owner: bool = true,
    /// Kconfig key: `CONFIG_FREERTOS_CHECK_PORT_CRITICAL_COMPLIANCE`.
    /// Enables critical section compliance checks in port layer.
    /// Default: `false`.
    freertos_check_port_critical_compliance: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_CHECK_STACKOVERFLOW_CANARY`.
    /// Enables canary-based stack overflow detection mode.
    /// Default: `true`.
    freertos_check_stackoverflow_canary: bool = true,
    /// Kconfig key: `CONFIG_FREERTOS_CHECK_STACKOVERFLOW_NONE`.
    /// Enables no stack overflow checking mode.
    /// Default: `false`.
    freertos_check_stackoverflow_none: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_CHECK_STACKOVERFLOW_PTRVAL`.
    /// Enables pointer-value stack overflow detection mode.
    /// Default: `false`.
    freertos_check_stackoverflow_ptrval: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_CORETIMER_SYSTIMER_LVL1`.
    /// Selects SYSTIMER level 1 interrupt for core timer.
    /// Default: `true`.
    freertos_coretimer_systimer_lvl1: bool = true,
    /// Kconfig key: `CONFIG_FREERTOS_CORETIMER_SYSTIMER_LVL3`.
    /// Selects SYSTIMER level 3 interrupt for core timer.
    /// Default: `false`.
    freertos_coretimer_systimer_lvl3: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_DEBUG_OCDAWARE`.
    /// Enables OCD-aware debug support in FreeRTOS.
    /// Default: `true`.
    freertos_debug_ocdaware: bool = true,
    /// Kconfig key: `CONFIG_FREERTOS_ENABLE_BACKWARD_COMPATIBILITY`.
    /// Enables FreeRTOS backward compatibility wrappers.
    /// Default: `false`.
    freertos_enable_backward_compatibility: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_ENABLE_STATIC_TASK_CLEAN_UP`.
    /// Enables static task clean-up callback support.
    /// Default: `false`.
    freertos_enable_static_task_clean_up: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_ENABLE_TASK_SNAPSHOT`.
    /// Enables FreeRTOS task snapshot API.
    /// Default: `true`.
    freertos_enable_task_snapshot: bool = true,
    /// Kconfig key: `CONFIG_FREERTOS_FPU_IN_ISR`.
    /// Enables FPU context use inside ISR.
    /// Default: `false`.
    freertos_fpu_in_isr: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_GENERATE_RUN_TIME_STATS`.
    /// Enables generation of runtime task statistics.
    /// Default: `false`.
    freertos_generate_run_time_stats: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_INTERRUPT_BACKTRACE`.
    /// Enables interrupt backtrace support.
    /// Default: `true`.
    freertos_interrupt_backtrace: bool = true,
    /// Kconfig key: `CONFIG_FREERTOS_ISR_STACKSIZE`.
    /// Sets ISR stack size in bytes.
    /// Default: `1536`.
    freertos_isr_stacksize: i64 = 1536,
    /// Kconfig key: `CONFIG_FREERTOS_NO_AFFINITY`.
    /// Sets the raw no-affinity mask value.
    /// Default: `"0x7FFFFFFF"`.
    freertos_no_affinity: []const u8 = "0x7FFFFFFF",
    /// Kconfig key: `CONFIG_FREERTOS_NUMBER_OF_CORES`.
    /// Sets the number of active FreeRTOS cores.
    /// Default: `2`.
    freertos_number_of_cores: i64 = 2,
    /// Kconfig key: `CONFIG_FREERTOS_PLACE_FUNCTIONS_INTO_FLASH`.
    /// Places selected FreeRTOS functions into flash.
    /// Default: `false`.
    freertos_place_functions_into_flash: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_PLACE_SNAPSHOT_FUNS_INTO_FLASH`.
    /// Places task snapshot helpers into flash.
    /// Default: `true`.
    freertos_place_snapshot_funs_into_flash: bool = true,
    /// Kconfig key: `CONFIG_FREERTOS_PORT`.
    /// Enables FreeRTOS port layer.
    /// Default: `true`.
    freertos_port: bool = true,
    /// Kconfig key: `CONFIG_FREERTOS_QUEUE_REGISTRY_SIZE`.
    /// Sets queue registry size.
    /// Default: `0`.
    freertos_queue_registry_size: i64 = 0,
    /// Kconfig key: `CONFIG_FREERTOS_SMP`.
    /// Enables FreeRTOS SMP mode.
    /// Default: `false`.
    freertos_smp: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_SUPPORT_STATIC_ALLOCATION`.
    /// Enables FreeRTOS static allocation APIs.
    /// Default: `true`.
    freertos_support_static_allocation: bool = true,
    /// Kconfig key: `CONFIG_FREERTOS_SYSTICK_USES_SYSTIMER`.
    /// Uses SYSTIMER as system tick source.
    /// Default: `true`.
    freertos_systick_uses_systimer: bool = true,
    /// Kconfig key: `CONFIG_FREERTOS_TASK_FUNCTION_WRAPPER`.
    /// Enables task function wrapper.
    /// Default: `true`.
    freertos_task_function_wrapper: bool = true,
    /// Kconfig key: `CONFIG_FREERTOS_TASK_NOTIFICATION_ARRAY_ENTRIES`.
    /// Sets task notification array entry count.
    /// Default: `1`.
    freertos_task_notification_array_entries: i64 = 1,
    /// Kconfig key: `CONFIG_FREERTOS_TASK_PRE_DELETION_HOOK`.
    /// Enables task pre-deletion hook support.
    /// Default: `false`.
    freertos_task_pre_deletion_hook: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_THREAD_LOCAL_STORAGE_POINTERS`.
    /// Sets number of TLS pointers per task.
    /// Default: `1`.
    freertos_thread_local_storage_pointers: i64 = 1,
    /// Kconfig key: `CONFIG_FREERTOS_TICK_SUPPORT_SYSTIMER`.
    /// Enables FreeRTOS tick support with SYSTIMER.
    /// Default: `true`.
    freertos_tick_support_systimer: bool = true,
    /// Kconfig key: `CONFIG_FREERTOS_TIMER_QUEUE_LENGTH`.
    /// Sets FreeRTOS timer queue length.
    /// Default: `10`.
    freertos_timer_queue_length: i64 = 10,
    /// Kconfig key: `CONFIG_FREERTOS_TIMER_SERVICE_TASK_CORE_AFFINITY`.
    /// Sets timer service task core affinity raw mask.
    /// Default: `"0x7FFFFFFF"`.
    freertos_timer_service_task_core_affinity: []const u8 = "0x7FFFFFFF",
    /// Kconfig key: `CONFIG_FREERTOS_TIMER_SERVICE_TASK_NAME`.
    /// Sets timer service task name.
    /// Default: `"Tmr Svc"`.
    freertos_timer_service_task_name: []const u8 = "Tmr Svc",
    /// Kconfig key: `CONFIG_FREERTOS_TIMER_TASK_AFFINITY_CPU0`.
    /// Pins timer task to CPU0.
    /// Default: `false`.
    freertos_timer_task_affinity_cpu0: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_TIMER_TASK_AFFINITY_CPU1`.
    /// Pins timer task to CPU1.
    /// Default: `false`.
    freertos_timer_task_affinity_cpu1: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_TIMER_TASK_NO_AFFINITY`.
    /// Runs timer task with no affinity.
    /// Default: `true`.
    freertos_timer_task_no_affinity: bool = true,
    /// Kconfig key: `CONFIG_FREERTOS_TIMER_TASK_PRIORITY`.
    /// Sets timer task priority.
    /// Default: `1`.
    freertos_timer_task_priority: i64 = 1,
    /// Kconfig key: `CONFIG_FREERTOS_TLSP_DELETION_CALLBACKS`.
    /// Enables TLS pointer deletion callbacks.
    /// Default: `true`.
    freertos_tlsp_deletion_callbacks: bool = true,
    /// Kconfig key: `CONFIG_FREERTOS_USE_APPLICATION_TASK_TAG`.
    /// Enables application task tag support.
    /// Default: `false`.
    freertos_use_application_task_tag: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_USE_IDLE_HOOK`.
    /// Enables idle hook callbacks.
    /// Default: `false`.
    freertos_use_idle_hook: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_USE_LIST_DATA_INTEGRITY_CHECK_BYTES`.
    /// Enables list integrity check bytes.
    /// Default: `false`.
    freertos_use_list_data_integrity_check_bytes: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_USE_TICK_HOOK`.
    /// Enables tick hook callbacks.
    /// Default: `false`.
    freertos_use_tick_hook: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_USE_TIMERS`.
    /// Enables FreeRTOS software timers.
    /// Default: `true`.
    freertos_use_timers: bool = true,
    /// Kconfig key: `CONFIG_FREERTOS_USE_TRACE_FACILITY`.
    /// Enables FreeRTOS trace facility.
    /// Default: `false`.
    freertos_use_trace_facility: bool = false,
    /// Kconfig key: `CONFIG_FREERTOS_WATCHPOINT_END_OF_STACK`.
    /// Enables end-of-stack watchpoint.
    /// Default: `false`.
    freertos_watchpoint_end_of_stack: bool = false,
    /// Kconfig key: `CONFIG_TIMER_QUEUE_LENGTH`.
    /// Legacy timer queue length option kept for compatibility.
    /// Default: `10`.
    timer_queue_length: i64 = 10,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 51);
        entries[0] = sdkconfig.Entry.flag("CONFIG_FREERTOS_UNICORE", cfg.unicore);
        entries[1] = sdkconfig.Entry.int("CONFIG_FREERTOS_HZ", cfg.tick_hz);
        entries[2] = sdkconfig.Entry.int("CONFIG_FREERTOS_IDLE_TASK_STACKSIZE", cfg.idle_task_stack_size);
        entries[3] = sdkconfig.Entry.int("CONFIG_FREERTOS_MAX_TASK_NAME_LEN", cfg.max_task_name_len);
        entries[4] = sdkconfig.Entry.int("CONFIG_FREERTOS_TIMER_TASK_STACK_DEPTH", cfg.timer_task_stack_depth);

        entries[5] = sdkconfig.Entry.flag("CONFIG_ENABLE_STATIC_TASK_CLEAN_UP_HOOK", cfg.enable_static_task_clean_up_hook);
        entries[6] = sdkconfig.Entry.flag("CONFIG_FREERTOS_CHECK_MUTEX_GIVEN_BY_OWNER", cfg.freertos_check_mutex_given_by_owner);
        entries[7] = sdkconfig.Entry.flag("CONFIG_FREERTOS_CHECK_PORT_CRITICAL_COMPLIANCE", cfg.freertos_check_port_critical_compliance);
        entries[8] = sdkconfig.Entry.flag("CONFIG_FREERTOS_CHECK_STACKOVERFLOW_CANARY", cfg.freertos_check_stackoverflow_canary);
        entries[9] = sdkconfig.Entry.flag("CONFIG_FREERTOS_CHECK_STACKOVERFLOW_NONE", cfg.freertos_check_stackoverflow_none);
        entries[10] = sdkconfig.Entry.flag("CONFIG_FREERTOS_CHECK_STACKOVERFLOW_PTRVAL", cfg.freertos_check_stackoverflow_ptrval);
        entries[11] = sdkconfig.Entry.flag("CONFIG_FREERTOS_CORETIMER_SYSTIMER_LVL1", cfg.freertos_coretimer_systimer_lvl1);
        entries[12] = sdkconfig.Entry.flag("CONFIG_FREERTOS_CORETIMER_SYSTIMER_LVL3", cfg.freertos_coretimer_systimer_lvl3);
        entries[13] = sdkconfig.Entry.flag("CONFIG_FREERTOS_DEBUG_OCDAWARE", cfg.freertos_debug_ocdaware);
        entries[14] = sdkconfig.Entry.flag("CONFIG_FREERTOS_ENABLE_BACKWARD_COMPATIBILITY", cfg.freertos_enable_backward_compatibility);
        entries[15] = sdkconfig.Entry.flag("CONFIG_FREERTOS_ENABLE_STATIC_TASK_CLEAN_UP", cfg.freertos_enable_static_task_clean_up);
        entries[16] = sdkconfig.Entry.flag("CONFIG_FREERTOS_ENABLE_TASK_SNAPSHOT", cfg.freertos_enable_task_snapshot);
        entries[17] = sdkconfig.Entry.flag("CONFIG_FREERTOS_FPU_IN_ISR", cfg.freertos_fpu_in_isr);
        entries[18] = sdkconfig.Entry.flag("CONFIG_FREERTOS_GENERATE_RUN_TIME_STATS", cfg.freertos_generate_run_time_stats);
        entries[19] = sdkconfig.Entry.flag("CONFIG_FREERTOS_INTERRUPT_BACKTRACE", cfg.freertos_interrupt_backtrace);
        entries[20] = sdkconfig.Entry.int("CONFIG_FREERTOS_ISR_STACKSIZE", cfg.freertos_isr_stacksize);
        entries[21] = sdkconfig.Entry.raw("CONFIG_FREERTOS_NO_AFFINITY", cfg.freertos_no_affinity);
        entries[22] = sdkconfig.Entry.int("CONFIG_FREERTOS_NUMBER_OF_CORES", cfg.freertos_number_of_cores);
        entries[23] = sdkconfig.Entry.flag("CONFIG_FREERTOS_PLACE_FUNCTIONS_INTO_FLASH", cfg.freertos_place_functions_into_flash);
        entries[24] = sdkconfig.Entry.flag("CONFIG_FREERTOS_PLACE_SNAPSHOT_FUNS_INTO_FLASH", cfg.freertos_place_snapshot_funs_into_flash);
        entries[25] = sdkconfig.Entry.flag("CONFIG_FREERTOS_PORT", cfg.freertos_port);
        entries[26] = sdkconfig.Entry.int("CONFIG_FREERTOS_QUEUE_REGISTRY_SIZE", cfg.freertos_queue_registry_size);
        entries[27] = sdkconfig.Entry.flag("CONFIG_FREERTOS_SMP", cfg.freertos_smp);
        entries[28] = sdkconfig.Entry.flag("CONFIG_FREERTOS_SUPPORT_STATIC_ALLOCATION", cfg.freertos_support_static_allocation);
        entries[29] = sdkconfig.Entry.flag("CONFIG_FREERTOS_SYSTICK_USES_SYSTIMER", cfg.freertos_systick_uses_systimer);
        entries[30] = sdkconfig.Entry.flag("CONFIG_FREERTOS_TASK_FUNCTION_WRAPPER", cfg.freertos_task_function_wrapper);
        entries[31] = sdkconfig.Entry.int("CONFIG_FREERTOS_TASK_NOTIFICATION_ARRAY_ENTRIES", cfg.freertos_task_notification_array_entries);
        entries[32] = sdkconfig.Entry.flag("CONFIG_FREERTOS_TASK_PRE_DELETION_HOOK", cfg.freertos_task_pre_deletion_hook);
        entries[33] = sdkconfig.Entry.int("CONFIG_FREERTOS_THREAD_LOCAL_STORAGE_POINTERS", cfg.freertos_thread_local_storage_pointers);
        entries[34] = sdkconfig.Entry.flag("CONFIG_FREERTOS_TICK_SUPPORT_SYSTIMER", cfg.freertos_tick_support_systimer);
        entries[35] = sdkconfig.Entry.int("CONFIG_FREERTOS_TIMER_QUEUE_LENGTH", cfg.freertos_timer_queue_length);
        entries[36] = sdkconfig.Entry.raw("CONFIG_FREERTOS_TIMER_SERVICE_TASK_CORE_AFFINITY", cfg.freertos_timer_service_task_core_affinity);
        entries[37] = sdkconfig.Entry.str("CONFIG_FREERTOS_TIMER_SERVICE_TASK_NAME", cfg.freertos_timer_service_task_name);
        entries[38] = sdkconfig.Entry.flag("CONFIG_FREERTOS_TIMER_TASK_AFFINITY_CPU0", cfg.freertos_timer_task_affinity_cpu0);
        entries[39] = sdkconfig.Entry.flag("CONFIG_FREERTOS_TIMER_TASK_AFFINITY_CPU1", cfg.freertos_timer_task_affinity_cpu1);
        entries[40] = sdkconfig.Entry.flag("CONFIG_FREERTOS_TIMER_TASK_NO_AFFINITY", cfg.freertos_timer_task_no_affinity);
        entries[41] = sdkconfig.Entry.int("CONFIG_FREERTOS_TIMER_TASK_PRIORITY", cfg.freertos_timer_task_priority);
        entries[42] = sdkconfig.Entry.flag("CONFIG_FREERTOS_TLSP_DELETION_CALLBACKS", cfg.freertos_tlsp_deletion_callbacks);
        entries[43] = sdkconfig.Entry.flag("CONFIG_FREERTOS_USE_APPLICATION_TASK_TAG", cfg.freertos_use_application_task_tag);
        entries[44] = sdkconfig.Entry.flag("CONFIG_FREERTOS_USE_IDLE_HOOK", cfg.freertos_use_idle_hook);
        entries[45] = sdkconfig.Entry.flag("CONFIG_FREERTOS_USE_LIST_DATA_INTEGRITY_CHECK_BYTES", cfg.freertos_use_list_data_integrity_check_bytes);
        entries[46] = sdkconfig.Entry.flag("CONFIG_FREERTOS_USE_TICK_HOOK", cfg.freertos_use_tick_hook);
        entries[47] = sdkconfig.Entry.flag("CONFIG_FREERTOS_USE_TIMERS", cfg.freertos_use_timers);
        entries[48] = sdkconfig.Entry.flag("CONFIG_FREERTOS_USE_TRACE_FACILITY", cfg.freertos_use_trace_facility);
        entries[49] = sdkconfig.Entry.flag("CONFIG_FREERTOS_WATCHPOINT_END_OF_STACK", cfg.freertos_watchpoint_end_of_stack);
        entries[50] = sdkconfig.Entry.int("CONFIG_TIMER_QUEUE_LENGTH", cfg.timer_queue_length);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }

    test "appendModuleDoc emits fixed freertos keys" {
        var docs = std.array_list.Managed(sdkconfig.ModuleDoc).init(std.testing.allocator);
        defer docs.deinit();

        try Config.appendModuleDoc(std.testing.allocator, &docs, .{});

        const module_docs = try docs.toOwnedSlice();
        defer sdkconfig.freeModuleDocs(std.testing.allocator, module_docs);

        try std.testing.expectEqual(@as(usize, 1), module_docs.len);
        try std.testing.expect(std.mem.eql(u8, module_docs[0].name, module_name));
        try std.testing.expectEqual(@as(usize, 51), module_docs[0].entries.len);
    }
};
