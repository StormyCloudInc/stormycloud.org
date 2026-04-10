#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────
# optimize-assets.sh — Compress the hell out of everything
# Runs on public/ AFTER hugo --minify
# ─────────────────────────────────────────────────────────────
set -euo pipefail

PUBLIC="${1:-public}"
echo "=== Asset optimization starting on $PUBLIC ==="

# ── 1. Convert all PNG/JPG to WebP ──────────────────────────
# WebP is typically 25-35% smaller than PNG and 25-50% smaller than JPEG
echo "--- Converting images to WebP ---"

IMG_COUNT=0
SAVED_BYTES=0

for img in $(find "$PUBLIC" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \)); do
  ORIG_SIZE=$(stat -c%s "$img" 2>/dev/null || stat -f%z "$img")
  WEBP_PATH="${img%.*}.webp"

  # Convert to WebP — quality 82 is visually lossless for photos
  # Use -lossless for small PNGs (screenshots/icons) under 50KB
  if [ "$ORIG_SIZE" -lt 51200 ]; then
    cwebp -lossless -quiet "$img" -o "$WEBP_PATH" 2>/dev/null || continue
  else
    cwebp -q 82 -m 6 -quiet "$img" -o "$WEBP_PATH" 2>/dev/null || continue
  fi

  WEBP_SIZE=$(stat -c%s "$WEBP_PATH" 2>/dev/null || stat -f%z "$WEBP_PATH")

  # Only keep WebP if it's actually smaller
  if [ "$WEBP_SIZE" -lt "$ORIG_SIZE" ]; then
    DIFF=$((ORIG_SIZE - WEBP_SIZE))
    SAVED_BYTES=$((SAVED_BYTES + DIFF))
    IMG_COUNT=$((IMG_COUNT + 1))

    # Get the filename parts for replacement
    BASENAME=$(basename "$img")
    WEBP_BASENAME=$(basename "$WEBP_PATH")

    # Replace all references in HTML and CSS files
    find "$PUBLIC" -type f \( -name '*.html' -o -name '*.css' -o -name '*.xml' -o -name '*.json' \) \
      -exec sed -i "s|${BASENAME}|${WEBP_BASENAME}|g" {} +

    # Remove original
    rm "$img"
    echo "  ✓ ${img#$PUBLIC/} → .webp (saved $((DIFF / 1024))KB)"
  else
    # WebP is larger (rare), keep original
    rm "$WEBP_PATH"
    echo "  · ${img#$PUBLIC/} — kept original (WebP not smaller)"
  fi
done

echo "  Converted $IMG_COUNT images, saved $((SAVED_BYTES / 1024))KB total"

# ── 2. Optimize existing WebP files ─────────────────────────
echo "--- Optimizing existing WebP files ---"
for img in $(find "$PUBLIC" -type f -iname '*.webp'); do
  # Re-encode existing WebP at optimal settings
  ORIG_SIZE=$(stat -c%s "$img" 2>/dev/null || stat -f%z "$img")

  # Only re-encode files larger than 100KB (likely photos)
  if [ "$ORIG_SIZE" -gt 102400 ]; then
    TEMP="${img}.tmp"
    cwebp -q 82 -m 6 -quiet "$img" -o "$TEMP" 2>/dev/null || continue
    TEMP_SIZE=$(stat -c%s "$TEMP" 2>/dev/null || stat -f%z "$TEMP")

    if [ "$TEMP_SIZE" -lt "$ORIG_SIZE" ]; then
      mv "$TEMP" "$img"
      DIFF=$((ORIG_SIZE - TEMP_SIZE))
      SAVED_BYTES=$((SAVED_BYTES + DIFF))
      echo "  ✓ ${img#$PUBLIC/} re-optimized (saved $((DIFF / 1024))KB)"
    else
      rm "$TEMP"
    fi
  fi
done

