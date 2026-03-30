const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "vfs";

pub const Config = struct {
    /// Kconfig key: `CONFIG_SEMIHOSTFS_MAX_MOUNT_POINTS`.
    /// Sets the numeric value for semihostfs MAX mount points in the `vfs` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    semihostfs_max_mount_points: i64 = 1,
    /// Kconfig key: `CONFIG_SUPPORT_TERMIOS`.
    /// Controls whether support termios is enabled for the `vfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    support_termios: bool = true,
    /// Kconfig key: `CONFIG_SUPPRESS_SELECT_DEBUG_OUTPUT`.
    /// Controls whether suppress select debug output is enabled for the `vfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    suppress_select_debug_output: bool = true,
    /// Kconfig key: `CONFIG_VFS_INITIALIZE_DEV_NULL`.
    /// Controls whether VFS initialize DEV NULL is enabled for the `vfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    vfs_initialize_dev_null: bool = true,
    /// Kconfig key: `CONFIG_VFS_MAX_COUNT`.
    /// Sets the numeric value for VFS MAX count in the `vfs` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `8`.
    vfs_max_count: i64 = 8,
    /// Kconfig key: `CONFIG_VFS_SELECT_IN_RAM`.
    /// Controls whether VFS select IN RAM is enabled for the `vfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    vfs_select_in_ram: bool = false,
    /// Kconfig key: `CONFIG_VFS_SEMIHOSTFS_MAX_MOUNT_POINTS`.
    /// Sets the numeric value for VFS semihostfs MAX mount points in the `vfs` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    vfs_semihostfs_max_mount_points: i64 = 1,
    /// Kconfig key: `CONFIG_VFS_SUPPORT_DIR`.
    /// Controls whether VFS support DIR is enabled for the `vfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    vfs_support_dir: bool = true,
    /// Kconfig key: `CONFIG_VFS_SUPPORT_IO`.
    /// Controls whether VFS support IO is enabled for the `vfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    vfs_support_io: bool = true,
    /// Kconfig key: `CONFIG_VFS_SUPPORT_SELECT`.
    /// Controls whether VFS support select is enabled for the `vfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    vfs_support_select: bool = true,
    /// Kconfig key: `CONFIG_VFS_SUPPORT_TERMIOS`.
    /// Controls whether VFS support termios is enabled for the `vfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    vfs_support_termios: bool = true,
    /// Kconfig key: `CONFIG_VFS_SUPPRESS_SELECT_DEBUG_OUTPUT`.
    /// Controls whether VFS suppress select debug output is enabled for the `vfs` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    vfs_suppress_select_debug_output: bool = true,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 12);
        entries[0] = sdkconfig.Entry.int("CONFIG_SEMIHOSTFS_MAX_MOUNT_POINTS", cfg.semihostfs_max_mount_points);
        entries[1] = sdkconfig.Entry.flag("CONFIG_SUPPORT_TERMIOS", cfg.support_termios);
        entries[2] = sdkconfig.Entry.flag("CONFIG_SUPPRESS_SELECT_DEBUG_OUTPUT", cfg.suppress_select_debug_output);
        entries[3] = sdkconfig.Entry.flag("CONFIG_VFS_INITIALIZE_DEV_NULL", cfg.vfs_initialize_dev_null);
        entries[4] = sdkconfig.Entry.int("CONFIG_VFS_MAX_COUNT", cfg.vfs_max_count);
        entries[5] = sdkconfig.Entry.flag("CONFIG_VFS_SELECT_IN_RAM", cfg.vfs_select_in_ram);
        entries[6] = sdkconfig.Entry.int("CONFIG_VFS_SEMIHOSTFS_MAX_MOUNT_POINTS", cfg.vfs_semihostfs_max_mount_points);
        entries[7] = sdkconfig.Entry.flag("CONFIG_VFS_SUPPORT_DIR", cfg.vfs_support_dir);
        entries[8] = sdkconfig.Entry.flag("CONFIG_VFS_SUPPORT_IO", cfg.vfs_support_io);
        entries[9] = sdkconfig.Entry.flag("CONFIG_VFS_SUPPORT_SELECT", cfg.vfs_support_select);
        entries[10] = sdkconfig.Entry.flag("CONFIG_VFS_SUPPORT_TERMIOS", cfg.vfs_support_termios);
        entries[11] = sdkconfig.Entry.flag("CONFIG_VFS_SUPPRESS_SELECT_DEBUG_OUTPUT", cfg.vfs_suppress_select_debug_output);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
