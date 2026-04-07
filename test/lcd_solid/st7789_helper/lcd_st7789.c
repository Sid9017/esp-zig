/*
 * ST7789 on H106-S3-TIGA-V4: pins and timing from
 *   x/c/esp/h106/bsp/H106_TIGA_V4_board/board.c (h106_init_lcd_display)
 *   x/c/esp/h106/bsp/H106_TIGA_V4_board/include/board_def.h
 *   x/c/esp/h106/bsp/H106_TIGA_V4_board/include/board_display_hal.h
 *
 * Full-screen solid fill using band buffer (max_transfer_sz 16KiB on SPI bus).
 */

#include "lcd_st7789.h"

#include <string.h>

#include "driver/gpio.h"
#include "driver/ledc.h"
#include "driver/spi_master.h"
#include "esp_check.h"
#include "esp_lcd_panel_io.h"
#include "esp_lcd_panel_ops.h"
#include "esp_lcd_panel_st7789.h"
#include "esp_log.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

static const char *TAG = "lcd_solid";

/* board_def.h */
#define BSP_GPIO_SPI_MISO (39)
#define BSP_GPIO_SPI_CS (40)
#define BSP_GPIO_SPI_SCK (41)
#define BSP_GPIO_SPI_MOSI (42)
#define BSP_GPIO_LCD_RESET (45)
#define BSP_GPIO_LCD_BL_PWM (46)
/** 上电即拉高（板级电源/使能等，与 ST7789 走线无关） */
#define BSP_GPIO_POWER_ON_HIGH (6)

/* board_display_hal.h */
#define LCD_H_RES (240)
#define LCD_V_RES (240)
#define LCD_PIXEL_CLK_HZ (40 * 1000 * 1000)
#define LCD_CMD_BITS (8)
#define LCD_PARAM_BITS (8)
#define LCD_COLOR_ORDER (LCD_RGB_ELEMENT_ORDER_RGB)
#define LCD_BITS_PER_PIXEL (16)

#define LCD_SPI_MAX_TRANSFER (16 * 1024)
#define LCD_BAND_LINES (32)
#define LCD_BAND_PIXELS (LCD_H_RES * LCD_BAND_LINES)

static spi_host_device_t s_spi_host = SPI_HOST_MAX;
static esp_lcd_panel_io_handle_t s_io = NULL;
static esp_lcd_panel_handle_t s_panel = NULL;

static uint16_t s_band_buf[LCD_BAND_PIXELS];

static esp_err_t init_backlight_pwm(void) {
    const ledc_timer_config_t ledc_timer = {
        .speed_mode = LEDC_LOW_SPEED_MODE,
        .duty_resolution = LEDC_TIMER_13_BIT,
        .timer_num = LEDC_TIMER_0,
        .freq_hz = 5000,
        .clk_cfg = LEDC_AUTO_CLK,
    };
    ESP_RETURN_ON_ERROR(ledc_timer_config(&ledc_timer), TAG, "ledc_timer_config");

    const ledc_channel_config_t ledc_channel = {
        .gpio_num = BSP_GPIO_LCD_BL_PWM,
        .speed_mode = LEDC_LOW_SPEED_MODE,
        .channel = LEDC_CHANNEL_0,
        .intr_type = LEDC_INTR_DISABLE,
        .timer_sel = LEDC_TIMER_0,
        .duty = 0,
        .hpoint = 0,
    };
    ESP_RETURN_ON_ERROR(ledc_channel_config(&ledc_channel), TAG, "ledc_channel_config");
    ESP_RETURN_ON_ERROR(ledc_update_duty(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_0), TAG,
                        "ledc_update_duty");
    ESP_RETURN_ON_ERROR(ledc_fade_func_install(0), TAG, "ledc_fade_func_install");
    return ESP_OK;
}

static esp_err_t gpio_power_on_high(void) {
    gpio_config_t cfg = {
        .pin_bit_mask = (1ULL << BSP_GPIO_POWER_ON_HIGH),
        .mode = GPIO_MODE_OUTPUT,
        .pull_up_en = false,
        .pull_down_en = false,
        .intr_type = GPIO_INTR_DISABLE,
    };
    ESP_RETURN_ON_ERROR(gpio_config(&cfg), TAG, "gpio_power_on_high config");
    gpio_set_level(BSP_GPIO_POWER_ON_HIGH, 1);
    return ESP_OK;
}

static void backlight_on_full(void) {
    const uint32_t duty_max = (1U << 13) - 1U;
    esp_err_t err = ledc_set_duty(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_0, duty_max);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "ledc_set_duty: %s", esp_err_to_name(err));
        return;
    }
    err = ledc_update_duty(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_0);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "ledc_update_duty: %s", esp_err_to_name(err));
    }
}

