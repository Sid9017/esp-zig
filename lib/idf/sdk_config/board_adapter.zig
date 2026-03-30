const std = @import("std");
const esp_idf = @import("esp_idf");
const schema = esp_idf.sdkconfig;
const PartitionTable = esp_idf.PartitionTable;
const profile = @import("app_sdkconfig_profile");

comptime {
    ensureProfileDecl("board");
    ensureProfileDecl("partition_table");
    ensureProfileDecl("config");
    ensureBoardValue(@TypeOf(profile.board));
    ensurePartitionTableValue(@TypeOf(profile.partition_table));
    ensureConfigValue(@TypeOf(profile.config));
}

pub fn collectModuleDocs(
    allocator: std.mem.Allocator,
    partition_csv_filename: []const u8,
) ![]schema.ModuleDoc {
    const table = partitionTable();
    validatePartitionTable(table);

    var docs = std.array_list.Managed(schema.ModuleDoc).init(allocator);
    errdefer docs.deinit();

    try appendConfigDocs(allocator, &docs, partition_csv_filename, table.offset);
    try appendUserConfigDocs(allocator, &docs);
    try appendBoardDoc(allocator, &docs, profile.board);

    return docs.toOwnedSlice();
}

pub fn renderPartitionCsv(allocator: std.mem.Allocator) ![]u8 {
    const table = partitionTable();
    validatePartitionTable(table);
    const resolved = try PartitionTable.resolveEntriesAlloc(allocator, table);
    defer allocator.free(resolved);
    return PartitionTable.renderCsv(allocator, resolved);
}

fn appendConfigDocs(
    allocator: std.mem.Allocator,
    docs: *std.array_list.Managed(schema.ModuleDoc),
    partition_csv_filename: []const u8,
    partition_offset: u32,
) !void {
    const merged_cfg = profile.config;

    const offset_str = try std.fmt.allocPrint(allocator, "0x{x}", .{partition_offset});

    inline for (esp_idf.SdkConfig.required_field_names) |field_name| {
        var val = @field(merged_cfg, field_name);
        const ValType = @TypeOf(val);
        if (@hasDecl(ValType, "appendModuleDoc")) {
            patchPartitionFields(&val, partition_csv_filename, offset_str);
            patchFlashAfterFields(&val);
            try ValType.appendModuleDoc(allocator, docs, val);
        }
    }
}

fn appendUserConfigDocs(
    allocator: std.mem.Allocator,
    docs: *std.array_list.Managed(schema.ModuleDoc),
) !void {
    inline for (@typeInfo(@TypeOf(profile.config)).@"struct".fields) |field| {
        if (comptime esp_idf.SdkConfig.isCoreField(field.name) or esp_idf.SdkConfig.isReservedField(field.name)) continue;
        const val = @field(profile.config, field.name);
        const ValType = @TypeOf(val);
        try ValType.appendModuleDoc(allocator, docs, val);
    }
}

fn patchPartitionFields(val: anytype, csv_filename: []const u8, offset_str: []const u8) void {
    const ValType = @TypeOf(val.*);
    if (@hasField(ValType, "partition_table_custom_filename")) {
        val.partition_table_custom_filename = csv_filename;
    }
    if (@hasField(ValType, "partition_table_filename")) {
        val.partition_table_filename = csv_filename;
    }
    if (@hasField(ValType, "partition_table_offset_hex")) {
        val.partition_table_offset_hex = offset_str;
    }
    if (@hasField(ValType, "partition_table_offset")) {
        val.partition_table_offset = offset_str;
    }
    if (@hasField(ValType, "partition_table_custom")) {
        val.partition_table_custom = true;
    }
}

fn patchFlashAfterFields(val: anytype) void {
    const ValType = @TypeOf(val.*);
    if (@hasField(ValType, "esptoolpy_after")) {
        val.esptoolpy_after = "no_reset";
    }
    if (@hasField(ValType, "esptoolpy_after_noreset")) {
        val.esptoolpy_after_noreset = true;
    }
    if (@hasField(ValType, "esptoolpy_after_reset")) {
        val.esptoolpy_after_reset = false;
    }
}

