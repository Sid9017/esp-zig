#pragma once

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/// Mirrors H106 TIGA V4 `h106_init_lcd_display` + full-screen RGB565 fill (no LVGL).
/// @return 0 on success, else `esp_err_t`.
int espz_lcd_solid_init(void);

/// Fill the entire 240×240 panel with one RGB565 color (e.g. 0xF800 red, 0x07E0 green).
/// @return 0 on success, else `esp_err_t`.
int espz_lcd_solid_fill_rgb565(uint16_t rgb565);

#ifdef __cplusplus
}
#endif
