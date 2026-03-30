const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "newlib";

pub const Config = struct {
    /// Kconfig key: `CONFIG_NEWLIB_NANO_FORMAT`.
    /// Controls whether newlib NANO format is enabled for the `newlib` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    newlib_nano_format: bool = false,
    /// Kconfig key: `CONFIG_NEWLIB_STDIN_LINE_ENDING_CR`.
    /// Controls whether newlib stdin LINE ending CR is enabled for the `newlib` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    newlib_stdin_line_ending_cr: bool = true,
    /// Kconfig key: `CONFIG_NEWLIB_STDIN_LINE_ENDING_CRLF`.
    /// Controls whether newlib stdin LINE ending CRLF is enabled for the `newlib` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    newlib_stdin_line_ending_crlf: bool = false,
    /// Kconfig key: `CONFIG_NEWLIB_STDIN_LINE_ENDING_LF`.
    /// Controls whether newlib stdin LINE ending LF is enabled for the `newlib` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    newlib_stdin_line_ending_lf: bool = false,
    /// Kconfig key: `CONFIG_NEWLIB_STDOUT_LINE_ENDING_CR`.
    /// Controls whether newlib stdout LINE ending CR is enabled for the `newlib` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    newlib_stdout_line_ending_cr: bool = false,
    /// Kconfig key: `CONFIG_NEWLIB_STDOUT_LINE_ENDING_CRLF`.
    /// Controls whether newlib stdout LINE ending CRLF is enabled for the `newlib` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    newlib_stdout_line_ending_crlf: bool = true,
    /// Kconfig key: `CONFIG_NEWLIB_STDOUT_LINE_ENDING_LF`.
    /// Controls whether newlib stdout LINE ending LF is enabled for the `newlib` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    newlib_stdout_line_ending_lf: bool = false,
    /// Kconfig key: `CONFIG_NEWLIB_TIME_SYSCALL_USE_HRT`.
    /// Controls whether newlib TIME syscall USE HRT is enabled for the `newlib` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    newlib_time_syscall_use_hrt: bool = false,
    /// Kconfig key: `CONFIG_NEWLIB_TIME_SYSCALL_USE_NONE`.
    /// Controls whether newlib TIME syscall USE NONE is enabled for the `newlib` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    newlib_time_syscall_use_none: bool = false,
    /// Kconfig key: `CONFIG_NEWLIB_TIME_SYSCALL_USE_RTC`.
    /// Controls whether newlib TIME syscall USE RTC is enabled for the `newlib` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    newlib_time_syscall_use_rtc: bool = false,
    /// Kconfig key: `CONFIG_NEWLIB_TIME_SYSCALL_USE_RTC_HRT`.
    /// Controls whether newlib TIME syscall USE RTC HRT is enabled for the `newlib` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    newlib_time_syscall_use_rtc_hrt: bool = true,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 11);
        entries[0] = sdkconfig.Entry.flag("CONFIG_NEWLIB_NANO_FORMAT", cfg.newlib_nano_format);
        entries[1] = sdkconfig.Entry.flag("CONFIG_NEWLIB_STDIN_LINE_ENDING_CR", cfg.newlib_stdin_line_ending_cr);
        entries[2] = sdkconfig.Entry.flag("CONFIG_NEWLIB_STDIN_LINE_ENDING_CRLF", cfg.newlib_stdin_line_ending_crlf);
        entries[3] = sdkconfig.Entry.flag("CONFIG_NEWLIB_STDIN_LINE_ENDING_LF", cfg.newlib_stdin_line_ending_lf);
        entries[4] = sdkconfig.Entry.flag("CONFIG_NEWLIB_STDOUT_LINE_ENDING_CR", cfg.newlib_stdout_line_ending_cr);
        entries[5] = sdkconfig.Entry.flag("CONFIG_NEWLIB_STDOUT_LINE_ENDING_CRLF", cfg.newlib_stdout_line_ending_crlf);
        entries[6] = sdkconfig.Entry.flag("CONFIG_NEWLIB_STDOUT_LINE_ENDING_LF", cfg.newlib_stdout_line_ending_lf);
        entries[7] = sdkconfig.Entry.flag("CONFIG_NEWLIB_TIME_SYSCALL_USE_HRT", cfg.newlib_time_syscall_use_hrt);
        entries[8] = sdkconfig.Entry.flag("CONFIG_NEWLIB_TIME_SYSCALL_USE_NONE", cfg.newlib_time_syscall_use_none);
        entries[9] = sdkconfig.Entry.flag("CONFIG_NEWLIB_TIME_SYSCALL_USE_RTC", cfg.newlib_time_syscall_use_rtc);
        entries[10] = sdkconfig.Entry.flag("CONFIG_NEWLIB_TIME_SYSCALL_USE_RTC_HRT", cfg.newlib_time_syscall_use_rtc_hrt);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
