#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="${1:-"$ROOT_DIR/dist"}"
VERSION="$(tr -d '[:space:]' < "$ROOT_DIR/VERSION")"
ARCHIVE="liskill-${VERSION}.zip"
STAGE_DIR="$(mktemp -d)"

trap 'rm -rf "$STAGE_DIR"' EXIT
rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR" "$STAGE_DIR/liskill/skills"

cp "$ROOT_DIR/README.md" "$STAGE_DIR/liskill/README.md"
cp "$ROOT_DIR/LICENSE" "$STAGE_DIR/liskill/LICENSE"
cp "$ROOT_DIR/VERSION" "$STAGE_DIR/liskill/VERSION"
cp -R "$ROOT_DIR/skills/." "$STAGE_DIR/liskill/skills/"

(cd "$STAGE_DIR" && zip -qr "$OUT_DIR/$ARCHIVE" liskill -x '*/.DS_Store')
echo "built $OUT_DIR/$ARCHIVE"
