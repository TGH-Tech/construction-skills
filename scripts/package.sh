#!/usr/bin/env bash
# Builds one upload-ready zip per skill in dist/: the skill folder is the
# zip's root, which is what claude.ai (Customize → Skills) and ChatGPT
# (Skills → Create → Upload) expect.
set -euo pipefail
cd "$(dirname "$0")/.."
rm -rf dist && mkdir -p dist
for dir in skills/*/; do
  name=$(basename "$dir")
  [ -f "$dir/SKILL.md" ] || continue
  (cd skills && zip -qr -X "../dist/$name.zip" "$name" -x '*/__pycache__/*' '*.pyc' '*/.DS_Store')
  echo "dist/$name.zip"
done
