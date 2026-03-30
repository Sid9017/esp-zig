const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "unity";

pub const Config = struct {
    /// Kconfig key: `CONFIG_UNITY_ENABLE_64BIT`.
    /// Controls whether unity enable 64bit is enabled for the `unity` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    unity_enable_64bit: bool = false,
    /// Kconfig key: `CONFIG_UNITY_ENABLE_BACKTRACE_ON_FAIL`.
    /// Controls whether unity enable backtrace ON FAIL is enabled for the `unity` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    unity_enable_backtrace_on_fail: bool = false,
    /// Kconfig key: `CONFIG_UNITY_ENABLE_COLOR`.
    /// Controls whether unity enable color is enabled for the `unity` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    unity_enable_color: bool = false,
    /// Kconfig key: `CONFIG_UNITY_ENABLE_DOUBLE`.
    /// Controls whether unity enable double is enabled for the `unity` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    unity_enable_double: bool = true,
    /// Kconfig key: `CONFIG_UNITY_ENABLE_FIXTURE`.
    /// Controls whether unity enable fixture is enabled for the `unity` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    unity_enable_fixture: bool = false,
    /// Kconfig key: `CONFIG_UNITY_ENABLE_FLOAT`.
    /// Controls whether unity enable float is enabled for the `unity` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    unity_enable_float: bool = true,
    /// Kconfig key: `CONFIG_UNITY_ENABLE_IDF_TEST_RUNNER`.
    /// Controls whether unity enable IDF TEST runner is enabled for the `unity` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    unity_enable_idf_test_runner: bool = true,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 7);
        entries[0] = sdkconfig.Entry.flag("CONFIG_UNITY_ENABLE_64BIT", cfg.unity_enable_64bit);
        entries[1] = sdkconfig.Entry.flag("CONFIG_UNITY_ENABLE_BACKTRACE_ON_FAIL", cfg.unity_enable_backtrace_on_fail);
        entries[2] = sdkconfig.Entry.flag("CONFIG_UNITY_ENABLE_COLOR", cfg.unity_enable_color);
        entries[3] = sdkconfig.Entry.flag("CONFIG_UNITY_ENABLE_DOUBLE", cfg.unity_enable_double);
        entries[4] = sdkconfig.Entry.flag("CONFIG_UNITY_ENABLE_FIXTURE", cfg.unity_enable_fixture);
        entries[5] = sdkconfig.Entry.flag("CONFIG_UNITY_ENABLE_FLOAT", cfg.unity_enable_float);
        entries[6] = sdkconfig.Entry.flag("CONFIG_UNITY_ENABLE_IDF_TEST_RUNNER", cfg.unity_enable_idf_test_runner);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
