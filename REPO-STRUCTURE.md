# Repository map

One place to understand the whole layout — what every file and folder is, whether it ships in the repo or you populate it locally, and how content moves through a cycle. Each folder also carries its own `README.md` with the detail; this is the index over all of them.

## Annotated tree

- **`product-RFI-drafting-system/`**
  - `README.md` — What this system is (team + interviewer). Start here.
  - `REPO-STRUCTURE.md` — This file — the map of every file and folder.
  - `SETUP-INSTRUCTIONS.md` — One-time setup + the per-cycle folder-hygiene checklist.
  - `CLAUDE.md` — The constitution: standing rules every session enforces (auto-loaded).
  - `START-SESSION-PROMPT.md` — The per-run kickoff prompt (replace the `<<FILL:>>` markers, paste, go).
  - `claude-code-tooling-requirements.txt` — Python libs for reading/writing xlsx, pptx, docx.
  - `.gitignore` — Keeps populated content OUT of the public repo.
  - **`knowledge-base/`** — Everything the agent reads FROM.
    - `README.md`
    - `doc-sources.md` — Registry of authoritative product-doc sources (repos, docs sites).
    - **`references/`** — This cycle's source material (strategy deck, screenshots).
      - `README.md`
      - **`roadmap/`** — Roadmap material only — GA-vs-roadmap facts. Refreshed FIRST, every cycle.
        - `README.md`
    - **`previous-RFIs/`** — Corpus of prior completed RFIs and reports.
      - `README.md`
      - **`latest-RFI/`** — The single most recent finalized RFI — top-ranked for current facts.
        - `README.md`
  - **`outputs/`** — The working set for this cycle (produced files land here).
    - `README.md`
    - **`blank-current-RFI/`** — The untouched blank RFI for this cycle (the target).
      - `README.md`

## What ships vs. what you populate

| Path | Role | In the repo? |
| --- | --- | --- |
| `README.md`, `REPO-STRUCTURE.md`, `SETUP-INSTRUCTIONS.md`, `CLAUDE.md`, `START-SESSION-PROMPT.md` | The framework — instructions and rules | **Tracked** (ships on fork) |
| `claude-code-tooling-requirements.txt`, `.gitignore` | Tooling and the privacy guard | **Tracked** |
| `knowledge-base/doc-sources.md` | Authoritative doc-source registry | **Tracked** |
| Every folder's `README.md` | Per-folder guide (also what preserves the empty structure on fork) | **Tracked** |
| Anything you drop into `knowledge-base/references/` (incl. `roadmap/`) | Decks, roadmap, screenshots | **Local only** — git-ignored |
| Anything you drop into `knowledge-base/previous-RFIs/` (incl. `latest-RFI/`) | Prior completed RFIs | **Local only** — git-ignored |
| Anything in `outputs/` (incl. `blank-current-RFI/`) | The target and the generated deliverables | **Local only** — git-ignored |

The content folders ship **empty on purpose**. `.gitignore` whitelists exactly the `README.md` files (and `doc-sources.md`), so the structure survives a fork while confidential RFI material can never be pushed to a public repo by accident.

## How content moves through one cycle

1. **Seed once** (first fork): copy reusable material from the team drive into `knowledge-base/` — see [`SETUP-INSTRUCTIONS.md`](./SETUP-INSTRUCTIONS.md).
2. **Stage the target:** drop this cycle's blank RFI into `outputs/blank-current-RFI/`.
3. **Refresh** `knowledge-base/references/roadmap/` first, then doc pointers, then (rarely) the strategy deck.
4. **Run** [`START-SESSION-PROMPT.md`](./START-SESSION-PROMPT.md). The agent reads from `knowledge-base/`, drafts, and writes the answers `.md` + a filled workbook copy into `outputs/`.
5. **Finalize:** after human review, the finished RFI graduates out of `outputs/` — the file currently in `knowledge-base/previous-RFIs/latest-RFI/` moves down into `previous-RFIs/`, and the newly finalized RFI (named with `FINAL` + date) takes its place in `latest-RFI/`, becoming the top-ranked source for the next cycle.

So the flow is: **team drive → `knowledge-base/` → (agent) → `outputs/` → `previous-RFIs/latest-RFI/` → next cycle's top source.**
