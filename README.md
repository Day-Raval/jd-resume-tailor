# JD Resume Tailor

An agent skill that tailors your resume to one job description **using only facts you have verified**.

Most AI resume tools will happily invent a skill to match a posting. This one can't: every bullet ends with a source tag pointing at an entry in your private portfolio bank, and anything the job asks for that your bank can't back up is reported as a gap instead of being written into the resume.

## What you get

- Subtitle, summary, skills, experience and 3 project bullets tailored to the JD
- A source tag on every bullet, e.g. `[P04-F1, P04-F3]`
- A keyword coverage table: `yes` (evidenced on this resume), `swap Pxx` (evidence is in a project you didn't pick), `listed` (skills list only) or `no`
- A two-line score, e.g. `Must-haves: Evidenced 9 / 16 · Swap available 1 · Listed only 2 · Missing 4`
- A hard skip for postings you've ruled out (`references/hard-skips.md`)

See `skills/jd-resume-tailor/examples/` for a full fictional run.

## Install

Works in Claude Code, Claude.ai, OpenAI Codex, Gemini CLI, Cursor and GitHub Copilot. The skill uses the open SKILL.md format, so any compatible agent can load it.

**Any agent (recommended)**: clone and run the installer. It detects which agents you have and copies the skill into each one's skills folder.
```
git clone https://github.com/Day-Raval/jd-resume-tailor.git
cd jd-resume-tailor
./install.sh              # agents detected on this machine
./install.sh --all        # all five
./install.sh codex gemini # only these
./install.sh --project    # into ./.agents/skills and ./.claude/skills of the current repo
./install.sh --uninstall
```
On Windows with WSL, target your Windows home so Windows-native agents see it: `HOME=/mnt/c/Users/<you> ./install.sh`

| Agent | Skills folder the installer uses |
|---|---|
| Claude Code | `~/.claude/skills/` |
| OpenAI Codex | `~/.agents/skills/` |
| Gemini CLI | `~/.gemini/skills/` |
| Cursor | `~/.cursor/skills/` |
| GitHub Copilot | `~/.copilot/skills/` |

**Claude Code plugin** (gets updates with `claude plugin update`):
```
claude plugin marketplace add Day-Raval/jd-resume-tailor
claude plugin install jd-resume-tailor@dayesh-skills
```

**Claude.ai**: zip the `skills/jd-resume-tailor/` folder (with your bank copied into its `references/` folder as `portfolio-bank.md`) and upload it under Settings > Capabilities > Skills.

**Agents without skill support**: open this repo in the agent. `AGENTS.md` tells it to follow `skills/jd-resume-tailor/SKILL.md`.

## Set up your portfolio bank (required)

The skill never ships your data. It looks for your bank in this order:

1. `portfolio-bank.md` in your current working directory
2. `~/.jd-resume-tailor/portfolio-bank.md`
3. `references/portfolio-bank.md` inside the skill folder (for Claude.ai uploads)

Start from `skills/jd-resume-tailor/references/portfolio-bank.sample.md`, or ask the skill to build one from your pasted resume. Rules: one fact per line, real numbers only, and IDs (`E01`, `P03`, `F2`) never change once used.

## Use

```
Tailor my resume for this JD:
<paste the job description>
```

## Customize

- `references/style-guide.md`: bullet format, banned words, verb pool
- `references/hard-skips.md`: postings to refuse
- `references/domain-matching.md`: domains and fallback subtitles

## Privacy

Your portfolio bank stays on your machine. `.gitignore` excludes it, and CI fails if one is committed.

## Testing

`evals/trigger-tests.md` has 10 trigger prompts (5 should load the skill, 5 should not) and a quality checklist.

## License

MIT
