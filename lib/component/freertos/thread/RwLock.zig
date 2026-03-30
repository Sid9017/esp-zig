const embed = @import("embed");
const binding = @import("../binding.zig");
const Mutex = @import("Mutex.zig");

const Handle = binding.Handle;
const pd_true = binding.pd_true;

const uninitialized: usize = 0;
const initializing: usize = 1;

state_lock: Mutex = .{},
writer_gate_bits: embed.atomic.Value(usize) = embed.atomic.Value(usize).init(uninitialized),
readers: usize = 0,

const RwLock = @This();

pub fn lockShared(self: *RwLock) void {
    self.state_lock.lock();
    defer self.state_lock.unlock();

    if (self.readers == 0) {
        self.lockWriterGate();
    }
    self.readers += 1;
}

pub fn unlockShared(self: *RwLock) void {
    self.state_lock.lock();
    defer self.state_lock.unlock();

    self.readers -= 1;
    if (self.readers == 0) {
        self.unlockWriterGate();
    }
}

pub fn lock(self: *RwLock) void {
    self.lockWriterGate();
}

pub fn unlock(self: *RwLock) void {
    self.unlockWriterGate();
}

pub fn tryLockShared(self: *RwLock) bool {
    if (!self.state_lock.tryLock()) return false;
    defer self.state_lock.unlock();

    if (self.readers == 0 and !self.tryLockWriterGate()) {
        return false;
    }
    self.readers += 1;
    return true;
}

pub fn tryLock(self: *RwLock) bool {
    return self.tryLockWriterGate();
}

fn lockWriterGate(self: *RwLock) void {
    const handle = self.ensureWriterGate();
    while (binding.espz_semaphore_take(handle, binding.max_delay) != pd_true) {}
}

fn unlockWriterGate(self: *RwLock) void {
    const handle = self.currentWriterGate() orelse unreachable;
    _ = binding.espz_semaphore_give(handle);
}

fn tryLockWriterGate(self: *RwLock) bool {
    const handle = self.ensureWriterGate();
    return binding.espz_semaphore_take(handle, 0) == pd_true;
}

fn ensureWriterGate(self: *RwLock) Handle {
    while (true) {
        const bits = self.writer_gate_bits.load(.acquire);
        switch (bits) {
            uninitialized => {
                if (self.writer_gate_bits.cmpxchgWeak(uninitialized, initializing, .acq_rel, .acquire) == null) {
                    const handle = binding.espz_semaphore_create_binary() orelse
                        @panic("freertos.thread.RwLock: xSemaphoreCreateBinary failed");
                    if (binding.espz_semaphore_give(handle) != pd_true) {
                        @panic("freertos.thread.RwLock: initial give failed");
                    }
                    self.writer_gate_bits.store(@intFromPtr(handle), .release);
                    return handle;
                }
            },
            initializing => binding.espz_freertos_thread_yield(),
            else => return @ptrFromInt(bits),
        }
    }
}

fn currentWriterGate(self: *RwLock) Handle {
    const bits = self.writer_gate_bits.load(.acquire);
    return switch (bits) {
        uninitialized, initializing => null,
        else => @ptrFromInt(bits),
    };
}
