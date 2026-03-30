const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_psram";

pub const Config = struct {
    /// Kconfig key: `CONFIG_SPIRAM`.
    /// Controls whether spiram is enabled for the `esp_psram` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spiram: bool = false,

    /// Kconfig key: `CONFIG_SPIRAM_MODE_QUAD`.
    /// Selects Quad SPI PSRAM line mode.
    /// Default: `false`.
    spiram_mode_quad: bool = false,

    /// Kconfig key: `CONFIG_SPIRAM_MODE_OCT`.
    /// Selects Octal SPI PSRAM line mode (ESP32-S3 with 8-line PSRAM).
    /// Default: `false`.
    spiram_mode_oct: bool = false,

    /// Kconfig key: `CONFIG_SPIRAM_SPEED_80M`.
    /// PSRAM clock speed 80 MHz.
    /// Default: `false`.
    spiram_speed_80m: bool = false,

    /// Kconfig key: `CONFIG_SPIRAM_SPEED_40M`.
    /// PSRAM clock speed 40 MHz.
    /// Default: `false`.
    spiram_speed_40m: bool = false,

    /// Kconfig key: `CONFIG_SPIRAM_SPEED_120M`.
    /// PSRAM clock speed 120 MHz (Octal only).
    /// Default: `false`.
    spiram_speed_120m: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 6);
        entries[0] = sdkconfig.Entry.flag("CONFIG_SPIRAM", cfg.spiram);
        entries[1] = sdkconfig.Entry.flag("CONFIG_SPIRAM_MODE_QUAD", cfg.spiram_mode_quad);
        entries[2] = sdkconfig.Entry.flag("CONFIG_SPIRAM_MODE_OCT", cfg.spiram_mode_oct);
        entries[3] = sdkconfig.Entry.flag("CONFIG_SPIRAM_SPEED_80M", cfg.spiram_speed_80m);
        entries[4] = sdkconfig.Entry.flag("CONFIG_SPIRAM_SPEED_40M", cfg.spiram_speed_40m);
        entries[5] = sdkconfig.Entry.flag("CONFIG_SPIRAM_SPEED_120M", cfg.spiram_speed_120m);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }

    test "appendModuleDoc emits CONFIG_SPIRAM entries" {
        var docs = std.array_list.Managed(sdkconfig.ModuleDoc).init(std.testing.allocator);
        defer docs.deinit();

        try Config.appendModuleDoc(std.testing.allocator, &docs, .{});

        const module_docs = try docs.toOwnedSlice();
        defer sdkconfig.freeModuleDocs(std.testing.allocator, module_docs);

        try std.testing.expectEqual(@as(usize, 1), module_docs.len);
        try std.testing.expect(std.mem.eql(u8, module_docs[0].name, module_name));
        try std.testing.expectEqual(@as(usize, 6), module_docs[0].entries.len);
        try std.testing.expect(std.mem.eql(u8, module_docs[0].entries[0].key, "CONFIG_SPIRAM"));
    }
};
