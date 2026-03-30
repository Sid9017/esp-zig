const std = @import("std");

const metadata_field_name = "__idf";

const Self = @This();

/// Declares the built-in sdkconfig requirements for all IDF-internal components.
/// Each field maps to `lib/idf/sdk_config/default/<name>.zig`.
const RequiredConfig = struct {
    app_trace: @import("sdk_config/default/app_trace.zig").Config = .{},
    bootloader: @import("sdk_config/default/bootloader.zig").Config = .{},
    bt: @import("sdk_config/default/bt.zig").Config = .{},
    console: @import("sdk_config/default/console.zig").Config = .{},
    driver: @import("sdk_config/default/driver.zig").Config = .{},
    efuse: @import("sdk_config/default/efuse.zig").Config = .{},
    esp_adc: @import("sdk_config/default/esp_adc.zig").Config = .{},
    esp_app_format: @import("sdk_config/default/esp_app_format.zig").Config = .{},
    esp_coex: @import("sdk_config/default/esp_coex.zig").Config = .{},
    esp_driver_gpio: @import("sdk_config/default/esp_driver_gpio.zig").Config = .{},
    esp_driver_gptimer: @import("sdk_config/default/esp_driver_gptimer.zig").Config = .{},
    esp_driver_i2c: @import("sdk_config/default/esp_driver_i2c.zig").Config = .{},
    esp_driver_i2s: @import("sdk_config/default/esp_driver_i2s.zig").Config = .{},
    esp_driver_ledc: @import("sdk_config/default/esp_driver_ledc.zig").Config = .{},
    esp_driver_mcpwm: @import("sdk_config/default/esp_driver_mcpwm.zig").Config = .{},
    esp_driver_pcnt: @import("sdk_config/default/esp_driver_pcnt.zig").Config = .{},
    esp_driver_rmt: @import("sdk_config/default/esp_driver_rmt.zig").Config = .{},
    esp_driver_sdm: @import("sdk_config/default/esp_driver_sdm.zig").Config = .{},
    esp_driver_spi: @import("sdk_config/default/esp_driver_spi.zig").Config = .{},
    esp_driver_touch_sens: @import("sdk_config/default/esp_driver_touch_sens.zig").Config = .{},
    esp_driver_tsens: @import("sdk_config/default/esp_driver_tsens.zig").Config = .{},
    esp_driver_uart: @import("sdk_config/default/esp_driver_uart.zig").Config = .{},
    esp_eth: @import("sdk_config/default/esp_eth.zig").Config = .{},
    esp_event: @import("sdk_config/default/esp_event.zig").Config = .{},
    esp_gdbstub: @import("sdk_config/default/esp_gdbstub.zig").Config = .{},
    esp_http_client: @import("sdk_config/default/esp_http_client.zig").Config = .{},
    esp_http_server: @import("sdk_config/default/esp_http_server.zig").Config = .{},
    esp_https_ota: @import("sdk_config/default/esp_https_ota.zig").Config = .{},
    esp_https_server: @import("sdk_config/default/esp_https_server.zig").Config = .{},
    esp_hw_support: @import("sdk_config/default/esp_hw_support.zig").Config = .{},
    esp_lcd: @import("sdk_config/default/esp_lcd.zig").Config = .{},
    esp_mm: @import("sdk_config/default/esp_mm.zig").Config = .{},
    esp_netif: @import("sdk_config/default/esp_netif.zig").Config = .{},
    esp_phy: @import("sdk_config/default/esp_phy.zig").Config = .{},
    esp_pm: @import("sdk_config/default/esp_pm.zig").Config = .{},
    esp_psram: @import("sdk_config/default/esp_psram.zig").Config = .{},
    esp_security: @import("sdk_config/default/esp_security.zig").Config = .{},
    esp_system: @import("sdk_config/default/esp_system.zig").Config = .{},
    esp_timer: @import("sdk_config/default/esp_timer.zig").Config = .{},
    esp_wifi: @import("sdk_config/default/esp_wifi.zig").Config = .{},
    espcoredump: @import("sdk_config/default/espcoredump.zig").Config = .{},
    esptool_py: @import("sdk_config/default/esptool_py.zig").Config = .{},
    fatfs: @import("sdk_config/default/fatfs.zig").Config = .{},
    freertos: @import("sdk_config/default/freertos.zig").Config = .{},
    hal: @import("sdk_config/default/hal.zig").Config = .{},
    heap: @import("sdk_config/default/heap.zig").Config = .{},
    log: @import("sdk_config/default/log.zig").Config = .{},
    lwip: @import("sdk_config/default/lwip.zig").Config = .{},
    mbedtls: @import("sdk_config/default/mbedtls.zig").Config = .{},
    mqtt: @import("sdk_config/default/mqtt.zig").Config = .{},
    newlib: @import("sdk_config/default/newlib.zig").Config = .{},
    nvs_flash: @import("sdk_config/default/nvs_flash.zig").Config = .{},
    openthread: @import("sdk_config/default/openthread.zig").Config = .{},
    partition_table: @import("sdk_config/default/partition_table.zig").Config = .{},
    pthread: @import("sdk_config/default/pthread.zig").Config = .{},
    soc: @import("sdk_config/default/soc.zig").Config = .{},
    spi_flash: @import("sdk_config/default/spi_flash.zig").Config = .{},
    spiffs: @import("sdk_config/default/spiffs.zig").Config = .{},
    tcp_transport: @import("sdk_config/default/tcp_transport.zig").Config = .{},
    ulp: @import("sdk_config/default/ulp.zig").Config = .{},
    unity: @import("sdk_config/default/unity.zig").Config = .{},
    usb: @import("sdk_config/default/usb.zig").Config = .{},
    vfs: @import("sdk_config/default/vfs.zig").Config = .{},
    wear_levelling: @import("sdk_config/default/wear_levelling.zig").Config = .{},
    wpa_supplicant: @import("sdk_config/default/wpa_supplicant.zig").Config = .{},
};

