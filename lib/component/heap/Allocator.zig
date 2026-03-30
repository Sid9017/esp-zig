const embed = @import("embed");
const binding = @import("binding.zig");

pub const Caps = enum {
    internal,
    spiram,
    internal_8bit,
    spiram_8bit,
};

pub const Alignment = enum {
    natural,
    align_u32,
};

pub const Padding = enum {
    none,
    freertos_stack,
};

pub const Options = struct {
    caps: Caps,
    alignment: Alignment = .natural,
    padding: Padding = .none,
};

pub fn Allocator(comptime options: Options) embed.mem.Allocator {
    return allocatorFromCapsProvider(options);
}

fn allocatorFromCapsProvider(comptime options: Options) embed.mem.Allocator {
    const Impl = struct {
        fn alloc(_: *anyopaque, len: usize, requested_alignment: embed.mem.Alignment, ret_addr: usize) ?[*]u8 {
            _ = ret_addr;

            const effective_alignment = requiredAlignmentBytes(requested_alignment, options.alignment);
            const effective_len = paddedSize(len, options.padding) orelse return null;
            const resolved_caps = resolveCaps(options.caps);
            const raw = if (effective_alignment <= 1)
                binding.espz_heap_caps_malloc(effective_len, resolved_caps)
            else
                binding.espz_heap_caps_aligned_alloc(effective_alignment, effective_len, resolved_caps);

            const ptr = raw orelse return null;
            return @ptrCast(ptr);
        }

        fn resize(
            _: *anyopaque,
            memory: []u8,
            requested_alignment: embed.mem.Alignment,
            new_len: usize,
            ret_addr: usize,
        ) bool {
            _ = requested_alignment;
            _ = ret_addr;
            return new_len <= memory.len;
        }

        fn remap(
            _: *anyopaque,
            memory: []u8,
            requested_alignment: embed.mem.Alignment,
            new_len: usize,
            ret_addr: usize,
        ) ?[*]u8 {
            _ = requested_alignment;
            _ = ret_addr;
            if (new_len <= memory.len) return memory.ptr;
            return null;
        }

        fn free(_: *anyopaque, memory: []u8, requested_alignment: embed.mem.Alignment, ret_addr: usize) void {
            _ = requested_alignment;
            _ = ret_addr;
            binding.espz_heap_caps_free(memory.ptr);
        }

        const vtable: embed.mem.Allocator.VTable = .{
            .alloc = alloc,
            .resize = resize,
            .remap = remap,
            .free = free,
        };
    };

    return .{
        .ptr = undefined,
        .vtable = &Impl.vtable,
    };
}

fn requiredAlignmentBytes(
    requested_alignment: embed.mem.Alignment,
    comptime alignment: Alignment,
) usize {
    const requested = requested_alignment.toByteUnits();
    const minimum = comptime minimumAlignmentBytes(alignment);
    return @max(requested, minimum);
}

fn minimumAlignmentBytes(comptime alignment: Alignment) usize {
    return switch (alignment) {
        .natural => 1,
        .align_u32 => @alignOf(u32),
    };
}

fn paddedSize(len: usize, comptime padding: Padding) ?usize {
    return switch (padding) {
        .none => len,
        .freertos_stack => blk: {
            if (len == 0) break :blk 0;
            if (len > embed.math.maxInt(u32)) break :blk null;
            const aligned = binding.espz_heap_align_freertos_stack_size_bytes(@intCast(len));
            if (aligned == 0) break :blk null;
            break :blk aligned;
        },
    };
}

fn resolveCaps(comptime caps: Caps) u32 {
    return switch (caps) {
        .internal => binding.espz_heap_cap_internal,
        .spiram => binding.espz_heap_cap_spiram,
        .internal_8bit => binding.espz_heap_cap_internal | binding.espz_heap_cap_8bit,
        .spiram_8bit => binding.espz_heap_cap_spiram | binding.espz_heap_cap_8bit,
    };
}
