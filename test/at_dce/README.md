# at_dce — ESP32-S3 minimal AT modem mock (DCE)

Firmware for **ESP32-S3-DevKit** (and similar): USB CDC serial acts as the **DCE** side. Your **Mac** runs the **DTE** using **embed-zig** `integration_tests/at/dte_serial_host` (POSIX `read`/`write` on the same USB device).

## Prerequisites

- **ESP-IDF** installed; `IDF_PATH` set (same as `test/embed_compat`).
- **Zig** ≥ 0.15.2.
- **`embed-zig`** checkout next to this repo: `~/haivivi/embed-zig` (see `build.zig.zon` `embed_zig` path). Adjust the path if your layout differs.

## Build & flash (ESP32-S3 DevKit)

From this directory:

```sh
cd ~/haivivi/esp/test/at_dce
zig build -Dbuild_config=board/esp32s3_devkit/build_config.zig flash -- -p /dev/tty.usbmodem4101
```

Use **`cu`** on macOS if `tty` is busy (another monitor is open):

```sh
zig build flash -- -p /dev/cu.usbmodem4101
```

Monitor only:

```sh
zig build monitor -- -p /dev/cu.usbmodem4101
```

Flash + monitor:

```sh
zig build flash_monitor -- -p /dev/cu.usbmodem4101
```

## Mac DTE (embed-zig)

**Close** `idf.py monitor` / `screen` on that port before running the host test (only one client should open the serial port).

```sh
cd ~/haivivi/embed-zig
export EMBED_AT_SERIAL=/dev/cu.usbmodem4101
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
