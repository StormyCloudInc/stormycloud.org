#!/bin/bash
set -e

BASE_URL="${STATS_BASE_URL:?STATS_BASE_URL is not set}"

mkdir -p data

curl -sf "$BASE_URL/stats.json"      -o data/stats.json      || echo '{}' > data/stats.json
curl -sf "$BASE_URL/crypto.json"     -o data/crypto.json     || echo '{}' > data/crypto.json
curl -sf "$BASE_URL/network.json"    -o data/network.json    || echo '{}' > data/network.json
curl -sf "$BASE_URL/i2p-stats.json"  -o data/i2p-stats.json  || echo '{}' > data/i2p-stats.json
curl -sf "$BASE_URL/adsb-stats.json" -o data/adsb.json       || echo '{}' > data/adsb.json

# Download ADS-B chart/map images
mkdir -p static/images/adsb
for img in adsb-polar-map.png adsb-chart-aircraft.png adsb-chart-messages.png adsb-chart-distance.png adsb-chart-signal.png; do
  curl -sf "$BASE_URL/$img" -o "static/images/adsb/$img" || true
done
