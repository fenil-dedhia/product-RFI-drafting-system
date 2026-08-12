# SETUP-INSTRUCTIONS.md — Setup & folder hygiene

There are two parts: a **one-time setup** when you first fork the repo, and a **per-cycle checklist** you run by hand before each new RFI so the agent reads the right files and the newest facts.

> **Not your first time?** The one-time setup just below is only for your first fork — otherwise skip down to the **Per-cycle checklist** section (about halfway down this file).

---

## One-time setup (first fork)

1. **Fork** this repo to your own GitHub, then **clone** your fork locally.
2. **Install prerequisites:** Python 3, plus the libraries in [`claude-code-tooling-requirements.txt`](./claude-code-tooling-requirements.txt):
   ```bash
   pip install -r claude-code-tooling-requirements.txt
   ```
   These let the agent read and write `.xlsx` (openpyxl), and read `.pptx` decks (python-pptx) and `.docx` reports (python-docx).
3. **Install Claude Code** and open it **in the repo folder**, so `CLAUDE.md` is picked up automatically as the project's standing instructions.
4. **Confirm `.gitignore` is in place.** It keeps everything you add to the content folders **out of git**, so confidential RFI material never lands in a public repo. Only the folder `README.md` files (and `knowledge-base/doc-sources.md`) are tracked. Verify with `git status` after you populate the folders — your questionnaire, sources, and outputs should **not** appear as changes to commit.
5. **Populate the knowledge base (this solves the cold start).** The repo ships empty on purpose, so before your first run you curate your own source material into the local folders. Nothing you add here is committed — `.gitignore` keeps it local:
   - reference material → `knowledge-base/references/`,
   - roadmap material → `knowledge-base/references/roadmap/`,
   - prior completed RFIs → `knowledge-base/previous-RFIs/`,
   - the most recent finalized RFI → `knowledge-base/previous-RFIs/latest-RFI/`,
   - **only if a capability in your product is delivered by a third party** — create `knowledge-base/OEM-disclosure-notes.md` yourself, documenting the arrangement, the approved disclosure wording, and any upstream vendor doc links. It is **git-ignored** (never pushed), but every Claude Code session in this repo reads it from that path (per `CLAUDE.md`) and applies the disclosure in each relevant answer. If nothing in your product is third-party-delivered, skip it — the pre-flight check will simply ask you to confirm that at the start of each run, so a newly-added third-party capability never slips through.

   Then bring the fast-moving parts up to date using the refresh priority in the per-cycle checklist below. **For an example of a populated `references/` folder**, see the example section at the end of [`knowledge-base/doc-sources.md`](./knowledge-base/doc-sources.md).

   > **Rolling this out to a team from a public repo?** Everything above is git-ignored, so it never travels with a fork — a private or shared drive is a convenient place to keep this material for teammates to copy into their own clones. (That's how the team this was built for runs it.)

---

## Per-cycle checklist

_Before every new RFI — do these by hand._

1. **Promote last cycle's result into the corpus.** Take the questionnaire your team reviewed and finalized, and rename it so the filename contains **`FINAL`** and its **date** (e.g. `Some-Evaluation-Questionnaire-2026-07-17-FINAL.xlsx`). Then rotate the corpus: move whatever is currently in `knowledge-base/previous-RFIs/latest-RFI/` down into `knowledge-base/previous-RFIs/`, and place the newly finalized file into `latest-RFI/` so it is the **single top-ranked source of current facts**. Delete or clearly mark any superseded DRAFT so stale numbers can't be picked up.

2. **Stage the new questionnaire.** Put the new blank RFI to fill as the **only file in `outputs/blank-current-RFI/`**, so the agent unambiguously knows this cycle's target.

3. **Refresh `knowledge-base/references/`, in priority order** (top items age fastest):
   1. **`references/roadmap/`** — refresh **first**. Roadmap material changes most between cycles, and a stale roadmap is how a "does it ship yet" answer goes wrong. Drop in the latest roadmap deck/images and remove the previous cycle's.
   2. **Product-doc pointers** in `knowledge-base/doc-sources.md` — update only if a docs repo or site moved.
   3. **Strategy & vision deck** — changes rarely; refresh occasionally, not every cycle, and keep the speaker notes.

4. **Sanity-check `knowledge-base/previous-RFIs/`.** It should contain only real prior RFIs and reports — your factual corpus — with exactly one file in `latest-RFI/`. Nothing half-baked.

5. **Clear old deliverables from `outputs/`.** Remove last run's generated answers and filled workbook (the files directly in `outputs/`, not the `blank-current-RFI/` target) so they aren't confused with this cycle's work.

6. **Gather the team-only facts** for the interview step: current **version and GA date per module**, **active customer counts**, any **third-party / partner-supplied capability disclosure** wording, the exact **module list that defines "the platform,"** and any **percentage splits** the questionnaire asks for. No document can answer these — the agent will ask, and having them ready keeps the run moving.

---

Once the checklist is done, open [`START-SESSION-PROMPT.md`](./START-SESSION-PROMPT.md) and **replace the `<<FILL: … >>` markers it lists** — your product (set once) plus this cycle's analyst firm and any live-doc URLs. Then copy the prompt block and paste it into Claude Code. The agent runs the pre-flight check, extracts the schema, builds the facts register, and then **interviews you** before drafting.
