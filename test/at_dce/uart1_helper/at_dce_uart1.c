/* UART1 for AT DCE: ESP32-S3-DevKitC-1 style wiring (TX=GPIO17, RX=GPIO18). */
#include "driver/uart.h"
#include "esp_err.h"

esp_err_t at_dce_uart1_init(void) {
    uart_config_t cfg = {0};
    cfg.baud_rate = 115200;
    cfg.data_bits = UART_DATA_8_BITS;
    cfg.parity = UART_PARITY_DISABLE;
    cfg.stop_bits = UART_STOP_BITS_1;
    cfg.flow_ctrl = UART_HW_FLOWCTRL_DISABLE;
    cfg.source_clk = UART_SCLK_DEFAULT;

    esp_err_t err = uart_param_config(UART_NUM_1, &cfg);
    if (err != ESP_OK) {
        return err;
    }

    err = uart_set_pin(UART_NUM_1, 17, 18, UART_PIN_NO_CHANGE, UART_PIN_NO_CHANGE);
    if (err != ESP_OK) {
        return err;
    }

    return uart_driver_install(UART_NUM_1, 512, 0, 0, NULL, 0);
}
