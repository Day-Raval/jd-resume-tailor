# JD Resume Tailor

![Codex Skill](https://img.shields.io/badge/Codex-skill-111827?style=for-the-badge)
![Status](https://img.shields.io/badge/status-work%20in%20progress-f59e0b?style=for-the-badge)
![Privacy](https://img.shields.io/badge/privacy-local%20portfolio%20bank-10b981?style=for-the-badge)
![Python](https://img.shields.io/badge/python-%3E%3D3.12-3776ab?style=for-the-badge&logo=python&logoColor=white)

> A privacy-first Codex skill for tailoring resumes to job descriptions using only verified, candidate-owned experience.

`jd-resume-tailor` helps turn a job description into a targeted resume draft without inventing projects, metrics, tools, employers, or responsibilities. It is built around a simple rule: the job description defines what matters, and the portfolio bank defines what can truthfully be claimed.

## ✨ Why It Exists

Most resume tailoring workflows break in one of two places:

- They stay generic and miss the role's real requirements.
- They overfit the posting and create claims the candidate cannot defend.

This skill is designed for the middle path: sharper than a generic resume, stricter than a hallucination-prone rewrite.

## 🧭 How It Works

```text
Job description
      ↓
Requirement extraction
      ↓
Portfolio bank matching
      ↓
Truth-checked resume tailoring
      ↓
Targeted resume draft + rationale
```

The intended workflow:

1. Read the job description for domain, responsibilities, tools, keywords, and seniority signals.
2. Match those needs against verified entries in `references/portfolio-bank.md`.
3. Rewrite bullets only when the supporting evidence exists.
4. Skip unsupported claims instead of stretching the candidate's background.
5. Keep real candidate data out of the public repository.

## ✅ Current Capabilities

- 🧩 Defines the `jd-resume-tailor` Codex skill entrypoint in `SKILL.md`.
- 🗂️ Provides a sample portfolio bank format in `references/portfolio-bank.sample.md`.
- 🔒 Keeps the real `references/portfolio-bank.md` file ignored by git.
- 🧱 Includes placeholders for domain matching, style rules, hard skips, sample job descriptions, and sample outputs.
- 🛠️ Keeps runtime code minimal until a script is actually useful.

## 🚧 Project Status

This repository is publishable as a skill scaffold, but the tailoring instructions are still being filled in. Treat it as a polished starting point, not a production-ready resume engine yet.

Planned next steps:

- Write the full tailoring procedure in `SKILL.md`.
- Fill `references/style-guide.md` with resume voice, formatting, and bullet rules.
- Fill `references/domain-matching.md` with matching heuristics.
- Fill `references/hard-skips.md` with claims the skill must never make.
- Add a realistic `examples/sample-jd.md`.
- Add a complete `examples/sample-output.md`.
- Replace `main.py` only if automation becomes necessary.

## 📦 Repository Layout

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

## ⚡ Quick Start

Copy the sample portfolio bank:

```powershell
Copy-Item references\portfolio-bank.sample.md references\portfolio-bank.md
```

Then replace the fake sample entries with real, verified experience:

- Projects you actually worked on.
- Tools and technologies you actually used.
- Metrics you can defend.
- Links you are comfortable sharing.
- Responsibilities that match your actual role.

`references/portfolio-bank.md` is ignored by git so private candidate details stay local by default.

## 🧪 Expected Prompt

Use the skill when you have a job description and a verified portfolio bank:

```text
Use jd-resume-tailor to tailor my resume for this job description:

<paste job description>
```

The finished skill should return:

- A targeted resume draft.
- Rewritten bullets grounded in verified experience.
- A short rationale showing which portfolio items were used.
- A list of requirements intentionally skipped because no supporting evidence existed.

## 🔐 Privacy Model

The public repository should contain reusable instructions, fake samples, and safe fixtures only.

Do not commit:

- Real portfolio bank entries.
- Private resumes.
- Job applications in progress.
- Recruiter or employer contact details.
- Generated drafts containing personal information.

## 🎯 Good Fit

Use this skill for:

- Candidates tailoring resumes role by role.
- Career coaches who need evidence-backed rewrites.
- Agent workflows where resume output must stay truthful.
- Portfolio-driven resume generation.

Avoid this skill for:

- Inventing missing experience.
- Creating fake metrics.
- Rewriting resumes without a verified source of truth.
- Storing private candidate data in the repository.

## 🪪 License

No license has been selected yet. Until one is added, assume all rights are reserved.
