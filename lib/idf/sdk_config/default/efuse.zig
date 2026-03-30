const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "efuse";

pub const Config = struct {
    /// Kconfig key: `CONFIG_EFUSE_CUSTOM_TABLE`.
    /// Controls whether efuse custom table is enabled for the `efuse` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    efuse_custom_table: bool = false,
    /// Kconfig key: `CONFIG_EFUSE_MAX_BLK_LEN`.
    /// Sets the numeric value for efuse MAX BLK LEN in the `efuse` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `256`.
    efuse_max_blk_len: i64 = 256,
    /// Kconfig key: `CONFIG_EFUSE_VIRTUAL`.
    /// Controls whether efuse virtual is enabled for the `efuse` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    efuse_virtual: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 3);
        entries[0] = sdkconfig.Entry.flag("CONFIG_EFUSE_CUSTOM_TABLE", cfg.efuse_custom_table);
        entries[1] = sdkconfig.Entry.int("CONFIG_EFUSE_MAX_BLK_LEN", cfg.efuse_max_blk_len);
        entries[2] = sdkconfig.Entry.flag("CONFIG_EFUSE_VIRTUAL", cfg.efuse_virtual);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
