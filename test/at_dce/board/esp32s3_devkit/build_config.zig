const esp_idf = @import("esp_idf");

pub const board = .{
    .name = @as([]const u8, "board.esp32s3_devkit"),
    .chip = @as([]const u8, "esp32s3"),
    .target_arch = @as([]const u8, "xtensa"),
    .target_arch_config_flag = @as([]const u8, "CONFIG_IDF_TARGET_ARCH_XTENSA"),
    .target_config_flag = @as([]const u8, "CONFIG_IDF_TARGET_ESP32S3"),
};

pub const partition_table = esp_idf.PartitionTable.make(.{
    .entries = &.{
        .{ .name = "nvs", .kind = .data, .subtype = .nvs, .size = 0x6000 },
        .{ .name = "phy_init", .kind = .data, .subtype = .phy, .size = 0x1000 },
        .{ .name = "factory", .kind = .app, .subtype = .factory, .size = 0x700000 },
    },
});

pub const config = esp_idf.SdkConfig.make(.{
    // Primary console = USB Serial/JTAG so `getStdIn()` / `getStdOut()` (and AT DCE loop) use the same
    // native USB ACM as `esp_log`. Default IDF is UART0 primary + USJ secondary → logs on USB, stdin on UART.
    .console = .{
        .console_sorted_help = false,
        .console_uart = false,
        .console_uart_baudrate = 115200,
        .console_uart_custom = false,
        .console_uart_default = false,
        .console_uart_none = false,
        .console_uart_num = 0,
        .esp_console_usb_serial_jtag = true,
    },
    .esptool_py = .{
        .esptoolpy_flashsize = "16MB",
        .esptoolpy_flashsize_16mb = true,
        .esptoolpy_flashsize_2mb = false,
    },
    .esp_system = .{
        .esp_default_cpu_freq_mhz = 80,
        .esp_default_cpu_freq_mhz_80 = true,
        .esp_default_cpu_freq_mhz_160 = false,
        .esp_default_cpu_freq_mhz_240 = false,
        .main_task_stack_size = 8192,
    },
    .esp_psram = .{
        .spiram = true,
        .spiram_mode_quad = false,
        .spiram_mode_oct = true,
        .spiram_speed_80m = true,
        .spiram_speed_40m = false,
        .spiram_speed_120m = false,
    },
    .lwip = .{
        .lwip_loopback_max_pbufs = 32,
        .lwip_tcpip_recvmbox_size = 32,
        .lwip_udp_recvmbox_size = 32,
        .udp_recvmbox_size = 32,
    },
});
