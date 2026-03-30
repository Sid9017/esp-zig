const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "fatfs";

pub const Config = struct {
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE`.
    /// Sets the numeric value for fatfs codepage in the `fatfs` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `437`.
    fatfs_codepage: i64 = 437,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_437`.
    /// Controls whether fatfs codepage 437 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    fatfs_codepage_437: bool = true,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_720`.
    /// Controls whether fatfs codepage 720 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_720: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_737`.
    /// Controls whether fatfs codepage 737 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_737: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_771`.
    /// Controls whether fatfs codepage 771 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_771: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_775`.
    /// Controls whether fatfs codepage 775 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_775: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_850`.
    /// Controls whether fatfs codepage 850 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_850: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_852`.
    /// Controls whether fatfs codepage 852 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_852: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_855`.
    /// Controls whether fatfs codepage 855 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_855: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_857`.
    /// Controls whether fatfs codepage 857 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_857: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_860`.
    /// Controls whether fatfs codepage 860 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_860: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_861`.
    /// Controls whether fatfs codepage 861 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_861: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_862`.
    /// Controls whether fatfs codepage 862 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_862: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_863`.
    /// Controls whether fatfs codepage 863 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_863: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_864`.
    /// Controls whether fatfs codepage 864 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_864: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_865`.
    /// Controls whether fatfs codepage 865 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_865: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_866`.
    /// Controls whether fatfs codepage 866 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_866: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_869`.
    /// Controls whether fatfs codepage 869 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_869: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_932`.
    /// Controls whether fatfs codepage 932 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_932: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_936`.
    /// Controls whether fatfs codepage 936 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_936: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_949`.
    /// Controls whether fatfs codepage 949 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_949: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_950`.
    /// Controls whether fatfs codepage 950 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_950: bool = false,
    /// Kconfig key: `CONFIG_FATFS_CODEPAGE_DYNAMIC`.
    /// Controls whether fatfs codepage dynamic is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_codepage_dynamic: bool = false,
    /// Kconfig key: `CONFIG_FATFS_FS_LOCK`.
    /// Sets the numeric value for fatfs FS LOCK in the `fatfs` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `0`.
    fatfs_fs_lock: i64 = 0,
    /// Kconfig key: `CONFIG_FATFS_IMMEDIATE_FSYNC`.
    /// Controls whether fatfs immediate fsync is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_immediate_fsync: bool = false,
    /// Kconfig key: `CONFIG_FATFS_LFN_HEAP`.
    /// Controls whether fatfs LFN HEAP is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_lfn_heap: bool = false,
    /// Kconfig key: `CONFIG_FATFS_LFN_NONE`.
    /// Controls whether fatfs LFN NONE is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    fatfs_lfn_none: bool = true,
    /// Kconfig key: `CONFIG_FATFS_LFN_STACK`.
    /// Controls whether fatfs LFN stack is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_lfn_stack: bool = false,
    /// Kconfig key: `CONFIG_FATFS_LINK_LOCK`.
    /// Controls whether fatfs LINK LOCK is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    fatfs_link_lock: bool = true,
    /// Kconfig key: `CONFIG_FATFS_PER_FILE_CACHE`.
    /// Controls whether fatfs PER FILE cache is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    fatfs_per_file_cache: bool = true,
    /// Kconfig key: `CONFIG_FATFS_SECTOR_4096`.
    /// Controls whether fatfs sector 4096 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    fatfs_sector_4096: bool = true,
    /// Kconfig key: `CONFIG_FATFS_SECTOR_512`.
    /// Controls whether fatfs sector 512 is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_sector_512: bool = false,
    /// Kconfig key: `CONFIG_FATFS_TIMEOUT_MS`.
    /// Sets the numeric value for fatfs timeout MS in the `fatfs` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `10000`.
    fatfs_timeout_ms: i64 = 10000,
    /// Kconfig key: `CONFIG_FATFS_USE_FASTSEEK`.
    /// Controls whether fatfs USE fastseek is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_use_fastseek: bool = false,
    /// Kconfig key: `CONFIG_FATFS_USE_LABEL`.
    /// Controls whether fatfs USE label is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_use_label: bool = false,
    /// Kconfig key: `CONFIG_FATFS_USE_STRFUNC_NONE`.
    /// Controls whether fatfs USE strfunc NONE is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    fatfs_use_strfunc_none: bool = true,
    /// Kconfig key: `CONFIG_FATFS_USE_STRFUNC_WITHOUT_CRLF_CONV`.
    /// Controls whether fatfs USE strfunc without CRLF CONV is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_use_strfunc_without_crlf_conv: bool = false,
    /// Kconfig key: `CONFIG_FATFS_USE_STRFUNC_WITH_CRLF_CONV`.
    /// Controls whether fatfs USE strfunc WITH CRLF CONV is enabled for the `fatfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    fatfs_use_strfunc_with_crlf_conv: bool = false,
    /// Kconfig key: `CONFIG_FATFS_VFS_FSTAT_BLKSIZE`.
    /// Sets the numeric value for fatfs VFS fstat blksize in the `fatfs` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `0`.
    fatfs_vfs_fstat_blksize: i64 = 0,
    /// Kconfig key: `CONFIG_FATFS_VOLUME_COUNT`.
    /// Sets the numeric value for fatfs volume count in the `fatfs` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2`.
    fatfs_volume_count: i64 = 2,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 40);
        entries[0] = sdkconfig.Entry.int("CONFIG_FATFS_CODEPAGE", cfg.fatfs_codepage);
        entries[1] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_437", cfg.fatfs_codepage_437);
        entries[2] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_720", cfg.fatfs_codepage_720);
        entries[3] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_737", cfg.fatfs_codepage_737);
        entries[4] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_771", cfg.fatfs_codepage_771);
        entries[5] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_775", cfg.fatfs_codepage_775);
        entries[6] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_850", cfg.fatfs_codepage_850);
        entries[7] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_852", cfg.fatfs_codepage_852);
        entries[8] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_855", cfg.fatfs_codepage_855);
        entries[9] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_857", cfg.fatfs_codepage_857);
        entries[10] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_860", cfg.fatfs_codepage_860);
        entries[11] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_861", cfg.fatfs_codepage_861);
        entries[12] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_862", cfg.fatfs_codepage_862);
        entries[13] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_863", cfg.fatfs_codepage_863);
        entries[14] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_864", cfg.fatfs_codepage_864);
        entries[15] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_865", cfg.fatfs_codepage_865);
        entries[16] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_866", cfg.fatfs_codepage_866);
        entries[17] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_869", cfg.fatfs_codepage_869);
        entries[18] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_932", cfg.fatfs_codepage_932);
        entries[19] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_936", cfg.fatfs_codepage_936);
        entries[20] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_949", cfg.fatfs_codepage_949);
        entries[21] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_950", cfg.fatfs_codepage_950);
        entries[22] = sdkconfig.Entry.flag("CONFIG_FATFS_CODEPAGE_DYNAMIC", cfg.fatfs_codepage_dynamic);
        entries[23] = sdkconfig.Entry.int("CONFIG_FATFS_FS_LOCK", cfg.fatfs_fs_lock);
        entries[24] = sdkconfig.Entry.flag("CONFIG_FATFS_IMMEDIATE_FSYNC", cfg.fatfs_immediate_fsync);
        entries[25] = sdkconfig.Entry.flag("CONFIG_FATFS_LFN_HEAP", cfg.fatfs_lfn_heap);
        entries[26] = sdkconfig.Entry.flag("CONFIG_FATFS_LFN_NONE", cfg.fatfs_lfn_none);
        entries[27] = sdkconfig.Entry.flag("CONFIG_FATFS_LFN_STACK", cfg.fatfs_lfn_stack);
        entries[28] = sdkconfig.Entry.flag("CONFIG_FATFS_LINK_LOCK", cfg.fatfs_link_lock);
        entries[29] = sdkconfig.Entry.flag("CONFIG_FATFS_PER_FILE_CACHE", cfg.fatfs_per_file_cache);
        entries[30] = sdkconfig.Entry.flag("CONFIG_FATFS_SECTOR_4096", cfg.fatfs_sector_4096);
        entries[31] = sdkconfig.Entry.flag("CONFIG_FATFS_SECTOR_512", cfg.fatfs_sector_512);
        entries[32] = sdkconfig.Entry.int("CONFIG_FATFS_TIMEOUT_MS", cfg.fatfs_timeout_ms);
        entries[33] = sdkconfig.Entry.flag("CONFIG_FATFS_USE_FASTSEEK", cfg.fatfs_use_fastseek);
        entries[34] = sdkconfig.Entry.flag("CONFIG_FATFS_USE_LABEL", cfg.fatfs_use_label);
        entries[35] = sdkconfig.Entry.flag("CONFIG_FATFS_USE_STRFUNC_NONE", cfg.fatfs_use_strfunc_none);
        entries[36] = sdkconfig.Entry.flag("CONFIG_FATFS_USE_STRFUNC_WITHOUT_CRLF_CONV", cfg.fatfs_use_strfunc_without_crlf_conv);
        entries[37] = sdkconfig.Entry.flag("CONFIG_FATFS_USE_STRFUNC_WITH_CRLF_CONV", cfg.fatfs_use_strfunc_with_crlf_conv);
        entries[38] = sdkconfig.Entry.int("CONFIG_FATFS_VFS_FSTAT_BLKSIZE", cfg.fatfs_vfs_fstat_blksize);
        entries[39] = sdkconfig.Entry.int("CONFIG_FATFS_VOLUME_COUNT", cfg.fatfs_volume_count);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
