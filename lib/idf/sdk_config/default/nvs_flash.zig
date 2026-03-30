const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "nvs_flash";

pub const Config = struct {
    /// Kconfig key: `CONFIG_NVS_ASSERT_ERROR_CHECK`.
    /// Controls whether NVS assert error check is enabled for the `nvs_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    nvs_assert_error_check: bool = false,
    /// Kconfig key: `CONFIG_NVS_ENCRYPTION`.
    /// Controls whether NVS encryption is enabled for the `nvs_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    nvs_encryption: bool = false,
    /// Kconfig key: `CONFIG_NVS_LEGACY_DUP_KEYS_COMPATIBILITY`.
    /// Controls whether NVS legacy DUP KEYS compatibility is enabled for the `nvs_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    nvs_legacy_dup_keys_compatibility: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 3);
        entries[0] = sdkconfig.Entry.flag("CONFIG_NVS_ASSERT_ERROR_CHECK", cfg.nvs_assert_error_check);
        entries[1] = sdkconfig.Entry.flag("CONFIG_NVS_ENCRYPTION", cfg.nvs_encryption);
        entries[2] = sdkconfig.Entry.flag("CONFIG_NVS_LEGACY_DUP_KEYS_COMPATIBILITY", cfg.nvs_legacy_dup_keys_compatibility);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
