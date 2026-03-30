const embed_module = @import("embed");
const context_module = @import("context");
const net_module = @import("net");
const sync_module = @import("sync");
const binding_module = @import("esp_binding");

const impl = struct {
    pub const heap = binding_module.heap;
    pub const Thread = binding_module.freertos.Thread;
    pub const log = binding_module.freertos.Log;
    pub const time = binding_module.newlib.Time;
    pub const crypto = binding_module.mbedtls.Crypto;
    pub const posix = binding_module.posix;
    pub const testing = binding_module.testing;
};

pub const std = embed_module.make(impl);
pub const heap = binding_module.heap;
pub const context = context_module;
pub const net = net_module;
pub const sync = struct {
    pub const Channel = sync_module.Channel(binding_module.freertos.Channel);
    pub const test_runner = sync_module.test_runner;
};
pub const Allocator = binding_module.heap.Allocator;
