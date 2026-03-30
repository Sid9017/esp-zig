const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "esp_eth";

pub const Config = struct {
    /// Kconfig key: `CONFIG_ETH_ENABLED`.
    /// Controls whether ETH enabled is enabled for the `esp_eth` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    eth_enabled: bool = true,
    /// Kconfig key: `CONFIG_ETH_SPI_ETHERNET_DM9051`.
    /// Controls whether ETH SPI ethernet dm9051 is enabled for the `esp_eth` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    eth_spi_ethernet_dm9051: bool = false,
    /// Kconfig key: `CONFIG_ETH_SPI_ETHERNET_KSZ8851SNL`.
    /// Controls whether ETH SPI ethernet ksz8851snl is enabled for the `esp_eth` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    eth_spi_ethernet_ksz8851snl: bool = false,
    /// Kconfig key: `CONFIG_ETH_SPI_ETHERNET_W5500`.
    /// Controls whether ETH SPI ethernet w5500 is enabled for the `esp_eth` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    eth_spi_ethernet_w5500: bool = false,
    /// Kconfig key: `CONFIG_ETH_TRANSMIT_MUTEX`.
    /// Controls whether ETH transmit mutex is enabled for the `esp_eth` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    eth_transmit_mutex: bool = false,
    /// Kconfig key: `CONFIG_ETH_USE_OPENETH`.
    /// Controls whether ETH USE openeth is enabled for the `esp_eth` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    eth_use_openeth: bool = false,
    /// Kconfig key: `CONFIG_ETH_USE_SPI_ETHERNET`.
    /// Controls whether ETH USE SPI ethernet is enabled for the `esp_eth` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    eth_use_spi_ethernet: bool = true,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 7);
        entries[0] = sdkconfig.Entry.flag("CONFIG_ETH_ENABLED", cfg.eth_enabled);
        entries[1] = sdkconfig.Entry.flag("CONFIG_ETH_SPI_ETHERNET_DM9051", cfg.eth_spi_ethernet_dm9051);
        entries[2] = sdkconfig.Entry.flag("CONFIG_ETH_SPI_ETHERNET_KSZ8851SNL", cfg.eth_spi_ethernet_ksz8851snl);
        entries[3] = sdkconfig.Entry.flag("CONFIG_ETH_SPI_ETHERNET_W5500", cfg.eth_spi_ethernet_w5500);
        entries[4] = sdkconfig.Entry.flag("CONFIG_ETH_TRANSMIT_MUTEX", cfg.eth_transmit_mutex);
        entries[5] = sdkconfig.Entry.flag("CONFIG_ETH_USE_OPENETH", cfg.eth_use_openeth);
        entries[6] = sdkconfig.Entry.flag("CONFIG_ETH_USE_SPI_ETHERNET", cfg.eth_use_spi_ethernet);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
