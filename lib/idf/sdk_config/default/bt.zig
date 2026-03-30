const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "bt";

pub const Config = struct {
    /// Kconfig key: `CONFIG_BT_ALARM_MAX_NUM`.
    /// Sets the numeric value for BT alarm MAX NUM in the `bt` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `50`.
    bt_alarm_max_num: i64 = 50,
    /// Kconfig key: `CONFIG_BT_ENABLED`.
    /// Controls whether BT enabled is enabled for the `bt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    bt_enabled: bool = false,
    /// Kconfig key: `CONFIG_BT_BLUEDROID_ENABLED`.
    /// Controls whether Bluedroid host is selected for the `bt` module.
    /// Default: `false`.
    bt_bluedroid_enabled: bool = false,
    /// Kconfig key: `CONFIG_BT_NIMBLE_ENABLED`.
    /// Controls whether NimBLE host is selected for the `bt` module.
    /// Default: `false`.
    bt_nimble_enabled: bool = false,
    /// Kconfig key: `CONFIG_BT_CONTROLLER_ONLY`.
    /// Controls whether controller-only mode is selected for the `bt` module (no built-in host stack).
    /// Default: `false`.
    bt_controller_only: bool = false,
    /// Kconfig key: `CONFIG_BT_CONTROLLER_ENABLED`.
    /// Controls whether BT controller is enabled in the `bt` module.
    /// Default: `false`.
    bt_controller_enabled: bool = false,
    /// Kconfig key: `CONFIG_BT_CONTROLLER_DISABLED`.
    /// Controls whether BT controller is disabled in the `bt` module.
    /// Default: `false`.
    bt_controller_disabled: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 7);
        entries[0] = sdkconfig.Entry.int("CONFIG_BT_ALARM_MAX_NUM", cfg.bt_alarm_max_num);
        entries[1] = sdkconfig.Entry.flag("CONFIG_BT_ENABLED", cfg.bt_enabled);
        entries[2] = sdkconfig.Entry.flag("CONFIG_BT_BLUEDROID_ENABLED", cfg.bt_bluedroid_enabled);
        entries[3] = sdkconfig.Entry.flag("CONFIG_BT_NIMBLE_ENABLED", cfg.bt_nimble_enabled);
        entries[4] = sdkconfig.Entry.flag("CONFIG_BT_CONTROLLER_ONLY", cfg.bt_controller_only);
        entries[5] = sdkconfig.Entry.flag("CONFIG_BT_CONTROLLER_ENABLED", cfg.bt_controller_enabled);
        entries[6] = sdkconfig.Entry.flag("CONFIG_BT_CONTROLLER_DISABLED", cfg.bt_controller_disabled);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }

    test "appendModuleDoc emits vhci-related bt keys" {
        var docs = std.array_list.Managed(sdkconfig.ModuleDoc).init(std.testing.allocator);
        defer docs.deinit();

        try Config.appendModuleDoc(std.testing.allocator, &docs, .{
            .bt_enabled = true,
            .bt_controller_only = true,
            .bt_controller_enabled = true,
        });

        const owned = try docs.toOwnedSlice();
        defer sdkconfig.freeModuleDocs(std.testing.allocator, owned);

        const rendered = try sdkconfig.render(std.testing.allocator, owned);
        defer std.testing.allocator.free(rendered);

        try std.testing.expect(std.mem.indexOf(u8, rendered, "CONFIG_BT_ENABLED=y") != null);
        try std.testing.expect(std.mem.indexOf(u8, rendered, "CONFIG_BT_CONTROLLER_ONLY=y") != null);
        try std.testing.expect(std.mem.indexOf(u8, rendered, "CONFIG_BT_CONTROLLER_ENABLED=y") != null);
        try std.testing.expect(std.mem.indexOf(u8, rendered, "# CONFIG_BT_BLUEDROID_ENABLED is not set") != null);
        try std.testing.expect(std.mem.indexOf(u8, rendered, "# CONFIG_BT_NIMBLE_ENABLED is not set") != null);
    }
};