pub const required_field_names = blk: {
    const fields = @typeInfo(RequiredConfig).@"struct".fields;
    var names: [fields.len][]const u8 = undefined;
    for (fields, 0..) |field, idx| {
        names[idx] = field.name;
    }
    break :blk names;
};

pub fn make(comptime overrides: anytype) MergedType(@TypeOf(overrides)) {
    const Overrides = @TypeOf(overrides);
    validateOverrideType(Overrides);

    var merged: MergedType(Overrides) = undefined;
    const required_config: RequiredConfig = .{};

    inline for (@typeInfo(RequiredConfig).@"struct".fields) |field| {
        @field(merged, field.name) = if (@hasField(Overrides, field.name))
            std.mem.zeroInit(field.type, @field(overrides, field.name))
        else
            @field(required_config, field.name);
    }

    inline for (@typeInfo(Overrides).@"struct".fields) |field| {
        if (comptime isCoreField(field.name) or isMetadataField(field.name)) continue;
        @field(merged, field.name) = @field(overrides, field.name);
    }

    @field(merged, metadata_field_name) = .{};
    return merged;
}

pub fn isCoreField(comptime field_name: []const u8) bool {
    return @hasField(RequiredConfig, field_name);
}

pub fn isReservedField(comptime field_name: []const u8) bool {
    return std.mem.eql(u8, field_name, metadata_field_name);
}

pub fn coreFieldType(comptime field_name: []const u8) type {
    if (!isCoreField(field_name)) {
        @compileError(std.fmt.comptimePrint(
            "'{s}' is not an esp_idf.SdkConfig core field",
            .{field_name},
        ));
    }
    return @FieldType(RequiredConfig, field_name);
}

pub fn coreOverrideNames(comptime config: anytype) []const []const u8 {
    const ConfigType = @TypeOf(config);
    if (@hasField(ConfigType, metadata_field_name)) {
        return @TypeOf(@field(config, metadata_field_name)).core_override_names[0..];
    }

    return coreOverrideNamesFromType(ConfigType)[0..];
}

