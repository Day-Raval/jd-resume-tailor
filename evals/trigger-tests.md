# Trigger tests (Step 8)

Run each prompt in a fresh chat with the skill enabled. Record Y/N in "Triggered".
Target: all 5 positives trigger, no negatives trigger.

| # | Prompt | Should trigger | Triggered |
|---|---|---|---|
| 1 | Tailor my resume for this Optum ML Engineer posting: <paste JD> | Y | |
| 2 | Here's a JD for an AI Engineer at a fintech startup. Adapt my resume. | Y | |
| 3 | Can you target my resume to this computer vision role? <link> | Y | |
| 4 | Customize my resume for the attached job description. | Y | |
| 5 | Which of my projects should I lead with for this healthcare data scientist job? <JD> | Y | |
| 6 | Write a cover letter for this Optum role. | N | |
| 7 | Improve my LinkedIn headline. | N | |
| 8 | What are general tips for a data science resume? | N | |
| 9 | Summarize this job description for me. | N | |
| 10 | Draft a referral request message to a recruiter. | N | |

## Quality checks (Step 9), per output
- [ ] Every bullet has a source tag, and every tag exists in the bank
- [ ] No number differs from the bank
- [ ] No em dash, no "student", no purpose "to"
- [ ] In-progress projects last, max two
- [ ] Gaps are real (spot-check 2 against the bank)
- [ ] Better than / equal to / worse than the resume actually sent: ____