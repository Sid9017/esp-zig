const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_driver_spi";

pub const Config = struct {
    /// Kconfig key: `CONFIG_SPI_MASTER_IN_IRAM`.
    /// Controls whether SPI master IN IRAM is enabled for the `esp_driver_spi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spi_master_in_iram: bool = false,
    /// Kconfig key: `CONFIG_SPI_MASTER_ISR_IN_IRAM`.
    /// Controls whether SPI master ISR IN IRAM is enabled for the `esp_driver_spi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_master_isr_in_iram: bool = true,
    /// Kconfig key: `CONFIG_SPI_SLAVE_IN_IRAM`.
    /// Controls whether SPI slave IN IRAM is enabled for the `esp_driver_spi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    spi_slave_in_iram: bool = false,
    /// Kconfig key: `CONFIG_SPI_SLAVE_ISR_IN_IRAM`.
    /// Controls whether SPI slave ISR IN IRAM is enabled for the `esp_driver_spi` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    spi_slave_isr_in_iram: bool = true,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 4);
        entries[0] = sdkconfig.Entry.flag("CONFIG_SPI_MASTER_IN_IRAM", cfg.spi_master_in_iram);
        entries[1] = sdkconfig.Entry.flag("CONFIG_SPI_MASTER_ISR_IN_IRAM", cfg.spi_master_isr_in_iram);
        entries[2] = sdkconfig.Entry.flag("CONFIG_SPI_SLAVE_IN_IRAM", cfg.spi_slave_in_iram);
        entries[3] = sdkconfig.Entry.flag("CONFIG_SPI_SLAVE_ISR_IN_IRAM", cfg.spi_slave_isr_in_iram);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
