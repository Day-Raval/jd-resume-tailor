---
name: jd-resume-tailor
description: Tailors a resume to one specific job description using the user's verified portfolio bank. Picks the subtitle, summary, skills order and 3 to 4 projects, rewrites bullets in the house style with a source tag on every bullet, and reports keyword coverage and honest gaps. Use when given a job posting, JD text or role link and asked to tailor, target, adapt or customize a resume. Do not use for cover letters, LinkedIn profiles or general resume advice.
---

# JD Resume Tailor

Produce a tailored resume draft in which every claim traces to the portfolio bank.

## Procedure
0. **Check scope.** If the request is not to tailor a resume (cover letter, LinkedIn, general advice), reply: "This skill only tailors resumes." and stop.
1. **Parse the JD.** Extract: company, role title, seniority, domain, must-have skills, nice-to-have skills, and any work-authorization or location requirements. Must-haves are skills in "requirements", "must have" or "required" sections; everything else is nice-to-have.
2. **Check skips.** Read `references/hard-skips.md`. If any rule matches, STOP. Output only: `SKIP: <rule id> - <quoted JD line>`.
3. **Pick projects.** Read `references/portfolio-bank.md` and `references/domain-matching.md`. Rank every project by how many JD must-haves its Stack and facts cover. Take the top 3; break ties with the domain table.
4. **Load facts.** Use ONLY the facts listed for the chosen projects and experience entries. Never use a fact marked `TODO`.
5. **Write the draft.** Subtitle, summary (2 to 3 lines), skills (ordered by JD priority), experience bullets, project bullets (one bullet per project).
6. **Apply style.** Read `references/style-guide.md` and enforce every rule. Re-read each bullet against the checklist at the end of that file.
7. **Tag sources.** End every bullet with its fact IDs in brackets, e.g. `[P02-F3]` or `[E02-F1, E02-F3]`.
8. **Report coverage.** Build the keyword table and gap list in the output format below.

## Hard rules

- A bullet without a source tag is invalid. Delete it rather than invent a fact.
- Never add a skill, tool, metric or domain claim the bank does not support. Put it under Gaps instead.
- The Skills section lists only items found in K01 or in a chosen entry's Stack.
- Never change a number from the bank. Do not round up, estimate or combine metrics.
- If the bank has fewer than 3 relevant projects, say so and use what exists. Do not stretch.

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
### <Company>, <Role>
- <bullet> [Exx-Fy]

## Projects
### <Project name> | <stack>
- <bullet> [Pxx-Fy]

## Keyword coverage
| JD keyword | Must-have? | Covered | Source tag |
|---|---|---|---|

## Gaps
- <keyword>: no evidence in portfolio bank

## Coverage score
<covered must-haves> / <total must-haves> must-haves covered
```