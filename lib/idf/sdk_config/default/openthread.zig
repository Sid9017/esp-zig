const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "openthread";

pub const Config = struct {
    /// Kconfig key: `CONFIG_OPENTHREAD_ENABLED`.
    /// Controls whether openthread enabled is enabled for the `openthread` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    openthread_enabled: bool = false,
    /// Kconfig key: `CONFIG_OPENTHREAD_SPINEL_ONLY`.
    /// Controls whether openthread spinel ONLY is enabled for the `openthread` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    openthread_spinel_only: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 2);
        entries[0] = sdkconfig.Entry.flag("CONFIG_OPENTHREAD_ENABLED", cfg.openthread_enabled);
        entries[1] = sdkconfig.Entry.flag("CONFIG_OPENTHREAD_SPINEL_ONLY", cfg.openthread_spinel_only);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
