//! H106 TIGA V4: solid red full screen (RGB565 0xF800) after boot; no LVGL.
//! Display logic lives in `st7789_helper/lcd_st7789.c`.

extern fn espz_lcd_solid_init() callconv(.c) i32;
extern fn espz_lcd_solid_fill_rgb565(color: u16) callconv(.c) i32;
/// Yield CPU so a tight loop does not starve IDLE and trip the task WDT (~1 s at CONFIG_FREERTOS_HZ=100).
extern fn vTaskDelay(ticks: u32) callconv(.c) void;

const esp_ok: i32 = 0;

/// RGB565
const fill_color: u16 = 0xF800;

export fn zig_esp_main() callconv(.c) void {
    if (espz_lcd_solid_init() != esp_ok) {
        @panic("lcd_solid init failed");
    }
    if (espz_lcd_solid_fill_rgb565(fill_color) != esp_ok) {
        @panic("lcd_solid fill failed");
    }

    while (true) {
        vTaskDelay(100);
    }
}
