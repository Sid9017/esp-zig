const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "driver";

pub const Config = struct {
    /// Kconfig key: `CONFIG_TWAI_ERRATA_FIX_LISTEN_ONLY_DOM`.
    twai_errata_fix_listen_only_dom: bool = true,
    /// Kconfig key: `CONFIG_TWAI_ISR_IN_IRAM`.
    twai_isr_in_iram: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 2);
        entries[0] = sdkconfig.Entry.flag("CONFIG_TWAI_ERRATA_FIX_LISTEN_ONLY_DOM", cfg.twai_errata_fix_listen_only_dom);
        entries[1] = sdkconfig.Entry.flag("CONFIG_TWAI_ISR_IN_IRAM", cfg.twai_isr_in_iram);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
