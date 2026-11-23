#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE="https://dl.polyhaven.org/file/ph-assets/HDRIs/hdr/2k"
mkdir -p "$SCRIPT_DIR"

download_one() {
  local file="$1" md5="$2"
  echo "Downloading $file ..."
  curl --fail --location --retry 3 --retry-delay 2 "$BASE/$file" -o "$SCRIPT_DIR/$file"
  if command -v md5sum >/dev/null 2>&1; then
    local actual
    actual="$(md5sum "$SCRIPT_DIR/$file" | awk '{print $1}')"
    if [[ "$actual" != "$md5" ]]; then echo "Checksum mismatch for $file" >&2; exit 1; fi
  fi
}

download_one "studio_small_09_2k.hdr" "b056fea247bc84b81d2e0987d44c87d8"
download_one "qwantani_puresky_2k.hdr" "fdd877b7d1440ef299516653358d7f67"
download_one "qwantani_sunset_puresky_2k.hdr" "b918af5fefb341535961ffdad5fab7bc"
download_one "overcast_soil_puresky_2k.hdr" "877caf0680d7269037995f6567a67103"
echo "All four CC0 HDRI templates are ready in $SCRIPT_DIR"
