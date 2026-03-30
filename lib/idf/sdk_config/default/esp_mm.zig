const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_mm";

pub const Config = struct {
    /// Kconfig key: `CONFIG_MMU_PAGE_MODE`.
    /// Sets the literal value for MMU PAGE MODE in the `esp_mm` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `"64KB"`.
    mmu_page_mode: []const u8 = "64KB",
    /// Kconfig key: `CONFIG_MMU_PAGE_SIZE`.
    /// Sets the literal value for MMU PAGE SIZE in the `esp_mm` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `"0x10000"`.
    mmu_page_size: []const u8 = "0x10000",
    /// Kconfig key: `CONFIG_MMU_PAGE_SIZE_64KB`.
    /// Controls whether MMU PAGE SIZE 64KB is enabled for the `esp_mm` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mmu_page_size_64kb: bool = true,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 3);
        entries[0] = sdkconfig.Entry.str("CONFIG_MMU_PAGE_MODE", cfg.mmu_page_mode);
        entries[1] = sdkconfig.Entry.raw("CONFIG_MMU_PAGE_SIZE", cfg.mmu_page_size);
        entries[2] = sdkconfig.Entry.flag("CONFIG_MMU_PAGE_SIZE_64KB", cfg.mmu_page_size_64kb);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
