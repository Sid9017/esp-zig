#!/usr/bin/env bash
# Helper script that activates the ESP-IDF environment for another tool or
# subprocess invocation.
# It does not create files; it exports `IDF_PATH`, sources `export.sh`, and
# then `exec`s the requested command in the prepared environment.
# Usage: idf_env_wrapper.sh <esp_idf_path> <command> [args...]
set -euo pipefail

ESP_IDF_PATH="$1"
shift

export IDF_PATH="$ESP_IDF_PATH"
source "$ESP_IDF_PATH/export.sh" >/dev/null 2>&1

exec "$@"
