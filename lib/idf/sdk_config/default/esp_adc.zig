const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_adc";

pub const Config = struct {
    /// Kconfig key: `CONFIG_ADC_CALI_SUPPRESS_DEPRECATE_WARN`.
    /// Controls whether ADC CALI suppress deprecate WARN is enabled for the `esp_adc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    adc_cali_suppress_deprecate_warn: bool = false,
    /// Kconfig key: `CONFIG_ADC_CONTINUOUS_FORCE_USE_ADC2_ON_C3_S3`.
    /// Controls whether ADC continuous force USE ADC2 ON C3 S3 is enabled for the `esp_adc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    adc_continuous_force_use_adc2_on_c3_s3: bool = false,
    /// Kconfig key: `CONFIG_ADC_CONTINUOUS_ISR_IRAM_SAFE`.
    /// Controls whether ADC continuous ISR IRAM SAFE is enabled for the `esp_adc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    adc_continuous_isr_iram_safe: bool = false,
    /// Kconfig key: `CONFIG_ADC_ENABLE_DEBUG_LOG`.
    /// Controls whether ADC enable debug LOG is enabled for the `esp_adc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    adc_enable_debug_log: bool = false,
    /// Kconfig key: `CONFIG_ADC_ONESHOT_CTRL_FUNC_IN_IRAM`.
    /// Controls whether ADC oneshot CTRL FUNC IN IRAM is enabled for the `esp_adc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    adc_oneshot_ctrl_func_in_iram: bool = false,
    /// Kconfig key: `CONFIG_ADC_SUPPRESS_DEPRECATE_WARN`.
    /// Controls whether ADC suppress deprecate WARN is enabled for the `esp_adc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    adc_suppress_deprecate_warn: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 6);
        entries[0] = sdkconfig.Entry.flag("CONFIG_ADC_CALI_SUPPRESS_DEPRECATE_WARN", cfg.adc_cali_suppress_deprecate_warn);
        entries[1] = sdkconfig.Entry.flag("CONFIG_ADC_CONTINUOUS_FORCE_USE_ADC2_ON_C3_S3", cfg.adc_continuous_force_use_adc2_on_c3_s3);
        entries[2] = sdkconfig.Entry.flag("CONFIG_ADC_CONTINUOUS_ISR_IRAM_SAFE", cfg.adc_continuous_isr_iram_safe);
        entries[3] = sdkconfig.Entry.flag("CONFIG_ADC_ENABLE_DEBUG_LOG", cfg.adc_enable_debug_log);
        entries[4] = sdkconfig.Entry.flag("CONFIG_ADC_ONESHOT_CTRL_FUNC_IN_IRAM", cfg.adc_oneshot_ctrl_func_in_iram);
        entries[5] = sdkconfig.Entry.flag("CONFIG_ADC_SUPPRESS_DEPRECATE_WARN", cfg.adc_suppress_deprecate_warn);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
