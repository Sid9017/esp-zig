const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_netif";

pub const Config = struct {
    /// Kconfig key: `CONFIG_ESP_NETIF_BRIDGE_EN`.
    /// Controls whether ESP netif bridge EN is enabled for the `esp_netif` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_netif_bridge_en: bool = false,
    /// Kconfig key: `CONFIG_ESP_NETIF_IP_LOST_TIMER_INTERVAL`.
    /// Sets the numeric value for ESP netif IP LOST timer interval in the `esp_netif` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `120`.
    esp_netif_ip_lost_timer_interval: i64 = 120,
    /// Kconfig key: `CONFIG_ESP_NETIF_L2_TAP`.
    /// Controls whether ESP netif L2 TAP is enabled for the `esp_netif` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_netif_l2_tap: bool = false,
    /// Kconfig key: `CONFIG_ESP_NETIF_LOOPBACK`.
    /// Controls whether ESP netif loopback is enabled for the `esp_netif` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_netif_loopback: bool = false,
    /// Kconfig key: `CONFIG_ESP_NETIF_PROVIDE_CUSTOM_IMPLEMENTATION`.
    /// Controls whether ESP netif provide custom implementation is enabled for the `esp_netif` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_netif_provide_custom_implementation: bool = false,
    /// Kconfig key: `CONFIG_ESP_NETIF_RECEIVE_REPORT_ERRORS`.
    /// Controls whether ESP netif receive report errors is enabled for the `esp_netif` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_netif_receive_report_errors: bool = false,
    /// Kconfig key: `CONFIG_ESP_NETIF_REPORT_DATA_TRAFFIC`.
    /// Controls whether ESP netif report DATA traffic is enabled for the `esp_netif` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_netif_report_data_traffic: bool = true,
    /// Kconfig key: `CONFIG_ESP_NETIF_SET_DNS_PER_DEFAULT_NETIF`.
    /// Controls whether ESP netif SET DNS PER default netif is enabled for the `esp_netif` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    esp_netif_set_dns_per_default_netif: bool = false,
    /// Kconfig key: `CONFIG_ESP_NETIF_TCPIP_LWIP`.
    /// Controls whether ESP netif tcpip LWIP is enabled for the `esp_netif` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_netif_tcpip_lwip: bool = true,
    /// Kconfig key: `CONFIG_ESP_NETIF_USES_TCPIP_WITH_BSD_API`.
    /// Controls whether ESP netif USES tcpip WITH BSD API is enabled for the `esp_netif` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    esp_netif_uses_tcpip_with_bsd_api: bool = true,
    /// Kconfig key: `CONFIG_TCPIP_RECVMBOX_SIZE`.
    /// Sets the numeric value for tcpip recvmbox SIZE in the `esp_netif` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `32`.
    tcpip_recvmbox_size: i64 = 32,
    /// Kconfig key: `CONFIG_TCPIP_TASK_AFFINITY`.
    /// Sets the literal value for tcpip TASK affinity in the `esp_netif` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `"0x7FFFFFFF"`.
    tcpip_task_affinity: []const u8 = "0x7FFFFFFF",
    /// Kconfig key: `CONFIG_TCPIP_TASK_AFFINITY_CPU0`.
    /// Controls whether tcpip TASK affinity CPU0 is enabled for the `esp_netif` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    tcpip_task_affinity_cpu0: bool = false,
    /// Kconfig key: `CONFIG_TCPIP_TASK_AFFINITY_CPU1`.
    /// Controls whether tcpip TASK affinity CPU1 is enabled for the `esp_netif` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    tcpip_task_affinity_cpu1: bool = false,
    /// Kconfig key: `CONFIG_TCPIP_TASK_AFFINITY_NO_AFFINITY`.
    /// Controls whether tcpip TASK affinity NO affinity is enabled for the `esp_netif` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    tcpip_task_affinity_no_affinity: bool = true,
    /// Kconfig key: `CONFIG_TCPIP_TASK_STACK_SIZE`.
    /// Sets the numeric value for tcpip TASK stack SIZE in the `esp_netif` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3072`.
    tcpip_task_stack_size: i64 = 3072,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 16);
        entries[0] = sdkconfig.Entry.flag("CONFIG_ESP_NETIF_BRIDGE_EN", cfg.esp_netif_bridge_en);
        entries[1] = sdkconfig.Entry.int("CONFIG_ESP_NETIF_IP_LOST_TIMER_INTERVAL", cfg.esp_netif_ip_lost_timer_interval);
        entries[2] = sdkconfig.Entry.flag("CONFIG_ESP_NETIF_L2_TAP", cfg.esp_netif_l2_tap);
        entries[3] = sdkconfig.Entry.flag("CONFIG_ESP_NETIF_LOOPBACK", cfg.esp_netif_loopback);
        entries[4] = sdkconfig.Entry.flag("CONFIG_ESP_NETIF_PROVIDE_CUSTOM_IMPLEMENTATION", cfg.esp_netif_provide_custom_implementation);
        entries[5] = sdkconfig.Entry.flag("CONFIG_ESP_NETIF_RECEIVE_REPORT_ERRORS", cfg.esp_netif_receive_report_errors);
        entries[6] = sdkconfig.Entry.flag("CONFIG_ESP_NETIF_REPORT_DATA_TRAFFIC", cfg.esp_netif_report_data_traffic);
        entries[7] = sdkconfig.Entry.flag("CONFIG_ESP_NETIF_SET_DNS_PER_DEFAULT_NETIF", cfg.esp_netif_set_dns_per_default_netif);
        entries[8] = sdkconfig.Entry.flag("CONFIG_ESP_NETIF_TCPIP_LWIP", cfg.esp_netif_tcpip_lwip);
        entries[9] = sdkconfig.Entry.flag("CONFIG_ESP_NETIF_USES_TCPIP_WITH_BSD_API", cfg.esp_netif_uses_tcpip_with_bsd_api);
        entries[10] = sdkconfig.Entry.int("CONFIG_TCPIP_RECVMBOX_SIZE", cfg.tcpip_recvmbox_size);
        entries[11] = sdkconfig.Entry.raw("CONFIG_TCPIP_TASK_AFFINITY", cfg.tcpip_task_affinity);
        entries[12] = sdkconfig.Entry.flag("CONFIG_TCPIP_TASK_AFFINITY_CPU0", cfg.tcpip_task_affinity_cpu0);
        entries[13] = sdkconfig.Entry.flag("CONFIG_TCPIP_TASK_AFFINITY_CPU1", cfg.tcpip_task_affinity_cpu1);
        entries[14] = sdkconfig.Entry.flag("CONFIG_TCPIP_TASK_AFFINITY_NO_AFFINITY", cfg.tcpip_task_affinity_no_affinity);
        entries[15] = sdkconfig.Entry.int("CONFIG_TCPIP_TASK_STACK_SIZE", cfg.tcpip_task_stack_size);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