fn MergedType(comptime Overrides: type) type {
    validateOverrideType(Overrides);

    const core_fields = @typeInfo(RequiredConfig).@"struct".fields;
    const override_fields = @typeInfo(Overrides).@"struct".fields;
    const extra_field_count = comptime countExtraFields(Overrides);
    var fields: [core_fields.len + extra_field_count + 1]std.builtin.Type.StructField = undefined;

    inline for (core_fields, 0..) |field, idx| {
        fields[idx] = .{
            .name = field.name,
            .type = field.type,
            .default_value_ptr = null,
            .is_comptime = false,
            .alignment = @alignOf(field.type),
        };
    }

    var next_idx = core_fields.len;
    inline for (override_fields) |field| {
        if (isCoreField(field.name) or isMetadataField(field.name)) continue;
        fields[next_idx] = .{
            .name = field.name,
            .type = field.type,
            .default_value_ptr = null,
            .is_comptime = false,
            .alignment = @alignOf(field.type),
        };
        next_idx += 1;
    }

    fields[next_idx] = .{
        .name = metadata_field_name,
        .type = Metadata(Overrides),
        .default_value_ptr = null,
        .is_comptime = false,
        .alignment = @alignOf(Metadata(Overrides)),
    };

    return @Type(.{
        .@"struct" = .{
            .layout = .auto,
            .fields = &fields,
            .decls = &.{},
            .is_tuple = false,
        },
    });
}

fn Metadata(comptime Overrides: type) type {
    const override_names = coreOverrideNamesFromType(Overrides);
    return struct {
        pub const core_override_names = override_names;

        pub fn hasCoreOverride(comptime field_name: []const u8) bool {
            inline for (core_override_names) |name| {
                if (std.mem.eql(u8, name, field_name)) return true;
            }
            return false;
        }
    };
}

fn validateOverrideType(comptime Overrides: type) void {
    switch (@typeInfo(Overrides)) {
        .@"struct" => {},
        else => @compileError(std.fmt.comptimePrint(
            "esp_idf.SdkConfig.make() expects a struct literal, found {s}",
            .{@typeName(Overrides)},
        )),
    }
}

fn isMetadataField(comptime field_name: []const u8) bool {
    return isReservedField(field_name);
}

fn countExtraFields(comptime Overrides: type) usize {
    var count: usize = 0;
    inline for (@typeInfo(Overrides).@"struct".fields) |field| {
        if (isCoreField(field.name) or isMetadataField(field.name)) continue;
        count += 1;
    }
    return count;
}

fn coreOverrideNamesFromType(comptime Overrides: type) [countCoreOverrides(Overrides)][]const u8 {
    var names: [countCoreOverrides(Overrides)][]const u8 = undefined;
    var idx: usize = 0;
    inline for (@typeInfo(Overrides).@"struct".fields) |field| {
        if (!isCoreField(field.name)) continue;
        names[idx] = field.name;
        idx += 1;
    }
    return names;
}

fn countCoreOverrides(comptime Overrides: type) usize {
    var count: usize = 0;
    inline for (@typeInfo(Overrides).@"struct".fields) |field| {
        if (!isCoreField(field.name)) continue;
        count += 1;
    }
    return count;
}

test "make merges core defaults and preserves extra config" {
    const Custom = struct {
        enabled: bool = true,
    };

    const cfg = Self.make(.{
        .spiffs = .{},
        .custom = Custom{},
    });

    try std.testing.expect(@hasField(@TypeOf(cfg), "mbedtls"));
    try std.testing.expect(@hasField(@TypeOf(cfg), "spiffs"));
    try std.testing.expect(@hasField(@TypeOf(cfg), "custom"));
    try std.testing.expect(@hasField(@TypeOf(cfg), "__idf"));
    try std.testing.expect(@TypeOf(cfg.__idf).hasCoreOverride("spiffs"));
    try std.testing.expect(!@TypeOf(cfg.__idf).hasCoreOverride("mbedtls"));
    try std.testing.expectEqual(true, cfg.custom.enabled);
}

test "make preserves partial core overrides" {
    const cfg = Self.make(.{
        .esp_system = .{
            .main_task_stack_size = 65535,
        },
        .lwip = .{
            .lwip_loopback_max_pbufs = 128,
            .lwip_tcpip_recvmbox_size = 128,
            .lwip_udp_recvmbox_size = 128,
            .udp_recvmbox_size = 128,
        },
    });

    try std.testing.expectEqual(@as(i64, 65535), cfg.esp_system.main_task_stack_size);
    try std.testing.expectEqual(@as(i64, 128), cfg.lwip.lwip_loopback_max_pbufs);
    try std.testing.expectEqual(@as(i64, 128), cfg.lwip.lwip_tcpip_recvmbox_size);
    try std.testing.expectEqual(@as(i64, 128), cfg.lwip.lwip_udp_recvmbox_size);
    try std.testing.expectEqual(@as(i64, 128), cfg.lwip.udp_recvmbox_size);
}