# ── 3. Optimize SVGs ────────────────────────────────────────
echo "--- Optimizing SVGs ---"
if command -v svgo &>/dev/null; then
  SVG_COUNT=$(find "$PUBLIC" -type f -iname '*.svg' | wc -l)
  if [ "$SVG_COUNT" -gt 0 ]; then
    svgo -r "$PUBLIC" -q 2>/dev/null || true
    echo "  ✓ Optimized $SVG_COUNT SVGs"
  fi
else
  echo "  · svgo not found, skipping SVG optimization"
fi

# ── 4. Minify CSS beyond Hugo ───────────────────────────────
echo "--- Minifying CSS ---"
if command -v csso &>/dev/null; then
  for css in $(find "$PUBLIC" -type f -iname '*.css'); do
    ORIG_SIZE=$(stat -c%s "$css" 2>/dev/null || stat -f%z "$css")
    csso "$css" -o "$css" 2>/dev/null || continue
    NEW_SIZE=$(stat -c%s "$css" 2>/dev/null || stat -f%z "$css")
    DIFF=$((ORIG_SIZE - NEW_SIZE))
    if [ "$DIFF" -gt 0 ]; then
      SAVED_BYTES=$((SAVED_BYTES + DIFF))
      echo "  ✓ ${css#$PUBLIC/} (saved ${DIFF} bytes)"
    fi
  done
elif command -v cleancss &>/dev/null; then
  for css in $(find "$PUBLIC" -type f -iname '*.css'); do
    ORIG_SIZE=$(stat -c%s "$css" 2>/dev/null || stat -f%z "$css")
    cleancss -o "$css" "$css" 2>/dev/null || continue
    NEW_SIZE=$(stat -c%s "$css" 2>/dev/null || stat -f%z "$css")
    DIFF=$((ORIG_SIZE - NEW_SIZE))
    if [ "$DIFF" -gt 0 ]; then
      SAVED_BYTES=$((SAVED_BYTES + DIFF))
      echo "  ✓ ${css#$PUBLIC/} (saved ${DIFF} bytes)"
    fi
  done
else
  echo "  · No CSS minifier found, skipping (Hugo --minify already applied)"
fi

# ── 5. Minify JS ────────────────────────────────────────────
echo "--- Minifying JS ---"
if command -v terser &>/dev/null; then
  for js in $(find "$PUBLIC" -type f -iname '*.js' ! -path '*/leaflet*' ! -path '*/chart*'); do
    ORIG_SIZE=$(stat -c%s "$js" 2>/dev/null || stat -f%z "$js")
    terser "$js" --compress --mangle -o "$js" 2>/dev/null || continue
    NEW_SIZE=$(stat -c%s "$js" 2>/dev/null || stat -f%z "$js")
    DIFF=$((ORIG_SIZE - NEW_SIZE))
    if [ "$DIFF" -gt 0 ]; then
      SAVED_BYTES=$((SAVED_BYTES + DIFF))
      echo "  ✓ ${js#$PUBLIC/} (saved ${DIFF} bytes)"
    fi
  done
else
  echo "  · terser not found, skipping JS minification"
fi

# ── 6. Pre-compress with Brotli + Gzip ──────────────────────
echo "--- Pre-compressing text assets ---"
COMPRESSED=0
for f in $(find "$PUBLIC" -type f \( -iname '*.html' -o -iname '*.css' -o -iname '*.js' -o -iname '*.xml' -o -iname '*.json' -o -iname '*.svg' -o -iname '*.txt' \)); do
  # Brotli (if available)
  if command -v brotli &>/dev/null; then
    brotli -f -q 11 "$f" -o "${f}.br" 2>/dev/null || true
  fi
  # Gzip
  gzip -9 -k -f "$f" 2>/dev/null || true
  COMPRESSED=$((COMPRESSED + 1))
done
echo "  ✓ Pre-compressed $COMPRESSED files (.br + .gz)"

# ── Summary ──────────────────────────────────────────────────
echo ""
echo "=== Optimization complete ==="
echo "  Total saved: $((SAVED_BYTES / 1024))KB ($((SAVED_BYTES / 1024 / 1024))MB)"
TOTAL_SIZE=$(du -sk "$PUBLIC" | cut -f1)
echo "  Final public/ size: ${TOTAL_SIZE}KB"
