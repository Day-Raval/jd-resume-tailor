# Changelog

## 1.1.0 (2026-10-11)
- Works in Codex, Gemini CLI, Cursor and GitHub Copilot as well as Claude.
- `install.sh`: detects installed agents and copies the skill into each one's skills folder; `--project`, `--all`, `--uninstall`.
- `AGENTS.md` fallback for agents without SKILL.md support.
- SKILL.md states that reference paths are relative to its own folder.

## 1.0.0 (2026-10-11)
- First public release.
- Source tag on every bullet; unsourced claims are rejected.
- Coverage table with `yes` / `swap` / `listed` / `no` and a two-line score.
- Portfolio bank is read from the working directory or `~/.jd-resume-tailor/`, never shipped.
- Scope guard: declines cover letters and other non-resume requests.
