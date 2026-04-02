# lcd_solid

在 **H106-S3-TIGA-V4** 板（引脚与 SPI 与 `~/haivivi/x/c/esp/h106/bsp/H106_TIGA_V4_board` 对齐）上，用 **ESP-IDF `esp_lcd` + ST7789** 做 **全屏 RGB565 纯色**演示：不依赖 LVGL，Zig 入口为 `zig_esp_main`，屏驱与填色当前在 `st7789_helper/lcd_st7789.c`。

## 构建

在本目录执行（需已配置 `IDF_PATH`，与仓库其他 ESP 工程相同）：

```bash
zig build
zig build flash
# 或 zig build flash_monitor -Dport=...
```

可选：`-Dbuild_config=board/h106_tiga_v4/build_config.zig`（与默认一致）。

固件工程名 / 产物前缀为 **`lcd_solid`**；IDF 侧 C 组件名为 **`lcd_st7789`**；C 源码在 **`st7789_helper/lcd_st7789.c`**。

## 背光亮、画面全黑（已处理）

`esp_lcd_panel_dev_config_t` 若未设置 **`data_endian`**，默认为 **`LCD_RGB_DATA_ENDIAN_BIG`**，而 CPU 里 `uint16_t` RGB565 按**小端**排布，与 ST7789 SPI 期望不一致时会出现全黑或异常色。H106 官方 `main/test_lcd.c` 在 `draw_bitmap` 前对缓冲区做了 **`swap_rgb565_bytes`**，等价于在面板配置里使用 **`LCD_RGB_DATA_ENDIAN_LITTLE`**（本工程已在 `st7789_helper/lcd_st7789.c` 的 `panel_config` 中设置）。

## 下一步（Zig 封装路线）

1. **`lib/component/st7789/binding.zig`**  
   集中 `@cImport`（或等价方式）导出 `esp_lcd`、`spi_master`、`gpio`、`ledc`、`freertos` 等与 ST7789 相关的 C API，保持「binding 与 Zig 风格封装分层」。

2. **补齐 Zig 编译时的 IDF 头路径**  
   在 **`addApp` 的 entry 模块**（`zig_entry` 对应的 `root_module`）或 **独立 object** 上，把与 `idf.py` 一致的 include 链接上（含 `sdkconfig.h` / 生成目录），使 `binding.zig` 能在 **交叉编译 Zig 目标** 时通过翻译单元解析，而不是只靠 GCC 编 C。

3. **逐步迁移 `st7789_helper/lcd_st7789.c`**  
   按调用顺序把初始化、背光、条带 `draw_bitmap` 等挪进 Zig（调用 `binding` + 项目内错误集）；C 可缩成极薄胶水或删除，直至 `test/lcd_solid` 仅依赖 `esp_binding.st7789`（或等价模块）。

4. **板级**  
   继续用 `board/h106_tiga_v4/` 的 `bsp.zig` / `build_config.zig` 表达引脚与 sdkconfig；多板时再抽通用 `St7789Config` 由 comptime 注入。

与 `~/haivivi/docs/architecture.md` 一致：平台相关在 **esp-zig `lib/component/`**，`binding.zig` 与上层 Zig API 分离。
