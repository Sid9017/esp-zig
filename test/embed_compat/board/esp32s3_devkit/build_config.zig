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
        .{ .name = "factory", .kind = .app, .subtype = .factory, .size = 0x600000 },
        .{
            .name = "tmp",
            .kind = .data,
            .subtype = .spiffs,
            .size = 0x40000,
            .data = esp_idf.PartitionTable.data.spiffs("partitions/spiffs"),
        },
    },
});

pub const config = esp_idf.SdkConfig.make(.{
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
        .main_task_stack_size = 65535,
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
        .lwip_loopback_max_pbufs = 128,
        .lwip_tcpip_recvmbox_size = 128,
        .lwip_udp_recvmbox_size = 128,
        .udp_recvmbox_size = 128,
    },
    .spiffs = .{},
});
