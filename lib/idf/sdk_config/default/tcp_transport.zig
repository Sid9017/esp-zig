const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "tcp_transport";

pub const Config = struct {
    /// Kconfig key: `CONFIG_TCP_MAXRTX`.
    /// Sets the numeric value for TCP maxrtx in the `tcp_transport` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `12`.
    tcp_maxrtx: i64 = 12,
    /// Kconfig key: `CONFIG_TCP_MSL`.
    /// Sets the numeric value for TCP MSL in the `tcp_transport` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `60000`.
    tcp_msl: i64 = 60000,
    /// Kconfig key: `CONFIG_TCP_MSS`.
    /// Sets the numeric value for TCP MSS in the `tcp_transport` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1440`.
    tcp_mss: i64 = 1440,
    /// Kconfig key: `CONFIG_TCP_OVERSIZE_DISABLE`.
    /// Controls whether TCP oversize disable is enabled for the `tcp_transport` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    tcp_oversize_disable: bool = false,
    /// Kconfig key: `CONFIG_TCP_OVERSIZE_MSS`.
    /// Controls whether TCP oversize MSS is enabled for the `tcp_transport` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    tcp_oversize_mss: bool = true,
    /// Kconfig key: `CONFIG_TCP_OVERSIZE_QUARTER_MSS`.
    /// Controls whether TCP oversize quarter MSS is enabled for the `tcp_transport` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    tcp_oversize_quarter_mss: bool = false,
    /// Kconfig key: `CONFIG_TCP_QUEUE_OOSEQ`.
    /// Controls whether TCP queue ooseq is enabled for the `tcp_transport` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    tcp_queue_ooseq: bool = true,
    /// Kconfig key: `CONFIG_TCP_RECVMBOX_SIZE`.
    /// Sets the numeric value for TCP recvmbox SIZE in the `tcp_transport` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `6`.
    tcp_recvmbox_size: i64 = 6,
    /// Kconfig key: `CONFIG_TCP_SND_BUF_DEFAULT`.
    /// Sets the numeric value for TCP SND BUF default in the `tcp_transport` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `5760`.
    tcp_snd_buf_default: i64 = 5760,
    /// Kconfig key: `CONFIG_TCP_SYNMAXRTX`.
    /// Sets the numeric value for TCP synmaxrtx in the `tcp_transport` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `12`.
    tcp_synmaxrtx: i64 = 12,
    /// Kconfig key: `CONFIG_TCP_WND_DEFAULT`.
    /// Sets the numeric value for TCP WND default in the `tcp_transport` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `5760`.
    tcp_wnd_default: i64 = 5760,
    /// Kconfig key: `CONFIG_WS_BUFFER_SIZE`.
    /// Sets the numeric value for WS buffer SIZE in the `tcp_transport` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1024`.
    ws_buffer_size: i64 = 1024,
    /// Kconfig key: `CONFIG_WS_DYNAMIC_BUFFER`.
    /// Controls whether WS dynamic buffer is enabled for the `tcp_transport` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    ws_dynamic_buffer: bool = false,
    /// Kconfig key: `CONFIG_WS_TRANSPORT`.
    /// Controls whether WS transport is enabled for the `tcp_transport` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    ws_transport: bool = true,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 14);
        entries[0] = sdkconfig.Entry.int("CONFIG_TCP_MAXRTX", cfg.tcp_maxrtx);
        entries[1] = sdkconfig.Entry.int("CONFIG_TCP_MSL", cfg.tcp_msl);
        entries[2] = sdkconfig.Entry.int("CONFIG_TCP_MSS", cfg.tcp_mss);
        entries[3] = sdkconfig.Entry.flag("CONFIG_TCP_OVERSIZE_DISABLE", cfg.tcp_oversize_disable);
        entries[4] = sdkconfig.Entry.flag("CONFIG_TCP_OVERSIZE_MSS", cfg.tcp_oversize_mss);
        entries[5] = sdkconfig.Entry.flag("CONFIG_TCP_OVERSIZE_QUARTER_MSS", cfg.tcp_oversize_quarter_mss);
        entries[6] = sdkconfig.Entry.flag("CONFIG_TCP_QUEUE_OOSEQ", cfg.tcp_queue_ooseq);
        entries[7] = sdkconfig.Entry.int("CONFIG_TCP_RECVMBOX_SIZE", cfg.tcp_recvmbox_size);
        entries[8] = sdkconfig.Entry.int("CONFIG_TCP_SND_BUF_DEFAULT", cfg.tcp_snd_buf_default);
        entries[9] = sdkconfig.Entry.int("CONFIG_TCP_SYNMAXRTX", cfg.tcp_synmaxrtx);
        entries[10] = sdkconfig.Entry.int("CONFIG_TCP_WND_DEFAULT", cfg.tcp_wnd_default);
        entries[11] = sdkconfig.Entry.int("CONFIG_WS_BUFFER_SIZE", cfg.ws_buffer_size);
        entries[12] = sdkconfig.Entry.flag("CONFIG_WS_DYNAMIC_BUFFER", cfg.ws_dynamic_buffer);
        entries[13] = sdkconfig.Entry.flag("CONFIG_WS_TRANSPORT", cfg.ws_transport);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
