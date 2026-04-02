//! H106 TIGA V4：上电后全屏填充纯红色（RGB565 0xF800），不依赖 LVGL。
//! 屏驱逻辑在 `st7789_helper/lcd_st7789.c`。

extern fn espz_lcd_solid_init() callconv(.c) i32;
extern fn espz_lcd_solid_fill_rgb565(color: u16) callconv(.c) i32;
/// 让出 CPU，避免 `while (true) {}` 饿死 IDLE 触发 task_wdt（默认 CONFIG_FREERTOS_HZ=100 时约 1s/100 tick）。
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
