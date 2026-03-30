const esp_embed = @import("esp_embed");
const lvgl_osal = @import("lvgl_osal");

comptime {
    _ = lvgl_osal.make(esp_embed.std, esp_embed.Allocator(.{
        .caps = .spiram_8bit,
    }));
}
