# at_dce — ESP32-S3 minimal AT modem mock (DCE)

Firmware for **ESP32-S3-DevKit** (and similar). By default the **AT** stream uses **USB Serial/JTAG** (stdin/stdout). You can switch to **UART1** for AT only (logs stay on USB if `build_config` keeps the primary console on USB).

### AT transport (`-Dat_transport`)

| Value   | AT channel |
|---------|------------|
| `usb`   | stdin/stdout (default) |
| `uart1` | UART1 @ 115200 on **GPIO17 (TX)** / **GPIO18 (RX)** — see wiring below |

### Build: USB mode (default)

`build_config` defaults to `board/esp32s3_devkit/build_config.zig` if you omit `-Dbuild_config`.

```sh
cd ~/haivivi/esp/test/at_dce

# Equivalent: AT over USB console
zig build
# or explicit:
zig build -Dat_transport=usb
zig build -Dat_transport=usb -Dbuild_config=board/esp32s3_devkit/build_config.zig
```

Flash / monitor still use the **native USB** device (same as logs):

```sh
zig build flash -- -p /dev/cu.usbmodem4101
```

### Build: UART1 mode

```sh
cd ~/haivivi/esp/test/at_dce
zig build -Dat_transport=uart1 -Dbuild_config=board/esp32s3_devkit/build_config.zig
```

Flash firmware over **USB** as usual (JTAG/CDC). **AT** traffic is only on UART1 pins, not on that USB serial stream.

### UART1 wiring (USB–TTL ↔ DevKit)

Default pins match common **ESP32-S3-DevKitC-1** / Arduino `Serial1` style mappings. Use a **3.3 V** USB–TTL adapter (ESP32-S3 GPIOs are not 5 V tolerant on these lines).

Connect **crossed** TX/RX and common ground:

| ESP32-S3 (board) | USB–TTL adapter |
|------------------|-----------------|
| **GPIO17** (UART1 TX, data out from ESP) | **RX** |
| **GPIO18** (UART1 RX, data in to ESP)   | **TX** |
| **GND**                               | **GND** |

Do **not** connect the adapter’s VCC to the board unless you know you need to power one side that way; often the DevKit is already USB-powered.

Your **Mac** runs the **DTE** using **embed-zig** `integration_tests/at/dte_serial_host` on the adapter’s serial port (e.g. `/dev/cu.usbserial-*`), **115200** 8N1. Logs from `esp_log` stay on the DevKit’s **USB** console when `build_config` uses USB Serial/JTAG as primary console.

## Prerequisites

- **ESP-IDF** installed; `IDF_PATH` set (same as `test/embed_compat`).
- **Zig** ≥ 0.15.2.
- **`embed-zig`** checkout next to this repo: `~/haivivi/embed-zig` (see `build.zig.zon` `embed_zig` path). Adjust the path if your layout differs.

## Flash & monitor (USB cable to DevKit)

After `zig build` (either transport), flashing and **USB serial monitor** use the same **USB** port as usual — this is independent of `-Dat_transport=uart1` (UART1 is only for AT lines on GPIO17/18).

Use **`cu`** on macOS if `tty` is busy (another monitor is open):

```sh
cd ~/haivivi/esp/test/at_dce
zig build flash -- -p /dev/cu.usbmodem4101
zig build monitor -- -p /dev/cu.usbmodem4101
zig build flash_monitor -- -p /dev/cu.usbmodem4101
```

## Mac DTE (embed-zig)

**Close** `idf.py monitor` / `screen` on that port before running the host test (only one client should open the serial port).

- **`usb` firmware:** set `EMBED_AT_SERIAL` to the DevKit’s **USB** serial device (e.g. `/dev/cu.usbmodem…`).
- **`uart1` firmware:** set `EMBED_AT_SERIAL` to the **USB–TTL adapter** (e.g. `/dev/cu.usbserial…`), with wiring as in the **UART1 wiring** section above.

```sh
cd ~/haivivi/embed-zig
export EMBED_AT_SERIAL=/dev/cu.usbmodem4101   # usb mode; use /dev/cu.usbserial-* for uart1 + adapter
export EMBED_AT_BAUD=115200   # optional
zig build test-at
```

The **`integration_tests/at/dte_serial_host`** case runs inside `test-at` and will probe `AT` then `AT+CSQ`.

## Implemented commands (must match host expectations)

| Line (trimmed)   | Response                    |
|------------------|-----------------------------|
| `AT`             | `OK\r\n`                    |
| `AT+CSQ` prefix  | `+CSQ: 99,99\r\nOK\r\n`     |
| other `AT…`      | `ERROR\r\n`                 |

Lines are **LF-terminated** on the wire (`\r` before `\n` is ignored). Host sends `AT\r\n` by default (`Dte` `append_crlf`).
