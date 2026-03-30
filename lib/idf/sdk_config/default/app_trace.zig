const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "app_trace";

pub const Config = struct {
    /// Kconfig key: `CONFIG_APPTRACE_DEST_JTAG`.
    /// Controls whether apptrace DEST JTAG is enabled for the `app_trace` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    apptrace_dest_jtag: bool = false,
    /// Kconfig key: `CONFIG_APPTRACE_DEST_NONE`.
    /// Controls whether apptrace DEST NONE is enabled for the `app_trace` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    apptrace_dest_none: bool = true,
    /// Kconfig key: `CONFIG_APPTRACE_DEST_UART1`.
    /// Controls whether apptrace DEST uart1 is enabled for the `app_trace` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    apptrace_dest_uart1: bool = false,
    /// Kconfig key: `CONFIG_APPTRACE_DEST_UART2`.
    /// Controls whether apptrace DEST uart2 is enabled for the `app_trace` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    apptrace_dest_uart2: bool = false,
    /// Kconfig key: `CONFIG_APPTRACE_DEST_UART_NONE`.
    /// Controls whether apptrace DEST UART NONE is enabled for the `app_trace` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    apptrace_dest_uart_none: bool = true,
    /// Kconfig key: `CONFIG_APPTRACE_DEST_USB_CDC`.
    /// Controls whether apptrace DEST USB CDC is enabled for the `app_trace` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    apptrace_dest_usb_cdc: bool = false,
    /// Kconfig key: `CONFIG_APPTRACE_LOCK_ENABLE`.
    /// Controls whether apptrace LOCK enable is enabled for the `app_trace` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    apptrace_lock_enable: bool = true,
    /// Kconfig key: `CONFIG_APPTRACE_UART_TASK_PRIO`.
    /// Sets the numeric value for apptrace UART TASK PRIO in the `app_trace` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    apptrace_uart_task_prio: i64 = 1,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 8);
        entries[0] = sdkconfig.Entry.flag("CONFIG_APPTRACE_DEST_JTAG", cfg.apptrace_dest_jtag);
        entries[1] = sdkconfig.Entry.flag("CONFIG_APPTRACE_DEST_NONE", cfg.apptrace_dest_none);
        entries[2] = sdkconfig.Entry.flag("CONFIG_APPTRACE_DEST_UART1", cfg.apptrace_dest_uart1);
        entries[3] = sdkconfig.Entry.flag("CONFIG_APPTRACE_DEST_UART2", cfg.apptrace_dest_uart2);
        entries[4] = sdkconfig.Entry.flag("CONFIG_APPTRACE_DEST_UART_NONE", cfg.apptrace_dest_uart_none);
        entries[5] = sdkconfig.Entry.flag("CONFIG_APPTRACE_DEST_USB_CDC", cfg.apptrace_dest_usb_cdc);
        entries[6] = sdkconfig.Entry.flag("CONFIG_APPTRACE_LOCK_ENABLE", cfg.apptrace_lock_enable);
        entries[7] = sdkconfig.Entry.int("CONFIG_APPTRACE_UART_TASK_PRIO", cfg.apptrace_uart_task_prio);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
