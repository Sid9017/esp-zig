const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "ulp";

pub const Config = struct {
    /// Kconfig key: `CONFIG_ULP_COPROC_ENABLED`.
    /// Controls whether ULP coproc enabled is enabled for the `ulp` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    ulp_coproc_enabled: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 1);
        entries[0] = sdkconfig.Entry.flag("CONFIG_ULP_COPROC_ENABLED", cfg.ulp_coproc_enabled);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