fn appendBoardDoc(
    allocator: std.mem.Allocator,
    docs: *std.array_list.Managed(schema.ModuleDoc),
    board_cfg: anytype,
) std.mem.Allocator.Error!void {
    const entries = try allocator.alloc(schema.Entry, 4);
    entries[0] = schema.Entry.flag(board_cfg.target_arch_config_flag, true);
    entries[1] = schema.Entry.str("CONFIG_IDF_TARGET_ARCH", board_cfg.target_arch);
    entries[2] = schema.Entry.str("CONFIG_IDF_TARGET", board_cfg.chip);
    entries[3] = schema.Entry.flag(board_cfg.target_config_flag, true);

    try docs.append(.{
        .name = board_cfg.name,
        .entries = entries,
    });
}

fn partitionTable() PartitionTable {
    return profile.partition_table;
}

fn validatePartitionTable(table: PartitionTable) void {
    PartitionTable.validateEntries(table.entries) catch {
        @panic("partition table must include a valid app partition and use matching app/data subtypes");
    };
}

fn ensureProfileDecl(comptime decl_name: []const u8) void {
    if (!@hasDecl(profile, decl_name)) {
        @compileError(std.fmt.comptimePrint(
            "build_config must define `pub const {s}`",
            .{decl_name},
        ));
    }
}

fn ensurePartitionTableValue(comptime TableType: type) void {
    if (TableType != PartitionTable) {
        @compileError(std.fmt.comptimePrint(
            "build_config partition_table must be {s}",
            .{@typeName(PartitionTable)},
        ));
    }
}

fn ensureBoardValue(comptime BoardType: type) void {
    ensureFieldType(BoardType, "name", []const u8);
    ensureFieldType(BoardType, "chip", []const u8);
    ensureFieldType(BoardType, "target_arch", []const u8);
    ensureFieldType(BoardType, "target_arch_config_flag", []const u8);
    ensureFieldType(BoardType, "target_config_flag", []const u8);

    if (@hasField(BoardType, "psram_enabled")) {
        @compileError(
            "board.psram_enabled is deprecated; configure CONFIG_SPIRAM via esp_psram module config",
        );
    }
}

fn ensureConfigValue(comptime ConfigType: type) void {
    const info = @typeInfo(ConfigType);
    switch (info) {
        .@"struct" => |struct_info| {
            inline for (struct_info.fields) |field| {
                if (esp_idf.SdkConfig.isReservedField(field.name)) continue;
                ensureConfigField(field.name, field.type);
            }
        },
        else => @compileError(std.fmt.comptimePrint(
            "build_config config must be a struct literal, found {s}",
            .{@typeName(ConfigType)},
        )),
    }
}

fn ensureConfigField(comptime field_name: []const u8, comptime FieldType: type) void {
    if (!@hasDecl(FieldType, "appendModuleDoc")) {
        @compileError(std.fmt.comptimePrint(
            "build_config config.{s} must provide appendModuleDoc()",
            .{field_name},
        ));
    }

    if (esp_idf.SdkConfig.isCoreField(field_name)) {
        const ExpectedType = esp_idf.SdkConfig.coreFieldType(field_name);
        if (FieldType != ExpectedType) {
            @compileError(std.fmt.comptimePrint(
                "build_config config.{s} must be {s} to override the core config field",
                .{ field_name, @typeName(ExpectedType) },
            ));
        }
    }
}

fn ensureFieldType(comptime Container: type, comptime field_name: []const u8, comptime Expected: type) void {
    if (!@hasField(Container, field_name)) {
        @compileError(std.fmt.comptimePrint(
            "build_config board is missing required field '{s}'",
            .{field_name},
        ));
    }

    const field_type = @FieldType(Container, field_name);
    if (field_type != Expected) {
        @compileError(std.fmt.comptimePrint(
            "board.{s} type mismatch: expected {s}, found {s}",
            .{ field_name, @typeName(Expected), @typeName(field_type) },
        ));
    }
}
