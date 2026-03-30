const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_hw_support";

pub const Config = struct {
    /// Kconfig key: `CONFIG_GDMA_CTRL_FUNC_IN_IRAM`.
    gdma_ctrl_func_in_iram: bool = true,
    /// Kconfig key: `CONFIG_GDMA_ENABLE_DEBUG_LOG`.
    gdma_enable_debug_log: bool = false,
    /// Kconfig key: `CONFIG_GDMA_ISR_IRAM_SAFE`.
    gdma_isr_iram_safe: bool = false,
    /// Kconfig key: `CONFIG_PERIPH_CTRL_FUNC_IN_IRAM`.
    /// Controls whether periph CTRL FUNC IN IRAM is enabled for the `esp_hw_support` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    periph_ctrl_func_in_iram: bool = true,
    /// Kconfig key: `CONFIG_RTC_CLK_CAL_CYCLES`.
    /// Sets the numeric value for RTC CLK CAL cycles in the `esp_hw_support` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1024`.
    rtc_clk_cal_cycles: i64 = 1024,
    /// Kconfig key: `CONFIG_RTC_CLK_SRC_EXT_CRYS`.
    /// Controls whether RTC CLK SRC EXT CRYS is enabled for the `esp_hw_support` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    rtc_clk_src_ext_crys: bool = false,
    /// Kconfig key: `CONFIG_RTC_CLK_SRC_EXT_OSC`.
    /// Controls whether RTC CLK SRC EXT OSC is enabled for the `esp_hw_support` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    rtc_clk_src_ext_osc: bool = false,
    /// Kconfig key: `CONFIG_RTC_CLK_SRC_INT_8MD256`.
    /// Controls whether RTC CLK SRC INT 8md256 is enabled for the `esp_hw_support` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    rtc_clk_src_int_8md256: bool = false,
    /// Kconfig key: `CONFIG_RTC_CLK_SRC_INT_RC`.
    /// Controls whether RTC CLK SRC INT RC is enabled for the `esp_hw_support` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    rtc_clk_src_int_rc: bool = true,
    /// Kconfig key: `CONFIG_XTAL_FREQ`.
    /// Sets the numeric value for XTAL FREQ in the `esp_hw_support` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `40`.
    xtal_freq: i64 = 40,
    /// Kconfig key: `CONFIG_XTAL_FREQ_40`.
    /// Controls whether XTAL FREQ 40 is enabled for the `esp_hw_support` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    xtal_freq_40: bool = true,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 11);
        entries[0] = sdkconfig.Entry.flag("CONFIG_GDMA_CTRL_FUNC_IN_IRAM", cfg.gdma_ctrl_func_in_iram);
        entries[1] = sdkconfig.Entry.flag("CONFIG_GDMA_ENABLE_DEBUG_LOG", cfg.gdma_enable_debug_log);
        entries[2] = sdkconfig.Entry.flag("CONFIG_GDMA_ISR_IRAM_SAFE", cfg.gdma_isr_iram_safe);
        entries[3] = sdkconfig.Entry.flag("CONFIG_PERIPH_CTRL_FUNC_IN_IRAM", cfg.periph_ctrl_func_in_iram);
        entries[4] = sdkconfig.Entry.int("CONFIG_RTC_CLK_CAL_CYCLES", cfg.rtc_clk_cal_cycles);
        entries[5] = sdkconfig.Entry.flag("CONFIG_RTC_CLK_SRC_EXT_CRYS", cfg.rtc_clk_src_ext_crys);
        entries[6] = sdkconfig.Entry.flag("CONFIG_RTC_CLK_SRC_EXT_OSC", cfg.rtc_clk_src_ext_osc);
        entries[7] = sdkconfig.Entry.flag("CONFIG_RTC_CLK_SRC_INT_8MD256", cfg.rtc_clk_src_int_8md256);
        entries[8] = sdkconfig.Entry.flag("CONFIG_RTC_CLK_SRC_INT_RC", cfg.rtc_clk_src_int_rc);
        entries[9] = sdkconfig.Entry.int("CONFIG_XTAL_FREQ", cfg.xtal_freq);
        entries[10] = sdkconfig.Entry.flag("CONFIG_XTAL_FREQ_40", cfg.xtal_freq_40);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
