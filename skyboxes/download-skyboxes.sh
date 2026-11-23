#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE="https://dl.polyhaven.org/file/ph-assets/HDRIs/hdr/2k"

files=(
  "studio_small_09_2k.hdr|b056fea247bc84b81d2e0987d44c87d8"
  "qwantani_puresky_2k.hdr|fdd877b7d1440ef299516653358d7f67"
  "qwantani_sunset_puresky_2k.hdr|b918af5fefb341535961ffdad5fab7bc"
  "overcast_soil_puresky_2k.hdr|877caf0680d7269037995f6567a67103"
)

for item in "${files[@]}"; do
  IFS='|' read -r file expected_md5 <<< "$item"
  destination="$SCRIPT_DIR/$file"
  echo "Downloading $file ..."
  curl --fail --location --retry 3 --retry-delay 2 "$BASE/$file" -o "$destination"
  if command -v md5sum >/dev/null 2>&1; then
    actual_md5="$(md5sum "$destination" | awk '{print $1}')"
  elif command -v md5 >/dev/null 2>&1; then
    actual_md5="$(md5 -q "$destination")"
  else
    echo 'Need md5sum or md5 to verify downloads.' >&2
    exit 1
  fi
  if [[ "$actual_md5" != "$expected_md5" ]]; then
    rm -f "$destination"
    echo "Checksum mismatch for $file" >&2
    exit 1
  fi
  echo "Verified $file"
done

echo "All four HDR templates are ready in $SCRIPT_DIR"
