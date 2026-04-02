//! H106-S3-TIGA-V4 显示相关引脚与分辨率（与 `x/c/esp/h106/bsp/H106_TIGA_V4_board` 一致）。
//! C 侧实现见 `st7789_helper/lcd_st7789.c`。

pub const name = "h106-s3-tiga-v4";

pub const lcd = struct {
    pub const hor_res = 240;
    pub const ver_res = 240;
    pub const pixel_clock_hz = 40_000_000;
    pub const spi_host: u3 = 2; // SPI2_HOST

    pub const gpio = struct {
        pub const mosi: i32 = 42;
        pub const sck: i32 = 41;
        /// 复用为 DC（与 H106 `board.c` 一致：`dc_gpio_num = BSP_GPIO_SPI_MISO`）
        pub const dc: i32 = 39;
        pub const cs: i32 = 40;
        pub const reset: i32 = 45;
        pub const backlight_pwm: i32 = 46;
    };
};
