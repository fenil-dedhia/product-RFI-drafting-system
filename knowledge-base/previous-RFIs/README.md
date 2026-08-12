# knowledge-base/previous-RFIs/

The **factual corpus** — prior completed questionnaires and reports the agent mines for reusable facts and answer patterns.

## Structure

- **`latest-RFI/`** — holds the **single most recent** finalized RFI, and only that one. It is the top-ranked source of current facts; the agent treats it as the most authoritative prior answer set.
- **This folder (alongside `latest-RFI/`)** — every older finalized RFI and related report.

## Naming and ranking

- Name each finalized file so it contains **`FINAL`** and its **date** (e.g. `Some-Evaluation-Questionnaire-2026-07-17-FINAL.xlsx`).
- The file in `latest-RFI/` outranks everything here. Among the older files, most-recent-by-date wins.
- Drafts and AI-generated reports are used for **style and coverage only — never as a source of numbers.**

## Each cycle

When you finalize this cycle's RFI, move the file currently in `latest-RFI/` down into this folder, then place the newly finalized RFI into `latest-RFI/`. Keep it clean: only real, completed material — remove or clearly mark superseded drafts so stale figures can't be picked up. The full checklist is in [`../../SETUP-INSTRUCTIONS.md`](../../SETUP-INSTRUCTIONS.md).

Nothing in this folder is committed to git except this guide — see [`../../.gitignore`](../../.gitignore).
