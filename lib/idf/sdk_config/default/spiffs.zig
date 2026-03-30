const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "spiffs";

pub const Config = struct {
    /// Kconfig key: `CONFIG_SPIFFS_API_DBG`.
    /// Controls whether spiffs API DBG is enabled for the `spiffs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spiffs_api_dbg: bool = false,
    /// Kconfig key: `CONFIG_SPIFFS_CACHE`.
    /// Controls whether spiffs cache is enabled for the `spiffs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spiffs_cache: bool = true,
    /// Kconfig key: `CONFIG_SPIFFS_CACHE_DBG`.
    /// Controls whether spiffs cache DBG is enabled for the `spiffs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spiffs_cache_dbg: bool = false,
    /// Kconfig key: `CONFIG_SPIFFS_CACHE_STATS`.
    /// Controls whether spiffs cache stats is enabled for the `spiffs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spiffs_cache_stats: bool = false,
    /// Kconfig key: `CONFIG_SPIFFS_CACHE_WR`.
    /// Controls whether spiffs cache WR is enabled for the `spiffs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spiffs_cache_wr: bool = true,
    /// Kconfig key: `CONFIG_SPIFFS_CHECK_DBG`.
    /// Controls whether spiffs check DBG is enabled for the `spiffs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spiffs_check_dbg: bool = false,
    /// Kconfig key: `CONFIG_SPIFFS_DBG`.
    /// Controls whether spiffs DBG is enabled for the `spiffs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spiffs_dbg: bool = false,
    /// Kconfig key: `CONFIG_SPIFFS_FOLLOW_SYMLINKS`.
    /// Controls whether spiffs follow symlinks is enabled for the `spiffs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spiffs_follow_symlinks: bool = false,
    /// Kconfig key: `CONFIG_SPIFFS_GC_DBG`.
    /// Controls whether spiffs GC DBG is enabled for the `spiffs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spiffs_gc_dbg: bool = false,
    /// Kconfig key: `CONFIG_SPIFFS_GC_MAX_RUNS`.
    /// Sets the numeric value for spiffs GC MAX RUNS in the `spiffs` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `10`.
    spiffs_gc_max_runs: i64 = 10,
    /// Kconfig key: `CONFIG_SPIFFS_GC_STATS`.
    /// Controls whether spiffs GC stats is enabled for the `spiffs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spiffs_gc_stats: bool = false,
    /// Kconfig key: `CONFIG_SPIFFS_MAX_PARTITIONS`.
    /// Sets the numeric value for spiffs MAX partitions in the `spiffs` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    spiffs_max_partitions: i64 = 3,
    /// Kconfig key: `CONFIG_SPIFFS_META_LENGTH`.
    /// Sets the numeric value for spiffs META length in the `spiffs` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `4`.
    spiffs_meta_length: i64 = 4,
    /// Kconfig key: `CONFIG_SPIFFS_OBJ_NAME_LEN`.
    /// Sets the numeric value for spiffs OBJ NAME LEN in the `spiffs` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `32`.
    spiffs_obj_name_len: i64 = 32,
    /// Kconfig key: `CONFIG_SPIFFS_PAGE_CHECK`.
    /// Controls whether spiffs PAGE check is enabled for the `spiffs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spiffs_page_check: bool = true,
    /// Kconfig key: `CONFIG_SPIFFS_PAGE_SIZE`.
    /// Sets the numeric value for spiffs PAGE SIZE in the `spiffs` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `256`.
    spiffs_page_size: i64 = 256,
    /// Kconfig key: `CONFIG_SPIFFS_TEST_VISUALISATION`.
    /// Controls whether spiffs TEST visualisation is enabled for the `spiffs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spiffs_test_visualisation: bool = false,
    /// Kconfig key: `CONFIG_SPIFFS_USE_MAGIC`.
    /// Controls whether spiffs USE magic is enabled for the `spiffs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spiffs_use_magic: bool = true,
    /// Kconfig key: `CONFIG_SPIFFS_USE_MAGIC_LENGTH`.
    /// Controls whether spiffs USE magic length is enabled for the `spiffs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spiffs_use_magic_length: bool = true,
    /// Kconfig key: `CONFIG_SPIFFS_USE_MTIME`.
    /// Controls whether spiffs USE mtime is enabled for the `spiffs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spiffs_use_mtime: bool = true,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 20);
        entries[0] = sdkconfig.Entry.flag("CONFIG_SPIFFS_API_DBG", cfg.spiffs_api_dbg);
        entries[1] = sdkconfig.Entry.flag("CONFIG_SPIFFS_CACHE", cfg.spiffs_cache);
        entries[2] = sdkconfig.Entry.flag("CONFIG_SPIFFS_CACHE_DBG", cfg.spiffs_cache_dbg);
        entries[3] = sdkconfig.Entry.flag("CONFIG_SPIFFS_CACHE_STATS", cfg.spiffs_cache_stats);
        entries[4] = sdkconfig.Entry.flag("CONFIG_SPIFFS_CACHE_WR", cfg.spiffs_cache_wr);
        entries[5] = sdkconfig.Entry.flag("CONFIG_SPIFFS_CHECK_DBG", cfg.spiffs_check_dbg);
        entries[6] = sdkconfig.Entry.flag("CONFIG_SPIFFS_DBG", cfg.spiffs_dbg);
        entries[7] = sdkconfig.Entry.flag("CONFIG_SPIFFS_FOLLOW_SYMLINKS", cfg.spiffs_follow_symlinks);
        entries[8] = sdkconfig.Entry.flag("CONFIG_SPIFFS_GC_DBG", cfg.spiffs_gc_dbg);
        entries[9] = sdkconfig.Entry.int("CONFIG_SPIFFS_GC_MAX_RUNS", cfg.spiffs_gc_max_runs);
        entries[10] = sdkconfig.Entry.flag("CONFIG_SPIFFS_GC_STATS", cfg.spiffs_gc_stats);
        entries[11] = sdkconfig.Entry.int("CONFIG_SPIFFS_MAX_PARTITIONS", cfg.spiffs_max_partitions);
        entries[12] = sdkconfig.Entry.int("CONFIG_SPIFFS_META_LENGTH", cfg.spiffs_meta_length);
        entries[13] = sdkconfig.Entry.int("CONFIG_SPIFFS_OBJ_NAME_LEN", cfg.spiffs_obj_name_len);
        entries[14] = sdkconfig.Entry.flag("CONFIG_SPIFFS_PAGE_CHECK", cfg.spiffs_page_check);
        entries[15] = sdkconfig.Entry.int("CONFIG_SPIFFS_PAGE_SIZE", cfg.spiffs_page_size);
        entries[16] = sdkconfig.Entry.flag("CONFIG_SPIFFS_TEST_VISUALISATION", cfg.spiffs_test_visualisation);
        entries[17] = sdkconfig.Entry.flag("CONFIG_SPIFFS_USE_MAGIC", cfg.spiffs_use_magic);
        entries[18] = sdkconfig.Entry.flag("CONFIG_SPIFFS_USE_MAGIC_LENGTH", cfg.spiffs_use_magic_length);
        entries[19] = sdkconfig.Entry.flag("CONFIG_SPIFFS_USE_MTIME", cfg.spiffs_use_mtime);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
