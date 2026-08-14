# outputs/

The **working set** for this cycle: the blank target and everything the agent produces from it.

- **`blank-current-RFI/`** — the single **untouched** blank RFI you are drafting against this cycle. The agent never edits it in place; it re-runs from it.
- **This folder (alongside it)** — the **versioned deliverables** the agent writes on each drafting pass:
  - a **filled copy of the workbook** and its **Markdown answer sheet**, sharing a version tag: `<name>_v1.xlsx` + `<name>_v1.md`, then `_v2`, `_v3`, … Prior versions are kept, never overwritten, so you can compare and roll back.
  - the answer sheet labels every answer by its exact cell reference (e.g. `[K24]`) with its measured character count, so multi-slot answers paste cleanly;
  - a **reviewer's note** — the numbers register (each figure, where used, its provenance or `VERIFY` status), the `UNKNOWN` / `VERIFY` list to resolve, the **conflict log** (every contradiction the conflict pass found, how it was settled — by source or by your ruling — and anything still open), and the answers most likely to draw analyst scrutiny.

The reviewer's note is the **async** sweep — yours to work through, or to distribute across the team. It is not where contradictions are supposed to surface for the first time: those get raised with you *live*, during the session, before the package is written (see Phase 6 in [`../CLAUDE.md`](../CLAUDE.md)).

**Approval → `_FINAL`.** When you approve a version, the agent writes it with a `_FINAL` suffix (`<name>_FINAL.xlsx` + `<name>_FINAL.md`). That is your handoff artifact: upload `_FINAL` to the team drive, then manually copy the answers into your organization's secured master spreadsheet (which lives behind org auth and the agent cannot access). The `_FINAL` also becomes next cycle's corpus — it graduates into `knowledge-base/previous-RFIs/latest-RFI/` (see [`../SETUP-INSTRUCTIONS.md`](../SETUP-INSTRUCTIONS.md)).

Clear old versioned files at the start of each cycle so they aren't confused with current work.

Nothing in this folder is committed to git except this guide — generated answers can contain confidential content and are ignored by [`../.gitignore`](../.gitignore).
