# RFI Drafting System

**A self-serve, constitution-governed workflow for producing accurate, analyst-ready RFI responses with an AI coding agent.**

Analyst evaluations — the Gartner Magic Quadrant, Forrester Wave, IDC MarketScape, BARC Score — are high-stakes, recurring, and unforgiving. A single questionnaire can run to hundreds of questions; every answer is scored against a capability rubric, every cell is size-capped, and the finished evaluation is published. Drafting them by hand is slow; drafting them fast invites two specific, recurring failure modes:

1. **Numbers that aren't real** — a figure inherited from an old template, or invented, then quietly repeated across many answers.
2. **Limits that get blown** — answers that overflow the questionnaire's per-cell character caps and have to be re-cut late.

This repository is a **reusable system** that makes both failures structurally hard, and turns a scramble into a repeatable, reviewable pipeline the whole Product Management team can run.

> **New here? Start with the setup & folder-hygiene checklist → [`SETUP-INSTRUCTIONS.md`](./SETUP-INSTRUCTIONS.md).**

> **Have feedback for this system?** Contact the author, [Fenil Dedhia](https://www.linkedin.com/in/fenildedhia/) — suggestions and improvements are welcome.

---

## How it works — the folder is the interface

You don't configure anything. You **populate four folders** with real content, run **one prompt**, and the agent executes a fixed pipeline governed by [`CLAUDE.md`](./CLAUDE.md).

| Drop this in… | …and the agent treats it as |
| --- | --- |
| `outputs/blank-current-RFI/` | the blank RFI to fill this cycle (the target) |
| `knowledge-base/references/` | this cycle's truth — strategy deck (speaker notes especially), product docs, screenshots, roadmap |
| `knowledge-base/previous-RFIs/` | the factual corpus of prior completed RFIs |
| `knowledge-base/previous-RFIs/latest-RFI/` | the single most recent finalized RFI — top-ranked for current facts |
| `outputs/` | where the finished answers and filled workbook land |

Then the pipeline runs:

1. **Extract the schema first.** Before writing a word, the agent reads every answer cell's character limit, dropdown options, and value type straight from the workbook — so limits are honored from the first draft, not patched at the end.
2. **Build a facts register.** Every number is defined once, sourced to a quotable location, or flagged `VERIFY`. Inherited template values are treated as *unverified until proven*, and fabricating corroboration for a figure is explicitly forbidden.
3. **Interview the human.** The agent stops and asks about the judgment calls only a person can make — module scoping, third-party/partner capability disclosure, GA-vs-roadmap, deployment reality — before drafting anything.
4. **Draft per capability.** Each answer is written to its rubric line-item, to the character limit, as narrative prose — with a defensible, well-reasoned "No" preferred over an overreaching "Yes."
5. **Verify by measurement.** Every answer length is re-measured in code against its limit; every number is re-checked against the register by a fresh adversarial pass; every dropdown value is validated.
6. **Hand back a reviewable package.** A Markdown answer sheet (labelled by cell reference), a filled copy of the workbook, and a reviewer's note listing every number's provenance and every open `VERIFY` / `UNKNOWN` item.

---

## What makes it reliable

- **Provenance or it doesn't ship.** Counts, dates, versions, percentages, and customer numbers each carry a source citation or a `VERIFY` flag — nothing is asserted on trust.
- **Inherited ≠ verified.** A number sitting in a template is a *question to answer*, not an answer.
- **No invented corroboration.** The agent may cite a source only with an exact quote and location.
- **Measure, never estimate.** Character limits are enforced by counting in code, not by eyeballing.
- **Recency-ranked corpus.** The most recently finalized RFI is the strongest source of current facts; drafts are style precedent only, never a source of numbers.
- **Human-in-the-loop where it matters.** Two deliberate checkpoints — the scoping interview before drafting, and the reviewer's note before submission.

---

## Getting started

1. Fork and clone this repo.
2. Read **[`SETUP-INSTRUCTIONS.md`](./SETUP-INSTRUCTIONS.md)** and run the one-time setup.
3. Each cycle: run the folder-hygiene checklist in `SETUP-INSTRUCTIONS.md`, then paste **[`START-SESSION-PROMPT.md`](./START-SESSION-PROMPT.md)** into Claude Code.

---

## Repository layout

Six framework files at the root — this README, [`CLAUDE.md`](./CLAUDE.md), [`START-SESSION-PROMPT.md`](./START-SESSION-PROMPT.md), [`SETUP-INSTRUCTIONS.md`](./SETUP-INSTRUCTIONS.md), [`REPO-STRUCTURE.md`](./REPO-STRUCTURE.md), and the requirements file — plus two content areas you populate locally: `knowledge-base/` (what the agent reads) and `outputs/` (what it produces). The content folders ship empty; `.gitignore` keeps whatever you add local.

**→ [`REPO-STRUCTURE.md`](./REPO-STRUCTURE.md)** is the full annotated map of every file and folder, and how content flows through a cycle.

---

## Design notes

A few deliberate choices, for anyone evaluating how this is built:

- **Constitution as code.** The durable rules live in `CLAUDE.md`, which Claude Code loads automatically every session. The per-run prompt stays thin and carries only what changes cycle to cycle — so quality is a property of the system, not of whoever happened to write that day's prompt.
- **The RFI is treated as a scored artifact, not a document.** Every question is mapped to its rubric capability, and answers are optimized per line-item rather than as prose.
- **Failure modes drove the safeguards.** The provenance/`VERIFY` protocol and the measure-don't-estimate rule exist because those are the two ways fast RFI drafting actually goes wrong; each has a dedicated, automated defense so it can't depend on a human catching it.
- **Privacy by construction.** This repo contains **no company data and no completed RFIs** — only the framework. The `.gitignore` whitelists just the folder guides, so confidential material a team member adds locally can't be pushed to a public fork by accident.

---

**Built by [Fenil Dedhia](https://www.linkedin.com/in/fenildedhia/).** This framework ships no proprietary data or completed evaluations — only the reusable method.
