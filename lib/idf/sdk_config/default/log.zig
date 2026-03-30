const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "log";

pub const Config = struct {
    /// Kconfig key: `CONFIG_LOG_BOOTLOADER_LEVEL`.
    /// Sets the numeric value for LOG bootloader level in the `log` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    log_bootloader_level: i64 = 3,
    /// Kconfig key: `CONFIG_LOG_BOOTLOADER_LEVEL_DEBUG`.
    /// Controls whether LOG bootloader level debug is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    log_bootloader_level_debug: bool = false,
    /// Kconfig key: `CONFIG_LOG_BOOTLOADER_LEVEL_ERROR`.
    /// Controls whether LOG bootloader level error is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    log_bootloader_level_error: bool = false,
    /// Kconfig key: `CONFIG_LOG_BOOTLOADER_LEVEL_INFO`.
    /// Controls whether LOG bootloader level INFO is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    log_bootloader_level_info: bool = true,
    /// Kconfig key: `CONFIG_LOG_BOOTLOADER_LEVEL_NONE`.
    /// Controls whether LOG bootloader level NONE is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    log_bootloader_level_none: bool = false,
    /// Kconfig key: `CONFIG_LOG_BOOTLOADER_LEVEL_VERBOSE`.
    /// Controls whether LOG bootloader level verbose is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    log_bootloader_level_verbose: bool = false,
    /// Kconfig key: `CONFIG_LOG_BOOTLOADER_LEVEL_WARN`.
    /// Controls whether LOG bootloader level WARN is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    log_bootloader_level_warn: bool = false,
    /// Kconfig key: `CONFIG_LOG_COLORS`.
    /// Controls whether LOG colors is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    log_colors: bool = false,
    /// Kconfig key: `CONFIG_LOG_DEFAULT_LEVEL`.
    /// Sets the numeric value for LOG default level in the `log` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    log_default_level: i64 = 3,
    /// Kconfig key: `CONFIG_LOG_DEFAULT_LEVEL_DEBUG`.
    /// Controls whether LOG default level debug is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    log_default_level_debug: bool = false,
    /// Kconfig key: `CONFIG_LOG_DEFAULT_LEVEL_ERROR`.
    /// Controls whether LOG default level error is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    log_default_level_error: bool = false,
    /// Kconfig key: `CONFIG_LOG_DEFAULT_LEVEL_INFO`.
    /// Controls whether LOG default level INFO is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    log_default_level_info: bool = true,
    /// Kconfig key: `CONFIG_LOG_DEFAULT_LEVEL_NONE`.
    /// Controls whether LOG default level NONE is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    log_default_level_none: bool = false,
    /// Kconfig key: `CONFIG_LOG_DEFAULT_LEVEL_VERBOSE`.
    /// Controls whether LOG default level verbose is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    log_default_level_verbose: bool = false,
    /// Kconfig key: `CONFIG_LOG_DEFAULT_LEVEL_WARN`.
    /// Controls whether LOG default level WARN is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    log_default_level_warn: bool = false,
    /// Kconfig key: `CONFIG_LOG_DYNAMIC_LEVEL_CONTROL`.
    /// Controls whether LOG dynamic level control is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    log_dynamic_level_control: bool = true,
    /// Kconfig key: `CONFIG_LOG_MASTER_LEVEL`.
    /// Controls whether LOG master level is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    log_master_level: bool = false,
    /// Kconfig key: `CONFIG_LOG_MAXIMUM_EQUALS_DEFAULT`.
    /// Controls whether LOG maximum equals default is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    log_maximum_equals_default: bool = true,
    /// Kconfig key: `CONFIG_LOG_MAXIMUM_LEVEL`.
    /// Sets the numeric value for LOG maximum level in the `log` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    log_maximum_level: i64 = 3,
    /// Kconfig key: `CONFIG_LOG_MAXIMUM_LEVEL_DEBUG`.
    /// Controls whether LOG maximum level debug is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    log_maximum_level_debug: bool = false,
    /// Kconfig key: `CONFIG_LOG_MAXIMUM_LEVEL_VERBOSE`.
    /// Controls whether LOG maximum level verbose is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    log_maximum_level_verbose: bool = false,
    /// Kconfig key: `CONFIG_LOG_TAG_LEVEL_CACHE_ARRAY`.
    /// Controls whether LOG TAG level cache array is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    log_tag_level_cache_array: bool = false,
    /// Kconfig key: `CONFIG_LOG_TAG_LEVEL_CACHE_BINARY_MIN_HEAP`.
    /// Controls whether LOG TAG level cache binary MIN HEAP is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    log_tag_level_cache_binary_min_heap: bool = true,
    /// Kconfig key: `CONFIG_LOG_TAG_LEVEL_IMPL_CACHE_AND_LINKED_LIST`.
    /// Controls whether LOG TAG level IMPL cache AND linked LIST is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    log_tag_level_impl_cache_and_linked_list: bool = true,
    /// Kconfig key: `CONFIG_LOG_TAG_LEVEL_IMPL_CACHE_SIZE`.
    /// Sets the numeric value for LOG TAG level IMPL cache SIZE in the `log` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `31`.
    log_tag_level_impl_cache_size: i64 = 31,
    /// Kconfig key: `CONFIG_LOG_TAG_LEVEL_IMPL_LINKED_LIST`.
    /// Controls whether LOG TAG level IMPL linked LIST is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    log_tag_level_impl_linked_list: bool = false,
    /// Kconfig key: `CONFIG_LOG_TAG_LEVEL_IMPL_NONE`.
    /// Controls whether LOG TAG level IMPL NONE is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    log_tag_level_impl_none: bool = false,
    /// Kconfig key: `CONFIG_LOG_TIMESTAMP_SOURCE_RTOS`.
    /// Controls whether LOG timestamp source RTOS is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    log_timestamp_source_rtos: bool = true,
    /// Kconfig key: `CONFIG_LOG_TIMESTAMP_SOURCE_SYSTEM`.
    /// Controls whether LOG timestamp source system is enabled for the `log` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    log_timestamp_source_system: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 29);
        entries[0] = sdkconfig.Entry.int("CONFIG_LOG_BOOTLOADER_LEVEL", cfg.log_bootloader_level);
        entries[1] = sdkconfig.Entry.flag("CONFIG_LOG_BOOTLOADER_LEVEL_DEBUG", cfg.log_bootloader_level_debug);
        entries[2] = sdkconfig.Entry.flag("CONFIG_LOG_BOOTLOADER_LEVEL_ERROR", cfg.log_bootloader_level_error);
        entries[3] = sdkconfig.Entry.flag("CONFIG_LOG_BOOTLOADER_LEVEL_INFO", cfg.log_bootloader_level_info);
        entries[4] = sdkconfig.Entry.flag("CONFIG_LOG_BOOTLOADER_LEVEL_NONE", cfg.log_bootloader_level_none);
        entries[5] = sdkconfig.Entry.flag("CONFIG_LOG_BOOTLOADER_LEVEL_VERBOSE", cfg.log_bootloader_level_verbose);
        entries[6] = sdkconfig.Entry.flag("CONFIG_LOG_BOOTLOADER_LEVEL_WARN", cfg.log_bootloader_level_warn);
        entries[7] = sdkconfig.Entry.flag("CONFIG_LOG_COLORS", cfg.log_colors);
        entries[8] = sdkconfig.Entry.int("CONFIG_LOG_DEFAULT_LEVEL", cfg.log_default_level);
        entries[9] = sdkconfig.Entry.flag("CONFIG_LOG_DEFAULT_LEVEL_DEBUG", cfg.log_default_level_debug);
        entries[10] = sdkconfig.Entry.flag("CONFIG_LOG_DEFAULT_LEVEL_ERROR", cfg.log_default_level_error);
        entries[11] = sdkconfig.Entry.flag("CONFIG_LOG_DEFAULT_LEVEL_INFO", cfg.log_default_level_info);
        entries[12] = sdkconfig.Entry.flag("CONFIG_LOG_DEFAULT_LEVEL_NONE", cfg.log_default_level_none);
        entries[13] = sdkconfig.Entry.flag("CONFIG_LOG_DEFAULT_LEVEL_VERBOSE", cfg.log_default_level_verbose);
        entries[14] = sdkconfig.Entry.flag("CONFIG_LOG_DEFAULT_LEVEL_WARN", cfg.log_default_level_warn);
        entries[15] = sdkconfig.Entry.flag("CONFIG_LOG_DYNAMIC_LEVEL_CONTROL", cfg.log_dynamic_level_control);
        entries[16] = sdkconfig.Entry.flag("CONFIG_LOG_MASTER_LEVEL", cfg.log_master_level);
        entries[17] = sdkconfig.Entry.flag("CONFIG_LOG_MAXIMUM_EQUALS_DEFAULT", cfg.log_maximum_equals_default);
        entries[18] = sdkconfig.Entry.int("CONFIG_LOG_MAXIMUM_LEVEL", cfg.log_maximum_level);
        entries[19] = sdkconfig.Entry.flag("CONFIG_LOG_MAXIMUM_LEVEL_DEBUG", cfg.log_maximum_level_debug);
        entries[20] = sdkconfig.Entry.flag("CONFIG_LOG_MAXIMUM_LEVEL_VERBOSE", cfg.log_maximum_level_verbose);
        entries[21] = sdkconfig.Entry.flag("CONFIG_LOG_TAG_LEVEL_CACHE_ARRAY", cfg.log_tag_level_cache_array);
        entries[22] = sdkconfig.Entry.flag("CONFIG_LOG_TAG_LEVEL_CACHE_BINARY_MIN_HEAP", cfg.log_tag_level_cache_binary_min_heap);
        entries[23] = sdkconfig.Entry.flag("CONFIG_LOG_TAG_LEVEL_IMPL_CACHE_AND_LINKED_LIST", cfg.log_tag_level_impl_cache_and_linked_list);
        entries[24] = sdkconfig.Entry.int("CONFIG_LOG_TAG_LEVEL_IMPL_CACHE_SIZE", cfg.log_tag_level_impl_cache_size);
        entries[25] = sdkconfig.Entry.flag("CONFIG_LOG_TAG_LEVEL_IMPL_LINKED_LIST", cfg.log_tag_level_impl_linked_list);
        entries[26] = sdkconfig.Entry.flag("CONFIG_LOG_TAG_LEVEL_IMPL_NONE", cfg.log_tag_level_impl_none);
        entries[27] = sdkconfig.Entry.flag("CONFIG_LOG_TIMESTAMP_SOURCE_RTOS", cfg.log_timestamp_source_rtos);
        entries[28] = sdkconfig.Entry.flag("CONFIG_LOG_TIMESTAMP_SOURCE_SYSTEM", cfg.log_timestamp_source_system);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
