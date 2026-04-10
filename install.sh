#!/bin/bash

# Install support skills into Claude Code
# Usage: ./install.sh [target-dir]

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET="${1:-.}"
SKILLS_DIR="$TARGET/.claude/skills"

count=0
for skill in "$SCRIPT_DIR"/*/SKILL.md; do
  skill_dir="$(basename "$(dirname "$skill")")"
  mkdir -p "$SKILLS_DIR/$skill_dir"
  cp "$skill" "$SKILLS_DIR/$skill_dir/SKILL.md"
  count=$((count + 1))
done

echo "Installed $count skills into $SKILLS_DIR"
echo ""
echo "Open Claude Code in your project and run any skill:"
echo "  /ticket-triage"
echo "  /customer-360 jane@acme.com"
echo "  /sentiment-check \"your message here\""