int espz_lcd_solid_init(void) {
    esp_err_t err = gpio_power_on_high();
    if (err != ESP_OK) {
        return (int)err;
    }

    err = init_backlight_pwm();
    if (err != ESP_OK) {
        return (int)err;
    }

    gpio_config_t idle_pull = {
        .pin_bit_mask = (1ULL << BSP_GPIO_SPI_CS) | (1ULL << BSP_GPIO_SPI_SCK) |
                        (1ULL << BSP_GPIO_SPI_MOSI) | (1ULL << BSP_GPIO_SPI_MISO),
        .mode = GPIO_MODE_DISABLE,
        .pull_up_en = true,
        .pull_down_en = false,
        .intr_type = GPIO_INTR_DISABLE,
    };
    ESP_RETURN_ON_ERROR(gpio_config(&idle_pull), TAG, "gpio_config idle");

    spi_bus_config_t buscfg = {
        .mosi_io_num = BSP_GPIO_SPI_MOSI,
        .miso_io_num = -1,
        .sclk_io_num = BSP_GPIO_SPI_SCK,
        .quadwp_io_num = -1,
        .quadhd_io_num = -1,
        .max_transfer_sz = LCD_SPI_MAX_TRANSFER,
    };
    err = spi_bus_initialize(SPI2_HOST, &buscfg, SPI_DMA_CH_AUTO);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "spi_bus_initialize: %s", esp_err_to_name(err));
        return (int)err;
    }
    s_spi_host = SPI2_HOST;

    esp_lcd_panel_io_spi_config_t io_config = {
        .dc_gpio_num = BSP_GPIO_SPI_MISO,
        .cs_gpio_num = BSP_GPIO_SPI_CS,
        .pclk_hz = LCD_PIXEL_CLK_HZ,
        .lcd_cmd_bits = LCD_CMD_BITS,
        .lcd_param_bits = LCD_PARAM_BITS,
        .spi_mode = 0,
        .trans_queue_depth = 2,
    };
    err = esp_lcd_new_panel_io_spi((esp_lcd_spi_bus_handle_t)SPI2_HOST, &io_config, &s_io);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "esp_lcd_new_panel_io_spi: %s", esp_err_to_name(err));
        goto fail_spi;
    }

    /* Default data_endian is BIG; Xtensa uint16 RGB565 in RAM is little-endian per pixel.
     * H106 `test_lcd.c` fixes this with swap_rgb565_bytes() before draw_bitmap — same effect. */
    esp_lcd_panel_dev_config_t panel_config = {
        .reset_gpio_num = BSP_GPIO_LCD_RESET,
        .rgb_ele_order = LCD_COLOR_ORDER,
        .data_endian = LCD_RGB_DATA_ENDIAN_LITTLE,
        .bits_per_pixel = LCD_BITS_PER_PIXEL,
    };
    err = esp_lcd_new_panel_st7789(s_io, &panel_config, &s_panel);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "esp_lcd_new_panel_st7789: %s", esp_err_to_name(err));
        goto fail_io;
    }

    /* Avoid ESP_GOTO_ON_ERROR: newer ESP-IDF assigns into `ret`, not `err`. */
    err = esp_lcd_panel_reset(s_panel);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "panel_reset: %s", esp_err_to_name(err));
        goto fail_panel;
    }
    err = esp_lcd_panel_init(s_panel);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "panel_init: %s", esp_err_to_name(err));
        goto fail_panel;
    }
    err = esp_lcd_panel_mirror(s_panel, false, false);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "mirror: %s", esp_err_to_name(err));
        goto fail_panel;
    }
    err = esp_lcd_panel_disp_on_off(s_panel, true);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "disp_on: %s", esp_err_to_name(err));
        goto fail_panel;
    }
    err = esp_lcd_panel_invert_color(s_panel, true);
    if (err != ESP_OK) {
        ESP_LOGE(TAG, "invert: %s", esp_err_to_name(err));
        goto fail_panel;
    }

    backlight_on_full();
    ESP_LOGI(TAG, "ST7789 init OK (%dx%d)", LCD_H_RES, LCD_V_RES);
    return 0;

fail_panel:
    esp_lcd_panel_del(s_panel);
    s_panel = NULL;
fail_io:
    esp_lcd_panel_io_del(s_io);
    s_io = NULL;
fail_spi:
    spi_bus_free(s_spi_host);
    s_spi_host = SPI_HOST_MAX;
    return (int)err;
}

int espz_lcd_solid_fill_rgb565(uint16_t rgb565) {
    if (s_panel == NULL) {
        return ESP_ERR_INVALID_STATE;
    }

    for (size_t i = 0; i < LCD_BAND_PIXELS; i++) {
        s_band_buf[i] = rgb565;
    }

    for (int y = 0; y < LCD_V_RES; y += LCD_BAND_LINES) {
        int y_end = y + LCD_BAND_LINES;
        if (y_end > LCD_V_RES) {
            y_end = LCD_V_RES;
        }
        const int lines = y_end - y;
        const size_t pixels = (size_t)LCD_H_RES * (size_t)lines;
        esp_err_t err =
            esp_lcd_panel_draw_bitmap(s_panel, 0, y, LCD_H_RES, y_end, s_band_buf);
        if (err != ESP_OK) {
            ESP_LOGE(TAG, "draw_bitmap y=%d..%d: %s", y, y_end, esp_err_to_name(err));
            return (int)err;
        }
        (void)pixels;
        vTaskDelay(1);
    }
    return 0;
}
