#!/usr/bin/env bash
# Installs the jd-resume-tailor skill into every coding agent found on this machine.
# Usage:
#   ./install.sh                 install for agents detected in $HOME
#   ./install.sh --all           install for every supported agent
#   ./install.sh claude codex    install for the named agents only
#   ./install.sh --project       install into ./.agents/skills and ./.claude/skills (current repo)
#   ./install.sh --uninstall     remove from every agent folder
# Windows-native agents from WSL:  HOME=/mnt/c/Users/<you> ./install.sh
set -euo pipefail

NAME=jd-resume-tailor
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills/$NAME"
[ -f "$SRC/SKILL.md" ] || { echo "error: $SRC/SKILL.md not found; run from the repo root" >&2; exit 1; }

# agent | marker that shows it is installed | skills folder
AGENTS="
claude|$HOME/.claude|$HOME/.claude/skills
codex|$HOME/.codex|$HOME/.agents/skills
gemini|$HOME/.gemini|$HOME/.gemini/skills
cursor|$HOME/.cursor|$HOME/.cursor/skills
copilot|$HOME/.copilot|$HOME/.copilot/skills
"

install_to() {  # $1 = label, $2 = skills folder
  local dest="$2/$NAME"
  mkdir -p "$2"
  # keep a personal bank someone dropped into references/
  local keep=""
  [ -f "$dest/references/portfolio-bank.md" ] && keep="$(mktemp)" && cp "$dest/references/portfolio-bank.md" "$keep"
  rm -rf "$dest"
  cp -R "$SRC" "$dest"
  [ -n "$keep" ] && mv "$keep" "$dest/references/portfolio-bank.md"
  [ -f "$dest/SKILL.md" ] || { echo "error: install to $dest failed" >&2; exit 1; }
  echo "  ✔ $1 → $dest"
}

mode=detect; picked=()
for a in "$@"; do
  case "$a" in
    --all) mode=all ;;
    --project) mode=project ;;
    --uninstall) mode=uninstall ;;
    -h|--help) sed -n '2,9p' "$0"; exit 0 ;;
    *) mode=named; picked+=("$a") ;;
  esac
done

if [ "$mode" = project ]; then
  install_to "project (Codex, Cursor, Gemini, VS Code)" "$PWD/.agents/skills"
  install_to "project (Claude Code)" "$PWD/.claude/skills"
  exit 0
fi

count=0
while IFS='|' read -r agent marker dir; do
  [ -z "$agent" ] && continue
  case "$mode" in
    detect)    [ -d "$marker" ] || continue ;;
    named)     [[ " ${picked[*]} " == *" $agent "* ]] || continue ;;
    uninstall) [ -d "$dir/$NAME" ] && rm -rf "$dir/$NAME" && echo "  ✖ removed $dir/$NAME"; continue ;;
  esac
  install_to "$agent" "$dir"; count=$((count+1))
done <<< "$AGENTS"

[ "$mode" = uninstall ] && exit 0
[ "$count" -eq 0 ] && { echo "No agents detected. Use --all or name one: claude codex gemini cursor copilot"; exit 1; }

BANK="$HOME/.jd-resume-tailor/portfolio-bank.md"
if [ -f "$BANK" ]; then
  echo "Portfolio bank found: $BANK"
else
  mkdir -p "$HOME/.jd-resume-tailor"
  echo "No portfolio bank yet. Put yours at $BANK"
  echo "(format: $SRC/references/portfolio-bank.sample.md), or ask the skill to build one from your resume."
fi
