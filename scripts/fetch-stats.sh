#!/bin/bash
set -e

BASE_URL="${STATS_BASE_URL:?STATS_BASE_URL is not set}"

mkdir -p data

FAIL=0

fetch() {
  local url="$BASE_URL/$1"
  local dest="$2"
  local http_code
  http_code=$(curl -s -o "$dest" -w '%{http_code}' "$url") || true
  if [ "$http_code" -ge 200 ] 2>/dev/null && [ "$http_code" -lt 300 ] 2>/dev/null; then
    echo "OK   $1 -> $dest ($http_code)"
  else
    echo "FAIL $1 -> $dest (HTTP $http_code)"
    echo '{}' > "$dest"
    FAIL=$((FAIL + 1))
  fi
}

fetch stats.json      data/stats.json
fetch crypto.json     data/crypto.json
fetch network.json    data/network.json
fetch i2p-stats.json  data/i2p-stats.json
fetch adsb-stats.json data/adsb.json

# Download ADS-B chart/map images
mkdir -p static/images/adsb
for img in adsb-polar-map.png adsb-chart-aircraft.png adsb-chart-messages.png adsb-chart-distance.png adsb-chart-signal.png; do
  curl -sf "$BASE_URL/$img" -o "static/images/adsb/$img" || echo "WARN could not fetch $img"
done

if [ "$FAIL" -eq 5 ]; then
  echo "ERROR: All stats fetches failed — the stats API may be down."
  exit 1
fi
