# JD Resume Tailor

Status: work in progress

`jd-resume-tailor` is a Codex skill for tailoring resumes to a specific job
description using a verified portfolio bank. The goal is simple: help produce a
targeted resume that is relevant to the role without inventing experience,
metrics, projects, or tools.

## Why This Is Worth Utilizing

Most resume tailoring workflows fail in one of two ways: they stay too generic,
or they hallucinate stronger experience than the candidate can defend. This
skill is designed around a stricter workflow:

- Use the job description as the source of role requirements.
- Use a private portfolio bank as the source of verified experience.
- Match domain, tools, responsibilities, and outcomes before rewriting bullets.
- Skip claims that are not supported by the portfolio bank.
- Keep private candidate details out of the public repository.

That makes the skill useful for candidates, career coaches, and agent workflows
where resume output must be both targeted and truthful.

## Current Capabilities

- Defines the `jd-resume-tailor` skill entrypoint in `SKILL.md`.
- Provides a sample portfolio bank format in
  `references/portfolio-bank.sample.md`.
- Keeps the real `references/portfolio-bank.md` file git-ignored for privacy.
- Includes placeholders for domain matching, style guidance, hard skips, sample
  job descriptions, and sample outputs.

## Work In Progress

This repository is intentionally marked WIP. The public shape is ready, but the
tailoring instructions still need to be filled in before treating this as a
production-ready skill.

Planned next steps:

- Write the full tailoring procedure in `SKILL.md`.
- Fill `references/style-guide.md` with resume voice, formatting, and bullet
  rules.
- Fill `references/domain-matching.md` with matching heuristics.
- Fill `references/hard-skips.md` with claims the skill must never make.
- Add a realistic `examples/sample-jd.md`.
- Add a complete `examples/sample-output.md`.
- Replace the placeholder `main.py` only if a script becomes necessary.

## Repository Layout

```text
.
|-- SKILL.md
|-- README.md
|-- examples/
|   |-- sample-jd.md
|   `-- sample-output.md
|-- references/
|   |-- domain-matching.md
|   |-- hard-skips.md
|   |-- portfolio-bank.sample.md
|   `-- style-guide.md
|-- main.py
`-- pyproject.toml
```

## Setup

Copy the sample portfolio bank and replace the fake entries with verified,
candidate-owned experience:

```powershell
Copy-Item references\portfolio-bank.sample.md references\portfolio-bank.md
```

`references/portfolio-bank.md` is ignored by git. Keep real projects, employers,
metrics, links, and candidate details there.

## Intended Usage

Use this skill when you have:

- A job description or posting.
- A verified portfolio bank.
- A request to tailor, target, or rewrite a resume for that role.

Expected prompt shape:

```text
Use jd-resume-tailor to tailor my resume for this job description:

<paste job description>
```

The finished skill should return a targeted resume draft and, where useful, a
short rationale explaining which portfolio items were used and which job
requirements were intentionally skipped.

## Privacy Model

The repository should contain only reusable instructions, samples, and fake
fixtures. Real candidate material belongs in `references/portfolio-bank.md`,
which is local-only by default.

Do not commit:

- Real portfolio bank entries.
- Private resumes.
- Job applications in progress.
- Recruiter or employer contact details.
- Generated drafts containing personal information.

## License

No license has been selected yet.
