# Hard skips

If any rule matches, stop and output `SKIP: <rule id> - <quoted JD line>`. Do not tailor.

| ID | Rule | Typical JD wording |
|---|---|---|
| S1 | Posting is incompatible with sponsorship | "unable to sponsor", "no visa sponsorship", "must be authorized without sponsorship now or in the future" |
| S2 | Requires US citizenship or a security clearance | "US citizens only", "active Secret clearance", "must obtain clearance" |
| S3 | Seniority far above target | "10+ years", "Principal", "Director", "Staff" with 8+ years required |
| S4 | Role is outside target roles | sales engineer, pure frontend, QA-only, data entry |

Notes:
- Only skip on explicit wording. Silence on sponsorship is NOT a skip.
- For S3 and S4, if unsure, do not skip; flag it at the top of the output as `WARN: <rule id>`.