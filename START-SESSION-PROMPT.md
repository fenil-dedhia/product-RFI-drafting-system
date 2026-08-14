# START-SESSION-PROMPT.md

The prompt you paste into Claude Code to start a drafting cycle — run it **after** completing `SETUP-INSTRUCTIONS.md`.

## Before you paste — replace the FILL markers

The prompt block below has **`<<FILL: … >>`** markers everywhere you must substitute a value. Replace each one — the whole `<<FILL: … >>`, angle brackets included — with your specifics before pasting. They are deliberately loud so none get missed, and if you ever leave one in, Claude Code will spot the leftover marker and ask for it instead of drafting with a blank.

Here is what each marker takes:

| Marker | Replace with | How often |
| --- | --- | --- |
| **`<<FILL: ANALYST_FIRM_AND_EVALUATION>>`** | e.g. Gartner Magic Quadrant for Data and Analytics Governance Platforms | per cycle |
| **`<<FILL: PRODUCT_NAME_AND_AKA>>`** | your product, plus any former or "also known as" name | once |
| **`<<FILL: LIVE_DOC_URLS>>`** | live doc pages for features not yet in the local files | per cycle |
| **`<<FILL: COMPETITORS>>`** | comparable products to reference where useful | rarely |
| **`<<FILL: DIFFERENTIATING_LAYER>>`** | your platform's differentiating layer (e.g. semantic / metadata / knowledge-graph) | once |

Then copy the whole block below and paste it into Claude Code.

## The prompt

```
You are helping our Product Management team fill out an analyst-firm RFI questionnaire for our product. If any <<FILL: … >> marker remains anywhere in this message, stop immediately and ask me to supply those values before doing anything else. Follow the constitution in CLAUDE.md exactly — it is the standing framework for this repo (the pre-flight check, truth-and-provenance rules, character-limit handling, source precedence, answer craft, versioned deliverables, and orchestration).

Cycle specifics:
- Analyst firm / evaluation: <<FILL: ANALYST_FIRM_AND_EVALUATION>>.
- Product: <<FILL: PRODUCT_NAME_AND_AKA>>.
- Target: the blank questionnaire in outputs/blank-current-RFI/. Never edit it in place — write versioned filled copies into outputs/. It may arrive with some answers already filled in: treat those as incumbents. Never overwrite one — draft yours alongside it and bring me the difference.
- Sources: knowledge-base/references/ holds this cycle's material (the latest strategy deck — speaker notes are the best strategy source; roadmap in references/roadmap/). knowledge-base/doc-sources.md lists the authoritative "ships today" product docs. knowledge-base/previous-RFIs/ is the factual corpus, with the single most recent finalized RFI in previous-RFIs/latest-RFI/ (top-ranked for current facts). knowledge-base/OEM-disclosure-notes.md holds any third-party-capability disclosures to apply in every relevant answer.
- Live docs to also read for features not in the local files: <<FILL: LIVE_DOC_URLS>>.
- Comparable products to reference where useful: <<FILL: COMPETITORS>>.
- Our differentiator to frame No/partial answers around: our <<FILL: DIFFERENTIATING_LAYER>> layer.

Work in the order CLAUDE.md defines. Start with the pre-flight check, then extract the cell schema, then build the facts register (provenance or VERIFY for every number — never inherit or fabricate a figure; pin the counting definition for every aggregate). Then stop and interview me on the "Always confirm" items before drafting a single answer. After I answer, draft to the character limits, then verify every length and every number by measurement. Then run the conflict pass before handing anything back: attack your own answers for contradictions — against answers already in the questionnaire, against what the last finalized RFI told this analyst, against each other, and against the sources. Settle what a quotable source settles; bring me the rest live, in this session, clustered by decision rather than by cell, and I will rule on each. Then write versioned deliverables into outputs/ with the reviewer's note. Do not brand anything _FINAL until I explicitly confirm a version is the final deliverable.
```
