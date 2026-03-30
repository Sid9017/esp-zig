const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const schema = sdkconfig;

pub const module_name = "core";

pub const PanicMode = enum {
    print_halt,
    print_reboot,
    silent_reboot,
    gdbstub,
};

pub const LogDefaultLevel = enum {
    err,
    warn,
    info,
    debug,
    verbose,
};

pub const Config = struct {
    /// Kconfig key: `CONFIG_PARTITION_TABLE_CUSTOM_FILENAME`.
    /// Sets custom partition table CSV filename.
    /// Default: `"partitions.generated.csv"`.
    partition_table_custom_filename: []const u8 = "partitions.generated.csv",
    /// Kconfig key: `CONFIG_PARTITION_TABLE_OFFSET`.
    /// Sets partition table offset in flash.
    /// Default: `"0x8000"`.
    partition_table_offset_hex: []const u8 = "0x8000",

    /// Config field translated into panic-mode choice keys.
    /// Default: `.print_reboot`.
    panic_mode: PanicMode = .print_reboot,
    /// Kconfig key: `CONFIG_ESP_SYSTEM_PANIC_REBOOT_DELAY_SECONDS`.
    /// Sets delay before reboot after panic.
    /// Default: `0`.
    panic_reboot_delay_seconds: u16 = 0,
    /// Kconfig key: `CONFIG_ESP_MAIN_TASK_STACK_SIZE`.
    /// Sets main task stack size in bytes.
    /// Default: `3584`.
    main_task_stack_size: u16 = 3584,

    /// Kconfig key: `CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ`.
    /// Sets the default CPU frequency in MHz.
    /// Default: `160`.
    esp_default_cpu_freq_mhz: i64 = 160,

    /// Kconfig key: `CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ_80`.
    /// Selects 80 MHz as the default CPU frequency.
    /// Default: `false`.
    esp_default_cpu_freq_mhz_80: bool = false,

    /// Kconfig key: `CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ_160`.
    /// Selects 160 MHz as the default CPU frequency.
    /// Default: `true`.
    esp_default_cpu_freq_mhz_160: bool = true,

    /// Kconfig key: `CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ_240`.
    /// Selects 240 MHz as the default CPU frequency.
    /// Default: `false`.
    esp_default_cpu_freq_mhz_240: bool = false,

    /// Config field translated into log default level choice keys.
    /// Default: `.info`.
    log_default_level: LogDefaultLevel = .info,

    /// Kconfig key: `CONFIG_ESP_SYSTEM_ALLOW_RTC_FAST_MEM_AS_HEAP`.
    /// Allows RTC fast memory to be used as heap region.
    /// Default: `true`.
    esp_system_allow_rtc_fast_mem_as_heap: bool = true,
    /// Kconfig key: `CONFIG_ESP_SYSTEM_BBPLL_RECALIB`.
    /// Enables BBPLL recalibration.
    /// Default: `true`.
    esp_system_bbpll_recalib: bool = true,
    /// Kconfig key: `CONFIG_ESP_SYSTEM_BROWNOUT_INTR`.
    /// Enables brownout interrupt handling in esp_system.
    /// Default: `true`.
    esp_system_brownout_intr: bool = true,
    /// Kconfig key: `CONFIG_ESP_SYSTEM_CHECK_INT_LEVEL_4`.
    /// Enables interrupt level-4 check.
    /// Default: `true`.
    esp_system_check_int_level_4: bool = true,
    /// Kconfig key: `CONFIG_ESP_SYSTEM_GDBSTUB_RUNTIME`.
    /// Enables runtime gdbstub activation support.
    /// Default: `false`.
    esp_system_gdbstub_runtime: bool = false,
    /// Kconfig key: `CONFIG_ESP_SYSTEM_MEMPROT_FEATURE`.
    /// Enables memory protection feature.
    /// Default: `true`.
    esp_system_memprot_feature: bool = true,
    /// Kconfig key: `CONFIG_ESP_SYSTEM_MEMPROT_FEATURE_LOCK`.
    /// Locks memory protection feature configuration.
    /// Default: `true`.
    esp_system_memprot_feature_lock: bool = true,
    /// Kconfig key: `CONFIG_ESP_SYSTEM_PD_FLASH`.
    /// Enables flash power-down in selected power modes.
    /// Default: `false`.
    esp_system_pd_flash: bool = false,
    /// Kconfig key: `CONFIG_ESP_SYSTEM_PM_POWER_DOWN_CPU`.
    /// Enables CPU power-down in power management flow.
    /// Default: `true`.
    esp_system_pm_power_down_cpu: bool = true,
    /// Kconfig key: `CONFIG_ESP_SYSTEM_RTC_FAST_MEM_AS_HEAP_DEPCHECK`.
    /// Enables dependency checks for RTC fast memory heap mode.
    /// Default: `true`.
    esp_system_rtc_fast_mem_as_heap_depcheck: bool = true,
    /// Kconfig key: `CONFIG_RINGBUF_PLACE_FUNCTIONS_INTO_FLASH`.
    /// Keeps ring buffer helper functions in flash.
    /// Default: `false`.
    ringbuf_place_functions_into_flash: bool = false,

    /// Kconfig key: `CONFIG_BROWNOUT_DET`.
    /// Legacy brownout enable alias kept for compatibility.
    /// Default: `true`.
    brownout_det: bool = true,
    /// Kconfig key: `CONFIG_BROWNOUT_DET_LVL`.
    /// Legacy brownout level alias kept for compatibility.
    /// Default: `7`.
    brownout_det_lvl: i64 = 7,
    /// Kconfig key: `CONFIG_BROWNOUT_DET_LVL_SEL_1`.
    /// Legacy brownout level selector bit 1.
    /// Default: `false`.
    brownout_det_lvl_sel_1: bool = false,
    /// Kconfig key: `CONFIG_BROWNOUT_DET_LVL_SEL_2`.
    /// Legacy brownout level selector bit 2.
    /// Default: `false`.
    brownout_det_lvl_sel_2: bool = false,
    /// Kconfig key: `CONFIG_BROWNOUT_DET_LVL_SEL_3`.
    /// Legacy brownout level selector bit 3.
    /// Default: `false`.
    brownout_det_lvl_sel_3: bool = false,
    /// Kconfig key: `CONFIG_BROWNOUT_DET_LVL_SEL_4`.
    /// Legacy brownout level selector bit 4.
    /// Default: `false`.
    brownout_det_lvl_sel_4: bool = false,
    /// Kconfig key: `CONFIG_BROWNOUT_DET_LVL_SEL_5`.
    /// Legacy brownout level selector bit 5.
    /// Default: `false`.
    brownout_det_lvl_sel_5: bool = false,
    /// Kconfig key: `CONFIG_BROWNOUT_DET_LVL_SEL_6`.
    /// Legacy brownout level selector bit 6.
    /// Default: `false`.
    brownout_det_lvl_sel_6: bool = false,
    /// Kconfig key: `CONFIG_BROWNOUT_DET_LVL_SEL_7`.
    /// Legacy brownout level selector bit 7.
    /// Default: `true`.
    brownout_det_lvl_sel_7: bool = true,
    /// Kconfig key: `CONFIG_ESP_SYSTEM_EVENT_QUEUE_SIZE`.
    /// Legacy ESP_SYSTEM event queue size alias.
    /// Default: `32`.
    esp_system_event_queue_size: i64 = 32,
    /// Kconfig key: `CONFIG_ESP_SYSTEM_EVENT_TASK_STACK_SIZE`.
    /// Legacy ESP_SYSTEM event task stack size alias.
    /// Default: `2304`.
    esp_system_event_task_stack_size: i64 = 2304,
    /// Kconfig key: `CONFIG_INT_WDT`.
    /// Legacy interrupt watchdog enable alias.
    /// Default: `true`.
    int_wdt: bool = true,
    /// Kconfig key: `CONFIG_INT_WDT_CHECK_CPU1`.
    /// Legacy interrupt watchdog CPU1 check alias.
    /// Default: `true`.
    int_wdt_check_cpu1: bool = true,
    /// Kconfig key: `CONFIG_INT_WDT_TIMEOUT_MS`.
    /// Legacy interrupt watchdog timeout alias.
    /// Default: `300`.
    int_wdt_timeout_ms: i64 = 300,
    /// Kconfig key: `CONFIG_IPC_TASK_STACK_SIZE`.
    /// Legacy IPC task stack size alias.
    /// Default: `1280`.
    ipc_task_stack_size: i64 = 1280,
    /// Kconfig key: `CONFIG_TASK_WDT`.
    /// Legacy task watchdog enable alias.
    /// Default: `true`.
    task_wdt: bool = true,
    /// Kconfig key: `CONFIG_TASK_WDT_CHECK_IDLE_TASK_CPU0`.
    /// Legacy task watchdog CPU0 idle check alias.
    /// Default: `true`.
    task_wdt_check_idle_task_cpu0: bool = true,
    /// Kconfig key: `CONFIG_TASK_WDT_CHECK_IDLE_TASK_CPU1`.
    /// Legacy task watchdog CPU1 idle check alias.
    /// Default: `true`.
    task_wdt_check_idle_task_cpu1: bool = true,
    /// Kconfig key: `CONFIG_TASK_WDT_PANIC`.
    /// Legacy task watchdog panic behavior alias.
    /// Default: `false`.
    task_wdt_panic: bool = false,
    /// Kconfig key: `CONFIG_TASK_WDT_TIMEOUT_S`.
    /// Legacy task watchdog timeout alias.
    /// Default: `5`.
    task_wdt_timeout_s: i64 = 5,
    /// Kconfig key: `CONFIG_USJ_ENABLE_USB_SERIAL_JTAG`.
    /// Legacy USB-Serial-JTAG enable alias.
    /// Default: `true`.
    usj_enable_usb_serial_jtag: bool = true,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 52);
        entries[0] = sdkconfig.Entry.flag("CONFIG_PARTITION_TABLE_CUSTOM", true);
        entries[1] = sdkconfig.Entry.str("CONFIG_PARTITION_TABLE_CUSTOM_FILENAME", cfg.partition_table_custom_filename);
        entries[2] = sdkconfig.Entry.raw("CONFIG_PARTITION_TABLE_OFFSET", cfg.partition_table_offset_hex);

        entries[3] = sdkconfig.Entry.flag("CONFIG_ESP_SYSTEM_PANIC_PRINT_HALT", cfg.panic_mode == .print_halt);
        entries[4] = sdkconfig.Entry.flag("CONFIG_ESP_SYSTEM_PANIC_PRINT_REBOOT", cfg.panic_mode == .print_reboot);
        entries[5] = sdkconfig.Entry.flag("CONFIG_ESP_SYSTEM_PANIC_SILENT_REBOOT", cfg.panic_mode == .silent_reboot);
        entries[6] = sdkconfig.Entry.flag("CONFIG_ESP_SYSTEM_PANIC_GDBSTUB", cfg.panic_mode == .gdbstub);
        entries[7] = sdkconfig.Entry.int("CONFIG_ESP_SYSTEM_PANIC_REBOOT_DELAY_SECONDS", cfg.panic_reboot_delay_seconds);
        entries[8] = sdkconfig.Entry.int("CONFIG_ESP_MAIN_TASK_STACK_SIZE", cfg.main_task_stack_size);

        entries[9] = sdkconfig.Entry.int("CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ", cfg.esp_default_cpu_freq_mhz);
        entries[10] = sdkconfig.Entry.flag("CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ_80", cfg.esp_default_cpu_freq_mhz_80);
        entries[11] = sdkconfig.Entry.flag("CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ_160", cfg.esp_default_cpu_freq_mhz_160);
        entries[12] = sdkconfig.Entry.flag("CONFIG_ESP_DEFAULT_CPU_FREQ_MHZ_240", cfg.esp_default_cpu_freq_mhz_240);

        entries[13] = sdkconfig.Entry.flag("CONFIG_LOG_DEFAULT_LEVEL_ERROR", cfg.log_default_level == .err);
        entries[14] = sdkconfig.Entry.flag("CONFIG_LOG_DEFAULT_LEVEL_WARN", cfg.log_default_level == .warn);
        entries[15] = sdkconfig.Entry.flag("CONFIG_LOG_DEFAULT_LEVEL_INFO", cfg.log_default_level == .info);
        entries[16] = sdkconfig.Entry.flag("CONFIG_LOG_DEFAULT_LEVEL_DEBUG", cfg.log_default_level == .debug);
        entries[17] = sdkconfig.Entry.flag("CONFIG_LOG_DEFAULT_LEVEL_VERBOSE", cfg.log_default_level == .verbose);
        entries[18] = sdkconfig.Entry.flag("CONFIG_LOG_COLORS", false);

        entries[19] = sdkconfig.Entry.flag("CONFIG_ESP_SYSTEM_ALLOW_RTC_FAST_MEM_AS_HEAP", cfg.esp_system_allow_rtc_fast_mem_as_heap);
        entries[20] = sdkconfig.Entry.flag("CONFIG_ESP_SYSTEM_BBPLL_RECALIB", cfg.esp_system_bbpll_recalib);
        entries[21] = sdkconfig.Entry.flag("CONFIG_ESP_SYSTEM_BROWNOUT_INTR", cfg.esp_system_brownout_intr);
        entries[22] = sdkconfig.Entry.flag("CONFIG_ESP_SYSTEM_CHECK_INT_LEVEL_4", cfg.esp_system_check_int_level_4);
        entries[23] = sdkconfig.Entry.flag("CONFIG_ESP_SYSTEM_GDBSTUB_RUNTIME", cfg.esp_system_gdbstub_runtime);
        entries[24] = sdkconfig.Entry.flag("CONFIG_ESP_SYSTEM_MEMPROT_FEATURE", cfg.esp_system_memprot_feature);
        entries[25] = sdkconfig.Entry.flag("CONFIG_ESP_SYSTEM_MEMPROT_FEATURE_LOCK", cfg.esp_system_memprot_feature_lock);
        entries[26] = sdkconfig.Entry.flag("CONFIG_ESP_SYSTEM_PD_FLASH", cfg.esp_system_pd_flash);
        entries[27] = sdkconfig.Entry.flag("CONFIG_ESP_SYSTEM_PM_POWER_DOWN_CPU", cfg.esp_system_pm_power_down_cpu);
        entries[28] = sdkconfig.Entry.flag("CONFIG_ESP_SYSTEM_RTC_FAST_MEM_AS_HEAP_DEPCHECK", cfg.esp_system_rtc_fast_mem_as_heap_depcheck);
        entries[29] = sdkconfig.Entry.flag("CONFIG_RINGBUF_PLACE_FUNCTIONS_INTO_FLASH", cfg.ringbuf_place_functions_into_flash);

        entries[30] = sdkconfig.Entry.flag("CONFIG_BROWNOUT_DET", cfg.brownout_det);
        entries[31] = sdkconfig.Entry.int("CONFIG_BROWNOUT_DET_LVL", cfg.brownout_det_lvl);
        entries[32] = sdkconfig.Entry.flag("CONFIG_BROWNOUT_DET_LVL_SEL_1", cfg.brownout_det_lvl_sel_1);
        entries[33] = sdkconfig.Entry.flag("CONFIG_BROWNOUT_DET_LVL_SEL_2", cfg.brownout_det_lvl_sel_2);
        entries[34] = sdkconfig.Entry.flag("CONFIG_BROWNOUT_DET_LVL_SEL_3", cfg.brownout_det_lvl_sel_3);
        entries[35] = sdkconfig.Entry.flag("CONFIG_BROWNOUT_DET_LVL_SEL_4", cfg.brownout_det_lvl_sel_4);
        entries[36] = sdkconfig.Entry.flag("CONFIG_BROWNOUT_DET_LVL_SEL_5", cfg.brownout_det_lvl_sel_5);
        entries[37] = sdkconfig.Entry.flag("CONFIG_BROWNOUT_DET_LVL_SEL_6", cfg.brownout_det_lvl_sel_6);
        entries[38] = sdkconfig.Entry.flag("CONFIG_BROWNOUT_DET_LVL_SEL_7", cfg.brownout_det_lvl_sel_7);
        entries[39] = sdkconfig.Entry.int("CONFIG_ESP_SYSTEM_EVENT_QUEUE_SIZE", cfg.esp_system_event_queue_size);
        entries[40] = sdkconfig.Entry.int("CONFIG_ESP_SYSTEM_EVENT_TASK_STACK_SIZE", cfg.esp_system_event_task_stack_size);
        entries[41] = sdkconfig.Entry.flag("CONFIG_INT_WDT", cfg.int_wdt);
        entries[42] = sdkconfig.Entry.flag("CONFIG_INT_WDT_CHECK_CPU1", cfg.int_wdt_check_cpu1);
        entries[43] = sdkconfig.Entry.int("CONFIG_INT_WDT_TIMEOUT_MS", cfg.int_wdt_timeout_ms);
        entries[44] = sdkconfig.Entry.int("CONFIG_IPC_TASK_STACK_SIZE", cfg.ipc_task_stack_size);
        entries[45] = sdkconfig.Entry.int("CONFIG_MAIN_TASK_STACK_SIZE", cfg.main_task_stack_size);
        entries[46] = sdkconfig.Entry.flag("CONFIG_TASK_WDT", cfg.task_wdt);
        entries[47] = sdkconfig.Entry.flag("CONFIG_TASK_WDT_CHECK_IDLE_TASK_CPU0", cfg.task_wdt_check_idle_task_cpu0);
        entries[48] = sdkconfig.Entry.flag("CONFIG_TASK_WDT_CHECK_IDLE_TASK_CPU1", cfg.task_wdt_check_idle_task_cpu1);
        entries[49] = sdkconfig.Entry.flag("CONFIG_TASK_WDT_PANIC", cfg.task_wdt_panic);
        entries[50] = sdkconfig.Entry.int("CONFIG_TASK_WDT_TIMEOUT_S", cfg.task_wdt_timeout_s);
        entries[51] = sdkconfig.Entry.flag("CONFIG_USJ_ENABLE_USB_SERIAL_JTAG", cfg.usj_enable_usb_serial_jtag);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }

    test "appendModuleDoc emits fixed core keys" {
        var docs = std.array_list.Managed(sdkconfig.ModuleDoc).init(std.testing.allocator);
        defer docs.deinit();

        try Config.appendModuleDoc(std.testing.allocator, &docs, .{});

        const module_docs = try docs.toOwnedSlice();
        defer sdkconfig.freeModuleDocs(std.testing.allocator, module_docs);

        try std.testing.expectEqual(@as(usize, 1), module_docs.len);
        try std.testing.expect(std.mem.eql(u8, module_docs[0].name, module_name));
        try std.testing.expectEqual(@as(usize, 52), module_docs[0].entries.len);
    }
};
