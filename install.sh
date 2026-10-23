#!/usr/bin/env bash
set -euo pipefail
REPO="https://raw.githubusercontent.com/USERNAME/roblox-joiner/main"
DEST="${HOME}/.local/bin"
mkdir -p "$DEST"
curl -fsSL "${REPO}/play.sh" -o "${DEST}/play"
chmod +x "${DEST}/play"
echo "Installed: ${DEST}/play"
echo "Add to PATH if needed: export PATH=\"${DEST}:\$PATH\""
