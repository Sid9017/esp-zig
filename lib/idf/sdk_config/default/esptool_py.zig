const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esptool_py";

pub const Config = struct {
    /// Kconfig key: `CONFIG_ESPTOOLPY_AFTER`.
    /// Sets the literal value for esptoolpy after in the `esptool_py` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `"hard_reset"`.
    esptoolpy_after: []const u8 = "hard_reset",
    /// Kconfig key: `CONFIG_ESPTOOLPY_AFTER_NORESET`.
    /// Controls whether esptoolpy after noreset is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esptoolpy_after_noreset: bool = false,
    /// Kconfig key: `CONFIG_ESPTOOLPY_AFTER_RESET`.
    /// Controls whether esptoolpy after reset is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esptoolpy_after_reset: bool = true,
    /// Kconfig key: `CONFIG_ESPTOOLPY_BEFORE`.
    /// Sets the literal value for esptoolpy before in the `esptool_py` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `"default_reset"`.
    esptoolpy_before: []const u8 = "default_reset",
    /// Kconfig key: `CONFIG_ESPTOOLPY_BEFORE_NORESET`.
    /// Controls whether esptoolpy before noreset is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esptoolpy_before_noreset: bool = false,
    /// Kconfig key: `CONFIG_ESPTOOLPY_BEFORE_RESET`.
    /// Controls whether esptoolpy before reset is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esptoolpy_before_reset: bool = true,
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHFREQ`.
    /// Sets the literal value for esptoolpy flashfreq in the `esptool_py` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `"80m"`.
    esptoolpy_flashfreq: []const u8 = "80m",
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHFREQ_120M`.
    /// Controls whether esptoolpy flashfreq 120M is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esptoolpy_flashfreq_120m: bool = false,
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHFREQ_20M`.
    /// Controls whether esptoolpy flashfreq 20M is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esptoolpy_flashfreq_20m: bool = false,
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHFREQ_40M`.
    /// Controls whether esptoolpy flashfreq 40M is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esptoolpy_flashfreq_40m: bool = false,
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHFREQ_80M`.
    /// Controls whether esptoolpy flashfreq 80M is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esptoolpy_flashfreq_80m: bool = true,
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHMODE`.
    /// Sets the literal value for esptoolpy flashmode in the `esptool_py` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `"dio"`.
    esptoolpy_flashmode: []const u8 = "dio",
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHMODE_DIO`.
    /// Controls whether esptoolpy flashmode DIO is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esptoolpy_flashmode_dio: bool = true,
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHMODE_DOUT`.
    /// Controls whether esptoolpy flashmode DOUT is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esptoolpy_flashmode_dout: bool = false,
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHMODE_QIO`.
    /// Controls whether esptoolpy flashmode QIO is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esptoolpy_flashmode_qio: bool = false,
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHMODE_QOUT`.
    /// Controls whether esptoolpy flashmode QOUT is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esptoolpy_flashmode_qout: bool = false,
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHSIZE`.
    /// Sets the literal value for esptoolpy flashsize in the `esptool_py` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `"2MB"`.
    esptoolpy_flashsize: []const u8 = "2MB",
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHSIZE_128MB`.
    /// Controls whether esptoolpy flashsize 128mb is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esptoolpy_flashsize_128mb: bool = false,
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHSIZE_16MB`.
    /// Controls whether esptoolpy flashsize 16MB is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esptoolpy_flashsize_16mb: bool = false,
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHSIZE_1MB`.
    /// Controls whether esptoolpy flashsize 1MB is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esptoolpy_flashsize_1mb: bool = false,
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHSIZE_2MB`.
    /// Controls whether esptoolpy flashsize 2MB is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esptoolpy_flashsize_2mb: bool = true,
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHSIZE_32MB`.
    /// Controls whether esptoolpy flashsize 32MB is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esptoolpy_flashsize_32mb: bool = false,
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHSIZE_4MB`.
    /// Controls whether esptoolpy flashsize 4MB is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esptoolpy_flashsize_4mb: bool = false,
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHSIZE_64MB`.
    /// Controls whether esptoolpy flashsize 64MB is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esptoolpy_flashsize_64mb: bool = false,
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASHSIZE_8MB`.
    /// Controls whether esptoolpy flashsize 8MB is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esptoolpy_flashsize_8mb: bool = false,
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASH_MODE_AUTO_DETECT`.
    /// Controls whether esptoolpy flash MODE AUTO detect is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esptoolpy_flash_mode_auto_detect: bool = true,
    /// Kconfig key: `CONFIG_ESPTOOLPY_FLASH_SAMPLE_MODE_STR`.
    /// Controls whether esptoolpy flash sample MODE STR is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esptoolpy_flash_sample_mode_str: bool = true,
    /// Kconfig key: `CONFIG_ESPTOOLPY_HEADER_FLASHSIZE_UPDATE`.
    /// Controls whether esptoolpy header flashsize update is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esptoolpy_header_flashsize_update: bool = false,
    /// Kconfig key: `CONFIG_ESPTOOLPY_MONITOR_BAUD`.
    /// Sets the numeric value for esptoolpy monitor BAUD in the `esptool_py` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `115200`.
    esptoolpy_monitor_baud: i64 = 115200,
    /// Kconfig key: `CONFIG_ESPTOOLPY_NO_STUB`.
    /// Controls whether esptoolpy NO STUB is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esptoolpy_no_stub: bool = false,
    /// Kconfig key: `CONFIG_ESPTOOLPY_OCT_FLASH`.
    /// Controls whether esptoolpy OCT flash is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esptoolpy_oct_flash: bool = false,
    /// Kconfig key: `CONFIG_FLASHMODE_DIO`.
    /// Controls whether flashmode DIO is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    flashmode_dio: bool = true,
    /// Kconfig key: `CONFIG_FLASHMODE_DOUT`.
    /// Controls whether flashmode DOUT is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    flashmode_dout: bool = false,
    /// Kconfig key: `CONFIG_FLASHMODE_QIO`.
    /// Controls whether flashmode QIO is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    flashmode_qio: bool = false,
    /// Kconfig key: `CONFIG_FLASHMODE_QOUT`.
    /// Controls whether flashmode QOUT is enabled for the `esptool_py` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    flashmode_qout: bool = false,
    /// Kconfig key: `CONFIG_MONITOR_BAUD`.
    /// Sets the numeric value for monitor BAUD in the `esptool_py` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `115200`.
    monitor_baud: i64 = 115200,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 36);
        entries[0] = sdkconfig.Entry.str("CONFIG_ESPTOOLPY_AFTER", cfg.esptoolpy_after);
        entries[1] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_AFTER_NORESET", cfg.esptoolpy_after_noreset);
        entries[2] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_AFTER_RESET", cfg.esptoolpy_after_reset);
        entries[3] = sdkconfig.Entry.str("CONFIG_ESPTOOLPY_BEFORE", cfg.esptoolpy_before);
        entries[4] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_BEFORE_NORESET", cfg.esptoolpy_before_noreset);
        entries[5] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_BEFORE_RESET", cfg.esptoolpy_before_reset);
        entries[6] = sdkconfig.Entry.str("CONFIG_ESPTOOLPY_FLASHFREQ", cfg.esptoolpy_flashfreq);
        entries[7] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_FLASHFREQ_120M", cfg.esptoolpy_flashfreq_120m);
        entries[8] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_FLASHFREQ_20M", cfg.esptoolpy_flashfreq_20m);
        entries[9] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_FLASHFREQ_40M", cfg.esptoolpy_flashfreq_40m);
        entries[10] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_FLASHFREQ_80M", cfg.esptoolpy_flashfreq_80m);
        entries[11] = sdkconfig.Entry.str("CONFIG_ESPTOOLPY_FLASHMODE", cfg.esptoolpy_flashmode);
        entries[12] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_FLASHMODE_DIO", cfg.esptoolpy_flashmode_dio);
        entries[13] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_FLASHMODE_DOUT", cfg.esptoolpy_flashmode_dout);
        entries[14] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_FLASHMODE_QIO", cfg.esptoolpy_flashmode_qio);
        entries[15] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_FLASHMODE_QOUT", cfg.esptoolpy_flashmode_qout);
        entries[16] = sdkconfig.Entry.str("CONFIG_ESPTOOLPY_FLASHSIZE", cfg.esptoolpy_flashsize);
        entries[17] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_FLASHSIZE_128MB", cfg.esptoolpy_flashsize_128mb);
        entries[18] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_FLASHSIZE_16MB", cfg.esptoolpy_flashsize_16mb);
        entries[19] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_FLASHSIZE_1MB", cfg.esptoolpy_flashsize_1mb);
        entries[20] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_FLASHSIZE_2MB", cfg.esptoolpy_flashsize_2mb);
        entries[21] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_FLASHSIZE_32MB", cfg.esptoolpy_flashsize_32mb);
        entries[22] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_FLASHSIZE_4MB", cfg.esptoolpy_flashsize_4mb);
        entries[23] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_FLASHSIZE_64MB", cfg.esptoolpy_flashsize_64mb);
        entries[24] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_FLASHSIZE_8MB", cfg.esptoolpy_flashsize_8mb);
        entries[25] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_FLASH_MODE_AUTO_DETECT", cfg.esptoolpy_flash_mode_auto_detect);
        entries[26] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_FLASH_SAMPLE_MODE_STR", cfg.esptoolpy_flash_sample_mode_str);
        entries[27] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_HEADER_FLASHSIZE_UPDATE", cfg.esptoolpy_header_flashsize_update);
        entries[28] = sdkconfig.Entry.int("CONFIG_ESPTOOLPY_MONITOR_BAUD", cfg.esptoolpy_monitor_baud);
        entries[29] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_NO_STUB", cfg.esptoolpy_no_stub);
        entries[30] = sdkconfig.Entry.flag("CONFIG_ESPTOOLPY_OCT_FLASH", cfg.esptoolpy_oct_flash);
        entries[31] = sdkconfig.Entry.flag("CONFIG_FLASHMODE_DIO", cfg.flashmode_dio);
        entries[32] = sdkconfig.Entry.flag("CONFIG_FLASHMODE_DOUT", cfg.flashmode_dout);
        entries[33] = sdkconfig.Entry.flag("CONFIG_FLASHMODE_QIO", cfg.flashmode_qio);
        entries[34] = sdkconfig.Entry.flag("CONFIG_FLASHMODE_QOUT", cfg.flashmode_qout);
        entries[35] = sdkconfig.Entry.int("CONFIG_MONITOR_BAUD", cfg.monitor_baud);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
