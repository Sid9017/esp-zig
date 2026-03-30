const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_lcd";

pub const Config = struct {
    /// Kconfig key: `CONFIG_LCD_ENABLE_DEBUG_LOG`.
    /// Controls whether LCD enable debug LOG is enabled for the `esp_lcd` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lcd_enable_debug_log: bool = false,
    /// Kconfig key: `CONFIG_LCD_RGB_ISR_IRAM_SAFE`.
    /// Controls whether LCD RGB ISR IRAM SAFE is enabled for the `esp_lcd` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lcd_rgb_isr_iram_safe: bool = false,
    /// Kconfig key: `CONFIG_LCD_RGB_RESTART_IN_VSYNC`.
    /// Controls whether LCD RGB restart IN vsync is enabled for the `esp_lcd` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lcd_rgb_restart_in_vsync: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 3);
        entries[0] = sdkconfig.Entry.flag("CONFIG_LCD_ENABLE_DEBUG_LOG", cfg.lcd_enable_debug_log);
        entries[1] = sdkconfig.Entry.flag("CONFIG_LCD_RGB_ISR_IRAM_SAFE", cfg.lcd_rgb_isr_iram_safe);
        entries[2] = sdkconfig.Entry.flag("CONFIG_LCD_RGB_RESTART_IN_VSYNC", cfg.lcd_rgb_restart_in_vsync);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
