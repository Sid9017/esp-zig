const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "soc";

pub const Config = struct {
    /// Kconfig key: `CONFIG_SOC_ADC_ARBITER_SUPPORTED`.
    /// Controls whether SOC ADC arbiter supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_adc_arbiter_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_ADC_ATTEN_NUM`.
    /// Sets the numeric value for SOC ADC atten NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `4`.
    soc_adc_atten_num: i64 = 4,
    /// Kconfig key: `CONFIG_SOC_ADC_CALIBRATION_V1_SUPPORTED`.
    /// Controls whether SOC ADC calibration V1 supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_adc_calibration_v1_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_ADC_DIGI_CONTROLLER_NUM`.
    /// Sets the numeric value for SOC ADC DIGI controller NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_adc_digi_controller_num: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_ADC_DIGI_DATA_BYTES_PER_CONV`.
    /// Sets the numeric value for SOC ADC DIGI DATA bytes PER CONV in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `4`.
    soc_adc_digi_data_bytes_per_conv: i64 = 4,
    /// Kconfig key: `CONFIG_SOC_ADC_DIGI_IIR_FILTER_NUM`.
    /// Sets the numeric value for SOC ADC DIGI IIR filter NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_adc_digi_iir_filter_num: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_ADC_DIGI_MAX_BITWIDTH`.
    /// Sets the numeric value for SOC ADC DIGI MAX bitwidth in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `12`.
    soc_adc_digi_max_bitwidth: i64 = 12,
    /// Kconfig key: `CONFIG_SOC_ADC_DIGI_MIN_BITWIDTH`.
    /// Sets the numeric value for SOC ADC DIGI MIN bitwidth in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `12`.
    soc_adc_digi_min_bitwidth: i64 = 12,
    /// Kconfig key: `CONFIG_SOC_ADC_DIGI_MONITOR_NUM`.
    /// Sets the numeric value for SOC ADC DIGI monitor NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_adc_digi_monitor_num: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_ADC_DIGI_RESULT_BYTES`.
    /// Sets the numeric value for SOC ADC DIGI result bytes in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `4`.
    soc_adc_digi_result_bytes: i64 = 4,
    /// Kconfig key: `CONFIG_SOC_ADC_DIG_CTRL_SUPPORTED`.
    /// Controls whether SOC ADC DIG CTRL supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_adc_dig_ctrl_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_ADC_DIG_IIR_FILTER_SUPPORTED`.
    /// Controls whether SOC ADC DIG IIR filter supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_adc_dig_iir_filter_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_ADC_DMA_SUPPORTED`.
    /// Controls whether SOC ADC DMA supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_adc_dma_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_ADC_MAX_CHANNEL_NUM`.
    /// Sets the numeric value for SOC ADC MAX channel NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `10`.
    soc_adc_max_channel_num: i64 = 10,
    /// Kconfig key: `CONFIG_SOC_ADC_MONITOR_SUPPORTED`.
    /// Controls whether SOC ADC monitor supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_adc_monitor_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_ADC_PATT_LEN_MAX`.
    /// Sets the numeric value for SOC ADC PATT LEN MAX in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `24`.
    soc_adc_patt_len_max: i64 = 24,
    /// Kconfig key: `CONFIG_SOC_ADC_PERIPH_NUM`.
    /// Sets the numeric value for SOC ADC periph NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_adc_periph_num: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_ADC_RTC_CTRL_SUPPORTED`.
    /// Controls whether SOC ADC RTC CTRL supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_adc_rtc_ctrl_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_ADC_RTC_MAX_BITWIDTH`.
    /// Sets the numeric value for SOC ADC RTC MAX bitwidth in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `12`.
    soc_adc_rtc_max_bitwidth: i64 = 12,
    /// Kconfig key: `CONFIG_SOC_ADC_RTC_MIN_BITWIDTH`.
    /// Sets the numeric value for SOC ADC RTC MIN bitwidth in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `12`.
    soc_adc_rtc_min_bitwidth: i64 = 12,
    /// Kconfig key: `CONFIG_SOC_ADC_SAMPLE_FREQ_THRES_HIGH`.
    /// Sets the numeric value for SOC ADC sample FREQ thres HIGH in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `83333`.
    soc_adc_sample_freq_thres_high: i64 = 83333,
    /// Kconfig key: `CONFIG_SOC_ADC_SAMPLE_FREQ_THRES_LOW`.
    /// Sets the numeric value for SOC ADC sample FREQ thres LOW in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `611`.
    soc_adc_sample_freq_thres_low: i64 = 611,
    /// Kconfig key: `CONFIG_SOC_ADC_SELF_HW_CALI_SUPPORTED`.
    /// Controls whether SOC ADC SELF HW CALI supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_adc_self_hw_cali_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_ADC_SHARED_POWER`.
    /// Controls whether SOC ADC shared power is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_adc_shared_power: bool = true,
    /// Kconfig key: `CONFIG_SOC_ADC_SUPPORTED`.
    /// Controls whether SOC ADC supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_adc_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_AES_GDMA`.
    /// Controls whether SOC AES GDMA is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_aes_gdma: bool = true,
    /// Kconfig key: `CONFIG_SOC_AES_SUPPORTED`.
    /// Controls whether SOC AES supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_aes_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_AES_SUPPORT_AES_128`.
    /// Controls whether SOC AES support AES 128 is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_aes_support_aes_128: bool = true,
    /// Kconfig key: `CONFIG_SOC_AES_SUPPORT_AES_256`.
    /// Controls whether SOC AES support AES 256 is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_aes_support_aes_256: bool = true,
    /// Kconfig key: `CONFIG_SOC_AES_SUPPORT_DMA`.
    /// Controls whether SOC AES support DMA is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_aes_support_dma: bool = true,
    /// Kconfig key: `CONFIG_SOC_AHB_GDMA_SUPPORTED`.
    /// Controls whether SOC AHB GDMA supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_ahb_gdma_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_AHB_GDMA_SUPPORT_PSRAM`.
    /// Controls whether SOC AHB GDMA support psram is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_ahb_gdma_support_psram: bool = true,
    /// Kconfig key: `CONFIG_SOC_AHB_GDMA_VERSION`.
    /// Sets the numeric value for SOC AHB GDMA version in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    soc_ahb_gdma_version: i64 = 1,
    /// Kconfig key: `CONFIG_SOC_APB_BACKUP_DMA`.
    /// Controls whether SOC APB backup DMA is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_apb_backup_dma: bool = true,
    /// Kconfig key: `CONFIG_SOC_APPCPU_HAS_CLOCK_GATING_BUG`.
    /// Controls whether SOC appcpu HAS clock gating BUG is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_appcpu_has_clock_gating_bug: bool = true,
    /// Kconfig key: `CONFIG_SOC_ASYNC_MEMCPY_SUPPORTED`.
    /// Controls whether SOC async memcpy supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_async_memcpy_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_BLE_50_SUPPORTED`.
    /// Controls whether SOC BLE 50 supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_ble_50_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_BLE_DEVICE_PRIVACY_SUPPORTED`.
    /// Controls whether SOC BLE device privacy supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_ble_device_privacy_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_BLE_MESH_SUPPORTED`.
    /// Controls whether SOC BLE MESH supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_ble_mesh_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_BLE_SUPPORTED`.
    /// Controls whether SOC BLE supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_ble_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_BLUFI_SUPPORTED`.
    /// Controls whether SOC blufi supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_blufi_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_BOD_SUPPORTED`.
    /// Controls whether SOC BOD supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_bod_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_BROWNOUT_RESET_SUPPORTED`.
    /// Controls whether SOC brownout reset supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_brownout_reset_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_BT_SUPPORTED`.
    /// Controls whether SOC BT supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_bt_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_CACHE_FREEZE_SUPPORTED`.
    /// Controls whether SOC cache freeze supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_cache_freeze_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_CACHE_SUPPORT_WRAP`.
    /// Controls whether SOC cache support WRAP is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_cache_support_wrap: bool = true,
    /// Kconfig key: `CONFIG_SOC_CACHE_WRITEBACK_SUPPORTED`.
    /// Controls whether SOC cache writeback supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_cache_writeback_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_CCOMP_TIMER_SUPPORTED`.
    /// Controls whether SOC ccomp timer supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_ccomp_timer_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_CLK_RC_FAST_D256_SUPPORTED`.
    /// Controls whether SOC CLK RC FAST D256 supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_clk_rc_fast_d256_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_CLK_RC_FAST_SUPPORT_CALIBRATION`.
    /// Controls whether SOC CLK RC FAST support calibration is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_clk_rc_fast_support_calibration: bool = true,
    /// Kconfig key: `CONFIG_SOC_CLK_TREE_SUPPORTED`.
    /// Controls whether SOC CLK TREE supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_clk_tree_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_CLK_XTAL32K_SUPPORTED`.
    /// Controls whether SOC CLK xtal32k supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_clk_xtal32k_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_COEX_HW_PTI`.
    /// Controls whether SOC COEX HW PTI is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_coex_hw_pti: bool = true,
    /// Kconfig key: `CONFIG_SOC_CONFIGURABLE_VDDSDIO_SUPPORTED`.
    /// Controls whether SOC configurable vddsdio supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_configurable_vddsdio_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_CPU_BREAKPOINTS_NUM`.
    /// Sets the numeric value for SOC CPU breakpoints NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_cpu_breakpoints_num: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_CPU_CORES_NUM`.
    /// Sets the numeric value for SOC CPU cores NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_cpu_cores_num: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_CPU_HAS_FPU`.
    /// Controls whether SOC CPU HAS FPU is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_cpu_has_fpu: bool = true,
    /// Kconfig key: `CONFIG_SOC_CPU_INTR_NUM`.
    /// Sets the numeric value for SOC CPU INTR NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `32`.
    soc_cpu_intr_num: i64 = 32,
    /// Kconfig key: `CONFIG_SOC_CPU_WATCHPOINTS_NUM`.
    /// Sets the numeric value for SOC CPU watchpoints NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_cpu_watchpoints_num: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_CPU_WATCHPOINT_MAX_REGION_SIZE`.
    /// Sets the numeric value for SOC CPU watchpoint MAX region SIZE in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `64`.
    soc_cpu_watchpoint_max_region_size: i64 = 64,
    /// Kconfig key: `CONFIG_SOC_DEDICATED_GPIO_SUPPORTED`.
    /// Controls whether SOC dedicated GPIO supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_dedicated_gpio_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_DEDIC_GPIO_IN_CHANNELS_NUM`.
    /// Sets the numeric value for SOC dedic GPIO IN channels NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `8`.
    soc_dedic_gpio_in_channels_num: i64 = 8,
    /// Kconfig key: `CONFIG_SOC_DEDIC_GPIO_OUT_AUTO_ENABLE`.
    /// Controls whether SOC dedic GPIO OUT AUTO enable is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_dedic_gpio_out_auto_enable: bool = true,
    /// Kconfig key: `CONFIG_SOC_DEDIC_GPIO_OUT_CHANNELS_NUM`.
    /// Sets the numeric value for SOC dedic GPIO OUT channels NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `8`.
    soc_dedic_gpio_out_channels_num: i64 = 8,
    /// Kconfig key: `CONFIG_SOC_DEEP_SLEEP_SUPPORTED`.
    /// Controls whether SOC DEEP sleep supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_deep_sleep_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_DIG_SIGN_SUPPORTED`.
    /// Controls whether SOC DIG SIGN supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_dig_sign_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_DS_KEY_CHECK_MAX_WAIT_US`.
    /// Sets the numeric value for SOC DS KEY check MAX WAIT US in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1100`.
    soc_ds_key_check_max_wait_us: i64 = 1100,
    /// Kconfig key: `CONFIG_SOC_DS_KEY_PARAM_MD_IV_LENGTH`.
    /// Sets the numeric value for SOC DS KEY param MD IV length in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `16`.
    soc_ds_key_param_md_iv_length: i64 = 16,
    /// Kconfig key: `CONFIG_SOC_DS_SIGNATURE_MAX_BIT_LEN`.
    /// Sets the numeric value for SOC DS signature MAX BIT LEN in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `4096`.
    soc_ds_signature_max_bit_len: i64 = 4096,
    /// Kconfig key: `CONFIG_SOC_EFUSE_BLOCK9_KEY_PURPOSE_QUIRK`.
    /// Controls whether SOC efuse block9 KEY purpose quirk is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_efuse_block9_key_purpose_quirk: bool = true,
    /// Kconfig key: `CONFIG_SOC_EFUSE_DIS_DIRECT_BOOT`.
    /// Controls whether SOC efuse DIS direct BOOT is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_efuse_dis_direct_boot: bool = true,
    /// Kconfig key: `CONFIG_SOC_EFUSE_DIS_DOWNLOAD_DCACHE`.
    /// Controls whether SOC efuse DIS download dcache is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_efuse_dis_download_dcache: bool = true,
    /// Kconfig key: `CONFIG_SOC_EFUSE_DIS_DOWNLOAD_ICACHE`.
    /// Controls whether SOC efuse DIS download icache is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_efuse_dis_download_icache: bool = true,
    /// Kconfig key: `CONFIG_SOC_EFUSE_DIS_ICACHE`.
    /// Controls whether SOC efuse DIS icache is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_efuse_dis_icache: bool = true,
    /// Kconfig key: `CONFIG_SOC_EFUSE_DIS_USB_JTAG`.
    /// Controls whether SOC efuse DIS USB JTAG is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_efuse_dis_usb_jtag: bool = true,
    /// Kconfig key: `CONFIG_SOC_EFUSE_HARD_DIS_JTAG`.
    /// Controls whether SOC efuse HARD DIS JTAG is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_efuse_hard_dis_jtag: bool = true,
    /// Kconfig key: `CONFIG_SOC_EFUSE_KEY_PURPOSE_FIELD`.
    /// Controls whether SOC efuse KEY purpose field is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_efuse_key_purpose_field: bool = true,
    /// Kconfig key: `CONFIG_SOC_EFUSE_REVOKE_BOOT_KEY_DIGESTS`.
    /// Controls whether SOC efuse revoke BOOT KEY digests is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_efuse_revoke_boot_key_digests: bool = true,
    /// Kconfig key: `CONFIG_SOC_EFUSE_SECURE_BOOT_KEY_DIGESTS`.
    /// Sets the numeric value for SOC efuse secure BOOT KEY digests in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    soc_efuse_secure_boot_key_digests: i64 = 3,
    /// Kconfig key: `CONFIG_SOC_EFUSE_SOFT_DIS_JTAG`.
    /// Controls whether SOC efuse SOFT DIS JTAG is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_efuse_soft_dis_jtag: bool = true,
    /// Kconfig key: `CONFIG_SOC_EFUSE_SUPPORTED`.
    /// Controls whether SOC efuse supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_efuse_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_EXTERNAL_COEX_LEADER_TX_LINE`.
    /// Controls whether SOC external COEX leader TX LINE is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_external_coex_leader_tx_line: bool = true,
    /// Kconfig key: `CONFIG_SOC_FLASH_ENCRYPTED_XTS_AES_BLOCK_MAX`.
    /// Sets the numeric value for SOC flash encrypted XTS AES block MAX in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `64`.
    soc_flash_encrypted_xts_aes_block_max: i64 = 64,
    /// Kconfig key: `CONFIG_SOC_FLASH_ENCRYPTION_XTS_AES`.
    /// Controls whether SOC flash encryption XTS AES is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_flash_encryption_xts_aes: bool = true,
    /// Kconfig key: `CONFIG_SOC_FLASH_ENCRYPTION_XTS_AES_128`.
    /// Controls whether SOC flash encryption XTS AES 128 is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_flash_encryption_xts_aes_128: bool = true,
    /// Kconfig key: `CONFIG_SOC_FLASH_ENCRYPTION_XTS_AES_256`.
    /// Controls whether SOC flash encryption XTS AES 256 is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_flash_encryption_xts_aes_256: bool = true,
    /// Kconfig key: `CONFIG_SOC_FLASH_ENCRYPTION_XTS_AES_OPTIONS`.
    /// Controls whether SOC flash encryption XTS AES options is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_flash_encryption_xts_aes_options: bool = true,
    /// Kconfig key: `CONFIG_SOC_FLASH_ENC_SUPPORTED`.
    /// Controls whether SOC flash ENC supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_flash_enc_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_GDMA_NUM_GROUPS_MAX`.
    /// Sets the numeric value for SOC GDMA NUM groups MAX in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    soc_gdma_num_groups_max: i64 = 1,
    /// Kconfig key: `CONFIG_SOC_GDMA_PAIRS_PER_GROUP`.
    /// Sets the numeric value for SOC GDMA pairs PER group in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `5`.
    soc_gdma_pairs_per_group: i64 = 5,
    /// Kconfig key: `CONFIG_SOC_GDMA_PAIRS_PER_GROUP_MAX`.
    /// Sets the numeric value for SOC GDMA pairs PER group MAX in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `5`.
    soc_gdma_pairs_per_group_max: i64 = 5,
    /// Kconfig key: `CONFIG_SOC_GDMA_SUPPORTED`.
    /// Controls whether SOC GDMA supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_gdma_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_GPIO_CLOCKOUT_BY_IO_MUX`.
    /// Controls whether SOC GPIO clockout BY IO MUX is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_gpio_clockout_by_io_mux: bool = true,
    /// Kconfig key: `CONFIG_SOC_GPIO_CLOCKOUT_CHANNEL_NUM`.
    /// Sets the numeric value for SOC GPIO clockout channel NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    soc_gpio_clockout_channel_num: i64 = 3,
    /// Kconfig key: `CONFIG_SOC_GPIO_FILTER_CLK_SUPPORT_APB`.
    /// Controls whether SOC GPIO filter CLK support APB is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_gpio_filter_clk_support_apb: bool = true,
    /// Kconfig key: `CONFIG_SOC_GPIO_IN_RANGE_MAX`.
    /// Sets the numeric value for SOC GPIO IN range MAX in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `48`.
    soc_gpio_in_range_max: i64 = 48,
    /// Kconfig key: `CONFIG_SOC_GPIO_OUT_RANGE_MAX`.
    /// Sets the numeric value for SOC GPIO OUT range MAX in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `48`.
    soc_gpio_out_range_max: i64 = 48,
    /// Kconfig key: `CONFIG_SOC_GPIO_PIN_COUNT`.
    /// Sets the numeric value for SOC GPIO PIN count in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `49`.
    soc_gpio_pin_count: i64 = 49,
    /// Kconfig key: `CONFIG_SOC_GPIO_PORT`.
    /// Sets the numeric value for SOC GPIO PORT in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    soc_gpio_port: i64 = 1,
    /// Kconfig key: `CONFIG_SOC_GPIO_SUPPORT_FORCE_HOLD`.
    /// Controls whether SOC GPIO support force HOLD is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_gpio_support_force_hold: bool = true,
    /// Kconfig key: `CONFIG_SOC_GPIO_SUPPORT_HOLD_IO_IN_DSLP`.
    /// Controls whether SOC GPIO support HOLD IO IN DSLP is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_gpio_support_hold_io_in_dslp: bool = true,
    /// Kconfig key: `CONFIG_SOC_GPIO_SUPPORT_PIN_GLITCH_FILTER`.
    /// Controls whether SOC GPIO support PIN glitch filter is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_gpio_support_pin_glitch_filter: bool = true,
    /// Kconfig key: `CONFIG_SOC_GPIO_SUPPORT_RTC_INDEPENDENT`.
    /// Controls whether SOC GPIO support RTC independent is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_gpio_support_rtc_independent: bool = true,
    /// Kconfig key: `CONFIG_SOC_GPIO_VALID_DIGITAL_IO_PAD_MASK`.
    /// Sets the literal value for SOC GPIO valid digital IO PAD MASK in the `soc` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `"0x0001FFFFFC000000"`.
    soc_gpio_valid_digital_io_pad_mask: []const u8 = "0x0001FFFFFC000000",
    /// Kconfig key: `CONFIG_SOC_GPIO_VALID_GPIO_MASK`.
    /// Sets the literal value for SOC GPIO valid GPIO MASK in the `soc` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `"0x1FFFFFFFFFFFF"`.
    soc_gpio_valid_gpio_mask: []const u8 = "0x1FFFFFFFFFFFF",
    /// Kconfig key: `CONFIG_SOC_GPSPI_SUPPORTED`.
    /// Controls whether SOC gpspi supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_gpspi_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_GPTIMER_SUPPORTED`.
    /// Controls whether SOC gptimer supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_gptimer_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_HMAC_SUPPORTED`.
    /// Controls whether SOC HMAC supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_hmac_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_HP_CPU_HAS_MULTIPLE_CORES`.
    /// Controls whether SOC HP CPU HAS multiple cores is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_hp_cpu_has_multiple_cores: bool = true,
    /// Kconfig key: `CONFIG_SOC_HP_I2C_NUM`.
    /// Sets the numeric value for SOC HP I2C NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_hp_i2c_num: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_I2C_CMD_REG_NUM`.
    /// Sets the numeric value for SOC I2C CMD REG NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `8`.
    soc_i2c_cmd_reg_num: i64 = 8,
    /// Kconfig key: `CONFIG_SOC_I2C_FIFO_LEN`.
    /// Sets the numeric value for SOC I2C FIFO LEN in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `32`.
    soc_i2c_fifo_len: i64 = 32,
    /// Kconfig key: `CONFIG_SOC_I2C_NUM`.
    /// Sets the numeric value for SOC I2C NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_i2c_num: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_I2C_SLAVE_CAN_GET_STRETCH_CAUSE`.
    /// Controls whether SOC I2C slave CAN GET stretch cause is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_i2c_slave_can_get_stretch_cause: bool = true,
    /// Kconfig key: `CONFIG_SOC_I2C_SLAVE_SUPPORT_BROADCAST`.
    /// Controls whether SOC I2C slave support broadcast is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_i2c_slave_support_broadcast: bool = true,
    /// Kconfig key: `CONFIG_SOC_I2C_SLAVE_SUPPORT_I2CRAM_ACCESS`.
    /// Controls whether SOC I2C slave support i2cram access is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_i2c_slave_support_i2cram_access: bool = true,
    /// Kconfig key: `CONFIG_SOC_I2C_SUPPORTED`.
    /// Controls whether SOC I2C supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_i2c_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_I2C_SUPPORT_10BIT_ADDR`.
    /// Controls whether SOC I2C support 10bit ADDR is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_i2c_support_10bit_addr: bool = true,
    /// Kconfig key: `CONFIG_SOC_I2C_SUPPORT_HW_CLR_BUS`.
    /// Controls whether SOC I2C support HW CLR BUS is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_i2c_support_hw_clr_bus: bool = true,
    /// Kconfig key: `CONFIG_SOC_I2C_SUPPORT_RTC`.
    /// Controls whether SOC I2C support RTC is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_i2c_support_rtc: bool = true,
    /// Kconfig key: `CONFIG_SOC_I2C_SUPPORT_SLAVE`.
    /// Controls whether SOC I2C support slave is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_i2c_support_slave: bool = true,
    /// Kconfig key: `CONFIG_SOC_I2C_SUPPORT_XTAL`.
    /// Controls whether SOC I2C support XTAL is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_i2c_support_xtal: bool = true,
    /// Kconfig key: `CONFIG_SOC_I2S_HW_VERSION_2`.
    /// Controls whether SOC I2S HW version 2 is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_i2s_hw_version_2: bool = true,
    /// Kconfig key: `CONFIG_SOC_I2S_NUM`.
    /// Sets the numeric value for SOC I2S NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_i2s_num: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_I2S_PDM_MAX_RX_LINES`.
    /// Sets the numeric value for SOC I2S PDM MAX RX lines in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `4`.
    soc_i2s_pdm_max_rx_lines: i64 = 4,
    /// Kconfig key: `CONFIG_SOC_I2S_PDM_MAX_TX_LINES`.
    /// Sets the numeric value for SOC I2S PDM MAX TX lines in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_i2s_pdm_max_tx_lines: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_I2S_SUPPORTED`.
    /// Controls whether SOC I2S supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_i2s_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_I2S_SUPPORTS_PCM`.
    /// Controls whether SOC I2S supports PCM is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_i2s_supports_pcm: bool = true,
    /// Kconfig key: `CONFIG_SOC_I2S_SUPPORTS_PDM`.
    /// Controls whether SOC I2S supports PDM is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_i2s_supports_pdm: bool = true,
    /// Kconfig key: `CONFIG_SOC_I2S_SUPPORTS_PDM_RX`.
    /// Controls whether SOC I2S supports PDM RX is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_i2s_supports_pdm_rx: bool = true,
    /// Kconfig key: `CONFIG_SOC_I2S_SUPPORTS_PDM_TX`.
    /// Controls whether SOC I2S supports PDM TX is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_i2s_supports_pdm_tx: bool = true,
    /// Kconfig key: `CONFIG_SOC_I2S_SUPPORTS_PLL_F160M`.
    /// Controls whether SOC I2S supports PLL f160m is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_i2s_supports_pll_f160m: bool = true,
    /// Kconfig key: `CONFIG_SOC_I2S_SUPPORTS_TDM`.
    /// Controls whether SOC I2S supports TDM is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_i2s_supports_tdm: bool = true,
    /// Kconfig key: `CONFIG_SOC_I2S_SUPPORTS_XTAL`.
    /// Controls whether SOC I2S supports XTAL is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_i2s_supports_xtal: bool = true,
    /// Kconfig key: `CONFIG_SOC_LCDCAM_I80_BUS_WIDTH`.
    /// Sets the numeric value for SOC lcdcam I80 BUS width in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `16`.
    soc_lcdcam_i80_bus_width: i64 = 16,
    /// Kconfig key: `CONFIG_SOC_LCDCAM_I80_LCD_SUPPORTED`.
    /// Controls whether SOC lcdcam I80 LCD supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_lcdcam_i80_lcd_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_LCDCAM_I80_NUM_BUSES`.
    /// Sets the numeric value for SOC lcdcam I80 NUM buses in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    soc_lcdcam_i80_num_buses: i64 = 1,
    /// Kconfig key: `CONFIG_SOC_LCDCAM_RGB_DATA_WIDTH`.
    /// Sets the numeric value for SOC lcdcam RGB DATA width in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `16`.
    soc_lcdcam_rgb_data_width: i64 = 16,
    /// Kconfig key: `CONFIG_SOC_LCDCAM_RGB_LCD_SUPPORTED`.
    /// Controls whether SOC lcdcam RGB LCD supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_lcdcam_rgb_lcd_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_LCDCAM_RGB_NUM_PANELS`.
    /// Sets the numeric value for SOC lcdcam RGB NUM panels in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    soc_lcdcam_rgb_num_panels: i64 = 1,
    /// Kconfig key: `CONFIG_SOC_LCDCAM_SUPPORTED`.
    /// Controls whether SOC lcdcam supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_lcdcam_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_LCD_I80_BUSES`.
    /// Sets the numeric value for SOC LCD I80 buses in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    soc_lcd_i80_buses: i64 = 1,
    /// Kconfig key: `CONFIG_SOC_LCD_I80_BUS_WIDTH`.
    /// Sets the numeric value for SOC LCD I80 BUS width in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `16`.
    soc_lcd_i80_bus_width: i64 = 16,
    /// Kconfig key: `CONFIG_SOC_LCD_I80_SUPPORTED`.
    /// Controls whether SOC LCD I80 supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_lcd_i80_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_LCD_RGB_DATA_WIDTH`.
    /// Sets the numeric value for SOC LCD RGB DATA width in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `16`.
    soc_lcd_rgb_data_width: i64 = 16,
    /// Kconfig key: `CONFIG_SOC_LCD_RGB_PANELS`.
    /// Sets the numeric value for SOC LCD RGB panels in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    soc_lcd_rgb_panels: i64 = 1,
    /// Kconfig key: `CONFIG_SOC_LCD_RGB_SUPPORTED`.
    /// Controls whether SOC LCD RGB supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_lcd_rgb_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_LCD_SUPPORT_RGB_YUV_CONV`.
    /// Controls whether SOC LCD support RGB YUV CONV is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_lcd_support_rgb_yuv_conv: bool = true,
    /// Kconfig key: `CONFIG_SOC_LEDC_CHANNEL_NUM`.
    /// Sets the numeric value for SOC LEDC channel NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `8`.
    soc_ledc_channel_num: i64 = 8,
    /// Kconfig key: `CONFIG_SOC_LEDC_SUPPORTED`.
    /// Controls whether SOC LEDC supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_ledc_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_LEDC_SUPPORT_APB_CLOCK`.
    /// Controls whether SOC LEDC support APB clock is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_ledc_support_apb_clock: bool = true,
    /// Kconfig key: `CONFIG_SOC_LEDC_SUPPORT_FADE_STOP`.
    /// Controls whether SOC LEDC support FADE STOP is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_ledc_support_fade_stop: bool = true,
    /// Kconfig key: `CONFIG_SOC_LEDC_SUPPORT_XTAL_CLOCK`.
    /// Controls whether SOC LEDC support XTAL clock is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_ledc_support_xtal_clock: bool = true,
    /// Kconfig key: `CONFIG_SOC_LEDC_TIMER_BIT_WIDTH`.
    /// Sets the numeric value for SOC LEDC timer BIT width in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `14`.
    soc_ledc_timer_bit_width: i64 = 14,
    /// Kconfig key: `CONFIG_SOC_LEDC_TIMER_NUM`.
    /// Sets the numeric value for SOC LEDC timer NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `4`.
    soc_ledc_timer_num: i64 = 4,
    /// Kconfig key: `CONFIG_SOC_LIGHT_SLEEP_SUPPORTED`.
    /// Controls whether SOC light sleep supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_light_sleep_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_LP_PERIPH_SHARE_INTERRUPT`.
    /// Controls whether SOC LP periph share interrupt is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_lp_periph_share_interrupt: bool = true,
    /// Kconfig key: `CONFIG_SOC_MAC_BB_PD_MEM_SIZE`.
    /// Sets the numeric value for SOC MAC BB PD MEM SIZE in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `192`.
    soc_mac_bb_pd_mem_size: i64 = 192,
    /// Kconfig key: `CONFIG_SOC_MCPWM_CAPTURE_CHANNELS_PER_TIMER`.
    /// Sets the numeric value for SOC mcpwm capture channels PER timer in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    soc_mcpwm_capture_channels_per_timer: i64 = 3,
    /// Kconfig key: `CONFIG_SOC_MCPWM_CAPTURE_TIMERS_PER_GROUP`.
    /// Controls whether SOC mcpwm capture timers PER group is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_mcpwm_capture_timers_per_group: bool = true,
    /// Kconfig key: `CONFIG_SOC_MCPWM_COMPARATORS_PER_OPERATOR`.
    /// Sets the numeric value for SOC mcpwm comparators PER operator in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_mcpwm_comparators_per_operator: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_MCPWM_GENERATORS_PER_OPERATOR`.
    /// Sets the numeric value for SOC mcpwm generators PER operator in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_mcpwm_generators_per_operator: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_MCPWM_GPIO_FAULTS_PER_GROUP`.
    /// Sets the numeric value for SOC mcpwm GPIO faults PER group in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    soc_mcpwm_gpio_faults_per_group: i64 = 3,
    /// Kconfig key: `CONFIG_SOC_MCPWM_GPIO_SYNCHROS_PER_GROUP`.
    /// Sets the numeric value for SOC mcpwm GPIO synchros PER group in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    soc_mcpwm_gpio_synchros_per_group: i64 = 3,
    /// Kconfig key: `CONFIG_SOC_MCPWM_GROUPS`.
    /// Sets the numeric value for SOC mcpwm groups in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_mcpwm_groups: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_MCPWM_OPERATORS_PER_GROUP`.
    /// Sets the numeric value for SOC mcpwm operators PER group in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    soc_mcpwm_operators_per_group: i64 = 3,
    /// Kconfig key: `CONFIG_SOC_MCPWM_SUPPORTED`.
    /// Controls whether SOC mcpwm supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_mcpwm_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_MCPWM_SWSYNC_CAN_PROPAGATE`.
    /// Controls whether SOC mcpwm swsync CAN propagate is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_mcpwm_swsync_can_propagate: bool = true,
    /// Kconfig key: `CONFIG_SOC_MCPWM_TIMERS_PER_GROUP`.
    /// Sets the numeric value for SOC mcpwm timers PER group in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    soc_mcpwm_timers_per_group: i64 = 3,
    /// Kconfig key: `CONFIG_SOC_MCPWM_TRIGGERS_PER_OPERATOR`.
    /// Sets the numeric value for SOC mcpwm triggers PER operator in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_mcpwm_triggers_per_operator: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_MEMPROT_CPU_PREFETCH_PAD_SIZE`.
    /// Sets the numeric value for SOC memprot CPU prefetch PAD SIZE in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `16`.
    soc_memprot_cpu_prefetch_pad_size: i64 = 16,
    /// Kconfig key: `CONFIG_SOC_MEMPROT_MEM_ALIGN_SIZE`.
    /// Sets the numeric value for SOC memprot MEM align SIZE in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `256`.
    soc_memprot_mem_align_size: i64 = 256,
    /// Kconfig key: `CONFIG_SOC_MEMPROT_SUPPORTED`.
    /// Controls whether SOC memprot supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_memprot_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_MEMSPI_CORE_CLK_SHARED_WITH_PSRAM`.
    /// Controls whether SOC memspi CORE CLK shared WITH psram is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_memspi_core_clk_shared_with_psram: bool = true,
    /// Kconfig key: `CONFIG_SOC_MEMSPI_IS_INDEPENDENT`.
    /// Controls whether SOC memspi IS independent is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_memspi_is_independent: bool = true,
    /// Kconfig key: `CONFIG_SOC_MEMSPI_SRC_FREQ_120M`.
    /// Controls whether SOC memspi SRC FREQ 120M is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_memspi_src_freq_120m: bool = true,
    /// Kconfig key: `CONFIG_SOC_MEMSPI_SRC_FREQ_20M_SUPPORTED`.
    /// Controls whether SOC memspi SRC FREQ 20M supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_memspi_src_freq_20m_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_MEMSPI_SRC_FREQ_40M_SUPPORTED`.
    /// Controls whether SOC memspi SRC FREQ 40M supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_memspi_src_freq_40m_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_MEMSPI_SRC_FREQ_80M_SUPPORTED`.
    /// Controls whether SOC memspi SRC FREQ 80M supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_memspi_src_freq_80m_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_MEMSPI_TIMING_TUNING_BY_MSPI_DELAY`.
    /// Controls whether SOC memspi timing tuning BY MSPI delay is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_memspi_timing_tuning_by_mspi_delay: bool = true,
    /// Kconfig key: `CONFIG_SOC_MMU_LINEAR_ADDRESS_REGION_NUM`.
    /// Sets the numeric value for SOC MMU linear address region NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    soc_mmu_linear_address_region_num: i64 = 1,
    /// Kconfig key: `CONFIG_SOC_MMU_PERIPH_NUM`.
    /// Sets the numeric value for SOC MMU periph NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    soc_mmu_periph_num: i64 = 1,
    /// Kconfig key: `CONFIG_SOC_MPI_MEM_BLOCKS_NUM`.
    /// Sets the numeric value for SOC MPI MEM blocks NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `4`.
    soc_mpi_mem_blocks_num: i64 = 4,
    /// Kconfig key: `CONFIG_SOC_MPI_OPERATIONS_NUM`.
    /// Sets the numeric value for SOC MPI operations NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    soc_mpi_operations_num: i64 = 3,
    /// Kconfig key: `CONFIG_SOC_MPI_SUPPORTED`.
    /// Controls whether SOC MPI supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_mpi_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_MPU_MIN_REGION_SIZE`.
    /// Sets the literal value for SOC MPU MIN region SIZE in the `soc` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `"0x20000000"`.
    soc_mpu_min_region_size: []const u8 = "0x20000000",
    /// Kconfig key: `CONFIG_SOC_MPU_REGIONS_MAX_NUM`.
    /// Sets the numeric value for SOC MPU regions MAX NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `8`.
    soc_mpu_regions_max_num: i64 = 8,
    /// Kconfig key: `CONFIG_SOC_MPU_SUPPORTED`.
    /// Controls whether SOC MPU supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_mpu_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_PCNT_CHANNELS_PER_UNIT`.
    /// Sets the numeric value for SOC PCNT channels PER UNIT in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_pcnt_channels_per_unit: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_PCNT_GROUPS`.
    /// Sets the numeric value for SOC PCNT groups in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    soc_pcnt_groups: i64 = 1,
    /// Kconfig key: `CONFIG_SOC_PCNT_SUPPORTED`.
    /// Controls whether SOC PCNT supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pcnt_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_PCNT_THRES_POINT_PER_UNIT`.
    /// Sets the numeric value for SOC PCNT thres point PER UNIT in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_pcnt_thres_point_per_unit: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_PCNT_UNITS_PER_GROUP`.
    /// Sets the numeric value for SOC PCNT units PER group in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `4`.
    soc_pcnt_units_per_group: i64 = 4,
    /// Kconfig key: `CONFIG_SOC_PHY_COMBO_MODULE`.
    /// Controls whether SOC PHY combo module is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_phy_combo_module: bool = true,
    /// Kconfig key: `CONFIG_SOC_PHY_DIG_REGS_MEM_SIZE`.
    /// Sets the numeric value for SOC PHY DIG REGS MEM SIZE in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `21`.
    soc_phy_dig_regs_mem_size: i64 = 21,
    /// Kconfig key: `CONFIG_SOC_PHY_SUPPORTED`.
    /// Controls whether SOC PHY supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_phy_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_PM_CPU_RETENTION_BY_RTCCNTL`.
    /// Controls whether SOC PM CPU retention BY rtccntl is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pm_cpu_retention_by_rtccntl: bool = true,
    /// Kconfig key: `CONFIG_SOC_PM_MODEM_PD_BY_SW`.
    /// Controls whether SOC PM modem PD BY SW is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pm_modem_pd_by_sw: bool = true,
    /// Kconfig key: `CONFIG_SOC_PM_MODEM_RETENTION_BY_BACKUPDMA`.
    /// Controls whether SOC PM modem retention BY backupdma is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pm_modem_retention_by_backupdma: bool = true,
    /// Kconfig key: `CONFIG_SOC_PM_SUPPORTED`.
    /// Controls whether SOC PM supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pm_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_PM_SUPPORT_BT_WAKEUP`.
    /// Controls whether SOC PM support BT wakeup is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pm_support_bt_wakeup: bool = true,
    /// Kconfig key: `CONFIG_SOC_PM_SUPPORT_CPU_PD`.
    /// Controls whether SOC PM support CPU PD is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pm_support_cpu_pd: bool = true,
    /// Kconfig key: `CONFIG_SOC_PM_SUPPORT_DEEPSLEEP_CHECK_STUB_ONLY`.
    /// Controls whether SOC PM support deepsleep check STUB ONLY is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pm_support_deepsleep_check_stub_only: bool = true,
    /// Kconfig key: `CONFIG_SOC_PM_SUPPORT_EXT0_WAKEUP`.
    /// Controls whether SOC PM support EXT0 wakeup is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pm_support_ext0_wakeup: bool = true,
    /// Kconfig key: `CONFIG_SOC_PM_SUPPORT_EXT1_WAKEUP`.
    /// Controls whether SOC PM support EXT1 wakeup is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pm_support_ext1_wakeup: bool = true,
    /// Kconfig key: `CONFIG_SOC_PM_SUPPORT_EXT_WAKEUP`.
    /// Controls whether SOC PM support EXT wakeup is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pm_support_ext_wakeup: bool = true,
    /// Kconfig key: `CONFIG_SOC_PM_SUPPORT_MAC_BB_PD`.
    /// Controls whether SOC PM support MAC BB PD is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pm_support_mac_bb_pd: bool = true,
    /// Kconfig key: `CONFIG_SOC_PM_SUPPORT_MODEM_PD`.
    /// Controls whether SOC PM support modem PD is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pm_support_modem_pd: bool = true,
    /// Kconfig key: `CONFIG_SOC_PM_SUPPORT_RC_FAST_PD`.
    /// Controls whether SOC PM support RC FAST PD is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pm_support_rc_fast_pd: bool = true,
    /// Kconfig key: `CONFIG_SOC_PM_SUPPORT_RTC_PERIPH_PD`.
    /// Controls whether SOC PM support RTC periph PD is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pm_support_rtc_periph_pd: bool = true,
    /// Kconfig key: `CONFIG_SOC_PM_SUPPORT_TAGMEM_PD`.
    /// Controls whether SOC PM support tagmem PD is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pm_support_tagmem_pd: bool = true,
    /// Kconfig key: `CONFIG_SOC_PM_SUPPORT_TOUCH_SENSOR_WAKEUP`.
    /// Controls whether SOC PM support touch sensor wakeup is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pm_support_touch_sensor_wakeup: bool = true,
    /// Kconfig key: `CONFIG_SOC_PM_SUPPORT_VDDSDIO_PD`.
    /// Controls whether SOC PM support vddsdio PD is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pm_support_vddsdio_pd: bool = true,
    /// Kconfig key: `CONFIG_SOC_PM_SUPPORT_WIFI_WAKEUP`.
    /// Controls whether SOC PM support WIFI wakeup is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_pm_support_wifi_wakeup: bool = true,
    /// Kconfig key: `CONFIG_SOC_PSRAM_DMA_CAPABLE`.
    /// Controls whether SOC psram DMA capable is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_psram_dma_capable: bool = true,
    /// Kconfig key: `CONFIG_SOC_RISCV_COPROC_SUPPORTED`.
    /// Controls whether SOC riscv coproc supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_riscv_coproc_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_RMT_CHANNELS_PER_GROUP`.
    /// Sets the numeric value for SOC RMT channels PER group in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `8`.
    soc_rmt_channels_per_group: i64 = 8,
    /// Kconfig key: `CONFIG_SOC_RMT_GROUPS`.
    /// Sets the numeric value for SOC RMT groups in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    soc_rmt_groups: i64 = 1,
    /// Kconfig key: `CONFIG_SOC_RMT_MEM_WORDS_PER_CHANNEL`.
    /// Sets the numeric value for SOC RMT MEM words PER channel in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `48`.
    soc_rmt_mem_words_per_channel: i64 = 48,
    /// Kconfig key: `CONFIG_SOC_RMT_RX_CANDIDATES_PER_GROUP`.
    /// Sets the numeric value for SOC RMT RX candidates PER group in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `4`.
    soc_rmt_rx_candidates_per_group: i64 = 4,
    /// Kconfig key: `CONFIG_SOC_RMT_SUPPORTED`.
    /// Controls whether SOC RMT supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rmt_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_RMT_SUPPORT_APB`.
    /// Controls whether SOC RMT support APB is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rmt_support_apb: bool = true,
    /// Kconfig key: `CONFIG_SOC_RMT_SUPPORT_DMA`.
    /// Controls whether SOC RMT support DMA is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rmt_support_dma: bool = true,
    /// Kconfig key: `CONFIG_SOC_RMT_SUPPORT_RC_FAST`.
    /// Controls whether SOC RMT support RC FAST is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rmt_support_rc_fast: bool = true,
    /// Kconfig key: `CONFIG_SOC_RMT_SUPPORT_RX_DEMODULATION`.
    /// Controls whether SOC RMT support RX demodulation is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rmt_support_rx_demodulation: bool = true,
    /// Kconfig key: `CONFIG_SOC_RMT_SUPPORT_RX_PINGPONG`.
    /// Controls whether SOC RMT support RX pingpong is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rmt_support_rx_pingpong: bool = true,
    /// Kconfig key: `CONFIG_SOC_RMT_SUPPORT_TX_ASYNC_STOP`.
    /// Controls whether SOC RMT support TX async STOP is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rmt_support_tx_async_stop: bool = true,
    /// Kconfig key: `CONFIG_SOC_RMT_SUPPORT_TX_CARRIER_DATA_ONLY`.
    /// Controls whether SOC RMT support TX carrier DATA ONLY is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rmt_support_tx_carrier_data_only: bool = true,
    /// Kconfig key: `CONFIG_SOC_RMT_SUPPORT_TX_LOOP_AUTO_STOP`.
    /// Controls whether SOC RMT support TX LOOP AUTO STOP is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rmt_support_tx_loop_auto_stop: bool = true,
    /// Kconfig key: `CONFIG_SOC_RMT_SUPPORT_TX_LOOP_COUNT`.
    /// Controls whether SOC RMT support TX LOOP count is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rmt_support_tx_loop_count: bool = true,
    /// Kconfig key: `CONFIG_SOC_RMT_SUPPORT_TX_SYNCHRO`.
    /// Controls whether SOC RMT support TX synchro is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rmt_support_tx_synchro: bool = true,
    /// Kconfig key: `CONFIG_SOC_RMT_SUPPORT_XTAL`.
    /// Controls whether SOC RMT support XTAL is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rmt_support_xtal: bool = true,
    /// Kconfig key: `CONFIG_SOC_RMT_TX_CANDIDATES_PER_GROUP`.
    /// Sets the numeric value for SOC RMT TX candidates PER group in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `4`.
    soc_rmt_tx_candidates_per_group: i64 = 4,
    /// Kconfig key: `CONFIG_SOC_RNG_SUPPORTED`.
    /// Controls whether SOC RNG supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rng_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_RSA_MAX_BIT_LEN`.
    /// Sets the numeric value for SOC RSA MAX BIT LEN in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `4096`.
    soc_rsa_max_bit_len: i64 = 4096,
    /// Kconfig key: `CONFIG_SOC_RTCIO_HOLD_SUPPORTED`.
    /// Controls whether SOC rtcio HOLD supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rtcio_hold_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_RTCIO_INPUT_OUTPUT_SUPPORTED`.
    /// Controls whether SOC rtcio input output supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rtcio_input_output_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_RTCIO_PIN_COUNT`.
    /// Sets the numeric value for SOC rtcio PIN count in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `22`.
    soc_rtcio_pin_count: i64 = 22,
    /// Kconfig key: `CONFIG_SOC_RTCIO_WAKE_SUPPORTED`.
    /// Controls whether SOC rtcio WAKE supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rtcio_wake_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_RTC_CNTL_CPU_PD_DMA_BUS_WIDTH`.
    /// Sets the numeric value for SOC RTC CNTL CPU PD DMA BUS width in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `128`.
    soc_rtc_cntl_cpu_pd_dma_bus_width: i64 = 128,
    /// Kconfig key: `CONFIG_SOC_RTC_CNTL_CPU_PD_REG_FILE_NUM`.
    /// Sets the numeric value for SOC RTC CNTL CPU PD REG FILE NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `549`.
    soc_rtc_cntl_cpu_pd_reg_file_num: i64 = 549,
    /// Kconfig key: `CONFIG_SOC_RTC_CNTL_TAGMEM_PD_DMA_BUS_WIDTH`.
    /// Sets the numeric value for SOC RTC CNTL tagmem PD DMA BUS width in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `128`.
    soc_rtc_cntl_tagmem_pd_dma_bus_width: i64 = 128,
    /// Kconfig key: `CONFIG_SOC_RTC_FAST_MEM_SUPPORTED`.
    /// Controls whether SOC RTC FAST MEM supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rtc_fast_mem_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_RTC_MEM_SUPPORTED`.
    /// Controls whether SOC RTC MEM supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rtc_mem_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_RTC_SLOW_CLK_SUPPORT_RC_FAST_D256`.
    /// Controls whether SOC RTC SLOW CLK support RC FAST D256 is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rtc_slow_clk_support_rc_fast_d256: bool = true,
    /// Kconfig key: `CONFIG_SOC_RTC_SLOW_MEM_SUPPORTED`.
    /// Controls whether SOC RTC SLOW MEM supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_rtc_slow_mem_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_SDMMC_DELAY_PHASE_NUM`.
    /// Sets the numeric value for SOC sdmmc delay phase NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `4`.
    soc_sdmmc_delay_phase_num: i64 = 4,
    /// Kconfig key: `CONFIG_SOC_SDMMC_HOST_SUPPORTED`.
    /// Controls whether SOC sdmmc HOST supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_sdmmc_host_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_SDMMC_NUM_SLOTS`.
    /// Sets the numeric value for SOC sdmmc NUM slots in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_sdmmc_num_slots: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_SDMMC_SUPPORT_XTAL_CLOCK`.
    /// Controls whether SOC sdmmc support XTAL clock is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_sdmmc_support_xtal_clock: bool = true,
    /// Kconfig key: `CONFIG_SOC_SDMMC_USE_GPIO_MATRIX`.
    /// Controls whether SOC sdmmc USE GPIO matrix is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_sdmmc_use_gpio_matrix: bool = true,
    /// Kconfig key: `CONFIG_SOC_SDM_CHANNELS_PER_GROUP`.
    /// Sets the numeric value for SOC SDM channels PER group in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `8`.
    soc_sdm_channels_per_group: i64 = 8,
    /// Kconfig key: `CONFIG_SOC_SDM_CLK_SUPPORT_APB`.
    /// Controls whether SOC SDM CLK support APB is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_sdm_clk_support_apb: bool = true,
    /// Kconfig key: `CONFIG_SOC_SDM_GROUPS`.
    /// Controls whether SOC SDM groups is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_sdm_groups: bool = true,
    /// Kconfig key: `CONFIG_SOC_SDM_SUPPORTED`.
    /// Controls whether SOC SDM supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_sdm_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_SECURE_BOOT_SUPPORTED`.
    /// Controls whether SOC secure BOOT supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_secure_boot_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_SECURE_BOOT_V2_RSA`.
    /// Controls whether SOC secure BOOT V2 RSA is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_secure_boot_v2_rsa: bool = true,
    /// Kconfig key: `CONFIG_SOC_SHA_DMA_MAX_BUFFER_SIZE`.
    /// Sets the numeric value for SOC SHA DMA MAX buffer SIZE in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3968`.
    soc_sha_dma_max_buffer_size: i64 = 3968,
    /// Kconfig key: `CONFIG_SOC_SHA_GDMA`.
    /// Controls whether SOC SHA GDMA is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_sha_gdma: bool = true,
    /// Kconfig key: `CONFIG_SOC_SHA_SUPPORTED`.
    /// Controls whether SOC SHA supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_sha_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_SHA_SUPPORT_DMA`.
    /// Controls whether SOC SHA support DMA is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_sha_support_dma: bool = true,
    /// Kconfig key: `CONFIG_SOC_SHA_SUPPORT_RESUME`.
    /// Controls whether SOC SHA support resume is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_sha_support_resume: bool = true,
    /// Kconfig key: `CONFIG_SOC_SHA_SUPPORT_SHA1`.
    /// Controls whether SOC SHA support SHA1 is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_sha_support_sha1: bool = true,
    /// Kconfig key: `CONFIG_SOC_SHA_SUPPORT_SHA224`.
    /// Controls whether SOC SHA support sha224 is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_sha_support_sha224: bool = true,
    /// Kconfig key: `CONFIG_SOC_SHA_SUPPORT_SHA256`.
    /// Controls whether SOC SHA support sha256 is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_sha_support_sha256: bool = true,
    /// Kconfig key: `CONFIG_SOC_SHA_SUPPORT_SHA384`.
    /// Controls whether SOC SHA support sha384 is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_sha_support_sha384: bool = true,
    /// Kconfig key: `CONFIG_SOC_SHA_SUPPORT_SHA512`.
    /// Controls whether SOC SHA support sha512 is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_sha_support_sha512: bool = true,
    /// Kconfig key: `CONFIG_SOC_SHA_SUPPORT_SHA512_224`.
    /// Controls whether SOC SHA support sha512 224 is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_sha_support_sha512_224: bool = true,
    /// Kconfig key: `CONFIG_SOC_SHA_SUPPORT_SHA512_256`.
    /// Controls whether SOC SHA support sha512 256 is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_sha_support_sha512_256: bool = true,
    /// Kconfig key: `CONFIG_SOC_SHA_SUPPORT_SHA512_T`.
    /// Controls whether SOC SHA support sha512 T is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_sha_support_sha512_t: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPIRAM_SUPPORTED`.
    /// Controls whether SOC spiram supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spiram_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPIRAM_XIP_SUPPORTED`.
    /// Controls whether SOC spiram XIP supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spiram_xip_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_FLASH_SUPPORTED`.
    /// Controls whether SOC SPI flash supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_flash_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_MAXIMUM_BUFFER_SIZE`.
    /// Sets the numeric value for SOC SPI maximum buffer SIZE in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `64`.
    soc_spi_maximum_buffer_size: i64 = 64,
    /// Kconfig key: `CONFIG_SOC_SPI_MAX_CS_NUM`.
    /// Sets the numeric value for SOC SPI MAX CS NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `6`.
    soc_spi_max_cs_num: i64 = 6,
    /// Kconfig key: `CONFIG_SOC_SPI_MAX_PRE_DIVIDER`.
    /// Sets the numeric value for SOC SPI MAX PRE divider in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `16`.
    soc_spi_max_pre_divider: i64 = 16,
    /// Kconfig key: `CONFIG_SOC_SPI_MEM_SUPPORT_AUTO_RESUME`.
    /// Controls whether SOC SPI MEM support AUTO resume is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_mem_support_auto_resume: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_MEM_SUPPORT_AUTO_SUSPEND`.
    /// Controls whether SOC SPI MEM support AUTO suspend is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_mem_support_auto_suspend: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_MEM_SUPPORT_AUTO_WAIT_IDLE`.
    /// Controls whether SOC SPI MEM support AUTO WAIT IDLE is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_mem_support_auto_wait_idle: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_MEM_SUPPORT_CACHE_32BIT_ADDR_MAP`.
    /// Controls whether SOC SPI MEM support cache 32bit ADDR MAP is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_mem_support_cache_32bit_addr_map: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_MEM_SUPPORT_CONFIG_GPIO_BY_EFUSE`.
    /// Controls whether SOC SPI MEM support config GPIO BY efuse is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_mem_support_config_gpio_by_efuse: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_MEM_SUPPORT_OPI_MODE`.
    /// Controls whether SOC SPI MEM support OPI MODE is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_mem_support_opi_mode: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_MEM_SUPPORT_SW_SUSPEND`.
    /// Controls whether SOC SPI MEM support SW suspend is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_mem_support_sw_suspend: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_MEM_SUPPORT_TIMING_TUNING`.
    /// Controls whether SOC SPI MEM support timing tuning is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_mem_support_timing_tuning: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_MEM_SUPPORT_WRAP`.
    /// Controls whether SOC SPI MEM support WRAP is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_mem_support_wrap: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_PERIPH_NUM`.
    /// Sets the numeric value for SOC SPI periph NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    soc_spi_periph_num: i64 = 3,
    /// Kconfig key: `CONFIG_SOC_SPI_PERIPH_SUPPORT_CONTROL_DUMMY_OUT`.
    /// Controls whether SOC SPI periph support control dummy OUT is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_periph_support_control_dummy_out: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_SCT_BUFFER_NUM_MAX`.
    /// Controls whether SOC SPI SCT buffer NUM MAX is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_sct_buffer_num_max: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_SCT_CONF_BITLEN_MAX`.
    /// Sets the literal value for SOC SPI SCT CONF bitlen MAX in the `soc` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `"0x3FFFA"`.
    soc_spi_sct_conf_bitlen_max: []const u8 = "0x3FFFA",
    /// Kconfig key: `CONFIG_SOC_SPI_SCT_REG_NUM`.
    /// Sets the numeric value for SOC SPI SCT REG NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `14`.
    soc_spi_sct_reg_num: i64 = 14,
    /// Kconfig key: `CONFIG_SOC_SPI_SCT_SUPPORTED`.
    /// Controls whether SOC SPI SCT supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_sct_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_SLAVE_SUPPORT_SEG_TRANS`.
    /// Controls whether SOC SPI slave support SEG trans is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_slave_support_seg_trans: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_SUPPORT_CD_SIG`.
    /// Controls whether SOC SPI support CD SIG is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_support_cd_sig: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_SUPPORT_CLK_APB`.
    /// Controls whether SOC SPI support CLK APB is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_support_clk_apb: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_SUPPORT_CLK_XTAL`.
    /// Controls whether SOC SPI support CLK XTAL is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_support_clk_xtal: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_SUPPORT_CONTINUOUS_TRANS`.
    /// Controls whether SOC SPI support continuous trans is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_support_continuous_trans: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_SUPPORT_DDRCLK`.
    /// Controls whether SOC SPI support ddrclk is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_support_ddrclk: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_SUPPORT_OCT`.
    /// Controls whether SOC SPI support OCT is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_support_oct: bool = true,
    /// Kconfig key: `CONFIG_SOC_SPI_SUPPORT_SLAVE_HD_VER2`.
    /// Controls whether SOC SPI support slave HD VER2 is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_spi_support_slave_hd_ver2: bool = true,
    /// Kconfig key: `CONFIG_SOC_SUPPORTS_SECURE_DL_MODE`.
    /// Controls whether SOC supports secure DL MODE is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_supports_secure_dl_mode: bool = true,
    /// Kconfig key: `CONFIG_SOC_SUPPORT_COEXISTENCE`.
    /// Controls whether SOC support coexistence is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_support_coexistence: bool = true,
    /// Kconfig key: `CONFIG_SOC_SUPPORT_SECURE_BOOT_REVOKE_KEY`.
    /// Controls whether SOC support secure BOOT revoke KEY is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_support_secure_boot_revoke_key: bool = true,
    /// Kconfig key: `CONFIG_SOC_SYSTIMER_ALARM_MISS_COMPENSATE`.
    /// Controls whether SOC systimer alarm MISS compensate is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_systimer_alarm_miss_compensate: bool = true,
    /// Kconfig key: `CONFIG_SOC_SYSTIMER_ALARM_NUM`.
    /// Sets the numeric value for SOC systimer alarm NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    soc_systimer_alarm_num: i64 = 3,
    /// Kconfig key: `CONFIG_SOC_SYSTIMER_BIT_WIDTH_HI`.
    /// Sets the numeric value for SOC systimer BIT width HI in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `20`.
    soc_systimer_bit_width_hi: i64 = 20,
    /// Kconfig key: `CONFIG_SOC_SYSTIMER_BIT_WIDTH_LO`.
    /// Sets the numeric value for SOC systimer BIT width LO in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `32`.
    soc_systimer_bit_width_lo: i64 = 32,
    /// Kconfig key: `CONFIG_SOC_SYSTIMER_COUNTER_NUM`.
    /// Sets the numeric value for SOC systimer counter NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_systimer_counter_num: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_SYSTIMER_FIXED_DIVIDER`.
    /// Controls whether SOC systimer fixed divider is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_systimer_fixed_divider: bool = true,
    /// Kconfig key: `CONFIG_SOC_SYSTIMER_INT_LEVEL`.
    /// Controls whether SOC systimer INT level is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_systimer_int_level: bool = true,
    /// Kconfig key: `CONFIG_SOC_SYSTIMER_SUPPORTED`.
    /// Controls whether SOC systimer supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_systimer_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_TEMPERATURE_SENSOR_SUPPORT_FAST_RC`.
    /// Controls whether SOC temperature sensor support FAST RC is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_temperature_sensor_support_fast_rc: bool = true,
    /// Kconfig key: `CONFIG_SOC_TEMP_SENSOR_SUPPORTED`.
    /// Controls whether SOC TEMP sensor supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_temp_sensor_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_TIMER_GROUPS`.
    /// Sets the numeric value for SOC timer groups in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_timer_groups: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_TIMER_GROUP_COUNTER_BIT_WIDTH`.
    /// Sets the numeric value for SOC timer group counter BIT width in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `54`.
    soc_timer_group_counter_bit_width: i64 = 54,
    /// Kconfig key: `CONFIG_SOC_TIMER_GROUP_SUPPORT_APB`.
    /// Controls whether SOC timer group support APB is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_timer_group_support_apb: bool = true,
    /// Kconfig key: `CONFIG_SOC_TIMER_GROUP_SUPPORT_XTAL`.
    /// Controls whether SOC timer group support XTAL is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_timer_group_support_xtal: bool = true,
    /// Kconfig key: `CONFIG_SOC_TIMER_GROUP_TIMERS_PER_GROUP`.
    /// Sets the numeric value for SOC timer group timers PER group in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_timer_group_timers_per_group: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_TIMER_GROUP_TOTAL_TIMERS`.
    /// Sets the numeric value for SOC timer group total timers in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `4`.
    soc_timer_group_total_timers: i64 = 4,
    /// Kconfig key: `CONFIG_SOC_TOUCH_PROXIMITY_CHANNEL_NUM`.
    /// Sets the numeric value for SOC touch proximity channel NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    soc_touch_proximity_channel_num: i64 = 3,
    /// Kconfig key: `CONFIG_SOC_TOUCH_PROXIMITY_MEAS_DONE_SUPPORTED`.
    /// Controls whether SOC touch proximity MEAS DONE supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_touch_proximity_meas_done_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_TOUCH_SAMPLE_CFG_NUM`.
    /// Sets the numeric value for SOC touch sample CFG NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    soc_touch_sample_cfg_num: i64 = 1,
    /// Kconfig key: `CONFIG_SOC_TOUCH_SENSOR_NUM`.
    /// Sets the numeric value for SOC touch sensor NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `15`.
    soc_touch_sensor_num: i64 = 15,
    /// Kconfig key: `CONFIG_SOC_TOUCH_SENSOR_SUPPORTED`.
    /// Controls whether SOC touch sensor supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_touch_sensor_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_TOUCH_SENSOR_VERSION`.
    /// Sets the numeric value for SOC touch sensor version in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_touch_sensor_version: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_TOUCH_SUPPORT_PROX_SENSING`.
    /// Controls whether SOC touch support PROX sensing is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_touch_support_prox_sensing: bool = true,
    /// Kconfig key: `CONFIG_SOC_TOUCH_SUPPORT_SLEEP_WAKEUP`.
    /// Controls whether SOC touch support sleep wakeup is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_touch_support_sleep_wakeup: bool = true,
    /// Kconfig key: `CONFIG_SOC_TOUCH_SUPPORT_WATERPROOF`.
    /// Controls whether SOC touch support waterproof is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_touch_support_waterproof: bool = true,
    /// Kconfig key: `CONFIG_SOC_TWAI_BRP_MAX`.
    /// Sets the numeric value for SOC TWAI BRP MAX in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `16384`.
    soc_twai_brp_max: i64 = 16384,
    /// Kconfig key: `CONFIG_SOC_TWAI_BRP_MIN`.
    /// Sets the numeric value for SOC TWAI BRP MIN in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    soc_twai_brp_min: i64 = 2,
    /// Kconfig key: `CONFIG_SOC_TWAI_CLK_SUPPORT_APB`.
    /// Controls whether SOC TWAI CLK support APB is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_twai_clk_support_apb: bool = true,
    /// Kconfig key: `CONFIG_SOC_TWAI_CONTROLLER_NUM`.
    /// Sets the numeric value for SOC TWAI controller NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    soc_twai_controller_num: i64 = 1,
    /// Kconfig key: `CONFIG_SOC_TWAI_SUPPORTED`.
    /// Controls whether SOC TWAI supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_twai_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_TWAI_SUPPORTS_RX_STATUS`.
    /// Controls whether SOC TWAI supports RX status is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_twai_supports_rx_status: bool = true,
    /// Kconfig key: `CONFIG_SOC_UART_BITRATE_MAX`.
    /// Sets the numeric value for SOC UART bitrate MAX in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `5000000`.
    soc_uart_bitrate_max: i64 = 5000000,
    /// Kconfig key: `CONFIG_SOC_UART_FIFO_LEN`.
    /// Sets the numeric value for SOC UART FIFO LEN in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `128`.
    soc_uart_fifo_len: i64 = 128,
    /// Kconfig key: `CONFIG_SOC_UART_HP_NUM`.
    /// Sets the numeric value for SOC UART HP NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    soc_uart_hp_num: i64 = 3,
    /// Kconfig key: `CONFIG_SOC_UART_NUM`.
    /// Sets the numeric value for SOC UART NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    soc_uart_num: i64 = 3,
    /// Kconfig key: `CONFIG_SOC_UART_SUPPORTED`.
    /// Controls whether SOC UART supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_uart_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_UART_SUPPORT_APB_CLK`.
    /// Controls whether SOC UART support APB CLK is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_uart_support_apb_clk: bool = true,
    /// Kconfig key: `CONFIG_SOC_UART_SUPPORT_FSM_TX_WAIT_SEND`.
    /// Controls whether SOC UART support FSM TX WAIT SEND is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_uart_support_fsm_tx_wait_send: bool = true,
    /// Kconfig key: `CONFIG_SOC_UART_SUPPORT_RTC_CLK`.
    /// Controls whether SOC UART support RTC CLK is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_uart_support_rtc_clk: bool = true,
    /// Kconfig key: `CONFIG_SOC_UART_SUPPORT_WAKEUP_INT`.
    /// Controls whether SOC UART support wakeup INT is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_uart_support_wakeup_int: bool = true,
    /// Kconfig key: `CONFIG_SOC_UART_SUPPORT_XTAL_CLK`.
    /// Controls whether SOC UART support XTAL CLK is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_uart_support_xtal_clk: bool = true,
    /// Kconfig key: `CONFIG_SOC_ULP_FSM_SUPPORTED`.
    /// Controls whether SOC ULP FSM supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_ulp_fsm_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_ULP_HAS_ADC`.
    /// Controls whether SOC ULP HAS ADC is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_ulp_has_adc: bool = true,
    /// Kconfig key: `CONFIG_SOC_ULP_SUPPORTED`.
    /// Controls whether SOC ULP supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_ulp_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_USB_OTG_PERIPH_NUM`.
    /// Sets the numeric value for SOC USB OTG periph NUM in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    soc_usb_otg_periph_num: i64 = 1,
    /// Kconfig key: `CONFIG_SOC_USB_OTG_SUPPORTED`.
    /// Controls whether SOC USB OTG supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_usb_otg_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_USB_SERIAL_JTAG_SUPPORTED`.
    /// Controls whether SOC USB serial JTAG supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_usb_serial_jtag_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_WDT_SUPPORTED`.
    /// Controls whether SOC WDT supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_wdt_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_WIFI_CSI_SUPPORT`.
    /// Controls whether SOC WIFI CSI support is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_wifi_csi_support: bool = true,
    /// Kconfig key: `CONFIG_SOC_WIFI_FTM_SUPPORT`.
    /// Controls whether SOC WIFI FTM support is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_wifi_ftm_support: bool = true,
    /// Kconfig key: `CONFIG_SOC_WIFI_GCMP_SUPPORT`.
    /// Controls whether SOC WIFI GCMP support is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_wifi_gcmp_support: bool = true,
    /// Kconfig key: `CONFIG_SOC_WIFI_HW_TSF`.
    /// Controls whether SOC WIFI HW TSF is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_wifi_hw_tsf: bool = true,
    /// Kconfig key: `CONFIG_SOC_WIFI_LIGHT_SLEEP_CLK_WIDTH`.
    /// Sets the numeric value for SOC WIFI light sleep CLK width in the `soc` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `12`.
    soc_wifi_light_sleep_clk_width: i64 = 12,
    /// Kconfig key: `CONFIG_SOC_WIFI_MESH_SUPPORT`.
    /// Controls whether SOC WIFI MESH support is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_wifi_mesh_support: bool = true,
    /// Kconfig key: `CONFIG_SOC_WIFI_PHY_NEEDS_USB_WORKAROUND`.
    /// Controls whether SOC WIFI PHY needs USB workaround is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_wifi_phy_needs_usb_workaround: bool = true,
    /// Kconfig key: `CONFIG_SOC_WIFI_SUPPORTED`.
    /// Controls whether SOC WIFI supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_wifi_supported: bool = true,
    /// Kconfig key: `CONFIG_SOC_WIFI_SUPPORT_VARIABLE_BEACON_WINDOW`.
    /// Controls whether SOC WIFI support variable beacon window is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_wifi_support_variable_beacon_window: bool = true,
    /// Kconfig key: `CONFIG_SOC_WIFI_WAPI_SUPPORT`.
    /// Controls whether SOC WIFI WAPI support is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_wifi_wapi_support: bool = true,
    /// Kconfig key: `CONFIG_SOC_XTAL_SUPPORT_40M`.
    /// Controls whether SOC XTAL support 40M is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_xtal_support_40m: bool = true,
    /// Kconfig key: `CONFIG_SOC_XT_WDT_SUPPORTED`.
    /// Controls whether SOC XT WDT supported is enabled for the `soc` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    soc_xt_wdt_supported: bool = true,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 362);
        entries[0] = sdkconfig.Entry.flag("CONFIG_SOC_ADC_ARBITER_SUPPORTED", cfg.soc_adc_arbiter_supported);
        entries[1] = sdkconfig.Entry.int("CONFIG_SOC_ADC_ATTEN_NUM", cfg.soc_adc_atten_num);
        entries[2] = sdkconfig.Entry.flag("CONFIG_SOC_ADC_CALIBRATION_V1_SUPPORTED", cfg.soc_adc_calibration_v1_supported);
        entries[3] = sdkconfig.Entry.int("CONFIG_SOC_ADC_DIGI_CONTROLLER_NUM", cfg.soc_adc_digi_controller_num);
        entries[4] = sdkconfig.Entry.int("CONFIG_SOC_ADC_DIGI_DATA_BYTES_PER_CONV", cfg.soc_adc_digi_data_bytes_per_conv);
        entries[5] = sdkconfig.Entry.int("CONFIG_SOC_ADC_DIGI_IIR_FILTER_NUM", cfg.soc_adc_digi_iir_filter_num);
        entries[6] = sdkconfig.Entry.int("CONFIG_SOC_ADC_DIGI_MAX_BITWIDTH", cfg.soc_adc_digi_max_bitwidth);
        entries[7] = sdkconfig.Entry.int("CONFIG_SOC_ADC_DIGI_MIN_BITWIDTH", cfg.soc_adc_digi_min_bitwidth);
        entries[8] = sdkconfig.Entry.int("CONFIG_SOC_ADC_DIGI_MONITOR_NUM", cfg.soc_adc_digi_monitor_num);
        entries[9] = sdkconfig.Entry.int("CONFIG_SOC_ADC_DIGI_RESULT_BYTES", cfg.soc_adc_digi_result_bytes);
        entries[10] = sdkconfig.Entry.flag("CONFIG_SOC_ADC_DIG_CTRL_SUPPORTED", cfg.soc_adc_dig_ctrl_supported);
        entries[11] = sdkconfig.Entry.flag("CONFIG_SOC_ADC_DIG_IIR_FILTER_SUPPORTED", cfg.soc_adc_dig_iir_filter_supported);
        entries[12] = sdkconfig.Entry.flag("CONFIG_SOC_ADC_DMA_SUPPORTED", cfg.soc_adc_dma_supported);
        entries[13] = sdkconfig.Entry.int("CONFIG_SOC_ADC_MAX_CHANNEL_NUM", cfg.soc_adc_max_channel_num);
        entries[14] = sdkconfig.Entry.flag("CONFIG_SOC_ADC_MONITOR_SUPPORTED", cfg.soc_adc_monitor_supported);
        entries[15] = sdkconfig.Entry.int("CONFIG_SOC_ADC_PATT_LEN_MAX", cfg.soc_adc_patt_len_max);
        entries[16] = sdkconfig.Entry.int("CONFIG_SOC_ADC_PERIPH_NUM", cfg.soc_adc_periph_num);
        entries[17] = sdkconfig.Entry.flag("CONFIG_SOC_ADC_RTC_CTRL_SUPPORTED", cfg.soc_adc_rtc_ctrl_supported);
        entries[18] = sdkconfig.Entry.int("CONFIG_SOC_ADC_RTC_MAX_BITWIDTH", cfg.soc_adc_rtc_max_bitwidth);
        entries[19] = sdkconfig.Entry.int("CONFIG_SOC_ADC_RTC_MIN_BITWIDTH", cfg.soc_adc_rtc_min_bitwidth);
        entries[20] = sdkconfig.Entry.int("CONFIG_SOC_ADC_SAMPLE_FREQ_THRES_HIGH", cfg.soc_adc_sample_freq_thres_high);
        entries[21] = sdkconfig.Entry.int("CONFIG_SOC_ADC_SAMPLE_FREQ_THRES_LOW", cfg.soc_adc_sample_freq_thres_low);
        entries[22] = sdkconfig.Entry.flag("CONFIG_SOC_ADC_SELF_HW_CALI_SUPPORTED", cfg.soc_adc_self_hw_cali_supported);
        entries[23] = sdkconfig.Entry.flag("CONFIG_SOC_ADC_SHARED_POWER", cfg.soc_adc_shared_power);
        entries[24] = sdkconfig.Entry.flag("CONFIG_SOC_ADC_SUPPORTED", cfg.soc_adc_supported);
        entries[25] = sdkconfig.Entry.flag("CONFIG_SOC_AES_GDMA", cfg.soc_aes_gdma);
        entries[26] = sdkconfig.Entry.flag("CONFIG_SOC_AES_SUPPORTED", cfg.soc_aes_supported);
        entries[27] = sdkconfig.Entry.flag("CONFIG_SOC_AES_SUPPORT_AES_128", cfg.soc_aes_support_aes_128);
        entries[28] = sdkconfig.Entry.flag("CONFIG_SOC_AES_SUPPORT_AES_256", cfg.soc_aes_support_aes_256);
        entries[29] = sdkconfig.Entry.flag("CONFIG_SOC_AES_SUPPORT_DMA", cfg.soc_aes_support_dma);
        entries[30] = sdkconfig.Entry.flag("CONFIG_SOC_AHB_GDMA_SUPPORTED", cfg.soc_ahb_gdma_supported);
        entries[31] = sdkconfig.Entry.flag("CONFIG_SOC_AHB_GDMA_SUPPORT_PSRAM", cfg.soc_ahb_gdma_support_psram);
        entries[32] = sdkconfig.Entry.int("CONFIG_SOC_AHB_GDMA_VERSION", cfg.soc_ahb_gdma_version);
        entries[33] = sdkconfig.Entry.flag("CONFIG_SOC_APB_BACKUP_DMA", cfg.soc_apb_backup_dma);
        entries[34] = sdkconfig.Entry.flag("CONFIG_SOC_APPCPU_HAS_CLOCK_GATING_BUG", cfg.soc_appcpu_has_clock_gating_bug);
        entries[35] = sdkconfig.Entry.flag("CONFIG_SOC_ASYNC_MEMCPY_SUPPORTED", cfg.soc_async_memcpy_supported);
        entries[36] = sdkconfig.Entry.flag("CONFIG_SOC_BLE_50_SUPPORTED", cfg.soc_ble_50_supported);
        entries[37] = sdkconfig.Entry.flag("CONFIG_SOC_BLE_DEVICE_PRIVACY_SUPPORTED", cfg.soc_ble_device_privacy_supported);
        entries[38] = sdkconfig.Entry.flag("CONFIG_SOC_BLE_MESH_SUPPORTED", cfg.soc_ble_mesh_supported);
        entries[39] = sdkconfig.Entry.flag("CONFIG_SOC_BLE_SUPPORTED", cfg.soc_ble_supported);
        entries[40] = sdkconfig.Entry.flag("CONFIG_SOC_BLUFI_SUPPORTED", cfg.soc_blufi_supported);
        entries[41] = sdkconfig.Entry.flag("CONFIG_SOC_BOD_SUPPORTED", cfg.soc_bod_supported);
        entries[42] = sdkconfig.Entry.flag("CONFIG_SOC_BROWNOUT_RESET_SUPPORTED", cfg.soc_brownout_reset_supported);
        entries[43] = sdkconfig.Entry.flag("CONFIG_SOC_BT_SUPPORTED", cfg.soc_bt_supported);
        entries[44] = sdkconfig.Entry.flag("CONFIG_SOC_CACHE_FREEZE_SUPPORTED", cfg.soc_cache_freeze_supported);
        entries[45] = sdkconfig.Entry.flag("CONFIG_SOC_CACHE_SUPPORT_WRAP", cfg.soc_cache_support_wrap);
        entries[46] = sdkconfig.Entry.flag("CONFIG_SOC_CACHE_WRITEBACK_SUPPORTED", cfg.soc_cache_writeback_supported);
        entries[47] = sdkconfig.Entry.flag("CONFIG_SOC_CCOMP_TIMER_SUPPORTED", cfg.soc_ccomp_timer_supported);
        entries[48] = sdkconfig.Entry.flag("CONFIG_SOC_CLK_RC_FAST_D256_SUPPORTED", cfg.soc_clk_rc_fast_d256_supported);
        entries[49] = sdkconfig.Entry.flag("CONFIG_SOC_CLK_RC_FAST_SUPPORT_CALIBRATION", cfg.soc_clk_rc_fast_support_calibration);
        entries[50] = sdkconfig.Entry.flag("CONFIG_SOC_CLK_TREE_SUPPORTED", cfg.soc_clk_tree_supported);
        entries[51] = sdkconfig.Entry.flag("CONFIG_SOC_CLK_XTAL32K_SUPPORTED", cfg.soc_clk_xtal32k_supported);
        entries[52] = sdkconfig.Entry.flag("CONFIG_SOC_COEX_HW_PTI", cfg.soc_coex_hw_pti);
        entries[53] = sdkconfig.Entry.flag("CONFIG_SOC_CONFIGURABLE_VDDSDIO_SUPPORTED", cfg.soc_configurable_vddsdio_supported);
        entries[54] = sdkconfig.Entry.int("CONFIG_SOC_CPU_BREAKPOINTS_NUM", cfg.soc_cpu_breakpoints_num);
        entries[55] = sdkconfig.Entry.int("CONFIG_SOC_CPU_CORES_NUM", cfg.soc_cpu_cores_num);
        entries[56] = sdkconfig.Entry.flag("CONFIG_SOC_CPU_HAS_FPU", cfg.soc_cpu_has_fpu);
        entries[57] = sdkconfig.Entry.int("CONFIG_SOC_CPU_INTR_NUM", cfg.soc_cpu_intr_num);
        entries[58] = sdkconfig.Entry.int("CONFIG_SOC_CPU_WATCHPOINTS_NUM", cfg.soc_cpu_watchpoints_num);
        entries[59] = sdkconfig.Entry.int("CONFIG_SOC_CPU_WATCHPOINT_MAX_REGION_SIZE", cfg.soc_cpu_watchpoint_max_region_size);
        entries[60] = sdkconfig.Entry.flag("CONFIG_SOC_DEDICATED_GPIO_SUPPORTED", cfg.soc_dedicated_gpio_supported);
        entries[61] = sdkconfig.Entry.int("CONFIG_SOC_DEDIC_GPIO_IN_CHANNELS_NUM", cfg.soc_dedic_gpio_in_channels_num);
        entries[62] = sdkconfig.Entry.flag("CONFIG_SOC_DEDIC_GPIO_OUT_AUTO_ENABLE", cfg.soc_dedic_gpio_out_auto_enable);
        entries[63] = sdkconfig.Entry.int("CONFIG_SOC_DEDIC_GPIO_OUT_CHANNELS_NUM", cfg.soc_dedic_gpio_out_channels_num);
        entries[64] = sdkconfig.Entry.flag("CONFIG_SOC_DEEP_SLEEP_SUPPORTED", cfg.soc_deep_sleep_supported);
        entries[65] = sdkconfig.Entry.flag("CONFIG_SOC_DIG_SIGN_SUPPORTED", cfg.soc_dig_sign_supported);
        entries[66] = sdkconfig.Entry.int("CONFIG_SOC_DS_KEY_CHECK_MAX_WAIT_US", cfg.soc_ds_key_check_max_wait_us);
        entries[67] = sdkconfig.Entry.int("CONFIG_SOC_DS_KEY_PARAM_MD_IV_LENGTH", cfg.soc_ds_key_param_md_iv_length);
        entries[68] = sdkconfig.Entry.int("CONFIG_SOC_DS_SIGNATURE_MAX_BIT_LEN", cfg.soc_ds_signature_max_bit_len);
        entries[69] = sdkconfig.Entry.flag("CONFIG_SOC_EFUSE_BLOCK9_KEY_PURPOSE_QUIRK", cfg.soc_efuse_block9_key_purpose_quirk);
        entries[70] = sdkconfig.Entry.flag("CONFIG_SOC_EFUSE_DIS_DIRECT_BOOT", cfg.soc_efuse_dis_direct_boot);
        entries[71] = sdkconfig.Entry.flag("CONFIG_SOC_EFUSE_DIS_DOWNLOAD_DCACHE", cfg.soc_efuse_dis_download_dcache);
        entries[72] = sdkconfig.Entry.flag("CONFIG_SOC_EFUSE_DIS_DOWNLOAD_ICACHE", cfg.soc_efuse_dis_download_icache);
        entries[73] = sdkconfig.Entry.flag("CONFIG_SOC_EFUSE_DIS_ICACHE", cfg.soc_efuse_dis_icache);
        entries[74] = sdkconfig.Entry.flag("CONFIG_SOC_EFUSE_DIS_USB_JTAG", cfg.soc_efuse_dis_usb_jtag);
        entries[75] = sdkconfig.Entry.flag("CONFIG_SOC_EFUSE_HARD_DIS_JTAG", cfg.soc_efuse_hard_dis_jtag);
        entries[76] = sdkconfig.Entry.flag("CONFIG_SOC_EFUSE_KEY_PURPOSE_FIELD", cfg.soc_efuse_key_purpose_field);
        entries[77] = sdkconfig.Entry.flag("CONFIG_SOC_EFUSE_REVOKE_BOOT_KEY_DIGESTS", cfg.soc_efuse_revoke_boot_key_digests);
        entries[78] = sdkconfig.Entry.int("CONFIG_SOC_EFUSE_SECURE_BOOT_KEY_DIGESTS", cfg.soc_efuse_secure_boot_key_digests);
        entries[79] = sdkconfig.Entry.flag("CONFIG_SOC_EFUSE_SOFT_DIS_JTAG", cfg.soc_efuse_soft_dis_jtag);
        entries[80] = sdkconfig.Entry.flag("CONFIG_SOC_EFUSE_SUPPORTED", cfg.soc_efuse_supported);
        entries[81] = sdkconfig.Entry.flag("CONFIG_SOC_EXTERNAL_COEX_LEADER_TX_LINE", cfg.soc_external_coex_leader_tx_line);
        entries[82] = sdkconfig.Entry.int("CONFIG_SOC_FLASH_ENCRYPTED_XTS_AES_BLOCK_MAX", cfg.soc_flash_encrypted_xts_aes_block_max);
        entries[83] = sdkconfig.Entry.flag("CONFIG_SOC_FLASH_ENCRYPTION_XTS_AES", cfg.soc_flash_encryption_xts_aes);
        entries[84] = sdkconfig.Entry.flag("CONFIG_SOC_FLASH_ENCRYPTION_XTS_AES_128", cfg.soc_flash_encryption_xts_aes_128);
        entries[85] = sdkconfig.Entry.flag("CONFIG_SOC_FLASH_ENCRYPTION_XTS_AES_256", cfg.soc_flash_encryption_xts_aes_256);
        entries[86] = sdkconfig.Entry.flag("CONFIG_SOC_FLASH_ENCRYPTION_XTS_AES_OPTIONS", cfg.soc_flash_encryption_xts_aes_options);
        entries[87] = sdkconfig.Entry.flag("CONFIG_SOC_FLASH_ENC_SUPPORTED", cfg.soc_flash_enc_supported);
        entries[88] = sdkconfig.Entry.int("CONFIG_SOC_GDMA_NUM_GROUPS_MAX", cfg.soc_gdma_num_groups_max);
        entries[89] = sdkconfig.Entry.int("CONFIG_SOC_GDMA_PAIRS_PER_GROUP", cfg.soc_gdma_pairs_per_group);
        entries[90] = sdkconfig.Entry.int("CONFIG_SOC_GDMA_PAIRS_PER_GROUP_MAX", cfg.soc_gdma_pairs_per_group_max);
        entries[91] = sdkconfig.Entry.flag("CONFIG_SOC_GDMA_SUPPORTED", cfg.soc_gdma_supported);
        entries[92] = sdkconfig.Entry.flag("CONFIG_SOC_GPIO_CLOCKOUT_BY_IO_MUX", cfg.soc_gpio_clockout_by_io_mux);
        entries[93] = sdkconfig.Entry.int("CONFIG_SOC_GPIO_CLOCKOUT_CHANNEL_NUM", cfg.soc_gpio_clockout_channel_num);
        entries[94] = sdkconfig.Entry.flag("CONFIG_SOC_GPIO_FILTER_CLK_SUPPORT_APB", cfg.soc_gpio_filter_clk_support_apb);
        entries[95] = sdkconfig.Entry.int("CONFIG_SOC_GPIO_IN_RANGE_MAX", cfg.soc_gpio_in_range_max);
        entries[96] = sdkconfig.Entry.int("CONFIG_SOC_GPIO_OUT_RANGE_MAX", cfg.soc_gpio_out_range_max);
        entries[97] = sdkconfig.Entry.int("CONFIG_SOC_GPIO_PIN_COUNT", cfg.soc_gpio_pin_count);
        entries[98] = sdkconfig.Entry.int("CONFIG_SOC_GPIO_PORT", cfg.soc_gpio_port);
        entries[99] = sdkconfig.Entry.flag("CONFIG_SOC_GPIO_SUPPORT_FORCE_HOLD", cfg.soc_gpio_support_force_hold);
        entries[100] = sdkconfig.Entry.flag("CONFIG_SOC_GPIO_SUPPORT_HOLD_IO_IN_DSLP", cfg.soc_gpio_support_hold_io_in_dslp);
        entries[101] = sdkconfig.Entry.flag("CONFIG_SOC_GPIO_SUPPORT_PIN_GLITCH_FILTER", cfg.soc_gpio_support_pin_glitch_filter);
        entries[102] = sdkconfig.Entry.flag("CONFIG_SOC_GPIO_SUPPORT_RTC_INDEPENDENT", cfg.soc_gpio_support_rtc_independent);
        entries[103] = sdkconfig.Entry.raw("CONFIG_SOC_GPIO_VALID_DIGITAL_IO_PAD_MASK", cfg.soc_gpio_valid_digital_io_pad_mask);
        entries[104] = sdkconfig.Entry.raw("CONFIG_SOC_GPIO_VALID_GPIO_MASK", cfg.soc_gpio_valid_gpio_mask);
        entries[105] = sdkconfig.Entry.flag("CONFIG_SOC_GPSPI_SUPPORTED", cfg.soc_gpspi_supported);
        entries[106] = sdkconfig.Entry.flag("CONFIG_SOC_GPTIMER_SUPPORTED", cfg.soc_gptimer_supported);
        entries[107] = sdkconfig.Entry.flag("CONFIG_SOC_HMAC_SUPPORTED", cfg.soc_hmac_supported);
        entries[108] = sdkconfig.Entry.flag("CONFIG_SOC_HP_CPU_HAS_MULTIPLE_CORES", cfg.soc_hp_cpu_has_multiple_cores);
        entries[109] = sdkconfig.Entry.int("CONFIG_SOC_HP_I2C_NUM", cfg.soc_hp_i2c_num);
        entries[110] = sdkconfig.Entry.int("CONFIG_SOC_I2C_CMD_REG_NUM", cfg.soc_i2c_cmd_reg_num);
        entries[111] = sdkconfig.Entry.int("CONFIG_SOC_I2C_FIFO_LEN", cfg.soc_i2c_fifo_len);
        entries[112] = sdkconfig.Entry.int("CONFIG_SOC_I2C_NUM", cfg.soc_i2c_num);
        entries[113] = sdkconfig.Entry.flag("CONFIG_SOC_I2C_SLAVE_CAN_GET_STRETCH_CAUSE", cfg.soc_i2c_slave_can_get_stretch_cause);
        entries[114] = sdkconfig.Entry.flag("CONFIG_SOC_I2C_SLAVE_SUPPORT_BROADCAST", cfg.soc_i2c_slave_support_broadcast);
        entries[115] = sdkconfig.Entry.flag("CONFIG_SOC_I2C_SLAVE_SUPPORT_I2CRAM_ACCESS", cfg.soc_i2c_slave_support_i2cram_access);
        entries[116] = sdkconfig.Entry.flag("CONFIG_SOC_I2C_SUPPORTED", cfg.soc_i2c_supported);
        entries[117] = sdkconfig.Entry.flag("CONFIG_SOC_I2C_SUPPORT_10BIT_ADDR", cfg.soc_i2c_support_10bit_addr);
        entries[118] = sdkconfig.Entry.flag("CONFIG_SOC_I2C_SUPPORT_HW_CLR_BUS", cfg.soc_i2c_support_hw_clr_bus);
        entries[119] = sdkconfig.Entry.flag("CONFIG_SOC_I2C_SUPPORT_RTC", cfg.soc_i2c_support_rtc);
        entries[120] = sdkconfig.Entry.flag("CONFIG_SOC_I2C_SUPPORT_SLAVE", cfg.soc_i2c_support_slave);
        entries[121] = sdkconfig.Entry.flag("CONFIG_SOC_I2C_SUPPORT_XTAL", cfg.soc_i2c_support_xtal);
        entries[122] = sdkconfig.Entry.flag("CONFIG_SOC_I2S_HW_VERSION_2", cfg.soc_i2s_hw_version_2);
        entries[123] = sdkconfig.Entry.int("CONFIG_SOC_I2S_NUM", cfg.soc_i2s_num);
        entries[124] = sdkconfig.Entry.int("CONFIG_SOC_I2S_PDM_MAX_RX_LINES", cfg.soc_i2s_pdm_max_rx_lines);
        entries[125] = sdkconfig.Entry.int("CONFIG_SOC_I2S_PDM_MAX_TX_LINES", cfg.soc_i2s_pdm_max_tx_lines);
        entries[126] = sdkconfig.Entry.flag("CONFIG_SOC_I2S_SUPPORTED", cfg.soc_i2s_supported);
        entries[127] = sdkconfig.Entry.flag("CONFIG_SOC_I2S_SUPPORTS_PCM", cfg.soc_i2s_supports_pcm);
        entries[128] = sdkconfig.Entry.flag("CONFIG_SOC_I2S_SUPPORTS_PDM", cfg.soc_i2s_supports_pdm);
        entries[129] = sdkconfig.Entry.flag("CONFIG_SOC_I2S_SUPPORTS_PDM_RX", cfg.soc_i2s_supports_pdm_rx);
        entries[130] = sdkconfig.Entry.flag("CONFIG_SOC_I2S_SUPPORTS_PDM_TX", cfg.soc_i2s_supports_pdm_tx);
        entries[131] = sdkconfig.Entry.flag("CONFIG_SOC_I2S_SUPPORTS_PLL_F160M", cfg.soc_i2s_supports_pll_f160m);
        entries[132] = sdkconfig.Entry.flag("CONFIG_SOC_I2S_SUPPORTS_TDM", cfg.soc_i2s_supports_tdm);
        entries[133] = sdkconfig.Entry.flag("CONFIG_SOC_I2S_SUPPORTS_XTAL", cfg.soc_i2s_supports_xtal);
        entries[134] = sdkconfig.Entry.int("CONFIG_SOC_LCDCAM_I80_BUS_WIDTH", cfg.soc_lcdcam_i80_bus_width);
        entries[135] = sdkconfig.Entry.flag("CONFIG_SOC_LCDCAM_I80_LCD_SUPPORTED", cfg.soc_lcdcam_i80_lcd_supported);
        entries[136] = sdkconfig.Entry.int("CONFIG_SOC_LCDCAM_I80_NUM_BUSES", cfg.soc_lcdcam_i80_num_buses);
        entries[137] = sdkconfig.Entry.int("CONFIG_SOC_LCDCAM_RGB_DATA_WIDTH", cfg.soc_lcdcam_rgb_data_width);
        entries[138] = sdkconfig.Entry.flag("CONFIG_SOC_LCDCAM_RGB_LCD_SUPPORTED", cfg.soc_lcdcam_rgb_lcd_supported);
        entries[139] = sdkconfig.Entry.int("CONFIG_SOC_LCDCAM_RGB_NUM_PANELS", cfg.soc_lcdcam_rgb_num_panels);
        entries[140] = sdkconfig.Entry.flag("CONFIG_SOC_LCDCAM_SUPPORTED", cfg.soc_lcdcam_supported);
        entries[141] = sdkconfig.Entry.int("CONFIG_SOC_LCD_I80_BUSES", cfg.soc_lcd_i80_buses);
        entries[142] = sdkconfig.Entry.int("CONFIG_SOC_LCD_I80_BUS_WIDTH", cfg.soc_lcd_i80_bus_width);
        entries[143] = sdkconfig.Entry.flag("CONFIG_SOC_LCD_I80_SUPPORTED", cfg.soc_lcd_i80_supported);
        entries[144] = sdkconfig.Entry.int("CONFIG_SOC_LCD_RGB_DATA_WIDTH", cfg.soc_lcd_rgb_data_width);
        entries[145] = sdkconfig.Entry.int("CONFIG_SOC_LCD_RGB_PANELS", cfg.soc_lcd_rgb_panels);
        entries[146] = sdkconfig.Entry.flag("CONFIG_SOC_LCD_RGB_SUPPORTED", cfg.soc_lcd_rgb_supported);
        entries[147] = sdkconfig.Entry.flag("CONFIG_SOC_LCD_SUPPORT_RGB_YUV_CONV", cfg.soc_lcd_support_rgb_yuv_conv);
        entries[148] = sdkconfig.Entry.int("CONFIG_SOC_LEDC_CHANNEL_NUM", cfg.soc_ledc_channel_num);
        entries[149] = sdkconfig.Entry.flag("CONFIG_SOC_LEDC_SUPPORTED", cfg.soc_ledc_supported);
        entries[150] = sdkconfig.Entry.flag("CONFIG_SOC_LEDC_SUPPORT_APB_CLOCK", cfg.soc_ledc_support_apb_clock);
        entries[151] = sdkconfig.Entry.flag("CONFIG_SOC_LEDC_SUPPORT_FADE_STOP", cfg.soc_ledc_support_fade_stop);
        entries[152] = sdkconfig.Entry.flag("CONFIG_SOC_LEDC_SUPPORT_XTAL_CLOCK", cfg.soc_ledc_support_xtal_clock);
        entries[153] = sdkconfig.Entry.int("CONFIG_SOC_LEDC_TIMER_BIT_WIDTH", cfg.soc_ledc_timer_bit_width);
        entries[154] = sdkconfig.Entry.int("CONFIG_SOC_LEDC_TIMER_NUM", cfg.soc_ledc_timer_num);
        entries[155] = sdkconfig.Entry.flag("CONFIG_SOC_LIGHT_SLEEP_SUPPORTED", cfg.soc_light_sleep_supported);
        entries[156] = sdkconfig.Entry.flag("CONFIG_SOC_LP_PERIPH_SHARE_INTERRUPT", cfg.soc_lp_periph_share_interrupt);
        entries[157] = sdkconfig.Entry.int("CONFIG_SOC_MAC_BB_PD_MEM_SIZE", cfg.soc_mac_bb_pd_mem_size);
        entries[158] = sdkconfig.Entry.int("CONFIG_SOC_MCPWM_CAPTURE_CHANNELS_PER_TIMER", cfg.soc_mcpwm_capture_channels_per_timer);
        entries[159] = sdkconfig.Entry.flag("CONFIG_SOC_MCPWM_CAPTURE_TIMERS_PER_GROUP", cfg.soc_mcpwm_capture_timers_per_group);
        entries[160] = sdkconfig.Entry.int("CONFIG_SOC_MCPWM_COMPARATORS_PER_OPERATOR", cfg.soc_mcpwm_comparators_per_operator);
        entries[161] = sdkconfig.Entry.int("CONFIG_SOC_MCPWM_GENERATORS_PER_OPERATOR", cfg.soc_mcpwm_generators_per_operator);
        entries[162] = sdkconfig.Entry.int("CONFIG_SOC_MCPWM_GPIO_FAULTS_PER_GROUP", cfg.soc_mcpwm_gpio_faults_per_group);
        entries[163] = sdkconfig.Entry.int("CONFIG_SOC_MCPWM_GPIO_SYNCHROS_PER_GROUP", cfg.soc_mcpwm_gpio_synchros_per_group);
        entries[164] = sdkconfig.Entry.int("CONFIG_SOC_MCPWM_GROUPS", cfg.soc_mcpwm_groups);
        entries[165] = sdkconfig.Entry.int("CONFIG_SOC_MCPWM_OPERATORS_PER_GROUP", cfg.soc_mcpwm_operators_per_group);
        entries[166] = sdkconfig.Entry.flag("CONFIG_SOC_MCPWM_SUPPORTED", cfg.soc_mcpwm_supported);
        entries[167] = sdkconfig.Entry.flag("CONFIG_SOC_MCPWM_SWSYNC_CAN_PROPAGATE", cfg.soc_mcpwm_swsync_can_propagate);
        entries[168] = sdkconfig.Entry.int("CONFIG_SOC_MCPWM_TIMERS_PER_GROUP", cfg.soc_mcpwm_timers_per_group);
        entries[169] = sdkconfig.Entry.int("CONFIG_SOC_MCPWM_TRIGGERS_PER_OPERATOR", cfg.soc_mcpwm_triggers_per_operator);
        entries[170] = sdkconfig.Entry.int("CONFIG_SOC_MEMPROT_CPU_PREFETCH_PAD_SIZE", cfg.soc_memprot_cpu_prefetch_pad_size);
        entries[171] = sdkconfig.Entry.int("CONFIG_SOC_MEMPROT_MEM_ALIGN_SIZE", cfg.soc_memprot_mem_align_size);
        entries[172] = sdkconfig.Entry.flag("CONFIG_SOC_MEMPROT_SUPPORTED", cfg.soc_memprot_supported);
        entries[173] = sdkconfig.Entry.flag("CONFIG_SOC_MEMSPI_CORE_CLK_SHARED_WITH_PSRAM", cfg.soc_memspi_core_clk_shared_with_psram);
        entries[174] = sdkconfig.Entry.flag("CONFIG_SOC_MEMSPI_IS_INDEPENDENT", cfg.soc_memspi_is_independent);
        entries[175] = sdkconfig.Entry.flag("CONFIG_SOC_MEMSPI_SRC_FREQ_120M", cfg.soc_memspi_src_freq_120m);
        entries[176] = sdkconfig.Entry.flag("CONFIG_SOC_MEMSPI_SRC_FREQ_20M_SUPPORTED", cfg.soc_memspi_src_freq_20m_supported);
        entries[177] = sdkconfig.Entry.flag("CONFIG_SOC_MEMSPI_SRC_FREQ_40M_SUPPORTED", cfg.soc_memspi_src_freq_40m_supported);
        entries[178] = sdkconfig.Entry.flag("CONFIG_SOC_MEMSPI_SRC_FREQ_80M_SUPPORTED", cfg.soc_memspi_src_freq_80m_supported);
        entries[179] = sdkconfig.Entry.flag("CONFIG_SOC_MEMSPI_TIMING_TUNING_BY_MSPI_DELAY", cfg.soc_memspi_timing_tuning_by_mspi_delay);
        entries[180] = sdkconfig.Entry.int("CONFIG_SOC_MMU_LINEAR_ADDRESS_REGION_NUM", cfg.soc_mmu_linear_address_region_num);
        entries[181] = sdkconfig.Entry.int("CONFIG_SOC_MMU_PERIPH_NUM", cfg.soc_mmu_periph_num);
        entries[182] = sdkconfig.Entry.int("CONFIG_SOC_MPI_MEM_BLOCKS_NUM", cfg.soc_mpi_mem_blocks_num);
        entries[183] = sdkconfig.Entry.int("CONFIG_SOC_MPI_OPERATIONS_NUM", cfg.soc_mpi_operations_num);
        entries[184] = sdkconfig.Entry.flag("CONFIG_SOC_MPI_SUPPORTED", cfg.soc_mpi_supported);
        entries[185] = sdkconfig.Entry.raw("CONFIG_SOC_MPU_MIN_REGION_SIZE", cfg.soc_mpu_min_region_size);
        entries[186] = sdkconfig.Entry.int("CONFIG_SOC_MPU_REGIONS_MAX_NUM", cfg.soc_mpu_regions_max_num);
        entries[187] = sdkconfig.Entry.flag("CONFIG_SOC_MPU_SUPPORTED", cfg.soc_mpu_supported);
        entries[188] = sdkconfig.Entry.int("CONFIG_SOC_PCNT_CHANNELS_PER_UNIT", cfg.soc_pcnt_channels_per_unit);
        entries[189] = sdkconfig.Entry.int("CONFIG_SOC_PCNT_GROUPS", cfg.soc_pcnt_groups);
        entries[190] = sdkconfig.Entry.flag("CONFIG_SOC_PCNT_SUPPORTED", cfg.soc_pcnt_supported);
        entries[191] = sdkconfig.Entry.int("CONFIG_SOC_PCNT_THRES_POINT_PER_UNIT", cfg.soc_pcnt_thres_point_per_unit);
        entries[192] = sdkconfig.Entry.int("CONFIG_SOC_PCNT_UNITS_PER_GROUP", cfg.soc_pcnt_units_per_group);
        entries[193] = sdkconfig.Entry.flag("CONFIG_SOC_PHY_COMBO_MODULE", cfg.soc_phy_combo_module);
        entries[194] = sdkconfig.Entry.int("CONFIG_SOC_PHY_DIG_REGS_MEM_SIZE", cfg.soc_phy_dig_regs_mem_size);
        entries[195] = sdkconfig.Entry.flag("CONFIG_SOC_PHY_SUPPORTED", cfg.soc_phy_supported);
        entries[196] = sdkconfig.Entry.flag("CONFIG_SOC_PM_CPU_RETENTION_BY_RTCCNTL", cfg.soc_pm_cpu_retention_by_rtccntl);
        entries[197] = sdkconfig.Entry.flag("CONFIG_SOC_PM_MODEM_PD_BY_SW", cfg.soc_pm_modem_pd_by_sw);
        entries[198] = sdkconfig.Entry.flag("CONFIG_SOC_PM_MODEM_RETENTION_BY_BACKUPDMA", cfg.soc_pm_modem_retention_by_backupdma);
        entries[199] = sdkconfig.Entry.flag("CONFIG_SOC_PM_SUPPORTED", cfg.soc_pm_supported);
        entries[200] = sdkconfig.Entry.flag("CONFIG_SOC_PM_SUPPORT_BT_WAKEUP", cfg.soc_pm_support_bt_wakeup);
        entries[201] = sdkconfig.Entry.flag("CONFIG_SOC_PM_SUPPORT_CPU_PD", cfg.soc_pm_support_cpu_pd);
        entries[202] = sdkconfig.Entry.flag("CONFIG_SOC_PM_SUPPORT_DEEPSLEEP_CHECK_STUB_ONLY", cfg.soc_pm_support_deepsleep_check_stub_only);
        entries[203] = sdkconfig.Entry.flag("CONFIG_SOC_PM_SUPPORT_EXT0_WAKEUP", cfg.soc_pm_support_ext0_wakeup);
        entries[204] = sdkconfig.Entry.flag("CONFIG_SOC_PM_SUPPORT_EXT1_WAKEUP", cfg.soc_pm_support_ext1_wakeup);
        entries[205] = sdkconfig.Entry.flag("CONFIG_SOC_PM_SUPPORT_EXT_WAKEUP", cfg.soc_pm_support_ext_wakeup);
        entries[206] = sdkconfig.Entry.flag("CONFIG_SOC_PM_SUPPORT_MAC_BB_PD", cfg.soc_pm_support_mac_bb_pd);
        entries[207] = sdkconfig.Entry.flag("CONFIG_SOC_PM_SUPPORT_MODEM_PD", cfg.soc_pm_support_modem_pd);
        entries[208] = sdkconfig.Entry.flag("CONFIG_SOC_PM_SUPPORT_RC_FAST_PD", cfg.soc_pm_support_rc_fast_pd);
        entries[209] = sdkconfig.Entry.flag("CONFIG_SOC_PM_SUPPORT_RTC_PERIPH_PD", cfg.soc_pm_support_rtc_periph_pd);
        entries[210] = sdkconfig.Entry.flag("CONFIG_SOC_PM_SUPPORT_TAGMEM_PD", cfg.soc_pm_support_tagmem_pd);
        entries[211] = sdkconfig.Entry.flag("CONFIG_SOC_PM_SUPPORT_TOUCH_SENSOR_WAKEUP", cfg.soc_pm_support_touch_sensor_wakeup);
        entries[212] = sdkconfig.Entry.flag("CONFIG_SOC_PM_SUPPORT_VDDSDIO_PD", cfg.soc_pm_support_vddsdio_pd);
        entries[213] = sdkconfig.Entry.flag("CONFIG_SOC_PM_SUPPORT_WIFI_WAKEUP", cfg.soc_pm_support_wifi_wakeup);
        entries[214] = sdkconfig.Entry.flag("CONFIG_SOC_PSRAM_DMA_CAPABLE", cfg.soc_psram_dma_capable);
        entries[215] = sdkconfig.Entry.flag("CONFIG_SOC_RISCV_COPROC_SUPPORTED", cfg.soc_riscv_coproc_supported);
        entries[216] = sdkconfig.Entry.int("CONFIG_SOC_RMT_CHANNELS_PER_GROUP", cfg.soc_rmt_channels_per_group);
        entries[217] = sdkconfig.Entry.int("CONFIG_SOC_RMT_GROUPS", cfg.soc_rmt_groups);
        entries[218] = sdkconfig.Entry.int("CONFIG_SOC_RMT_MEM_WORDS_PER_CHANNEL", cfg.soc_rmt_mem_words_per_channel);
        entries[219] = sdkconfig.Entry.int("CONFIG_SOC_RMT_RX_CANDIDATES_PER_GROUP", cfg.soc_rmt_rx_candidates_per_group);
        entries[220] = sdkconfig.Entry.flag("CONFIG_SOC_RMT_SUPPORTED", cfg.soc_rmt_supported);
        entries[221] = sdkconfig.Entry.flag("CONFIG_SOC_RMT_SUPPORT_APB", cfg.soc_rmt_support_apb);
        entries[222] = sdkconfig.Entry.flag("CONFIG_SOC_RMT_SUPPORT_DMA", cfg.soc_rmt_support_dma);
        entries[223] = sdkconfig.Entry.flag("CONFIG_SOC_RMT_SUPPORT_RC_FAST", cfg.soc_rmt_support_rc_fast);
        entries[224] = sdkconfig.Entry.flag("CONFIG_SOC_RMT_SUPPORT_RX_DEMODULATION", cfg.soc_rmt_support_rx_demodulation);
        entries[225] = sdkconfig.Entry.flag("CONFIG_SOC_RMT_SUPPORT_RX_PINGPONG", cfg.soc_rmt_support_rx_pingpong);
        entries[226] = sdkconfig.Entry.flag("CONFIG_SOC_RMT_SUPPORT_TX_ASYNC_STOP", cfg.soc_rmt_support_tx_async_stop);
        entries[227] = sdkconfig.Entry.flag("CONFIG_SOC_RMT_SUPPORT_TX_CARRIER_DATA_ONLY", cfg.soc_rmt_support_tx_carrier_data_only);
        entries[228] = sdkconfig.Entry.flag("CONFIG_SOC_RMT_SUPPORT_TX_LOOP_AUTO_STOP", cfg.soc_rmt_support_tx_loop_auto_stop);
        entries[229] = sdkconfig.Entry.flag("CONFIG_SOC_RMT_SUPPORT_TX_LOOP_COUNT", cfg.soc_rmt_support_tx_loop_count);
        entries[230] = sdkconfig.Entry.flag("CONFIG_SOC_RMT_SUPPORT_TX_SYNCHRO", cfg.soc_rmt_support_tx_synchro);
        entries[231] = sdkconfig.Entry.flag("CONFIG_SOC_RMT_SUPPORT_XTAL", cfg.soc_rmt_support_xtal);
        entries[232] = sdkconfig.Entry.int("CONFIG_SOC_RMT_TX_CANDIDATES_PER_GROUP", cfg.soc_rmt_tx_candidates_per_group);
        entries[233] = sdkconfig.Entry.flag("CONFIG_SOC_RNG_SUPPORTED", cfg.soc_rng_supported);
        entries[234] = sdkconfig.Entry.int("CONFIG_SOC_RSA_MAX_BIT_LEN", cfg.soc_rsa_max_bit_len);
        entries[235] = sdkconfig.Entry.flag("CONFIG_SOC_RTCIO_HOLD_SUPPORTED", cfg.soc_rtcio_hold_supported);
        entries[236] = sdkconfig.Entry.flag("CONFIG_SOC_RTCIO_INPUT_OUTPUT_SUPPORTED", cfg.soc_rtcio_input_output_supported);
        entries[237] = sdkconfig.Entry.int("CONFIG_SOC_RTCIO_PIN_COUNT", cfg.soc_rtcio_pin_count);
        entries[238] = sdkconfig.Entry.flag("CONFIG_SOC_RTCIO_WAKE_SUPPORTED", cfg.soc_rtcio_wake_supported);
        entries[239] = sdkconfig.Entry.int("CONFIG_SOC_RTC_CNTL_CPU_PD_DMA_BUS_WIDTH", cfg.soc_rtc_cntl_cpu_pd_dma_bus_width);
        entries[240] = sdkconfig.Entry.int("CONFIG_SOC_RTC_CNTL_CPU_PD_REG_FILE_NUM", cfg.soc_rtc_cntl_cpu_pd_reg_file_num);
        entries[241] = sdkconfig.Entry.int("CONFIG_SOC_RTC_CNTL_TAGMEM_PD_DMA_BUS_WIDTH", cfg.soc_rtc_cntl_tagmem_pd_dma_bus_width);
        entries[242] = sdkconfig.Entry.flag("CONFIG_SOC_RTC_FAST_MEM_SUPPORTED", cfg.soc_rtc_fast_mem_supported);
        entries[243] = sdkconfig.Entry.flag("CONFIG_SOC_RTC_MEM_SUPPORTED", cfg.soc_rtc_mem_supported);
        entries[244] = sdkconfig.Entry.flag("CONFIG_SOC_RTC_SLOW_CLK_SUPPORT_RC_FAST_D256", cfg.soc_rtc_slow_clk_support_rc_fast_d256);
        entries[245] = sdkconfig.Entry.flag("CONFIG_SOC_RTC_SLOW_MEM_SUPPORTED", cfg.soc_rtc_slow_mem_supported);
        entries[246] = sdkconfig.Entry.int("CONFIG_SOC_SDMMC_DELAY_PHASE_NUM", cfg.soc_sdmmc_delay_phase_num);
        entries[247] = sdkconfig.Entry.flag("CONFIG_SOC_SDMMC_HOST_SUPPORTED", cfg.soc_sdmmc_host_supported);
        entries[248] = sdkconfig.Entry.int("CONFIG_SOC_SDMMC_NUM_SLOTS", cfg.soc_sdmmc_num_slots);
        entries[249] = sdkconfig.Entry.flag("CONFIG_SOC_SDMMC_SUPPORT_XTAL_CLOCK", cfg.soc_sdmmc_support_xtal_clock);
        entries[250] = sdkconfig.Entry.flag("CONFIG_SOC_SDMMC_USE_GPIO_MATRIX", cfg.soc_sdmmc_use_gpio_matrix);
        entries[251] = sdkconfig.Entry.int("CONFIG_SOC_SDM_CHANNELS_PER_GROUP", cfg.soc_sdm_channels_per_group);
        entries[252] = sdkconfig.Entry.flag("CONFIG_SOC_SDM_CLK_SUPPORT_APB", cfg.soc_sdm_clk_support_apb);
        entries[253] = sdkconfig.Entry.flag("CONFIG_SOC_SDM_GROUPS", cfg.soc_sdm_groups);
        entries[254] = sdkconfig.Entry.flag("CONFIG_SOC_SDM_SUPPORTED", cfg.soc_sdm_supported);
        entries[255] = sdkconfig.Entry.flag("CONFIG_SOC_SECURE_BOOT_SUPPORTED", cfg.soc_secure_boot_supported);
        entries[256] = sdkconfig.Entry.flag("CONFIG_SOC_SECURE_BOOT_V2_RSA", cfg.soc_secure_boot_v2_rsa);
        entries[257] = sdkconfig.Entry.int("CONFIG_SOC_SHA_DMA_MAX_BUFFER_SIZE", cfg.soc_sha_dma_max_buffer_size);
        entries[258] = sdkconfig.Entry.flag("CONFIG_SOC_SHA_GDMA", cfg.soc_sha_gdma);
        entries[259] = sdkconfig.Entry.flag("CONFIG_SOC_SHA_SUPPORTED", cfg.soc_sha_supported);
        entries[260] = sdkconfig.Entry.flag("CONFIG_SOC_SHA_SUPPORT_DMA", cfg.soc_sha_support_dma);
        entries[261] = sdkconfig.Entry.flag("CONFIG_SOC_SHA_SUPPORT_RESUME", cfg.soc_sha_support_resume);
        entries[262] = sdkconfig.Entry.flag("CONFIG_SOC_SHA_SUPPORT_SHA1", cfg.soc_sha_support_sha1);
        entries[263] = sdkconfig.Entry.flag("CONFIG_SOC_SHA_SUPPORT_SHA224", cfg.soc_sha_support_sha224);
        entries[264] = sdkconfig.Entry.flag("CONFIG_SOC_SHA_SUPPORT_SHA256", cfg.soc_sha_support_sha256);
        entries[265] = sdkconfig.Entry.flag("CONFIG_SOC_SHA_SUPPORT_SHA384", cfg.soc_sha_support_sha384);
        entries[266] = sdkconfig.Entry.flag("CONFIG_SOC_SHA_SUPPORT_SHA512", cfg.soc_sha_support_sha512);
        entries[267] = sdkconfig.Entry.flag("CONFIG_SOC_SHA_SUPPORT_SHA512_224", cfg.soc_sha_support_sha512_224);
        entries[268] = sdkconfig.Entry.flag("CONFIG_SOC_SHA_SUPPORT_SHA512_256", cfg.soc_sha_support_sha512_256);
        entries[269] = sdkconfig.Entry.flag("CONFIG_SOC_SHA_SUPPORT_SHA512_T", cfg.soc_sha_support_sha512_t);
        entries[270] = sdkconfig.Entry.flag("CONFIG_SOC_SPIRAM_SUPPORTED", cfg.soc_spiram_supported);
        entries[271] = sdkconfig.Entry.flag("CONFIG_SOC_SPIRAM_XIP_SUPPORTED", cfg.soc_spiram_xip_supported);
        entries[272] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_FLASH_SUPPORTED", cfg.soc_spi_flash_supported);
        entries[273] = sdkconfig.Entry.int("CONFIG_SOC_SPI_MAXIMUM_BUFFER_SIZE", cfg.soc_spi_maximum_buffer_size);
        entries[274] = sdkconfig.Entry.int("CONFIG_SOC_SPI_MAX_CS_NUM", cfg.soc_spi_max_cs_num);
        entries[275] = sdkconfig.Entry.int("CONFIG_SOC_SPI_MAX_PRE_DIVIDER", cfg.soc_spi_max_pre_divider);
        entries[276] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_MEM_SUPPORT_AUTO_RESUME", cfg.soc_spi_mem_support_auto_resume);
        entries[277] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_MEM_SUPPORT_AUTO_SUSPEND", cfg.soc_spi_mem_support_auto_suspend);
        entries[278] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_MEM_SUPPORT_AUTO_WAIT_IDLE", cfg.soc_spi_mem_support_auto_wait_idle);
        entries[279] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_MEM_SUPPORT_CACHE_32BIT_ADDR_MAP", cfg.soc_spi_mem_support_cache_32bit_addr_map);
        entries[280] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_MEM_SUPPORT_CONFIG_GPIO_BY_EFUSE", cfg.soc_spi_mem_support_config_gpio_by_efuse);
        entries[281] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_MEM_SUPPORT_OPI_MODE", cfg.soc_spi_mem_support_opi_mode);
        entries[282] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_MEM_SUPPORT_SW_SUSPEND", cfg.soc_spi_mem_support_sw_suspend);
        entries[283] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_MEM_SUPPORT_TIMING_TUNING", cfg.soc_spi_mem_support_timing_tuning);
        entries[284] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_MEM_SUPPORT_WRAP", cfg.soc_spi_mem_support_wrap);
        entries[285] = sdkconfig.Entry.int("CONFIG_SOC_SPI_PERIPH_NUM", cfg.soc_spi_periph_num);
        entries[286] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_PERIPH_SUPPORT_CONTROL_DUMMY_OUT", cfg.soc_spi_periph_support_control_dummy_out);
        entries[287] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_SCT_BUFFER_NUM_MAX", cfg.soc_spi_sct_buffer_num_max);
        entries[288] = sdkconfig.Entry.raw("CONFIG_SOC_SPI_SCT_CONF_BITLEN_MAX", cfg.soc_spi_sct_conf_bitlen_max);
        entries[289] = sdkconfig.Entry.int("CONFIG_SOC_SPI_SCT_REG_NUM", cfg.soc_spi_sct_reg_num);
        entries[290] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_SCT_SUPPORTED", cfg.soc_spi_sct_supported);
        entries[291] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_SLAVE_SUPPORT_SEG_TRANS", cfg.soc_spi_slave_support_seg_trans);
        entries[292] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_SUPPORT_CD_SIG", cfg.soc_spi_support_cd_sig);
        entries[293] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_SUPPORT_CLK_APB", cfg.soc_spi_support_clk_apb);
        entries[294] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_SUPPORT_CLK_XTAL", cfg.soc_spi_support_clk_xtal);
        entries[295] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_SUPPORT_CONTINUOUS_TRANS", cfg.soc_spi_support_continuous_trans);
        entries[296] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_SUPPORT_DDRCLK", cfg.soc_spi_support_ddrclk);
        entries[297] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_SUPPORT_OCT", cfg.soc_spi_support_oct);
        entries[298] = sdkconfig.Entry.flag("CONFIG_SOC_SPI_SUPPORT_SLAVE_HD_VER2", cfg.soc_spi_support_slave_hd_ver2);
        entries[299] = sdkconfig.Entry.flag("CONFIG_SOC_SUPPORTS_SECURE_DL_MODE", cfg.soc_supports_secure_dl_mode);
        entries[300] = sdkconfig.Entry.flag("CONFIG_SOC_SUPPORT_COEXISTENCE", cfg.soc_support_coexistence);
        entries[301] = sdkconfig.Entry.flag("CONFIG_SOC_SUPPORT_SECURE_BOOT_REVOKE_KEY", cfg.soc_support_secure_boot_revoke_key);
        entries[302] = sdkconfig.Entry.flag("CONFIG_SOC_SYSTIMER_ALARM_MISS_COMPENSATE", cfg.soc_systimer_alarm_miss_compensate);
        entries[303] = sdkconfig.Entry.int("CONFIG_SOC_SYSTIMER_ALARM_NUM", cfg.soc_systimer_alarm_num);
        entries[304] = sdkconfig.Entry.int("CONFIG_SOC_SYSTIMER_BIT_WIDTH_HI", cfg.soc_systimer_bit_width_hi);
        entries[305] = sdkconfig.Entry.int("CONFIG_SOC_SYSTIMER_BIT_WIDTH_LO", cfg.soc_systimer_bit_width_lo);
        entries[306] = sdkconfig.Entry.int("CONFIG_SOC_SYSTIMER_COUNTER_NUM", cfg.soc_systimer_counter_num);
        entries[307] = sdkconfig.Entry.flag("CONFIG_SOC_SYSTIMER_FIXED_DIVIDER", cfg.soc_systimer_fixed_divider);
        entries[308] = sdkconfig.Entry.flag("CONFIG_SOC_SYSTIMER_INT_LEVEL", cfg.soc_systimer_int_level);
        entries[309] = sdkconfig.Entry.flag("CONFIG_SOC_SYSTIMER_SUPPORTED", cfg.soc_systimer_supported);
        entries[310] = sdkconfig.Entry.flag("CONFIG_SOC_TEMPERATURE_SENSOR_SUPPORT_FAST_RC", cfg.soc_temperature_sensor_support_fast_rc);
        entries[311] = sdkconfig.Entry.flag("CONFIG_SOC_TEMP_SENSOR_SUPPORTED", cfg.soc_temp_sensor_supported);
        entries[312] = sdkconfig.Entry.int("CONFIG_SOC_TIMER_GROUPS", cfg.soc_timer_groups);
        entries[313] = sdkconfig.Entry.int("CONFIG_SOC_TIMER_GROUP_COUNTER_BIT_WIDTH", cfg.soc_timer_group_counter_bit_width);
        entries[314] = sdkconfig.Entry.flag("CONFIG_SOC_TIMER_GROUP_SUPPORT_APB", cfg.soc_timer_group_support_apb);
        entries[315] = sdkconfig.Entry.flag("CONFIG_SOC_TIMER_GROUP_SUPPORT_XTAL", cfg.soc_timer_group_support_xtal);
        entries[316] = sdkconfig.Entry.int("CONFIG_SOC_TIMER_GROUP_TIMERS_PER_GROUP", cfg.soc_timer_group_timers_per_group);
        entries[317] = sdkconfig.Entry.int("CONFIG_SOC_TIMER_GROUP_TOTAL_TIMERS", cfg.soc_timer_group_total_timers);
        entries[318] = sdkconfig.Entry.int("CONFIG_SOC_TOUCH_PROXIMITY_CHANNEL_NUM", cfg.soc_touch_proximity_channel_num);
        entries[319] = sdkconfig.Entry.flag("CONFIG_SOC_TOUCH_PROXIMITY_MEAS_DONE_SUPPORTED", cfg.soc_touch_proximity_meas_done_supported);
        entries[320] = sdkconfig.Entry.int("CONFIG_SOC_TOUCH_SAMPLE_CFG_NUM", cfg.soc_touch_sample_cfg_num);
        entries[321] = sdkconfig.Entry.int("CONFIG_SOC_TOUCH_SENSOR_NUM", cfg.soc_touch_sensor_num);
        entries[322] = sdkconfig.Entry.flag("CONFIG_SOC_TOUCH_SENSOR_SUPPORTED", cfg.soc_touch_sensor_supported);
        entries[323] = sdkconfig.Entry.int("CONFIG_SOC_TOUCH_SENSOR_VERSION", cfg.soc_touch_sensor_version);
        entries[324] = sdkconfig.Entry.flag("CONFIG_SOC_TOUCH_SUPPORT_PROX_SENSING", cfg.soc_touch_support_prox_sensing);
        entries[325] = sdkconfig.Entry.flag("CONFIG_SOC_TOUCH_SUPPORT_SLEEP_WAKEUP", cfg.soc_touch_support_sleep_wakeup);
        entries[326] = sdkconfig.Entry.flag("CONFIG_SOC_TOUCH_SUPPORT_WATERPROOF", cfg.soc_touch_support_waterproof);
        entries[327] = sdkconfig.Entry.int("CONFIG_SOC_TWAI_BRP_MAX", cfg.soc_twai_brp_max);
        entries[328] = sdkconfig.Entry.int("CONFIG_SOC_TWAI_BRP_MIN", cfg.soc_twai_brp_min);
        entries[329] = sdkconfig.Entry.flag("CONFIG_SOC_TWAI_CLK_SUPPORT_APB", cfg.soc_twai_clk_support_apb);
        entries[330] = sdkconfig.Entry.int("CONFIG_SOC_TWAI_CONTROLLER_NUM", cfg.soc_twai_controller_num);
        entries[331] = sdkconfig.Entry.flag("CONFIG_SOC_TWAI_SUPPORTED", cfg.soc_twai_supported);
        entries[332] = sdkconfig.Entry.flag("CONFIG_SOC_TWAI_SUPPORTS_RX_STATUS", cfg.soc_twai_supports_rx_status);
        entries[333] = sdkconfig.Entry.int("CONFIG_SOC_UART_BITRATE_MAX", cfg.soc_uart_bitrate_max);
        entries[334] = sdkconfig.Entry.int("CONFIG_SOC_UART_FIFO_LEN", cfg.soc_uart_fifo_len);
        entries[335] = sdkconfig.Entry.int("CONFIG_SOC_UART_HP_NUM", cfg.soc_uart_hp_num);
        entries[336] = sdkconfig.Entry.int("CONFIG_SOC_UART_NUM", cfg.soc_uart_num);
        entries[337] = sdkconfig.Entry.flag("CONFIG_SOC_UART_SUPPORTED", cfg.soc_uart_supported);
        entries[338] = sdkconfig.Entry.flag("CONFIG_SOC_UART_SUPPORT_APB_CLK", cfg.soc_uart_support_apb_clk);
        entries[339] = sdkconfig.Entry.flag("CONFIG_SOC_UART_SUPPORT_FSM_TX_WAIT_SEND", cfg.soc_uart_support_fsm_tx_wait_send);
        entries[340] = sdkconfig.Entry.flag("CONFIG_SOC_UART_SUPPORT_RTC_CLK", cfg.soc_uart_support_rtc_clk);
        entries[341] = sdkconfig.Entry.flag("CONFIG_SOC_UART_SUPPORT_WAKEUP_INT", cfg.soc_uart_support_wakeup_int);
        entries[342] = sdkconfig.Entry.flag("CONFIG_SOC_UART_SUPPORT_XTAL_CLK", cfg.soc_uart_support_xtal_clk);
        entries[343] = sdkconfig.Entry.flag("CONFIG_SOC_ULP_FSM_SUPPORTED", cfg.soc_ulp_fsm_supported);
        entries[344] = sdkconfig.Entry.flag("CONFIG_SOC_ULP_HAS_ADC", cfg.soc_ulp_has_adc);
        entries[345] = sdkconfig.Entry.flag("CONFIG_SOC_ULP_SUPPORTED", cfg.soc_ulp_supported);
        entries[346] = sdkconfig.Entry.int("CONFIG_SOC_USB_OTG_PERIPH_NUM", cfg.soc_usb_otg_periph_num);
        entries[347] = sdkconfig.Entry.flag("CONFIG_SOC_USB_OTG_SUPPORTED", cfg.soc_usb_otg_supported);
        entries[348] = sdkconfig.Entry.flag("CONFIG_SOC_USB_SERIAL_JTAG_SUPPORTED", cfg.soc_usb_serial_jtag_supported);
        entries[349] = sdkconfig.Entry.flag("CONFIG_SOC_WDT_SUPPORTED", cfg.soc_wdt_supported);
        entries[350] = sdkconfig.Entry.flag("CONFIG_SOC_WIFI_CSI_SUPPORT", cfg.soc_wifi_csi_support);
        entries[351] = sdkconfig.Entry.flag("CONFIG_SOC_WIFI_FTM_SUPPORT", cfg.soc_wifi_ftm_support);
        entries[352] = sdkconfig.Entry.flag("CONFIG_SOC_WIFI_GCMP_SUPPORT", cfg.soc_wifi_gcmp_support);
        entries[353] = sdkconfig.Entry.flag("CONFIG_SOC_WIFI_HW_TSF", cfg.soc_wifi_hw_tsf);
        entries[354] = sdkconfig.Entry.int("CONFIG_SOC_WIFI_LIGHT_SLEEP_CLK_WIDTH", cfg.soc_wifi_light_sleep_clk_width);
        entries[355] = sdkconfig.Entry.flag("CONFIG_SOC_WIFI_MESH_SUPPORT", cfg.soc_wifi_mesh_support);
        entries[356] = sdkconfig.Entry.flag("CONFIG_SOC_WIFI_PHY_NEEDS_USB_WORKAROUND", cfg.soc_wifi_phy_needs_usb_workaround);
        entries[357] = sdkconfig.Entry.flag("CONFIG_SOC_WIFI_SUPPORTED", cfg.soc_wifi_supported);
        entries[358] = sdkconfig.Entry.flag("CONFIG_SOC_WIFI_SUPPORT_VARIABLE_BEACON_WINDOW", cfg.soc_wifi_support_variable_beacon_window);
        entries[359] = sdkconfig.Entry.flag("CONFIG_SOC_WIFI_WAPI_SUPPORT", cfg.soc_wifi_wapi_support);
        entries[360] = sdkconfig.Entry.flag("CONFIG_SOC_XTAL_SUPPORT_40M", cfg.soc_xtal_support_40m);
        entries[361] = sdkconfig.Entry.flag("CONFIG_SOC_XT_WDT_SUPPORTED", cfg.soc_xt_wdt_supported);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
