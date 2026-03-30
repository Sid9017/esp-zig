const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "lwip";

pub const Config = struct {
    /// Kconfig key: `CONFIG_GARP_TMR_INTERVAL`.
    /// Sets the numeric value for GARP TMR interval in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `60`.
    garp_tmr_interval: i64 = 60,
    /// Kconfig key: `CONFIG_L2_TO_L3_COPY`.
    /// Controls whether L2 TO L3 COPY is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    l2_to_l3_copy: bool = false,
    /// Kconfig key: `CONFIG_LWIP_AUTOIP`.
    /// Controls whether LWIP autoip is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_autoip: bool = false,
    /// Kconfig key: `CONFIG_LWIP_BRIDGEIF_MAX_PORTS`.
    /// Sets the numeric value for LWIP bridgeif MAX ports in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `7`.
    lwip_bridgeif_max_ports: i64 = 7,
    /// Kconfig key: `CONFIG_LWIP_BROADCAST_PING`.
    /// Controls whether LWIP broadcast PING is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_broadcast_ping: bool = false,
    /// Kconfig key: `CONFIG_LWIP_CHECKSUM_CHECK_ICMP`.
    /// Controls whether LWIP checksum check ICMP is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_checksum_check_icmp: bool = true,
    /// Kconfig key: `CONFIG_LWIP_CHECKSUM_CHECK_IP`.
    /// Controls whether LWIP checksum check IP is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_checksum_check_ip: bool = false,
    /// Kconfig key: `CONFIG_LWIP_CHECKSUM_CHECK_UDP`.
    /// Controls whether LWIP checksum check UDP is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_checksum_check_udp: bool = false,
    /// Kconfig key: `CONFIG_LWIP_CHECK_THREAD_SAFETY`.
    /// Controls whether LWIP check thread safety is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_check_thread_safety: bool = false,
    /// Kconfig key: `CONFIG_LWIP_DEBUG`.
    /// Controls whether LWIP debug is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_debug: bool = false,
    /// Kconfig key: `CONFIG_LWIP_DHCPS`.
    /// Controls whether LWIP dhcps is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_dhcps: bool = true,
    /// Kconfig key: `CONFIG_LWIP_DHCPS_ADD_DNS`.
    /// Controls whether LWIP dhcps ADD DNS is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_dhcps_add_dns: bool = true,
    /// Kconfig key: `CONFIG_LWIP_DHCPS_LEASE_UNIT`.
    /// Sets the numeric value for LWIP dhcps lease UNIT in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `60`.
    lwip_dhcps_lease_unit: i64 = 60,
    /// Kconfig key: `CONFIG_LWIP_DHCPS_MAX_STATION_NUM`.
    /// Sets the numeric value for LWIP dhcps MAX station NUM in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `8`.
    lwip_dhcps_max_station_num: i64 = 8,
    /// Kconfig key: `CONFIG_LWIP_DHCPS_STATIC_ENTRIES`.
    /// Controls whether LWIP dhcps static entries is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_dhcps_static_entries: bool = true,
    /// Kconfig key: `CONFIG_LWIP_DHCP_COARSE_TIMER_SECS`.
    /// Sets the numeric value for LWIP DHCP coarse timer SECS in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    lwip_dhcp_coarse_timer_secs: i64 = 1,
    /// Kconfig key: `CONFIG_LWIP_DHCP_DISABLE_CLIENT_ID`.
    /// Controls whether LWIP DHCP disable client ID is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_dhcp_disable_client_id: bool = false,
    /// Kconfig key: `CONFIG_LWIP_DHCP_DISABLE_VENDOR_CLASS_ID`.
    /// Controls whether LWIP DHCP disable vendor class ID is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_dhcp_disable_vendor_class_id: bool = true,
    /// Kconfig key: `CONFIG_LWIP_DHCP_DOES_ACD_CHECK`.
    /// Controls whether LWIP DHCP DOES ACD check is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_dhcp_does_acd_check: bool = false,
    /// Kconfig key: `CONFIG_LWIP_DHCP_DOES_ARP_CHECK`.
    /// Controls whether LWIP DHCP DOES ARP check is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_dhcp_does_arp_check: bool = true,
    /// Kconfig key: `CONFIG_LWIP_DHCP_DOES_NOT_CHECK_OFFERED_IP`.
    /// Controls whether LWIP DHCP DOES NOT check offered IP is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_dhcp_does_not_check_offered_ip: bool = false,
    /// Kconfig key: `CONFIG_LWIP_DHCP_GET_NTP_SRV`.
    /// Controls whether LWIP DHCP GET NTP SRV is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_dhcp_get_ntp_srv: bool = false,
    /// Kconfig key: `CONFIG_LWIP_DHCP_OPTIONS_LEN`.
    /// Sets the numeric value for LWIP DHCP options LEN in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `68`.
    lwip_dhcp_options_len: i64 = 68,
    /// Kconfig key: `CONFIG_LWIP_DHCP_RESTORE_LAST_IP`.
    /// Controls whether LWIP DHCP restore LAST IP is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_dhcp_restore_last_ip: bool = false,
    /// Kconfig key: `CONFIG_LWIP_DNS_MAX_HOST_IP`.
    /// Sets the numeric value for LWIP DNS MAX HOST IP in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    lwip_dns_max_host_ip: i64 = 1,
    /// Kconfig key: `CONFIG_LWIP_DNS_MAX_SERVERS`.
    /// Sets the numeric value for LWIP DNS MAX servers in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    lwip_dns_max_servers: i64 = 3,
    /// Kconfig key: `CONFIG_LWIP_DNS_SETSERVER_WITH_NETIF`.
    /// Controls whether LWIP DNS setserver WITH netif is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_dns_setserver_with_netif: bool = false,
    /// Kconfig key: `CONFIG_LWIP_DNS_SUPPORT_MDNS_QUERIES`.
    /// Controls whether LWIP DNS support MDNS queries is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_dns_support_mdns_queries: bool = true,
    /// Kconfig key: `CONFIG_LWIP_ENABLE`.
    /// Controls whether LWIP enable is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_enable: bool = true,
    /// Kconfig key: `CONFIG_LWIP_ESP_GRATUITOUS_ARP`.
    /// Controls whether LWIP ESP gratuitous ARP is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_esp_gratuitous_arp: bool = true,
    /// Kconfig key: `CONFIG_LWIP_ESP_LWIP_ASSERT`.
    /// Controls whether LWIP ESP LWIP assert is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_esp_lwip_assert: bool = true,
    /// Kconfig key: `CONFIG_LWIP_ESP_MLDV6_REPORT`.
    /// Controls whether LWIP ESP mldv6 report is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_esp_mldv6_report: bool = true,
    /// Kconfig key: `CONFIG_LWIP_EXTRA_IRAM_OPTIMIZATION`.
    /// Controls whether LWIP extra IRAM optimization is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_extra_iram_optimization: bool = false,
    /// Kconfig key: `CONFIG_LWIP_FALLBACK_DNS_SERVER_SUPPORT`.
    /// Controls whether LWIP fallback DNS server support is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_fallback_dns_server_support: bool = false,
    /// Kconfig key: `CONFIG_LWIP_FORCE_ROUTER_FORWARDING`.
    /// Controls whether LWIP force router forwarding is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_force_router_forwarding: bool = false,
    /// Kconfig key: `CONFIG_LWIP_GARP_TMR_INTERVAL`.
    /// Sets the numeric value for LWIP GARP TMR interval in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `60`.
    lwip_garp_tmr_interval: i64 = 60,
    /// Kconfig key: `CONFIG_LWIP_HOOK_DNS_EXT_RESOLVE_CUSTOM`.
    /// Controls whether LWIP HOOK DNS EXT resolve custom is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_hook_dns_ext_resolve_custom: bool = false,
    /// Kconfig key: `CONFIG_LWIP_HOOK_DNS_EXT_RESOLVE_NONE`.
    /// Controls whether LWIP HOOK DNS EXT resolve NONE is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_hook_dns_ext_resolve_none: bool = true,
    /// Kconfig key: `CONFIG_LWIP_HOOK_IP6_INPUT_CUSTOM`.
    /// Controls whether LWIP HOOK IP6 input custom is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_hook_ip6_input_custom: bool = false,
    /// Kconfig key: `CONFIG_LWIP_HOOK_IP6_INPUT_DEFAULT`.
    /// Controls whether LWIP HOOK IP6 input default is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_hook_ip6_input_default: bool = true,
    /// Kconfig key: `CONFIG_LWIP_HOOK_IP6_INPUT_NONE`.
    /// Controls whether LWIP HOOK IP6 input NONE is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_hook_ip6_input_none: bool = false,
    /// Kconfig key: `CONFIG_LWIP_HOOK_IP6_ROUTE_CUSTOM`.
    /// Controls whether LWIP HOOK IP6 route custom is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_hook_ip6_route_custom: bool = false,
    /// Kconfig key: `CONFIG_LWIP_HOOK_IP6_ROUTE_DEFAULT`.
    /// Controls whether LWIP HOOK IP6 route default is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_hook_ip6_route_default: bool = false,
    /// Kconfig key: `CONFIG_LWIP_HOOK_IP6_ROUTE_NONE`.
    /// Controls whether LWIP HOOK IP6 route NONE is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_hook_ip6_route_none: bool = true,
    /// Kconfig key: `CONFIG_LWIP_HOOK_IP6_SELECT_SRC_ADDR_CUSTOM`.
    /// Controls whether LWIP HOOK IP6 select SRC ADDR custom is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_hook_ip6_select_src_addr_custom: bool = false,
    /// Kconfig key: `CONFIG_LWIP_HOOK_IP6_SELECT_SRC_ADDR_DEFAULT`.
    /// Controls whether LWIP HOOK IP6 select SRC ADDR default is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_hook_ip6_select_src_addr_default: bool = false,
    /// Kconfig key: `CONFIG_LWIP_HOOK_IP6_SELECT_SRC_ADDR_NONE`.
    /// Controls whether LWIP HOOK IP6 select SRC ADDR NONE is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_hook_ip6_select_src_addr_none: bool = true,
    /// Kconfig key: `CONFIG_LWIP_HOOK_ND6_GET_GW_CUSTOM`.
    /// Controls whether LWIP HOOK ND6 GET GW custom is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_hook_nd6_get_gw_custom: bool = false,
    /// Kconfig key: `CONFIG_LWIP_HOOK_ND6_GET_GW_DEFAULT`.
    /// Controls whether LWIP HOOK ND6 GET GW default is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_hook_nd6_get_gw_default: bool = false,
    /// Kconfig key: `CONFIG_LWIP_HOOK_ND6_GET_GW_NONE`.
    /// Controls whether LWIP HOOK ND6 GET GW NONE is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_hook_nd6_get_gw_none: bool = true,
    /// Kconfig key: `CONFIG_LWIP_HOOK_NETCONN_EXT_RESOLVE_CUSTOM`.
    /// Controls whether LWIP HOOK netconn EXT resolve custom is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_hook_netconn_ext_resolve_custom: bool = false,
    /// Kconfig key: `CONFIG_LWIP_HOOK_NETCONN_EXT_RESOLVE_DEFAULT`.
    /// Controls whether LWIP HOOK netconn EXT resolve default is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_hook_netconn_ext_resolve_default: bool = false,
    /// Kconfig key: `CONFIG_LWIP_HOOK_NETCONN_EXT_RESOLVE_NONE`.
    /// Controls whether LWIP HOOK netconn EXT resolve NONE is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_hook_netconn_ext_resolve_none: bool = true,
    /// Kconfig key: `CONFIG_LWIP_HOOK_TCP_ISN_CUSTOM`.
    /// Controls whether LWIP HOOK TCP ISN custom is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_hook_tcp_isn_custom: bool = false,
    /// Kconfig key: `CONFIG_LWIP_HOOK_TCP_ISN_DEFAULT`.
    /// Controls whether LWIP HOOK TCP ISN default is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_hook_tcp_isn_default: bool = true,
    /// Kconfig key: `CONFIG_LWIP_HOOK_TCP_ISN_NONE`.
    /// Controls whether LWIP HOOK TCP ISN NONE is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_hook_tcp_isn_none: bool = false,
    /// Kconfig key: `CONFIG_LWIP_ICMP`.
    /// Controls whether LWIP ICMP is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_icmp: bool = true,
    /// Kconfig key: `CONFIG_LWIP_IP4_FRAG`.
    /// Controls whether LWIP IP4 FRAG is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_ip4_frag: bool = true,
    /// Kconfig key: `CONFIG_LWIP_IP4_REASSEMBLY`.
    /// Controls whether LWIP IP4 reassembly is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_ip4_reassembly: bool = false,
    /// Kconfig key: `CONFIG_LWIP_IP6_FRAG`.
    /// Controls whether LWIP IP6 FRAG is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_ip6_frag: bool = true,
    /// Kconfig key: `CONFIG_LWIP_IP6_REASSEMBLY`.
    /// Controls whether LWIP IP6 reassembly is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_ip6_reassembly: bool = false,
    /// Kconfig key: `CONFIG_LWIP_IPV4`.
    /// Controls whether LWIP IPV4 is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_ipv4: bool = true,
    /// Kconfig key: `CONFIG_LWIP_IPV6`.
    /// Controls whether LWIP IPV6 is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_ipv6: bool = true,
    /// Kconfig key: `CONFIG_LWIP_IPV6_AUTOCONFIG`.
    /// Controls whether LWIP IPV6 autoconfig is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_ipv6_autoconfig: bool = false,
    /// Kconfig key: `CONFIG_LWIP_IPV6_FORWARD`.
    /// Controls whether LWIP IPV6 forward is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_ipv6_forward: bool = false,
    /// Kconfig key: `CONFIG_LWIP_IPV6_MEMP_NUM_ND6_QUEUE`.
    /// Sets the numeric value for LWIP IPV6 MEMP NUM ND6 queue in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    lwip_ipv6_memp_num_nd6_queue: i64 = 3,
    /// Kconfig key: `CONFIG_LWIP_IPV6_ND6_NUM_DESTINATIONS`.
    /// Sets the numeric value for LWIP IPV6 ND6 NUM destinations in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `10`.
    lwip_ipv6_nd6_num_destinations: i64 = 10,
    /// Kconfig key: `CONFIG_LWIP_IPV6_ND6_NUM_NEIGHBORS`.
    /// Sets the numeric value for LWIP IPV6 ND6 NUM neighbors in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `5`.
    lwip_ipv6_nd6_num_neighbors: i64 = 5,
    /// Kconfig key: `CONFIG_LWIP_IPV6_ND6_NUM_PREFIXES`.
    /// Sets the numeric value for LWIP IPV6 ND6 NUM prefixes in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `5`.
    lwip_ipv6_nd6_num_prefixes: i64 = 5,
    /// Kconfig key: `CONFIG_LWIP_IPV6_ND6_NUM_ROUTERS`.
    /// Sets the numeric value for LWIP IPV6 ND6 NUM routers in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    lwip_ipv6_nd6_num_routers: i64 = 3,
    /// Kconfig key: `CONFIG_LWIP_IPV6_NUM_ADDRESSES`.
    /// Sets the numeric value for LWIP IPV6 NUM addresses in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3`.
    lwip_ipv6_num_addresses: i64 = 3,
    /// Kconfig key: `CONFIG_LWIP_IP_DEFAULT_TTL`.
    /// Sets the numeric value for LWIP IP default TTL in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `64`.
    lwip_ip_default_ttl: i64 = 64,
    /// Kconfig key: `CONFIG_LWIP_IP_FORWARD`.
    /// Controls whether LWIP IP forward is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_ip_forward: bool = false,
    /// Kconfig key: `CONFIG_LWIP_IP_REASS_MAX_PBUFS`.
    /// Sets the numeric value for LWIP IP reass MAX pbufs in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `10`.
    lwip_ip_reass_max_pbufs: i64 = 10,
    /// Kconfig key: `CONFIG_LWIP_IRAM_OPTIMIZATION`.
    /// Controls whether LWIP IRAM optimization is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_iram_optimization: bool = false,
    /// Kconfig key: `CONFIG_LWIP_L2_TO_L3_COPY`.
    /// Controls whether LWIP L2 TO L3 COPY is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_l2_to_l3_copy: bool = false,
    /// Kconfig key: `CONFIG_LWIP_LOCAL_HOSTNAME`.
    /// Sets the literal value for LWIP local hostname in the `lwip` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `"espressif"`.
    lwip_local_hostname: []const u8 = "espressif",
    /// Kconfig key: `CONFIG_LWIP_LOOPBACK_MAX_PBUFS`.
    /// Sets the numeric value for LWIP loopback MAX pbufs in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `8`.
    lwip_loopback_max_pbufs: i64 = 8,
    /// Kconfig key: `CONFIG_LWIP_MAX_ACTIVE_TCP`.
    /// Sets the numeric value for LWIP MAX active TCP in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `16`.
    lwip_max_active_tcp: i64 = 16,
    /// Kconfig key: `CONFIG_LWIP_MAX_LISTENING_TCP`.
    /// Sets the numeric value for LWIP MAX listening TCP in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `16`.
    lwip_max_listening_tcp: i64 = 16,
    /// Kconfig key: `CONFIG_LWIP_MAX_RAW_PCBS`.
    /// Sets the numeric value for LWIP MAX RAW PCBS in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `16`.
    lwip_max_raw_pcbs: i64 = 16,
    /// Kconfig key: `CONFIG_LWIP_MAX_SOCKETS`.
    /// Sets the numeric value for LWIP MAX sockets in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `10`.
    lwip_max_sockets: i64 = 10,
    /// Kconfig key: `CONFIG_LWIP_MAX_UDP_PCBS`.
    /// Sets the numeric value for LWIP MAX UDP PCBS in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `16`.
    lwip_max_udp_pcbs: i64 = 16,
    /// Kconfig key: `CONFIG_LWIP_MLDV6_TMR_INTERVAL`.
    /// Sets the numeric value for LWIP mldv6 TMR interval in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `40`.
    lwip_mldv6_tmr_interval: i64 = 40,
    /// Kconfig key: `CONFIG_LWIP_MULTICAST_PING`.
    /// Controls whether LWIP multicast PING is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_multicast_ping: bool = false,
    /// Kconfig key: `CONFIG_LWIP_ND6`.
    /// Controls whether LWIP ND6 is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_nd6: bool = true,
    /// Kconfig key: `CONFIG_LWIP_NETBUF_RECVINFO`.
    /// Controls whether LWIP netbuf recvinfo is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_netbuf_recvinfo: bool = false,
    /// Kconfig key: `CONFIG_LWIP_NETIF_API`.
    /// Controls whether LWIP netif API is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_netif_api: bool = false,
    /// Kconfig key: `CONFIG_LWIP_NETIF_LOOPBACK`.
    /// Controls whether LWIP netif loopback is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_netif_loopback: bool = true,
    /// Kconfig key: `CONFIG_LWIP_NETIF_STATUS_CALLBACK`.
    /// Controls whether LWIP netif status callback is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_netif_status_callback: bool = false,
    /// Kconfig key: `CONFIG_LWIP_NUM_NETIF_CLIENT_DATA`.
    /// Sets the numeric value for LWIP NUM netif client DATA in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `0`.
    lwip_num_netif_client_data: i64 = 0,
    /// Kconfig key: `CONFIG_LWIP_PPP_SUPPORT`.
    /// Controls whether LWIP PPP support is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_ppp_support: bool = false,
    /// Kconfig key: `CONFIG_LWIP_SLIP_SUPPORT`.
    /// Controls whether LWIP SLIP support is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_slip_support: bool = false,
    /// Kconfig key: `CONFIG_LWIP_SNTP_MAXIMUM_STARTUP_DELAY`.
    /// Sets the numeric value for LWIP SNTP maximum startup delay in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `5000`.
    lwip_sntp_maximum_startup_delay: i64 = 5000,
    /// Kconfig key: `CONFIG_LWIP_SNTP_MAX_SERVERS`.
    /// Sets the numeric value for LWIP SNTP MAX servers in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1`.
    lwip_sntp_max_servers: i64 = 1,
    /// Kconfig key: `CONFIG_LWIP_SNTP_STARTUP_DELAY`.
    /// Controls whether LWIP SNTP startup delay is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_sntp_startup_delay: bool = true,
    /// Kconfig key: `CONFIG_LWIP_SNTP_UPDATE_DELAY`.
    /// Sets the numeric value for LWIP SNTP update delay in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3600000`.
    lwip_sntp_update_delay: i64 = 3600000,
    /// Kconfig key: `CONFIG_LWIP_SO_LINGER`.
    /// Controls whether LWIP SO linger is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_so_linger: bool = false,
    /// Kconfig key: `CONFIG_LWIP_SO_RCVBUF`.
    /// Controls whether LWIP SO rcvbuf is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_so_rcvbuf: bool = false,
    /// Kconfig key: `CONFIG_LWIP_SO_REUSE`.
    /// Controls whether LWIP SO reuse is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_so_reuse: bool = true,
    /// Kconfig key: `CONFIG_LWIP_SO_REUSE_RXTOALL`.
    /// Controls whether LWIP SO reuse rxtoall is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_so_reuse_rxtoall: bool = true,
    /// Kconfig key: `CONFIG_LWIP_STATS`.
    /// Controls whether LWIP stats is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_stats: bool = false,
    /// Kconfig key: `CONFIG_LWIP_TCPIP_CORE_LOCKING`.
    /// Controls whether LWIP tcpip CORE locking is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_tcpip_core_locking: bool = false,
    /// Kconfig key: `CONFIG_LWIP_TCPIP_RECVMBOX_SIZE`.
    /// Sets the numeric value for LWIP tcpip recvmbox SIZE in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `32`.
    lwip_tcpip_recvmbox_size: i64 = 32,
    /// Kconfig key: `CONFIG_LWIP_TCPIP_TASK_AFFINITY`.
    /// Sets the literal value for LWIP tcpip TASK affinity in the `lwip` module; the value is forwarded into ESP-IDF Kconfig output as configured.
    /// Default: `"0x7FFFFFFF"`.
    lwip_tcpip_task_affinity: []const u8 = "0x7FFFFFFF",
    /// Kconfig key: `CONFIG_LWIP_TCPIP_TASK_AFFINITY_CPU0`.
    /// Controls whether LWIP tcpip TASK affinity CPU0 is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_tcpip_task_affinity_cpu0: bool = false,
    /// Kconfig key: `CONFIG_LWIP_TCPIP_TASK_AFFINITY_CPU1`.
    /// Controls whether LWIP tcpip TASK affinity CPU1 is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_tcpip_task_affinity_cpu1: bool = false,
    /// Kconfig key: `CONFIG_LWIP_TCPIP_TASK_AFFINITY_NO_AFFINITY`.
    /// Controls whether LWIP tcpip TASK affinity NO affinity is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_tcpip_task_affinity_no_affinity: bool = true,
    /// Kconfig key: `CONFIG_LWIP_TCPIP_TASK_PRIO`.
    /// Sets the numeric value for LWIP tcpip TASK PRIO in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `18`.
    lwip_tcpip_task_prio: i64 = 18,
    /// Kconfig key: `CONFIG_LWIP_TCPIP_TASK_STACK_SIZE`.
    /// Sets the numeric value for LWIP tcpip TASK stack SIZE in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `3072`.
    lwip_tcpip_task_stack_size: i64 = 3072,
    /// Kconfig key: `CONFIG_LWIP_TCP_ACCEPTMBOX_SIZE`.
    /// Sets the numeric value for LWIP TCP acceptmbox SIZE in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `6`.
    lwip_tcp_acceptmbox_size: i64 = 6,
    /// Kconfig key: `CONFIG_LWIP_TCP_FIN_WAIT_TIMEOUT`.
    /// Sets the numeric value for LWIP TCP FIN WAIT timeout in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `20000`.
    lwip_tcp_fin_wait_timeout: i64 = 20000,
    /// Kconfig key: `CONFIG_LWIP_TCP_HIGH_SPEED_RETRANSMISSION`.
    /// Controls whether LWIP TCP HIGH speed retransmission is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_tcp_high_speed_retransmission: bool = true,
    /// Kconfig key: `CONFIG_LWIP_TCP_MAXRTX`.
    /// Sets the numeric value for LWIP TCP maxrtx in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `12`.
    lwip_tcp_maxrtx: i64 = 12,
    /// Kconfig key: `CONFIG_LWIP_TCP_MSL`.
    /// Sets the numeric value for LWIP TCP MSL in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `60000`.
    lwip_tcp_msl: i64 = 60000,
    /// Kconfig key: `CONFIG_LWIP_TCP_MSS`.
    /// Sets the numeric value for LWIP TCP MSS in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1440`.
    lwip_tcp_mss: i64 = 1440,
    /// Kconfig key: `CONFIG_LWIP_TCP_OOSEQ_MAX_PBUFS`.
    /// Sets the numeric value for LWIP TCP ooseq MAX pbufs in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `4`.
    lwip_tcp_ooseq_max_pbufs: i64 = 4,
    /// Kconfig key: `CONFIG_LWIP_TCP_OOSEQ_TIMEOUT`.
    /// Sets the numeric value for LWIP TCP ooseq timeout in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `6`.
    lwip_tcp_ooseq_timeout: i64 = 6,
    /// Kconfig key: `CONFIG_LWIP_TCP_OVERSIZE_DISABLE`.
    /// Controls whether LWIP TCP oversize disable is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_tcp_oversize_disable: bool = false,
    /// Kconfig key: `CONFIG_LWIP_TCP_OVERSIZE_MSS`.
    /// Controls whether LWIP TCP oversize MSS is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_tcp_oversize_mss: bool = true,
    /// Kconfig key: `CONFIG_LWIP_TCP_OVERSIZE_QUARTER_MSS`.
    /// Controls whether LWIP TCP oversize quarter MSS is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_tcp_oversize_quarter_mss: bool = false,
    /// Kconfig key: `CONFIG_LWIP_TCP_QUEUE_OOSEQ`.
    /// Controls whether LWIP TCP queue ooseq is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_tcp_queue_ooseq: bool = true,
    /// Kconfig key: `CONFIG_LWIP_TCP_RECVMBOX_SIZE`.
    /// Sets the numeric value for LWIP TCP recvmbox SIZE in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `6`.
    lwip_tcp_recvmbox_size: i64 = 6,
    /// Kconfig key: `CONFIG_LWIP_TCP_RTO_TIME`.
    /// Sets the numeric value for LWIP TCP RTO TIME in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `1500`.
    lwip_tcp_rto_time: i64 = 1500,
    /// Kconfig key: `CONFIG_LWIP_TCP_SACK_OUT`.
    /// Controls whether LWIP TCP SACK OUT is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_tcp_sack_out: bool = false,
    /// Kconfig key: `CONFIG_LWIP_TCP_SND_BUF_DEFAULT`.
    /// Sets the numeric value for LWIP TCP SND BUF default in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `5760`.
    lwip_tcp_snd_buf_default: i64 = 5760,
    /// Kconfig key: `CONFIG_LWIP_TCP_SYNMAXRTX`.
    /// Sets the numeric value for LWIP TCP synmaxrtx in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `12`.
    lwip_tcp_synmaxrtx: i64 = 12,
    /// Kconfig key: `CONFIG_LWIP_TCP_TMR_INTERVAL`.
    /// Sets the numeric value for LWIP TCP TMR interval in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `250`.
    lwip_tcp_tmr_interval: i64 = 250,
    /// Kconfig key: `CONFIG_LWIP_TCP_WND_DEFAULT`.
    /// Sets the numeric value for LWIP TCP WND default in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `5760`.
    lwip_tcp_wnd_default: i64 = 5760,
    /// Kconfig key: `CONFIG_LWIP_TIMERS_ONDEMAND`.
    /// Controls whether LWIP timers ondemand is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    lwip_timers_ondemand: bool = true,
    /// Kconfig key: `CONFIG_LWIP_UDP_RECVMBOX_SIZE`.
    /// Sets the numeric value for LWIP UDP recvmbox SIZE in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `6`.
    lwip_udp_recvmbox_size: i64 = 6,
    /// Kconfig key: `CONFIG_LWIP_USE_ONLY_LWIP_SELECT`.
    /// Controls whether LWIP USE ONLY LWIP select is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    lwip_use_only_lwip_select: bool = false,
    /// Kconfig key: `CONFIG_PPP_SUPPORT`.
    /// Controls whether PPP support is enabled for the `lwip` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    ppp_support: bool = false,
    /// Kconfig key: `CONFIG_UDP_RECVMBOX_SIZE`.
    /// Sets the numeric value for UDP recvmbox SIZE in the `lwip` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `6`.
    udp_recvmbox_size: i64 = 6,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 134);
        entries[0] = sdkconfig.Entry.int("CONFIG_GARP_TMR_INTERVAL", cfg.garp_tmr_interval);
        entries[1] = sdkconfig.Entry.flag("CONFIG_L2_TO_L3_COPY", cfg.l2_to_l3_copy);
        entries[2] = sdkconfig.Entry.flag("CONFIG_LWIP_AUTOIP", cfg.lwip_autoip);
        entries[3] = sdkconfig.Entry.int("CONFIG_LWIP_BRIDGEIF_MAX_PORTS", cfg.lwip_bridgeif_max_ports);
        entries[4] = sdkconfig.Entry.flag("CONFIG_LWIP_BROADCAST_PING", cfg.lwip_broadcast_ping);
        entries[5] = sdkconfig.Entry.flag("CONFIG_LWIP_CHECKSUM_CHECK_ICMP", cfg.lwip_checksum_check_icmp);
        entries[6] = sdkconfig.Entry.flag("CONFIG_LWIP_CHECKSUM_CHECK_IP", cfg.lwip_checksum_check_ip);
        entries[7] = sdkconfig.Entry.flag("CONFIG_LWIP_CHECKSUM_CHECK_UDP", cfg.lwip_checksum_check_udp);
        entries[8] = sdkconfig.Entry.flag("CONFIG_LWIP_CHECK_THREAD_SAFETY", cfg.lwip_check_thread_safety);
        entries[9] = sdkconfig.Entry.flag("CONFIG_LWIP_DEBUG", cfg.lwip_debug);
        entries[10] = sdkconfig.Entry.flag("CONFIG_LWIP_DHCPS", cfg.lwip_dhcps);
        entries[11] = sdkconfig.Entry.flag("CONFIG_LWIP_DHCPS_ADD_DNS", cfg.lwip_dhcps_add_dns);
        entries[12] = sdkconfig.Entry.int("CONFIG_LWIP_DHCPS_LEASE_UNIT", cfg.lwip_dhcps_lease_unit);
        entries[13] = sdkconfig.Entry.int("CONFIG_LWIP_DHCPS_MAX_STATION_NUM", cfg.lwip_dhcps_max_station_num);
        entries[14] = sdkconfig.Entry.flag("CONFIG_LWIP_DHCPS_STATIC_ENTRIES", cfg.lwip_dhcps_static_entries);
        entries[15] = sdkconfig.Entry.int("CONFIG_LWIP_DHCP_COARSE_TIMER_SECS", cfg.lwip_dhcp_coarse_timer_secs);
        entries[16] = sdkconfig.Entry.flag("CONFIG_LWIP_DHCP_DISABLE_CLIENT_ID", cfg.lwip_dhcp_disable_client_id);
        entries[17] = sdkconfig.Entry.flag("CONFIG_LWIP_DHCP_DISABLE_VENDOR_CLASS_ID", cfg.lwip_dhcp_disable_vendor_class_id);
        entries[18] = sdkconfig.Entry.flag("CONFIG_LWIP_DHCP_DOES_ACD_CHECK", cfg.lwip_dhcp_does_acd_check);
        entries[19] = sdkconfig.Entry.flag("CONFIG_LWIP_DHCP_DOES_ARP_CHECK", cfg.lwip_dhcp_does_arp_check);
        entries[20] = sdkconfig.Entry.flag("CONFIG_LWIP_DHCP_DOES_NOT_CHECK_OFFERED_IP", cfg.lwip_dhcp_does_not_check_offered_ip);
        entries[21] = sdkconfig.Entry.flag("CONFIG_LWIP_DHCP_GET_NTP_SRV", cfg.lwip_dhcp_get_ntp_srv);
        entries[22] = sdkconfig.Entry.int("CONFIG_LWIP_DHCP_OPTIONS_LEN", cfg.lwip_dhcp_options_len);
        entries[23] = sdkconfig.Entry.flag("CONFIG_LWIP_DHCP_RESTORE_LAST_IP", cfg.lwip_dhcp_restore_last_ip);
        entries[24] = sdkconfig.Entry.int("CONFIG_LWIP_DNS_MAX_HOST_IP", cfg.lwip_dns_max_host_ip);
        entries[25] = sdkconfig.Entry.int("CONFIG_LWIP_DNS_MAX_SERVERS", cfg.lwip_dns_max_servers);
        entries[26] = sdkconfig.Entry.flag("CONFIG_LWIP_DNS_SETSERVER_WITH_NETIF", cfg.lwip_dns_setserver_with_netif);
        entries[27] = sdkconfig.Entry.flag("CONFIG_LWIP_DNS_SUPPORT_MDNS_QUERIES", cfg.lwip_dns_support_mdns_queries);
        entries[28] = sdkconfig.Entry.flag("CONFIG_LWIP_ENABLE", cfg.lwip_enable);
        entries[29] = sdkconfig.Entry.flag("CONFIG_LWIP_ESP_GRATUITOUS_ARP", cfg.lwip_esp_gratuitous_arp);
        entries[30] = sdkconfig.Entry.flag("CONFIG_LWIP_ESP_LWIP_ASSERT", cfg.lwip_esp_lwip_assert);
        entries[31] = sdkconfig.Entry.flag("CONFIG_LWIP_ESP_MLDV6_REPORT", cfg.lwip_esp_mldv6_report);
        entries[32] = sdkconfig.Entry.flag("CONFIG_LWIP_EXTRA_IRAM_OPTIMIZATION", cfg.lwip_extra_iram_optimization);
        entries[33] = sdkconfig.Entry.flag("CONFIG_LWIP_FALLBACK_DNS_SERVER_SUPPORT", cfg.lwip_fallback_dns_server_support);
        entries[34] = sdkconfig.Entry.flag("CONFIG_LWIP_FORCE_ROUTER_FORWARDING", cfg.lwip_force_router_forwarding);
        entries[35] = sdkconfig.Entry.int("CONFIG_LWIP_GARP_TMR_INTERVAL", cfg.lwip_garp_tmr_interval);
        entries[36] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_DNS_EXT_RESOLVE_CUSTOM", cfg.lwip_hook_dns_ext_resolve_custom);
        entries[37] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_DNS_EXT_RESOLVE_NONE", cfg.lwip_hook_dns_ext_resolve_none);
        entries[38] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_IP6_INPUT_CUSTOM", cfg.lwip_hook_ip6_input_custom);
        entries[39] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_IP6_INPUT_DEFAULT", cfg.lwip_hook_ip6_input_default);
        entries[40] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_IP6_INPUT_NONE", cfg.lwip_hook_ip6_input_none);
        entries[41] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_IP6_ROUTE_CUSTOM", cfg.lwip_hook_ip6_route_custom);
        entries[42] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_IP6_ROUTE_DEFAULT", cfg.lwip_hook_ip6_route_default);
        entries[43] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_IP6_ROUTE_NONE", cfg.lwip_hook_ip6_route_none);
        entries[44] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_IP6_SELECT_SRC_ADDR_CUSTOM", cfg.lwip_hook_ip6_select_src_addr_custom);
        entries[45] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_IP6_SELECT_SRC_ADDR_DEFAULT", cfg.lwip_hook_ip6_select_src_addr_default);
        entries[46] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_IP6_SELECT_SRC_ADDR_NONE", cfg.lwip_hook_ip6_select_src_addr_none);
        entries[47] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_ND6_GET_GW_CUSTOM", cfg.lwip_hook_nd6_get_gw_custom);
        entries[48] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_ND6_GET_GW_DEFAULT", cfg.lwip_hook_nd6_get_gw_default);
        entries[49] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_ND6_GET_GW_NONE", cfg.lwip_hook_nd6_get_gw_none);
        entries[50] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_NETCONN_EXT_RESOLVE_CUSTOM", cfg.lwip_hook_netconn_ext_resolve_custom);
        entries[51] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_NETCONN_EXT_RESOLVE_DEFAULT", cfg.lwip_hook_netconn_ext_resolve_default);
        entries[52] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_NETCONN_EXT_RESOLVE_NONE", cfg.lwip_hook_netconn_ext_resolve_none);
        entries[53] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_TCP_ISN_CUSTOM", cfg.lwip_hook_tcp_isn_custom);
        entries[54] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_TCP_ISN_DEFAULT", cfg.lwip_hook_tcp_isn_default);
        entries[55] = sdkconfig.Entry.flag("CONFIG_LWIP_HOOK_TCP_ISN_NONE", cfg.lwip_hook_tcp_isn_none);
        entries[56] = sdkconfig.Entry.flag("CONFIG_LWIP_ICMP", cfg.lwip_icmp);
        entries[57] = sdkconfig.Entry.flag("CONFIG_LWIP_IP4_FRAG", cfg.lwip_ip4_frag);
        entries[58] = sdkconfig.Entry.flag("CONFIG_LWIP_IP4_REASSEMBLY", cfg.lwip_ip4_reassembly);
        entries[59] = sdkconfig.Entry.flag("CONFIG_LWIP_IP6_FRAG", cfg.lwip_ip6_frag);
        entries[60] = sdkconfig.Entry.flag("CONFIG_LWIP_IP6_REASSEMBLY", cfg.lwip_ip6_reassembly);
        entries[61] = sdkconfig.Entry.flag("CONFIG_LWIP_IPV4", cfg.lwip_ipv4);
        entries[62] = sdkconfig.Entry.flag("CONFIG_LWIP_IPV6", cfg.lwip_ipv6);
        entries[63] = sdkconfig.Entry.flag("CONFIG_LWIP_IPV6_AUTOCONFIG", cfg.lwip_ipv6_autoconfig);
        entries[64] = sdkconfig.Entry.flag("CONFIG_LWIP_IPV6_FORWARD", cfg.lwip_ipv6_forward);
        entries[65] = sdkconfig.Entry.int("CONFIG_LWIP_IPV6_MEMP_NUM_ND6_QUEUE", cfg.lwip_ipv6_memp_num_nd6_queue);
        entries[66] = sdkconfig.Entry.int("CONFIG_LWIP_IPV6_ND6_NUM_DESTINATIONS", cfg.lwip_ipv6_nd6_num_destinations);
        entries[67] = sdkconfig.Entry.int("CONFIG_LWIP_IPV6_ND6_NUM_NEIGHBORS", cfg.lwip_ipv6_nd6_num_neighbors);
        entries[68] = sdkconfig.Entry.int("CONFIG_LWIP_IPV6_ND6_NUM_PREFIXES", cfg.lwip_ipv6_nd6_num_prefixes);
        entries[69] = sdkconfig.Entry.int("CONFIG_LWIP_IPV6_ND6_NUM_ROUTERS", cfg.lwip_ipv6_nd6_num_routers);
        entries[70] = sdkconfig.Entry.int("CONFIG_LWIP_IPV6_NUM_ADDRESSES", cfg.lwip_ipv6_num_addresses);
        entries[71] = sdkconfig.Entry.int("CONFIG_LWIP_IP_DEFAULT_TTL", cfg.lwip_ip_default_ttl);
        entries[72] = sdkconfig.Entry.flag("CONFIG_LWIP_IP_FORWARD", cfg.lwip_ip_forward);
        entries[73] = sdkconfig.Entry.int("CONFIG_LWIP_IP_REASS_MAX_PBUFS", cfg.lwip_ip_reass_max_pbufs);
        entries[74] = sdkconfig.Entry.flag("CONFIG_LWIP_IRAM_OPTIMIZATION", cfg.lwip_iram_optimization);
        entries[75] = sdkconfig.Entry.flag("CONFIG_LWIP_L2_TO_L3_COPY", cfg.lwip_l2_to_l3_copy);
        entries[76] = sdkconfig.Entry.str("CONFIG_LWIP_LOCAL_HOSTNAME", cfg.lwip_local_hostname);
        entries[77] = sdkconfig.Entry.int("CONFIG_LWIP_LOOPBACK_MAX_PBUFS", cfg.lwip_loopback_max_pbufs);
        entries[78] = sdkconfig.Entry.int("CONFIG_LWIP_MAX_ACTIVE_TCP", cfg.lwip_max_active_tcp);
        entries[79] = sdkconfig.Entry.int("CONFIG_LWIP_MAX_LISTENING_TCP", cfg.lwip_max_listening_tcp);
        entries[80] = sdkconfig.Entry.int("CONFIG_LWIP_MAX_RAW_PCBS", cfg.lwip_max_raw_pcbs);
        entries[81] = sdkconfig.Entry.int("CONFIG_LWIP_MAX_SOCKETS", cfg.lwip_max_sockets);
        entries[82] = sdkconfig.Entry.int("CONFIG_LWIP_MAX_UDP_PCBS", cfg.lwip_max_udp_pcbs);
        entries[83] = sdkconfig.Entry.int("CONFIG_LWIP_MLDV6_TMR_INTERVAL", cfg.lwip_mldv6_tmr_interval);
        entries[84] = sdkconfig.Entry.flag("CONFIG_LWIP_MULTICAST_PING", cfg.lwip_multicast_ping);
        entries[85] = sdkconfig.Entry.flag("CONFIG_LWIP_ND6", cfg.lwip_nd6);
        entries[86] = sdkconfig.Entry.flag("CONFIG_LWIP_NETBUF_RECVINFO", cfg.lwip_netbuf_recvinfo);
        entries[87] = sdkconfig.Entry.flag("CONFIG_LWIP_NETIF_API", cfg.lwip_netif_api);
        entries[88] = sdkconfig.Entry.flag("CONFIG_LWIP_NETIF_LOOPBACK", cfg.lwip_netif_loopback);
        entries[89] = sdkconfig.Entry.flag("CONFIG_LWIP_NETIF_STATUS_CALLBACK", cfg.lwip_netif_status_callback);
        entries[90] = sdkconfig.Entry.int("CONFIG_LWIP_NUM_NETIF_CLIENT_DATA", cfg.lwip_num_netif_client_data);
        entries[91] = sdkconfig.Entry.flag("CONFIG_LWIP_PPP_SUPPORT", cfg.lwip_ppp_support);
        entries[92] = sdkconfig.Entry.flag("CONFIG_LWIP_SLIP_SUPPORT", cfg.lwip_slip_support);
        entries[93] = sdkconfig.Entry.int("CONFIG_LWIP_SNTP_MAXIMUM_STARTUP_DELAY", cfg.lwip_sntp_maximum_startup_delay);
        entries[94] = sdkconfig.Entry.int("CONFIG_LWIP_SNTP_MAX_SERVERS", cfg.lwip_sntp_max_servers);
        entries[95] = sdkconfig.Entry.flag("CONFIG_LWIP_SNTP_STARTUP_DELAY", cfg.lwip_sntp_startup_delay);
        entries[96] = sdkconfig.Entry.int("CONFIG_LWIP_SNTP_UPDATE_DELAY", cfg.lwip_sntp_update_delay);
        entries[97] = sdkconfig.Entry.flag("CONFIG_LWIP_SO_LINGER", cfg.lwip_so_linger);
        entries[98] = sdkconfig.Entry.flag("CONFIG_LWIP_SO_RCVBUF", cfg.lwip_so_rcvbuf);
        entries[99] = sdkconfig.Entry.flag("CONFIG_LWIP_SO_REUSE", cfg.lwip_so_reuse);
        entries[100] = sdkconfig.Entry.flag("CONFIG_LWIP_SO_REUSE_RXTOALL", cfg.lwip_so_reuse_rxtoall);
        entries[101] = sdkconfig.Entry.flag("CONFIG_LWIP_STATS", cfg.lwip_stats);
        entries[102] = sdkconfig.Entry.flag("CONFIG_LWIP_TCPIP_CORE_LOCKING", cfg.lwip_tcpip_core_locking);
        entries[103] = sdkconfig.Entry.int("CONFIG_LWIP_TCPIP_RECVMBOX_SIZE", cfg.lwip_tcpip_recvmbox_size);
        entries[104] = sdkconfig.Entry.raw("CONFIG_LWIP_TCPIP_TASK_AFFINITY", cfg.lwip_tcpip_task_affinity);
        entries[105] = sdkconfig.Entry.flag("CONFIG_LWIP_TCPIP_TASK_AFFINITY_CPU0", cfg.lwip_tcpip_task_affinity_cpu0);
        entries[106] = sdkconfig.Entry.flag("CONFIG_LWIP_TCPIP_TASK_AFFINITY_CPU1", cfg.lwip_tcpip_task_affinity_cpu1);
        entries[107] = sdkconfig.Entry.flag("CONFIG_LWIP_TCPIP_TASK_AFFINITY_NO_AFFINITY", cfg.lwip_tcpip_task_affinity_no_affinity);
        entries[108] = sdkconfig.Entry.int("CONFIG_LWIP_TCPIP_TASK_PRIO", cfg.lwip_tcpip_task_prio);
        entries[109] = sdkconfig.Entry.int("CONFIG_LWIP_TCPIP_TASK_STACK_SIZE", cfg.lwip_tcpip_task_stack_size);
        entries[110] = sdkconfig.Entry.int("CONFIG_LWIP_TCP_ACCEPTMBOX_SIZE", cfg.lwip_tcp_acceptmbox_size);
        entries[111] = sdkconfig.Entry.int("CONFIG_LWIP_TCP_FIN_WAIT_TIMEOUT", cfg.lwip_tcp_fin_wait_timeout);
        entries[112] = sdkconfig.Entry.flag("CONFIG_LWIP_TCP_HIGH_SPEED_RETRANSMISSION", cfg.lwip_tcp_high_speed_retransmission);
        entries[113] = sdkconfig.Entry.int("CONFIG_LWIP_TCP_MAXRTX", cfg.lwip_tcp_maxrtx);
        entries[114] = sdkconfig.Entry.int("CONFIG_LWIP_TCP_MSL", cfg.lwip_tcp_msl);
        entries[115] = sdkconfig.Entry.int("CONFIG_LWIP_TCP_MSS", cfg.lwip_tcp_mss);
        entries[116] = sdkconfig.Entry.int("CONFIG_LWIP_TCP_OOSEQ_MAX_PBUFS", cfg.lwip_tcp_ooseq_max_pbufs);
        entries[117] = sdkconfig.Entry.int("CONFIG_LWIP_TCP_OOSEQ_TIMEOUT", cfg.lwip_tcp_ooseq_timeout);
        entries[118] = sdkconfig.Entry.flag("CONFIG_LWIP_TCP_OVERSIZE_DISABLE", cfg.lwip_tcp_oversize_disable);
        entries[119] = sdkconfig.Entry.flag("CONFIG_LWIP_TCP_OVERSIZE_MSS", cfg.lwip_tcp_oversize_mss);
        entries[120] = sdkconfig.Entry.flag("CONFIG_LWIP_TCP_OVERSIZE_QUARTER_MSS", cfg.lwip_tcp_oversize_quarter_mss);
        entries[121] = sdkconfig.Entry.flag("CONFIG_LWIP_TCP_QUEUE_OOSEQ", cfg.lwip_tcp_queue_ooseq);
        entries[122] = sdkconfig.Entry.int("CONFIG_LWIP_TCP_RECVMBOX_SIZE", cfg.lwip_tcp_recvmbox_size);
        entries[123] = sdkconfig.Entry.int("CONFIG_LWIP_TCP_RTO_TIME", cfg.lwip_tcp_rto_time);
        entries[124] = sdkconfig.Entry.flag("CONFIG_LWIP_TCP_SACK_OUT", cfg.lwip_tcp_sack_out);
        entries[125] = sdkconfig.Entry.int("CONFIG_LWIP_TCP_SND_BUF_DEFAULT", cfg.lwip_tcp_snd_buf_default);
        entries[126] = sdkconfig.Entry.int("CONFIG_LWIP_TCP_SYNMAXRTX", cfg.lwip_tcp_synmaxrtx);
        entries[127] = sdkconfig.Entry.int("CONFIG_LWIP_TCP_TMR_INTERVAL", cfg.lwip_tcp_tmr_interval);
        entries[128] = sdkconfig.Entry.int("CONFIG_LWIP_TCP_WND_DEFAULT", cfg.lwip_tcp_wnd_default);
        entries[129] = sdkconfig.Entry.flag("CONFIG_LWIP_TIMERS_ONDEMAND", cfg.lwip_timers_ondemand);
        entries[130] = sdkconfig.Entry.int("CONFIG_LWIP_UDP_RECVMBOX_SIZE", cfg.lwip_udp_recvmbox_size);
        entries[131] = sdkconfig.Entry.flag("CONFIG_LWIP_USE_ONLY_LWIP_SELECT", cfg.lwip_use_only_lwip_select);
        entries[132] = sdkconfig.Entry.flag("CONFIG_PPP_SUPPORT", cfg.ppp_support);
        entries[133] = sdkconfig.Entry.int("CONFIG_UDP_RECVMBOX_SIZE", cfg.udp_recvmbox_size);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
