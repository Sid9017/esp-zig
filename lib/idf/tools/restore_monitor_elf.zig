// Host tool that restores the ELF file path expected by ESP-IDF monitor.
// Outputs the destination ELF copy when a fresh build artifact exists, and
// otherwise preserves an already-present destination file for monitoring.
const std = @import("std");

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len != 3) {
        std.debug.print(
            "usage: restore_monitor_elf <source_elf> <dest_elf>\n",
            .{},
        );
        return error.InvalidArgs;
    }

    try restoreElf(args[1], args[2]);
}

fn restoreElf(source_path: []const u8, dest_path: []const u8) !void {
    copyFile(source_path, dest_path) catch |err| switch (err) {
        error.FileNotFound => {
            if (fileExists(dest_path)) return;
            return err;
        },
        else => return err,
    };
}

fn copyFile(source_path: []const u8, dest_path: []const u8) !void {
    try ensureParentDir(dest_path);

    const source = if (std.fs.path.isAbsolute(source_path))
        try std.fs.openFileAbsolute(source_path, .{})
    else
        try std.fs.cwd().openFile(source_path, .{});
    defer source.close();

    const dest = if (std.fs.path.isAbsolute(dest_path))
        try std.fs.createFileAbsolute(dest_path, .{ .truncate = true })
    else
        try std.fs.cwd().createFile(dest_path, .{ .truncate = true });
    defer dest.close();

    var buf: [4096]u8 = undefined;
    while (true) {
        const n = try source.read(&buf);
        if (n == 0) break;
        try dest.writeAll(buf[0..n]);
    }
}

fn fileExists(path: []const u8) bool {
    const file = if (std.fs.path.isAbsolute(path))
        std.fs.openFileAbsolute(path, .{})
    else
        std.fs.cwd().openFile(path, .{});
    const opened = file catch |err| switch (err) {
        error.FileNotFound => return false,
        else => return false,
    };
    opened.close();
    return true;
}

fn ensureParentDir(path: []const u8) !void {
    if (std.fs.path.dirname(path)) |dir_name| {
        try std.fs.cwd().makePath(dir_name);
    }
}
