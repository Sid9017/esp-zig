const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "partition_table";

pub const Config = struct {
    /// Kconfig key: `CONFIG_PARTITION_TABLE_CUSTOM`.
    /// Controls whether partition table custom is enabled for the `partition_table` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    partition_table_custom: bool = true,
    /// Kconfig key: `CONFIG_PARTITION_TABLE_CUSTOM_FILENAME`.
    /// Sets the literal value for partition table custom filename in the `partition_table` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `".build/partitions.generated.e92b2059b49b71e3.csv"`.
    partition_table_custom_filename: []const u8 = ".build/partitions.generated.e92b2059b49b71e3.csv",
    /// Kconfig key: `CONFIG_PARTITION_TABLE_FILENAME`.
    /// Sets the literal value for partition table filename in the `partition_table` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `".build/partitions.generated.e92b2059b49b71e3.csv"`.
    partition_table_filename: []const u8 = ".build/partitions.generated.e92b2059b49b71e3.csv",
    /// Kconfig key: `CONFIG_PARTITION_TABLE_MD5`.
    /// Controls whether partition table MD5 is enabled for the `partition_table` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    partition_table_md5: bool = true,
    /// Kconfig key: `CONFIG_PARTITION_TABLE_OFFSET`.
    /// Sets the literal value for partition table offset in the `partition_table` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `"0x8000"`.
    partition_table_offset: []const u8 = "0x8000",
    /// Kconfig key: `CONFIG_PARTITION_TABLE_SINGLE_APP`.
    /// Controls whether partition table single APP is enabled for the `partition_table` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    partition_table_single_app: bool = false,
    /// Kconfig key: `CONFIG_PARTITION_TABLE_SINGLE_APP_LARGE`.
    /// Controls whether partition table single APP large is enabled for the `partition_table` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    partition_table_single_app_large: bool = false,
    /// Kconfig key: `CONFIG_PARTITION_TABLE_TWO_OTA`.
    /// Controls whether partition table TWO OTA is enabled for the `partition_table` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    partition_table_two_ota: bool = false,
    /// Kconfig key: `CONFIG_PARTITION_TABLE_TWO_OTA_LARGE`.
    /// Controls whether partition table TWO OTA large is enabled for the `partition_table` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    partition_table_two_ota_large: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 9);
        entries[0] = sdkconfig.Entry.flag("CONFIG_PARTITION_TABLE_CUSTOM", cfg.partition_table_custom);
        entries[1] = sdkconfig.Entry.str("CONFIG_PARTITION_TABLE_CUSTOM_FILENAME", cfg.partition_table_custom_filename);
        entries[2] = sdkconfig.Entry.str("CONFIG_PARTITION_TABLE_FILENAME", cfg.partition_table_filename);
        entries[3] = sdkconfig.Entry.flag("CONFIG_PARTITION_TABLE_MD5", cfg.partition_table_md5);
        entries[4] = sdkconfig.Entry.raw("CONFIG_PARTITION_TABLE_OFFSET", cfg.partition_table_offset);
        entries[5] = sdkconfig.Entry.flag("CONFIG_PARTITION_TABLE_SINGLE_APP", cfg.partition_table_single_app);
        entries[6] = sdkconfig.Entry.flag("CONFIG_PARTITION_TABLE_SINGLE_APP_LARGE", cfg.partition_table_single_app_large);
        entries[7] = sdkconfig.Entry.flag("CONFIG_PARTITION_TABLE_TWO_OTA", cfg.partition_table_two_ota);
        entries[8] = sdkconfig.Entry.flag("CONFIG_PARTITION_TABLE_TWO_OTA_LARGE", cfg.partition_table_two_ota_large);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
