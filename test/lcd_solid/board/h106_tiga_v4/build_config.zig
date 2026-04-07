const esp_idf = @import("esp_idf");

pub const board = .{
    .name = @as([]const u8, "board.h106_tiga_v4"),
    .chip = @as([]const u8, "esp32s3"),
    .target_arch = @as([]const u8, "xtensa"),
    .target_arch_config_flag = @as([]const u8, "CONFIG_IDF_TARGET_ARCH_XTENSA"),
    .target_config_flag = @as([]const u8, "CONFIG_IDF_TARGET_ESP32S3"),
};

/// Matches typical H106 16 MB flash; adjust `esptool_py` for your board if needed.
pub const partition_table = esp_idf.PartitionTable.make(.{
    .entries = &.{
        .{ .name = "nvs", .kind = .data, .subtype = .nvs, .size = 0x6000 },
        .{ .name = "phy_init", .kind = .data, .subtype = .phy, .size = 0x1000 },
        .{ .name = "factory", .kind = .app, .subtype = .factory, .size = 0x600000 },
    },
});

/// Octal PSRAM aligned with common TIGA V4 BSP settings (same class as `embed_compat` esp32s3_devkit).
pub const config = esp_idf.SdkConfig.make(.{
    .esptool_py = .{
        .esptoolpy_flashsize = "16MB",
        .esptoolpy_flashsize_16mb = true,
        .esptoolpy_flashsize_2mb = false,
    },
    .esp_system = .{
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
});
