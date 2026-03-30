const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "usb";

pub const Config = struct {
    /// Kconfig key: `CONFIG_USB_HOST_CONTROL_TRANSFER_MAX_SIZE`.
    /// Sets the numeric value for USB HOST control transfer MAX SIZE in the `usb` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `256`.
    usb_host_control_transfer_max_size: i64 = 256,
    /// Kconfig key: `CONFIG_USB_HOST_DEBOUNCE_DELAY_MS`.
    /// Sets the numeric value for USB HOST debounce delay MS in the `usb` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `250`.
    usb_host_debounce_delay_ms: i64 = 250,
    /// Kconfig key: `CONFIG_USB_HOST_ENABLE_ENUM_FILTER_CALLBACK`.
    /// Controls whether USB HOST enable ENUM filter callback is enabled for the `usb` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    usb_host_enable_enum_filter_callback: bool = false,
    /// Kconfig key: `CONFIG_USB_HOST_HUBS_SUPPORTED`.
    /// Controls whether USB HOST HUBS supported is enabled for the `usb` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    usb_host_hubs_supported: bool = false,
    /// Kconfig key: `CONFIG_USB_HOST_HW_BUFFER_BIAS_BALANCED`.
    /// Controls whether USB HOST HW buffer BIAS balanced is enabled for the `usb` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    usb_host_hw_buffer_bias_balanced: bool = true,
    /// Kconfig key: `CONFIG_USB_HOST_HW_BUFFER_BIAS_IN`.
    /// Controls whether USB HOST HW buffer BIAS IN is enabled for the `usb` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    usb_host_hw_buffer_bias_in: bool = false,
    /// Kconfig key: `CONFIG_USB_HOST_HW_BUFFER_BIAS_PERIODIC_OUT`.
    /// Controls whether USB HOST HW buffer BIAS periodic OUT is enabled for the `usb` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    usb_host_hw_buffer_bias_periodic_out: bool = false,
    /// Kconfig key: `CONFIG_USB_HOST_RESET_HOLD_MS`.
    /// Sets the numeric value for USB HOST reset HOLD MS in the `usb` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `30`.
    usb_host_reset_hold_ms: i64 = 30,
    /// Kconfig key: `CONFIG_USB_HOST_RESET_RECOVERY_MS`.
    /// Sets the numeric value for USB HOST reset recovery MS in the `usb` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `30`.
    usb_host_reset_recovery_ms: i64 = 30,
    /// Kconfig key: `CONFIG_USB_HOST_SET_ADDR_RECOVERY_MS`.
    /// Sets the numeric value for USB HOST SET ADDR recovery MS in the `usb` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `10`.
    usb_host_set_addr_recovery_ms: i64 = 10,
    /// Kconfig key: `CONFIG_USB_OTG_SUPPORTED`.
    /// Controls whether USB OTG supported is enabled for the `usb` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    usb_otg_supported: bool = true,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 11);
        entries[0] = sdkconfig.Entry.int("CONFIG_USB_HOST_CONTROL_TRANSFER_MAX_SIZE", cfg.usb_host_control_transfer_max_size);
        entries[1] = sdkconfig.Entry.int("CONFIG_USB_HOST_DEBOUNCE_DELAY_MS", cfg.usb_host_debounce_delay_ms);
        entries[2] = sdkconfig.Entry.flag("CONFIG_USB_HOST_ENABLE_ENUM_FILTER_CALLBACK", cfg.usb_host_enable_enum_filter_callback);
        entries[3] = sdkconfig.Entry.flag("CONFIG_USB_HOST_HUBS_SUPPORTED", cfg.usb_host_hubs_supported);
        entries[4] = sdkconfig.Entry.flag("CONFIG_USB_HOST_HW_BUFFER_BIAS_BALANCED", cfg.usb_host_hw_buffer_bias_balanced);
        entries[5] = sdkconfig.Entry.flag("CONFIG_USB_HOST_HW_BUFFER_BIAS_IN", cfg.usb_host_hw_buffer_bias_in);
        entries[6] = sdkconfig.Entry.flag("CONFIG_USB_HOST_HW_BUFFER_BIAS_PERIODIC_OUT", cfg.usb_host_hw_buffer_bias_periodic_out);
        entries[7] = sdkconfig.Entry.int("CONFIG_USB_HOST_RESET_HOLD_MS", cfg.usb_host_reset_hold_ms);
        entries[8] = sdkconfig.Entry.int("CONFIG_USB_HOST_RESET_RECOVERY_MS", cfg.usb_host_reset_recovery_ms);
        entries[9] = sdkconfig.Entry.int("CONFIG_USB_HOST_SET_ADDR_RECOVERY_MS", cfg.usb_host_set_addr_recovery_ms);
        entries[10] = sdkconfig.Entry.flag("CONFIG_USB_OTG_SUPPORTED", cfg.usb_otg_supported);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
