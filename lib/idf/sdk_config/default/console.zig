const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "console";

pub const Config = struct {
    /// Kconfig key: `CONFIG_CONSOLE_SORTED_HELP`.
    /// Controls whether console sorted HELP is enabled for the `console` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    console_sorted_help: bool = false,
    /// Kconfig key: `CONFIG_CONSOLE_UART`.
    /// Controls whether console UART is enabled for the `console` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    console_uart: bool = true,
    /// Kconfig key: `CONFIG_CONSOLE_UART_BAUDRATE`.
    /// Sets the numeric value for console UART baudrate in the `console` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `115200`.
    console_uart_baudrate: i64 = 115200,
    /// Kconfig key: `CONFIG_CONSOLE_UART_CUSTOM`.
    /// Controls whether console UART custom is enabled for the `console` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    console_uart_custom: bool = false,
    /// Kconfig key: `CONFIG_CONSOLE_UART_DEFAULT`.
    /// Controls whether console UART default is enabled for the `console` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    console_uart_default: bool = true,
    /// Kconfig key: `CONFIG_CONSOLE_UART_NONE`.
    /// Controls whether console UART NONE is enabled for the `console` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    console_uart_none: bool = false,
    /// Kconfig key: `CONFIG_CONSOLE_UART_NUM`.
    /// Sets the numeric value for console UART NUM in the `console` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `0`.
    console_uart_num: i64 = 0,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 7);
        entries[0] = sdkconfig.Entry.flag("CONFIG_CONSOLE_SORTED_HELP", cfg.console_sorted_help);
        entries[1] = sdkconfig.Entry.flag("CONFIG_CONSOLE_UART", cfg.console_uart);
        entries[2] = sdkconfig.Entry.int("CONFIG_CONSOLE_UART_BAUDRATE", cfg.console_uart_baudrate);
        entries[3] = sdkconfig.Entry.flag("CONFIG_CONSOLE_UART_CUSTOM", cfg.console_uart_custom);
        entries[4] = sdkconfig.Entry.flag("CONFIG_CONSOLE_UART_DEFAULT", cfg.console_uart_default);
        entries[5] = sdkconfig.Entry.flag("CONFIG_CONSOLE_UART_NONE", cfg.console_uart_none);
        entries[6] = sdkconfig.Entry.int("CONFIG_CONSOLE_UART_NUM", cfg.console_uart_num);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
