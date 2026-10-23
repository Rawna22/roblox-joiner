#!/usr/bin/env bash
# One-click Roblox joiner (Termux/Android & Linux)
# Usage: play.sh <placeId>  OR  play.sh <roblox game url>
set -euo pipefail

input="${1:-113290951185459}"

# Extract placeId from URL if given
if [[ "$input" =~ placeId=([0-9]+) ]]; then
  PLACE_ID="${BASH_REMATCH[1]}"
elif [[ "$input" =~ /games/([0-9]+) ]]; then
  PLACE_ID="${BASH_REMATCH[1]}"
else
  PLACE_ID="$input"
fi

# Deep link first (opens Roblox app directly)
if command -v am >/dev/null 2>&1; then
  am start -n com.roblox.client/.StartupActivity >/dev/null 2>&1 || true
  sleep 2
  am start -a android.intent.action.VIEW -d "roblox://experiences/start?placeId=${PLACE_ID}" >/dev/null 2>&1 || true
  sleep 1
fi
# Fallback browser
if command -v am >/dev/null 2>&1; then
  am start -a android.intent.action.VIEW -d "https://www.roblox.com/games/${PLACE_ID}" >/dev/null 2>&1 || true
elif command -v xdg-open >/dev/null 2>&1; then
  xdg-open "https://www.roblox.com/games/${PLACE_ID}" >/dev/null 2>&1 || true
else
  echo "Open manually: https://www.roblox.com/games/${PLACE_ID}"
fi
echo "Launched place ${PLACE_ID}"
