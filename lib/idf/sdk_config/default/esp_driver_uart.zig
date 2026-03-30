const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_driver_uart";

pub const Config = struct {
    /// Kconfig key: `CONFIG_UART_ISR_IN_IRAM`.
    /// Controls whether UART ISR IN IRAM is enabled for the `esp_driver_uart` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    uart_isr_in_iram: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 1);
        entries[0] = sdkconfig.Entry.flag("CONFIG_UART_ISR_IN_IRAM", cfg.uart_isr_in_iram);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
