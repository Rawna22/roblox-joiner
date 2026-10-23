#!/usr/bin/env bash
set -euo pipefail
REPO="https://raw.githubusercontent.com/rawna22/roblox-joiner/main"
DEST="${HOME}/.local/bin"
mkdir -p "$DEST"
curl -fsSL "${REPO}/roblox-play.sh" -o "${DEST}/roblox-play"
chmod +x "${DEST}/play"
echo "Installed: ${DEST}/play"
echo "Add to PATH if needed: export PATH=\"${DEST}:\$PATH\""
