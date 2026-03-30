const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "spi_flash";

pub const Config = struct {
    /// Kconfig key: `CONFIG_SPI_FLASH_AUTO_SUSPEND`.
    /// Controls whether SPI flash AUTO suspend is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spi_flash_auto_suspend: bool = false,
    /// Kconfig key: `CONFIG_SPI_FLASH_BROWNOUT_RESET`.
    /// Controls whether SPI flash brownout reset is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_brownout_reset: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_BROWNOUT_RESET_XMC`.
    /// Controls whether SPI flash brownout reset XMC is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_brownout_reset_xmc: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_BYPASS_BLOCK_ERASE`.
    /// Controls whether SPI flash bypass block erase is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spi_flash_bypass_block_erase: bool = false,
    /// Kconfig key: `CONFIG_SPI_FLASH_CHECK_ERASE_TIMEOUT_DISABLED`.
    /// Controls whether SPI flash check erase timeout disabled is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spi_flash_check_erase_timeout_disabled: bool = false,
    /// Kconfig key: `CONFIG_SPI_FLASH_DANGEROUS_WRITE_ABORTS`.
    /// Controls whether SPI flash dangerous write aborts is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_dangerous_write_aborts: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_DANGEROUS_WRITE_ALLOWED`.
    /// Controls whether SPI flash dangerous write allowed is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spi_flash_dangerous_write_allowed: bool = false,
    /// Kconfig key: `CONFIG_SPI_FLASH_DANGEROUS_WRITE_FAILS`.
    /// Controls whether SPI flash dangerous write fails is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spi_flash_dangerous_write_fails: bool = false,
    /// Kconfig key: `CONFIG_SPI_FLASH_ENABLE_COUNTERS`.
    /// Controls whether SPI flash enable counters is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spi_flash_enable_counters: bool = false,
    /// Kconfig key: `CONFIG_SPI_FLASH_ENABLE_ENCRYPTED_READ_WRITE`.
    /// Controls whether SPI flash enable encrypted READ write is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_enable_encrypted_read_write: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_ERASE_YIELD_DURATION_MS`.
    /// Sets the numeric value for SPI flash erase yield duration MS in the `spi_flash` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `20`.
    spi_flash_erase_yield_duration_ms: i64 = 20,
    /// Kconfig key: `CONFIG_SPI_FLASH_ERASE_YIELD_TICKS`.
    /// Sets the numeric value for SPI flash erase yield ticks in the `spi_flash` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    spi_flash_erase_yield_ticks: i64 = 1,
    /// Kconfig key: `CONFIG_SPI_FLASH_FORCE_ENABLE_XMC_C_SUSPEND`.
    /// Controls whether SPI flash force enable XMC C suspend is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spi_flash_force_enable_xmc_c_suspend: bool = false,
    /// Kconfig key: `CONFIG_SPI_FLASH_HPM_AUTO`.
    /// Controls whether SPI flash HPM AUTO is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_hpm_auto: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_HPM_DC_AUTO`.
    /// Controls whether SPI flash HPM DC AUTO is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_hpm_dc_auto: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_HPM_DC_DISABLE`.
    /// Controls whether SPI flash HPM DC disable is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spi_flash_hpm_dc_disable: bool = false,
    /// Kconfig key: `CONFIG_SPI_FLASH_HPM_DIS`.
    /// Controls whether SPI flash HPM DIS is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spi_flash_hpm_dis: bool = false,
    /// Kconfig key: `CONFIG_SPI_FLASH_HPM_ENA`.
    /// Controls whether SPI flash HPM ENA is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spi_flash_hpm_ena: bool = false,
    /// Kconfig key: `CONFIG_SPI_FLASH_HPM_ON`.
    /// Controls whether SPI flash HPM ON is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_hpm_on: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_OVERRIDE_CHIP_DRIVER_LIST`.
    /// Controls whether SPI flash override CHIP driver LIST is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spi_flash_override_chip_driver_list: bool = false,
    /// Kconfig key: `CONFIG_SPI_FLASH_ROM_DRIVER_PATCH`.
    /// Controls whether SPI flash ROM driver patch is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_rom_driver_patch: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_ROM_IMPL`.
    /// Controls whether SPI flash ROM IMPL is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spi_flash_rom_impl: bool = false,
    /// Kconfig key: `CONFIG_SPI_FLASH_SIZE_OVERRIDE`.
    /// Controls whether SPI flash SIZE override is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spi_flash_size_override: bool = false,
    /// Kconfig key: `CONFIG_SPI_FLASH_SUPPORT_BOYA_CHIP`.
    /// Controls whether SPI flash support BOYA CHIP is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_support_boya_chip: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_SUPPORT_GD_CHIP`.
    /// Controls whether SPI flash support GD CHIP is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_support_gd_chip: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_SUPPORT_ISSI_CHIP`.
    /// Controls whether SPI flash support ISSI CHIP is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_support_issi_chip: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_SUPPORT_MXIC_CHIP`.
    /// Controls whether SPI flash support MXIC CHIP is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_support_mxic_chip: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_SUPPORT_MXIC_OPI_CHIP`.
    /// Controls whether SPI flash support MXIC OPI CHIP is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_support_mxic_opi_chip: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_SUPPORT_TH_CHIP`.
    /// Controls whether SPI flash support TH CHIP is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_support_th_chip: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_SUPPORT_WINBOND_CHIP`.
    /// Controls whether SPI flash support winbond CHIP is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_support_winbond_chip: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_SUSPEND_TSUS_VAL_US`.
    /// Sets the numeric value for SPI flash suspend TSUS VAL US in the `spi_flash` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `50`.
    spi_flash_suspend_tsus_val_us: i64 = 50,
    /// Kconfig key: `CONFIG_SPI_FLASH_VENDOR_BOYA_SUPPORTED`.
    /// Controls whether SPI flash vendor BOYA supported is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_vendor_boya_supported: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_VENDOR_GD_SUPPORTED`.
    /// Controls whether SPI flash vendor GD supported is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_vendor_gd_supported: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_VENDOR_ISSI_SUPPORTED`.
    /// Controls whether SPI flash vendor ISSI supported is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_vendor_issi_supported: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_VENDOR_MXIC_SUPPORTED`.
    /// Controls whether SPI flash vendor MXIC supported is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_vendor_mxic_supported: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_VENDOR_TH_SUPPORTED`.
    /// Controls whether SPI flash vendor TH supported is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_vendor_th_supported: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_VENDOR_WINBOND_SUPPORTED`.
    /// Controls whether SPI flash vendor winbond supported is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_vendor_winbond_supported: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_VENDOR_XMC_SUPPORTED`.
    /// Controls whether SPI flash vendor XMC supported is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_vendor_xmc_supported: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_VERIFY_WRITE`.
    /// Controls whether SPI flash verify write is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spi_flash_verify_write: bool = false,
    /// Kconfig key: `CONFIG_SPI_FLASH_WRITE_CHUNK_SIZE`.
    /// Sets the numeric value for SPI flash write chunk SIZE in the `spi_flash` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `8192`.
    spi_flash_write_chunk_size: i64 = 8192,
    /// Kconfig key: `CONFIG_SPI_FLASH_WRITING_DANGEROUS_REGIONS_ABORTS`.
    /// Controls whether SPI flash writing dangerous regions aborts is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_writing_dangerous_regions_aborts: bool = true,
    /// Kconfig key: `CONFIG_SPI_FLASH_WRITING_DANGEROUS_REGIONS_ALLOWED`.
    /// Controls whether SPI flash writing dangerous regions allowed is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spi_flash_writing_dangerous_regions_allowed: bool = false,
    /// Kconfig key: `CONFIG_SPI_FLASH_WRITING_DANGEROUS_REGIONS_FAILS`.
    /// Controls whether SPI flash writing dangerous regions fails is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spi_flash_writing_dangerous_regions_fails: bool = false,
    /// Kconfig key: `CONFIG_SPI_FLASH_YIELD_DURING_ERASE`.
    /// Controls whether SPI flash yield during erase is enabled for the `spi_flash` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_flash_yield_during_erase: bool = true,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 44);
        entries[0] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_AUTO_SUSPEND", cfg.spi_flash_auto_suspend);
        entries[1] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_BROWNOUT_RESET", cfg.spi_flash_brownout_reset);
        entries[2] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_BROWNOUT_RESET_XMC", cfg.spi_flash_brownout_reset_xmc);
        entries[3] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_BYPASS_BLOCK_ERASE", cfg.spi_flash_bypass_block_erase);
        entries[4] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_CHECK_ERASE_TIMEOUT_DISABLED", cfg.spi_flash_check_erase_timeout_disabled);
        entries[5] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_DANGEROUS_WRITE_ABORTS", cfg.spi_flash_dangerous_write_aborts);
        entries[6] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_DANGEROUS_WRITE_ALLOWED", cfg.spi_flash_dangerous_write_allowed);
        entries[7] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_DANGEROUS_WRITE_FAILS", cfg.spi_flash_dangerous_write_fails);
        entries[8] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_ENABLE_COUNTERS", cfg.spi_flash_enable_counters);
        entries[9] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_ENABLE_ENCRYPTED_READ_WRITE", cfg.spi_flash_enable_encrypted_read_write);
        entries[10] = sdkconfig.Entry.int("CONFIG_SPI_FLASH_ERASE_YIELD_DURATION_MS", cfg.spi_flash_erase_yield_duration_ms);
        entries[11] = sdkconfig.Entry.int("CONFIG_SPI_FLASH_ERASE_YIELD_TICKS", cfg.spi_flash_erase_yield_ticks);
        entries[12] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_FORCE_ENABLE_XMC_C_SUSPEND", cfg.spi_flash_force_enable_xmc_c_suspend);
        entries[13] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_HPM_AUTO", cfg.spi_flash_hpm_auto);
        entries[14] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_HPM_DC_AUTO", cfg.spi_flash_hpm_dc_auto);
        entries[15] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_HPM_DC_DISABLE", cfg.spi_flash_hpm_dc_disable);
        entries[16] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_HPM_DIS", cfg.spi_flash_hpm_dis);
        entries[17] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_HPM_ENA", cfg.spi_flash_hpm_ena);
        entries[18] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_HPM_ON", cfg.spi_flash_hpm_on);
        entries[19] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_OVERRIDE_CHIP_DRIVER_LIST", cfg.spi_flash_override_chip_driver_list);
        entries[20] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_ROM_DRIVER_PATCH", cfg.spi_flash_rom_driver_patch);
        entries[21] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_ROM_IMPL", cfg.spi_flash_rom_impl);
        entries[22] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_SIZE_OVERRIDE", cfg.spi_flash_size_override);
        entries[23] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_SUPPORT_BOYA_CHIP", cfg.spi_flash_support_boya_chip);
        entries[24] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_SUPPORT_GD_CHIP", cfg.spi_flash_support_gd_chip);
        entries[25] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_SUPPORT_ISSI_CHIP", cfg.spi_flash_support_issi_chip);
        entries[26] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_SUPPORT_MXIC_CHIP", cfg.spi_flash_support_mxic_chip);
        entries[27] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_SUPPORT_MXIC_OPI_CHIP", cfg.spi_flash_support_mxic_opi_chip);
        entries[28] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_SUPPORT_TH_CHIP", cfg.spi_flash_support_th_chip);
        entries[29] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_SUPPORT_WINBOND_CHIP", cfg.spi_flash_support_winbond_chip);
        entries[30] = sdkconfig.Entry.int("CONFIG_SPI_FLASH_SUSPEND_TSUS_VAL_US", cfg.spi_flash_suspend_tsus_val_us);
        entries[31] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_VENDOR_BOYA_SUPPORTED", cfg.spi_flash_vendor_boya_supported);
        entries[32] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_VENDOR_GD_SUPPORTED", cfg.spi_flash_vendor_gd_supported);
        entries[33] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_VENDOR_ISSI_SUPPORTED", cfg.spi_flash_vendor_issi_supported);
        entries[34] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_VENDOR_MXIC_SUPPORTED", cfg.spi_flash_vendor_mxic_supported);
        entries[35] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_VENDOR_TH_SUPPORTED", cfg.spi_flash_vendor_th_supported);
        entries[36] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_VENDOR_WINBOND_SUPPORTED", cfg.spi_flash_vendor_winbond_supported);
        entries[37] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_VENDOR_XMC_SUPPORTED", cfg.spi_flash_vendor_xmc_supported);
        entries[38] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_VERIFY_WRITE", cfg.spi_flash_verify_write);
        entries[39] = sdkconfig.Entry.int("CONFIG_SPI_FLASH_WRITE_CHUNK_SIZE", cfg.spi_flash_write_chunk_size);
        entries[40] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_WRITING_DANGEROUS_REGIONS_ABORTS", cfg.spi_flash_writing_dangerous_regions_aborts);
        entries[41] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_WRITING_DANGEROUS_REGIONS_ALLOWED", cfg.spi_flash_writing_dangerous_regions_allowed);
        entries[42] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_WRITING_DANGEROUS_REGIONS_FAILS", cfg.spi_flash_writing_dangerous_regions_fails);
        entries[43] = sdkconfig.Entry.flag("CONFIG_SPI_FLASH_YIELD_DURING_ERASE", cfg.spi_flash_yield_during_erase);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
