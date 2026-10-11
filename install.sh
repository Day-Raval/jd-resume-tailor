#!/usr/bin/env bash
# Installs the jd-resume-tailor skill into the coding agents on this machine.
# Run from the repo root.
#   ./install.sh                 install for agents detected in your home folder
#   ./install.sh --all           install for every supported agent
#   ./install.sh claude codex    install for the named agents only
#   ./install.sh --project       install into ./.agents/skills and ./.claude/skills
#   ./install.sh --uninstall     remove from every agent folder
set -euo pipefail

SRC=skills/jd-resume-tailor
[ -f "$SRC/SKILL.md" ] || { echo "error: run this from the repo root (skills/jd-resume-tailor/SKILL.md not found)" >&2; exit 1; }

# agent | marker that shows it is installed | skills folder
AGENTS="
claude|$HOME/.claude|$HOME/.claude/skills
codex|$HOME/.codex|$HOME/.agents/skills
gemini|$HOME/.gemini|$HOME/.gemini/skills
cursor|$HOME/.cursor|$HOME/.cursor/skills
copilot|$HOME/.copilot|$HOME/.copilot/skills
"

install_to() {  # $1 = label, $2 = skills folder
  local dest="$2/jd-resume-tailor" keep=""
  mkdir -p "$2"
  # keep a personal bank someone dropped into references/
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
    -h|--help) sed -n '2,8p' "$0"; exit 0 ;;
    *) mode=named; picked+=("$a") ;;
  esac
done

if [ "$mode" = project ]; then
  install_to "project (Codex, Cursor, Gemini, VS Code)" .agents/skills
  install_to "project (Claude Code)" .claude/skills
  exit 0
fi

count=0
while IFS='|' read -r agent marker dir; do
  [ -z "$agent" ] && continue
  case "$mode" in
    detect)    [ -d "$marker" ] || continue ;;
    named)     [[ " ${picked[*]} " == *" $agent "* ]] || continue ;;
    uninstall) [ -d "$dir/jd-resume-tailor" ] && rm -rf "$dir/jd-resume-tailor" && echo "  ✖ removed $dir/jd-resume-tailor"; continue ;;
  esac
  install_to "$agent" "$dir"; count=$((count+1))
done <<< "$AGENTS"

[ "$mode" = uninstall ] && exit 0
[ "$count" -eq 0 ] && { echo "No agents detected. Use --all or name one: claude codex gemini cursor copilot"; exit 1; }

if [ -f "$HOME/.jd-resume-tailor/portfolio-bank.md" ]; then
  echo "Portfolio bank found: $HOME/.jd-resume-tailor/portfolio-bank.md"
else
  mkdir -p "$HOME/.jd-resume-tailor"
  echo "No portfolio bank yet. Put yours at $HOME/.jd-resume-tailor/portfolio-bank.md"
  echo "(format: $SRC/references/portfolio-bank.sample.md), or ask the skill to build one from your resume."
fi
