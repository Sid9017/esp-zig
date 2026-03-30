const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_security";

pub const Config = struct {
    /// Kconfig key: `CONFIG_FLASH_ENCRYPTION_ENABLED`.
    /// Controls whether flash encryption enabled is enabled for the `esp_security` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    flash_encryption_enabled: bool = false,
    /// Kconfig key: `CONFIG_SECURE_BOOT`.
    /// Controls whether secure BOOT is enabled for the `esp_security` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    secure_boot: bool = false,
    /// Kconfig key: `CONFIG_SECURE_BOOT_V2_PREFERRED`.
    /// Controls whether secure BOOT V2 preferred is enabled for the `esp_security` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    secure_boot_v2_preferred: bool = true,
    /// Kconfig key: `CONFIG_SECURE_BOOT_V2_RSA_SUPPORTED`.
    /// Controls whether secure BOOT V2 RSA supported is enabled for the `esp_security` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    secure_boot_v2_rsa_supported: bool = true,
    /// Kconfig key: `CONFIG_SECURE_FLASH_ENC_ENABLED`.
    /// Controls whether secure flash ENC enabled is enabled for the `esp_security` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    secure_flash_enc_enabled: bool = false,
    /// Kconfig key: `CONFIG_SECURE_ROM_DL_MODE_ENABLED`.
    /// Controls whether secure ROM DL MODE enabled is enabled for the `esp_security` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    secure_rom_dl_mode_enabled: bool = true,
    /// Kconfig key: `CONFIG_SECURE_SIGNED_APPS_NO_SECURE_BOOT`.
    /// Controls whether secure signed APPS NO secure BOOT is enabled for the `esp_security` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    secure_signed_apps_no_secure_boot: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 7);
        entries[0] = sdkconfig.Entry.flag("CONFIG_FLASH_ENCRYPTION_ENABLED", cfg.flash_encryption_enabled);
        entries[1] = sdkconfig.Entry.flag("CONFIG_SECURE_BOOT", cfg.secure_boot);
        entries[2] = sdkconfig.Entry.flag("CONFIG_SECURE_BOOT_V2_PREFERRED", cfg.secure_boot_v2_preferred);
        entries[3] = sdkconfig.Entry.flag("CONFIG_SECURE_BOOT_V2_RSA_SUPPORTED", cfg.secure_boot_v2_rsa_supported);
        entries[4] = sdkconfig.Entry.flag("CONFIG_SECURE_FLASH_ENC_ENABLED", cfg.secure_flash_enc_enabled);
        entries[5] = sdkconfig.Entry.flag("CONFIG_SECURE_ROM_DL_MODE_ENABLED", cfg.secure_rom_dl_mode_enabled);
        entries[6] = sdkconfig.Entry.flag("CONFIG_SECURE_SIGNED_APPS_NO_SECURE_BOOT", cfg.secure_signed_apps_no_secure_boot);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
