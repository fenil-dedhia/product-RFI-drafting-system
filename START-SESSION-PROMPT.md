# START-SESSION-PROMPT.md

The prompt you paste into Claude Code to start a run — for the RFI cycle, run it **after** completing
`SETUP-INSTRUCTIONS.md`.

There are two prompts here, because the repo does two jobs:

| Use | When | Prompt |
| --- | --- | --- |
| **Mode A — RFI questionnaire** | You have a blank analyst questionnaire staged in `outputs/blank-current-RFI/` | [below](#the-prompt--mode-a-rfi-questionnaire) |
| **Mode B — general product Q&A** | Someone needs product questions answered and there's no questionnaire — a customer thread, a sales escalation, a security review | [further down](#the-prompt--mode-b-general-product-qa) |

Both read the same `knowledge-base/` and enforce the same truth rules. Mode B is governed by
[`GENERAL-Q&A-PLAYBOOK.md`](./GENERAL-Q&A-PLAYBOOK.md) for structure, voice and formatting.

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

## The prompt — Mode A (RFI questionnaire)

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

---

## The prompt — Mode B (general product Q&A)

Use this when someone needs product questions answered and there is **no** questionnaire. Attach or point at the
source — the mail thread, PDF, or list of questions — and replace the two markers.

| Marker | Replace with |
| --- | --- |
| **`<<FILL: SOURCE>>`** | path to the thread / PDF / doc, or paste the questions inline |
| **`<<FILL: REQUESTER_AND_AUDIENCE>>`** | who asked, and who the answers are ultimately going to (e.g. "Amir, our SE — answers go to a banking prospect") |

```
I need help answering product questions. This is Mode B (general product Q&A), not an RFI cycle — there is no questionnaire staged. If any <<FILL: … >> marker remains anywhere in this message, stop and ask me for those values first.

Follow CLAUDE.md for what is true, and GENERAL-Q&A-PLAYBOOK.md for how the response is structured, worded and formatted. Both are in this repo.

- Source: <<FILL: SOURCE>>
- Requester and audience: <<FILL: REQUESTER_AND_AUDIENCE>>

Read the whole source before answering anything, and keep the voices separate throughout — what they asked, what their stakeholder followed up with, and what we already told them. Treat anything we've already said as an incumbent, but verify it: if we've told them something wrong, say so plainly and mark it as a correction next to the answer it belongs to.

Ground every answer in the primary sources registered in knowledge-base/doc-sources.md, and read into the docs of every module you make claims about — not just the one you expect to be relevant. Before asserting any limit ("no", "partial", "not supported", "module A doesn't do X"), run a deliberate negative search in the docs of the module that owns that capability and tell me what you searched. Anything you can't evidence that way, flag rather than assert.

Flag anything touching pricing, packaging, licensing or entitlements and ask me before writing it down — don't infer commercial positions from documentation. If I'm unsure or only partly sure, offer me a VERIFY or UNKNOWN tag rather than picking for me.

Read knowledge-base/pm-roster.md and route every open question to the right PM using the tags there. If that file is missing or empty, ask me for the roster before drafting.

Write the response document next to the source material, not into outputs/ — that folder belongs to the RFI cycle. Deep-link to the specific published doc pages and verify each link resolves before you hand it to me.
```
