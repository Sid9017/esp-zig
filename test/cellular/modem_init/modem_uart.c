/*
 * H106 TIGA V4 modem UART for embed-zig cellular smoke test.
 * Reference: `x/c/esp/h106/bsp/H106_TIGA_V4_board/board_def.h` + `board.c`
 * — GPIO6 codec enable (DTR path) before modem; GPIO12 MODEM_ENABLE; UART1 TX17/RX18 @ 115200.
 */

#include <stddef.h>
#include <stdint.h>

#include "driver/gpio.h"
#include "driver/uart.h"
#include "esp_err.h"
#include "esp_log.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "sdkconfig.h"

static const char *TAG = "cell_uart";

#ifndef CONFIG_ESP_CONSOLE_UART_NUM
#define CONFIG_ESP_CONSOLE_UART_NUM 0
#endif

static uart_port_t s_port = UART_NUM_1;
static int s_inited;
static int s_logged_first_write;
static int s_logged_first_read;

int espz_cellular_uart_init(int tx_io, int rx_io, int enable_io, int codec_enable_io, unsigned baud) {
    if (s_inited) {
        ESP_LOGI(TAG, "already initialized (port %d)", (int)s_port);
        return 0;
    }
    if (s_port == CONFIG_ESP_CONSOLE_UART_NUM) {
        ESP_LOGE(TAG, "port %d conflicts with CONFIG_ESP_CONSOLE_UART_NUM=%d", (int)s_port, CONFIG_ESP_CONSOLE_UART_NUM);
        return -1;
    }

    if (codec_enable_io >= 0) {
        gpio_config_t codec_en = {
            .pin_bit_mask = 1ULL << (unsigned)codec_enable_io,
            .mode = GPIO_MODE_OUTPUT,
            .pull_up_en = GPIO_PULLUP_DISABLE,
            .pull_down_en = GPIO_PULLDOWN_DISABLE,
            .intr_type = GPIO_INTR_DISABLE,
        };
        if (gpio_config(&codec_en) != ESP_OK) {
            ESP_LOGE(TAG, "gpio_config codec_enable %d failed", codec_enable_io);
            return -1;
        }
        if (gpio_set_level((gpio_num_t)codec_enable_io, 1) != ESP_OK) {
            ESP_LOGE(TAG, "codec_enable %d -> 1 failed", codec_enable_io);
            return -1;
        }
        ESP_LOGI(TAG, "codec_enable GPIO %d -> 1", codec_enable_io);
    }

    gpio_config_t en = {
        .pin_bit_mask = 1ULL << (unsigned)enable_io,
        .mode = GPIO_MODE_OUTPUT,
        .pull_up_en = GPIO_PULLUP_DISABLE,
        .pull_down_en = GPIO_PULLDOWN_DISABLE,
        .intr_type = GPIO_INTR_DISABLE,
    };
    if (gpio_config(&en) != ESP_OK) {
        ESP_LOGE(TAG, "gpio_config enable %d failed", enable_io);
        return -1;
    }
    if (gpio_set_level((gpio_num_t)enable_io, 1) != ESP_OK) {
        ESP_LOGE(TAG, "enable %d -> 1 failed", enable_io);
        return -1;
    }

    if (gpio_reset_pin((gpio_num_t)tx_io) != ESP_OK) {
        ESP_LOGW(TAG, "gpio_reset_pin(tx=%d) failed", tx_io);
    }
    if (gpio_reset_pin((gpio_num_t)rx_io) != ESP_OK) {
        ESP_LOGW(TAG, "gpio_reset_pin(rx=%d) failed", rx_io);
    }

    uart_config_t cfg = {
        .baud_rate = (int)baud,
        .data_bits = UART_DATA_8_BITS,
        .parity = UART_PARITY_DISABLE,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE,
        .rx_flow_ctrl_thresh = 122,
        .source_clk = UART_SCLK_DEFAULT,
    };

    const int rx_buf = 4096;
    const int tx_buf = 1024;

    if (uart_driver_install(s_port, rx_buf, tx_buf, 0, NULL, 0) != ESP_OK) {
        ESP_LOGE(TAG, "uart_driver_install failed");
        return -1;
    }
    if (uart_param_config(s_port, &cfg) != ESP_OK) {
        ESP_LOGE(TAG, "uart_param_config failed");
        uart_driver_delete(s_port);
        return -1;
    }
    if (uart_set_pin(s_port, tx_io, rx_io, UART_PIN_NO_CHANGE, UART_PIN_NO_CHANGE) != ESP_OK) {
        ESP_LOGE(TAG, "uart_set_pin tx=%d rx=%d failed", tx_io, rx_io);
        uart_driver_delete(s_port);
        return -1;
    }
    if (gpio_set_pull_mode((gpio_num_t)rx_io, GPIO_PULLUP_ONLY) != ESP_OK) {
        ESP_LOGW(TAG, "gpio_set_pull_mode rx=%d pull-up failed", rx_io);
    }
    uart_flush_input(s_port);

    uint32_t baud_hw = 0;
    if (uart_get_baudrate(s_port, &baud_hw) == ESP_OK) {
        ESP_LOGI(TAG, "ready port=%d tx=%d rx=%d en=%d baud_hw=%lu baud_req=%u console_uart_num=%d rx_buf=%d tx_buf=%d",
                 (int)s_port, tx_io, rx_io, enable_io, (unsigned long)baud_hw, baud, CONFIG_ESP_CONSOLE_UART_NUM, rx_buf, tx_buf);
    } else {
        ESP_LOGI(TAG, "ready port=%d tx=%d rx=%d en=%d baud_req=%u", (int)s_port, tx_io, rx_io, enable_io, baud);
    }

    s_inited = 1;
    s_logged_first_write = 0;
    s_logged_first_read = 0;
    return 0;
}

