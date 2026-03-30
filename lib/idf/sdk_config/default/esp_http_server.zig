const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_http_server";

pub const Config = struct {
    /// Kconfig key: `CONFIG_HTTPD_ERR_RESP_NO_DELAY`.
    /// Controls whether httpd ERR RESP NO delay is enabled for the `esp_http_server` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    httpd_err_resp_no_delay: bool = true,
    /// Kconfig key: `CONFIG_HTTPD_LOG_PURGE_DATA`.
    /// Controls whether httpd LOG purge DATA is enabled for the `esp_http_server` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    httpd_log_purge_data: bool = false,
    /// Kconfig key: `CONFIG_HTTPD_MAX_REQ_HDR_LEN`.
    /// Sets the numeric value for httpd MAX REQ HDR LEN in the `esp_http_server` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `512`.
    httpd_max_req_hdr_len: i64 = 512,
    /// Kconfig key: `CONFIG_HTTPD_MAX_URI_LEN`.
    /// Sets the numeric value for httpd MAX URI LEN in the `esp_http_server` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `512`.
    httpd_max_uri_len: i64 = 512,
    /// Kconfig key: `CONFIG_HTTPD_PURGE_BUF_LEN`.
    /// Sets the numeric value for httpd purge BUF LEN in the `esp_http_server` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `32`.
    httpd_purge_buf_len: i64 = 32,
    /// Kconfig key: `CONFIG_HTTPD_QUEUE_WORK_BLOCKING`.
    /// Controls whether httpd queue WORK blocking is enabled for the `esp_http_server` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    httpd_queue_work_blocking: bool = false,
    /// Kconfig key: `CONFIG_HTTPD_SERVER_EVENT_POST_TIMEOUT`.
    /// Sets the numeric value for httpd server event POST timeout in the `esp_http_server` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `2000`.
    httpd_server_event_post_timeout: i64 = 2000,
    /// Kconfig key: `CONFIG_HTTPD_WS_SUPPORT`.
    /// Controls whether httpd WS support is enabled for the `esp_http_server` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    httpd_ws_support: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 8);
        entries[0] = sdkconfig.Entry.flag("CONFIG_HTTPD_ERR_RESP_NO_DELAY", cfg.httpd_err_resp_no_delay);
        entries[1] = sdkconfig.Entry.flag("CONFIG_HTTPD_LOG_PURGE_DATA", cfg.httpd_log_purge_data);
        entries[2] = sdkconfig.Entry.int("CONFIG_HTTPD_MAX_REQ_HDR_LEN", cfg.httpd_max_req_hdr_len);
        entries[3] = sdkconfig.Entry.int("CONFIG_HTTPD_MAX_URI_LEN", cfg.httpd_max_uri_len);
        entries[4] = sdkconfig.Entry.int("CONFIG_HTTPD_PURGE_BUF_LEN", cfg.httpd_purge_buf_len);
        entries[5] = sdkconfig.Entry.flag("CONFIG_HTTPD_QUEUE_WORK_BLOCKING", cfg.httpd_queue_work_blocking);
        entries[6] = sdkconfig.Entry.int("CONFIG_HTTPD_SERVER_EVENT_POST_TIMEOUT", cfg.httpd_server_event_post_timeout);
        entries[7] = sdkconfig.Entry.flag("CONFIG_HTTPD_WS_SUPPORT", cfg.httpd_ws_support);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
