const embed = @import("embed");
const binding = @import("binding.zig");

const State = struct {
    fn fillBytes(_: *State, buf: []u8) void {
        fill(buf);
    }
};

var state: State = .{};

pub const random = embed.Random.init(&state, State.fillBytes);

pub fn fill(buf: []u8) void {
    if (buf.len == 0) return;
    binding.espz_esp_hw_support_fill_random(buf.ptr, buf.len);
}

pub fn randomU32() u32 {
    return binding.espz_esp_hw_support_random_u32();
}
