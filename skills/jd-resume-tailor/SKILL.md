---
name: jd-resume-tailor
description: Tailors a resume to one specific job description using the user's verified portfolio bank. Picks the subtitle, summary, skills order and 3 projects, rewrites bullets in the house style with a source tag on every bullet, and reports keyword coverage and honest gaps. Use when given job description text and asked to tailor, target, adapt or customize a resume. Do not use for cover letters, LinkedIn profiles or general resume advice.
---

# JD Resume Tailor

Produce a tailored resume draft in which every claim traces to the portfolio bank.
All `references/` and `examples/` paths below are relative to the folder containing this SKILL.md.

## Procedure

0. **Check scope.** If the request is not to tailor a resume (cover letter, LinkedIn, general advice), reply: "This skill only tailors resumes." and stop.
1. **Find the portfolio bank.** Use the first file that exists:
   1. `portfolio-bank.md` in the current working directory
   2. `~/.jd-resume-tailor/portfolio-bank.md`
   3. `references/portfolio-bank.md` inside this skill
   If none exists, STOP. Tell the user no bank was found, show the format in `references/portfolio-bank.sample.md`, and offer to build one from their pasted resume. Write only facts the user supplies, and save it to option 1 or 2 only after they confirm.
2. **Parse the JD.** Extract: company, role title, seniority, domain, must-have skills, nice-to-have skills, and any work-authorization or location requirements. Must-haves are skills in "requirements", "must have" or "required" sections; everything else is nice-to-have.
3. **Check skips.** Read `references/hard-skips.md`. If any rule matches, STOP. Output only: `SKIP: <rule id> - <quoted JD line>`.
4. **Pick projects.** Read the bank and `references/domain-matching.md`. Rank every project by how many JD must-haves its Stack and facts cover. Break ties by nice-to-haves, then by Key Responsibilities, then by the domain table. Take the top 3.
5. **Load facts.** Use ONLY the facts listed for the chosen projects and experience entries. Never use a fact marked `TODO`.
6. **Write the draft.** Subtitle, summary (2 to 3 lines), skills (ordered by JD priority), experience bullets, project bullets (one bullet per project).
7. **Apply style.** Read `references/style-guide.md` and enforce every rule. Re-read each bullet against the checklist at the end of that file.
8. **Tag sources.** End every bullet with its fact IDs in brackets, e.g. `[P02-F3]` or `[E02-F1, E02-F3]`.
9. **Report coverage.** Copy each item from the JD's required and nice-to-have lists into its own row, as written.
   One row per item, examples:
   - "TensorFlow / PyTorch" → 1 row (alternatives: covered if either)
   - "Pinecone, Weaviate, Chroma, FAISS" → 1 row (interchangeable: the JD needs any one)
   - "AWS / Azure / GCP" → 1 row (interchangeable)
   - "Docker, Kubernetes, MLflow, CI/CD pipelines" → 4 rows (different tools, all needed)
   - "Fine-tuning and embeddings" → 1 row
   Merge only interchangeable alternatives. Never merge different tools.
   Covered values:
   - `yes`: named in the Stack or facts of an entry that appears on THIS resume
   - `swap Pxx`: evidence exists only in a project not chosen; name it
   - `listed`: appears only in the skills inventory (K01)
   - `no`: not in the bank

## Hard rules

- A bullet without a source tag is invalid. Delete it rather than invent a fact.
- Never add a skill, tool, metric or domain claim the bank does not support. Put it under Gaps instead.
- The Skills section lists only items found in K01 or in a chosen entry's Stack.
- Never change a number from the bank. Do not round up, estimate or combine metrics.
- If the bank has fewer than 3 relevant projects, say so and use what exists. Do not stretch.
- Every Gaps line must match a table row with the same status, and every count in Coverage score must equal the number of rows with that status.

## Output format

Use exactly these sections, in this order. See `examples/sample-output.md`.

```
## Target
<Company> | <Role title> | Domain: <domain>

## Subtitle
<one line>

## Summary
<2 to 3 lines, source tags at the end of each sentence>

## Skills
<Category>: item, item, item

## Experience
### <Company>, <Role> | <dates>
- <bullet> [Exx-Fy]

## Projects
### <Project name> | <stack>
- <bullet> [Pxx-Fy]

## Keyword coverage
| JD keyword | Must-have? | Covered | Source tag |
|---|---|---|---|

## Gaps
- <keyword>: no evidence in portfolio bank
- <keyword>: swap in Pxx (not on this resume)

## Coverage score
Must-haves: Evidenced <yes> / <total> · Swap available <swap> · Listed only <listed> · Missing <no>
All rows: Evidenced <yes> / <total>
```

Always output every section above, starting with `## Target`. Never skip the resume sections.
