# knowledge-base/references/

This cycle's **source material** — the ground truth the agent draws answers from.

What belongs here:

- **The latest strategy deck** (`.pptx`). Keep the **speaker notes** — they explain each slide and are the single best source for strategy and positioning.
- **`roadmap/`** — roadmap decks, images, and exports (what is GA today vs. on the roadmap). Kept in its own subfolder because it changes most often and is refreshed every cycle.
- **Screenshots** and other supporting material relevant to this evaluation.

## Where the authoritative product-doc links live

Not here — they have a single home in [`../doc-sources.md`](../doc-sources.md) (the docs source repos and live docs sites that are the "ships today" source of truth). This keeps one home per pointer.

## Refresh priority (per cycle)

Refresh top-to-bottom; the top items age fastest:

1. **`roadmap/`** — changes most between cycles; refresh first.
2. **Product-doc pointers** in [`../doc-sources.md`](../doc-sources.md) — update if a source repo or docs site moved.
3. **Strategy & vision deck** — changes rarely; refresh occasionally, not every cycle.

## Precedence the agent applies

1. Latest strategy deck → strategy and positioning.
2. Official product docs / docs source repos (see [`../doc-sources.md`](../doc-sources.md)) → what ships **today**.
3. The file in `../previous-RFIs/latest-RFI/` → most recent prior facts.
4. Drafts / AI-generated reports → **style and coverage only, never a source of numbers.**

Nothing in this folder is committed to git except this guide and `roadmap/README.md` — see [`../../.gitignore`](../../.gitignore).
