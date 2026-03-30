const std = @import("std");
const embed = @import("embed");
const lvgl_osal = @import("lvgl_osal");

comptime {
    _ = lvgl_osal.make(embed.make(@import("lvgl_osal_impl")), std.heap.page_allocator);
}
