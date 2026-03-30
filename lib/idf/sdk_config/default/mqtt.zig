const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "mqtt";

pub const Config = struct {
    /// Kconfig key: `CONFIG_MQTT_CUSTOM_OUTBOX`.
    /// Controls whether MQTT custom outbox is enabled for the `mqtt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mqtt_custom_outbox: bool = false,
    /// Kconfig key: `CONFIG_MQTT_MSG_ID_INCREMENTAL`.
    /// Controls whether MQTT MSG ID incremental is enabled for the `mqtt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mqtt_msg_id_incremental: bool = false,
    /// Kconfig key: `CONFIG_MQTT_PROTOCOL_311`.
    /// Controls whether MQTT protocol 311 is enabled for the `mqtt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mqtt_protocol_311: bool = true,
    /// Kconfig key: `CONFIG_MQTT_PROTOCOL_5`.
    /// Controls whether MQTT protocol 5 is enabled for the `mqtt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mqtt_protocol_5: bool = false,
    /// Kconfig key: `CONFIG_MQTT_REPORT_DELETED_MESSAGES`.
    /// Controls whether MQTT report deleted messages is enabled for the `mqtt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mqtt_report_deleted_messages: bool = false,
    /// Kconfig key: `CONFIG_MQTT_SKIP_PUBLISH_IF_DISCONNECTED`.
    /// Controls whether MQTT SKIP publish IF disconnected is enabled for the `mqtt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mqtt_skip_publish_if_disconnected: bool = false,
    /// Kconfig key: `CONFIG_MQTT_TASK_CORE_SELECTION_ENABLED`.
    /// Controls whether MQTT TASK CORE selection enabled is enabled for the `mqtt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mqtt_task_core_selection_enabled: bool = false,
    /// Kconfig key: `CONFIG_MQTT_TRANSPORT_SSL`.
    /// Controls whether MQTT transport SSL is enabled for the `mqtt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mqtt_transport_ssl: bool = true,
    /// Kconfig key: `CONFIG_MQTT_TRANSPORT_WEBSOCKET`.
    /// Controls whether MQTT transport websocket is enabled for the `mqtt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mqtt_transport_websocket: bool = true,
    /// Kconfig key: `CONFIG_MQTT_TRANSPORT_WEBSOCKET_SECURE`.
    /// Controls whether MQTT transport websocket secure is enabled for the `mqtt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mqtt_transport_websocket_secure: bool = true,
    /// Kconfig key: `CONFIG_MQTT_USE_CUSTOM_CONFIG`.
    /// Controls whether MQTT USE custom config is enabled for the `mqtt` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mqtt_use_custom_config: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 11);
        entries[0] = sdkconfig.Entry.flag("CONFIG_MQTT_CUSTOM_OUTBOX", cfg.mqtt_custom_outbox);
        entries[1] = sdkconfig.Entry.flag("CONFIG_MQTT_MSG_ID_INCREMENTAL", cfg.mqtt_msg_id_incremental);
        entries[2] = sdkconfig.Entry.flag("CONFIG_MQTT_PROTOCOL_311", cfg.mqtt_protocol_311);
        entries[3] = sdkconfig.Entry.flag("CONFIG_MQTT_PROTOCOL_5", cfg.mqtt_protocol_5);
        entries[4] = sdkconfig.Entry.flag("CONFIG_MQTT_REPORT_DELETED_MESSAGES", cfg.mqtt_report_deleted_messages);
        entries[5] = sdkconfig.Entry.flag("CONFIG_MQTT_SKIP_PUBLISH_IF_DISCONNECTED", cfg.mqtt_skip_publish_if_disconnected);
        entries[6] = sdkconfig.Entry.flag("CONFIG_MQTT_TASK_CORE_SELECTION_ENABLED", cfg.mqtt_task_core_selection_enabled);
        entries[7] = sdkconfig.Entry.flag("CONFIG_MQTT_TRANSPORT_SSL", cfg.mqtt_transport_ssl);
        entries[8] = sdkconfig.Entry.flag("CONFIG_MQTT_TRANSPORT_WEBSOCKET", cfg.mqtt_transport_websocket);
        entries[9] = sdkconfig.Entry.flag("CONFIG_MQTT_TRANSPORT_WEBSOCKET_SECURE", cfg.mqtt_transport_websocket_secure);
        entries[10] = sdkconfig.Entry.flag("CONFIG_MQTT_USE_CUSTOM_CONFIG", cfg.mqtt_use_custom_config);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
