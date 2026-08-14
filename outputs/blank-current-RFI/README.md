# outputs/blank-current-RFI/

Put the **single blank RFI for this cycle** here — and only that file. This is the target the agent drafts against.

- One target file at a time. The agent treats whatever lives here as this cycle's questionnaire.
- Leave it **exactly as received** from the analyst firm — **including any answers it already contains.** Don't clear them. A partially completed questionnaire is normal: the agent treats each pre-filled answer as an *incumbent*, drafts alongside it rather than over it, and brings any disagreement to you live before handing back the package (Principle 6 in [`../../CLAUDE.md`](../../CLAUDE.md)).
- The agent **never edits this file in place** — it re-runs from this pristine copy and writes *versioned* filled copies (`_v1`, `_v2`, … then `_FINAL`) plus the answer `.md` into the parent `outputs/` folder.
- When a version is approved and finalized, the `_FINAL` file is promoted to `knowledge-base/previous-RFIs/latest-RFI/` (renamed with `FINAL` + date) per [`../../SETUP-INSTRUCTIONS.md`](../../SETUP-INSTRUCTIONS.md).

It lives under `outputs/` because the blank and its filled versions are one working set. Nothing in this folder is committed to git except this guide — see [`../../.gitignore`](../../.gitignore).
