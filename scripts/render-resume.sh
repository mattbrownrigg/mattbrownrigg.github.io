#!/usr/bin/env bash
#
# render-resume.sh — rasterize the résumé PDF into the page image the
# /resume route displays. Run after updating the PDF.
#
#   npm run resume:render
#
# The site shows a rendered page image (framed as a document sheet) instead
# of an embedded PDF, so this regenerates that image. The PDF itself is still
# served for the Download / Open-in-new-tab actions.
#
# Uses macOS Quick Look (`qlmanage`), which is the PDF rasterizer available
# by default on macOS — no poppler/imagemagick required.

set -euo pipefail

# Resolve repo root from this script's location, so it works from anywhere.
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

PDF="$ROOT/public/media/resume.pdf"
SRC_PDF="$ROOT/src/media/resume.pdf"
OUT_IMG="$ROOT/src/media/resume.png"
SIZE=2600   # longest-edge pixels (~200 DPI for US Letter); bump for crisper text

# Prefer the served copy; fall back to the src/media source.
if [[ ! -f "$PDF" && -f "$SRC_PDF" ]]; then
  PDF="$SRC_PDF"
fi

if [[ ! -f "$PDF" ]]; then
  echo "✗ Résumé PDF not found at:" >&2
  echo "    $PDF" >&2
  echo "  Place the PDF there (and keep public/media in sync) then re-run." >&2
  exit 1
fi

if ! command -v qlmanage >/dev/null 2>&1; then
  echo "✗ qlmanage not found — this script requires macOS Quick Look." >&2
  echo "  On other platforms, render page 1 of the PDF to:" >&2
  echo "    $OUT_IMG" >&2
  echo "  e.g. with poppler: pdftoppm -png -r 200 -singlefile \"$PDF\" \"${OUT_IMG%.png}\"" >&2
  exit 1
fi

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "→ Rendering $(basename "$PDF") at ${SIZE}px (longest edge)…"
qlmanage -t -s "$SIZE" -o "$TMP" "$PDF" >/dev/null 2>&1

RENDERED="$(ls "$TMP"/*.png 2>/dev/null | head -1 || true)"
if [[ -z "$RENDERED" ]]; then
  echo "✗ Quick Look produced no PNG — the PDF may be unreadable." >&2
  exit 1
fi

mv -f "$RENDERED" "$OUT_IMG"

DIMS="$(sips -g pixelWidth -g pixelHeight "$OUT_IMG" 2>/dev/null \
  | awk '/pixelWidth/{w=$2} /pixelHeight/{h=$2} END{print w"×"h}')"

echo "✓ Wrote src/media/resume.png (${DIMS})"
echo "  Run \`npm run build\` to regenerate the optimized WebP variants."
