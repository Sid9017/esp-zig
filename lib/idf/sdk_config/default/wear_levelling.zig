const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "wear_levelling";

pub const Config = struct {
    /// Kconfig key: `CONFIG_WL_SECTOR_SIZE`.
    /// Sets the numeric value for WL sector SIZE in the `wear_levelling` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `4096`.
    wl_sector_size: i64 = 4096,
    /// Kconfig key: `CONFIG_WL_SECTOR_SIZE_4096`.
    /// Controls whether WL sector SIZE 4096 is enabled for the `wear_levelling` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    wl_sector_size_4096: bool = true,
    /// Kconfig key: `CONFIG_WL_SECTOR_SIZE_512`.
    /// Controls whether WL sector SIZE 512 is enabled for the `wear_levelling` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    wl_sector_size_512: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 3);
        entries[0] = sdkconfig.Entry.int("CONFIG_WL_SECTOR_SIZE", cfg.wl_sector_size);
        entries[1] = sdkconfig.Entry.flag("CONFIG_WL_SECTOR_SIZE_4096", cfg.wl_sector_size_4096);
        entries[2] = sdkconfig.Entry.flag("CONFIG_WL_SECTOR_SIZE_512", cfg.wl_sector_size_512);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
