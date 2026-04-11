#!/bin/bash
set -e

# Mirror of main.js canary logic — update this date when renewing the canary
CANARY_LAST_UPDATED="2026-04-10"
CANARY_MONTHS="1 4 7 10"

mkdir -p data

today=$(date +%s)
last_updated=$(date -d "$CANARY_LAST_UPDATED" +%s 2>/dev/null || date -j -f "%Y-%m-%d" "$CANARY_LAST_UPDATED" +%s)
year=$(date +%Y)
month=$(date +%-m)

status="active"

# Walk backwards through years to find the most recent scheduled month that has fully passed
found=0
for y in $(seq "$year" -1 $((year - 2))); do
  if [ "$found" -eq 1 ]; then break; fi
  start_m=$( [ "$y" -eq "$year" ] && echo "$month" || echo 12 )
  for m in $(seq "$start_m" -1 1); do
    if echo "$CANARY_MONTHS" | grep -qw "$m"; then
      # Get last day of month m in year y
      end_of_month=$(date -d "$y-$m-01 +1 month -1 day" +%s 2>/dev/null || \
        date -j -f "%Y-%m-%d" "$(date -j -f "%Y-%m-%d" "$y-$m-01" -v+1m -v-1d +%Y-%m-%d)" +%s)
      if [ "$end_of_month" -lt "$today" ]; then
        month_start=$(date -d "$y-$m-01" +%s 2>/dev/null || \
          date -j -f "%Y-%m-%d" "$y-$m-01" +%s)
        if [ "$last_updated" -ge "$month_start" ]; then
          status="active"
        else
          status="lapsed"
        fi
        found=1
        break
      fi
    fi
  done
done

echo "{\"status\": \"$status\", \"last_updated\": \"$CANARY_LAST_UPDATED\"}" > data/canary.json
echo "Canary status: $status (last updated: $CANARY_LAST_UPDATED)"
