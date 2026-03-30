const allocator_mod = @import("heap/Allocator.zig");

pub const Allocator = allocator_mod.Allocator;
pub const Caps = allocator_mod.Caps;
pub const Alignment = allocator_mod.Alignment;
pub const Padding = allocator_mod.Padding;
pub const Options = allocator_mod.Options;

pub inline fn pageSize() usize {
    // ESP heap is not paged; byte granularity satisfies embed's heap contract.
    return 1;
}
