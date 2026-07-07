#!/usr/bin/env bash
# Install the idea-expander skill into your Claude Code skills directory.
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills/idea-expander"
DEST="${HOME}/.claude/skills/idea-expander"

mkdir -p "${HOME}/.claude/skills"
cp -r "$SRC" "$DEST"

echo "Installed idea-expander to $DEST"
echo "Restart Claude Code (or reload skills), then run: /idea-expander"