void espz_cellular_uart_deinit(void) {
    if (!s_inited) {
        return;
    }
    uart_driver_delete(s_port);
    s_inited = 0;
    s_logged_first_write = 0;
    s_logged_first_read = 0;
    ESP_LOGI(TAG, "deinit port=%d", (int)s_port);
}

int espz_cellular_uart_read(uint8_t *buf, int len) {
    if (!s_inited || len <= 0) {
        return -2;
    }
    int n = uart_read_bytes(s_port, buf, (uint32_t)len, 0);
    if (n < 0) {
        ESP_LOGE(TAG, "uart_read_bytes error");
        return -2;
    }
    if (n == 0) {
        return -1;
    }
    if (!s_logged_first_read) {
        s_logged_first_read = 1;
        ESP_LOGI(TAG, "first read len=%d", n);
        ESP_LOG_BUFFER_HEX_LEVEL(TAG, buf, (size_t)n > 48U ? 48U : (size_t)n, ESP_LOG_INFO);
    }
    return n;
}

int espz_cellular_uart_write(const uint8_t *buf, int len) {
    if (!s_inited || len <= 0) {
        return -2;
    }
    int w = uart_write_bytes(s_port, buf, (size_t)len);
    if (w < 0) {
        ESP_LOGE(TAG, "uart_write_bytes failed len=%d", len);
        return -2;
    }
    if (uart_wait_tx_done(s_port, pdMS_TO_TICKS(500)) != ESP_OK) {
        ESP_LOGW(TAG, "uart_wait_tx_done timeout after write len=%d", len);
    }
    if (!s_logged_first_write) {
        s_logged_first_write = 1;
        size_t rx_backlog = 0;
        if (uart_get_buffered_data_len(s_port, &rx_backlog) == ESP_OK) {
            ESP_LOGI(TAG, "first write len=%d ret=%d rx_ring_bytes_after_tx=%u", len, w, (unsigned)rx_backlog);
        } else {
            ESP_LOGI(TAG, "first write len=%d ret=%d", len, w);
        }
        ESP_LOG_BUFFER_HEX_LEVEL(TAG, buf, (size_t)len > 48U ? 48U : (size_t)len, ESP_LOG_INFO);
    }
    return w;
}

int espz_cellular_uart_rx_waiting(void) {
    if (!s_inited) {
        return 0;
    }
    size_t n = 0;
    if (uart_get_buffered_data_len(s_port, &n) != ESP_OK) {
        return 0;
    }
    return n > (size_t)0x7fffffff ? 0x7fffffff : (int)n;
}
