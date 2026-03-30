const embed = @import("embed");
const binding = @import("binding.zig");
const Thread = @import("../freertos/Thread.zig");

const ns_per_ms: i128 = 1_000_000;
const ns_per_s: i128 = 1_000_000_000;
const ns_per_s_u64: u64 = 1_000_000_000;
const ns_per_ms_i64: i64 = 1_000_000;
const ms_per_s: i64 = 1_000;
const max_i64: i64 = 9_223_372_036_854_775_807;

var cache_lock: Thread.Mutex = .{};
var last_good_ns: u64 = 0;
var last_good_ms: u64 = 0;

const Sample = struct {
    ns: u64,
    ms: u64,
};

pub fn milliTimestamp() i64 {
    const sample = readMonotonic() orelse return @intCast(loadCachedMs());
    return @intCast(sample.ms);
}

pub fn nanoTimestamp() i128 {
    const sample = readMonotonic() orelse return loadCachedNs();
    return sample.ns;
}

fn readMonotonic() ?Sample {
    var ts: binding.timespec = undefined;
    if (binding.espz_newlib_clock_gettime_monotonic(&ts) != 0) {
        return null;
    }

    const ns = timespecToNano(ts);
    const ms = timespecToMilli(ts);
    const cached_ns = updateMax(&last_good_ns, ns);
    const cached_ms = updateMax(&last_good_ms, ms);
    return .{
        .ns = cached_ns,
        .ms = cached_ms,
    };
}

fn loadCachedMs() u64 {
    cache_lock.lock();
    defer cache_lock.unlock();
    return last_good_ms;
}

fn loadCachedNs() u64 {
    cache_lock.lock();
    defer cache_lock.unlock();
    return last_good_ns;
}

fn updateMax(value: *u64, candidate: u64) u64 {
    cache_lock.lock();
    defer cache_lock.unlock();
    if (candidate > value.*) {
        value.* = candidate;
    }
    return value.*;
}

fn timespecToNano(ts: binding.timespec) u64 {
    if (ts.tv_sec <= 0) return @intCast(@max(ts.tv_nsec, 0));

    const sec: u64 = @intCast(ts.tv_sec);
    const nsec: u64 = @intCast(@max(ts.tv_nsec, 0));
    if (sec >= @divFloor(embed.math.maxInt(u64) - nsec, ns_per_s_u64)) {
        return embed.math.maxInt(u64);
    }
    return sec * ns_per_s_u64 + nsec;
}

fn timespecToMilli(ts: binding.timespec) u64 {
    const sec: i64 = ts.tv_sec;
    const sub_ms = @divFloor(@as(i64, ts.tv_nsec), ns_per_ms_i64);

    if (sec <= 0) return @intCast(@max(sub_ms, 0));
    if (sec >= @divFloor(max_i64 - sub_ms, ms_per_s)) return max_i64;
    return @intCast(sec * ms_per_s + sub_ms);
}
