# Authoritative documentation sources

The registry of **where "what ships today" truth comes from** for your product — the live doc repos and doc sites the agent reads before trusting any deck, prior RFI, or recollection — plus an example of what the local `references/` corpus looks like. Product documentation and the docs source repos outrank decks for current capability (decks outrank both for strategy); the full precedence rules live in [`../CLAUDE.md`](../CLAUDE.md) (Principle 3).

Keep this list current — it is the single home for these pointers, so no other file should duplicate them. **Replace every `<<FILL: … >>` marker below** (the whole marker, angle brackets included), and add or remove product sections as needed.

## <<FILL: product or module name>>

- **Docs source repo (source of truth for shipped features):** <<FILL: docs source repo URL, e.g. https://github.com/your-org/your-docs-repo>>
- **Live documentation site:** <<FILL: live docs site URL, e.g. https://docs.your-company.com/...>>

Covers: <<FILL: capabilities documented here — e.g. catalog, lineage, APIs, connectors>>.

## <<FILL: second product or module name — or delete this whole section>>

- **Docs source repo:** <<FILL: docs source repo URL>>

Covers: <<FILL: capabilities covered>>.

> **If a source repo is public**, the agent can `git clone` or read it directly — no credentials required. A *private* source needs `gh` authentication or a token.

> **Team-confidential sources live only in the drive.** Where a component has upstream / deep-reference documentation that must not be tracked in this public repo (for example, a capability delivered by another vendor), its links and handling live in `OEM-disclosure-notes.md` — git-ignored, seeded from the restricted team drive (see [`../SETUP-INSTRUCTIONS.md`](../SETUP-INSTRUCTIONS.md)).

## Example — a populated `references/` corpus

Beyond the doc sources above, each cycle you drop non-doc source material into [`references/`](./references/) — the strategy deck (speaker notes are gold), roadmap slides, and positioning screenshots. This framework was built and first used by [Fenil Dedhia](https://www.linkedin.com/in/fenildedhia/) (Director of Product Management, Actian) for the Gartner Magic Quadrant for Data & Analytics Governance Platforms. A populated `references/` looked like this — use it as a template for your own:

- **`references/`**
  - **`Data-Intelligence-Breakout-Session.pptx`** — strategy deck (speaker notes = gold)
  - **`roadmap/`** — refreshed every cycle
    - `data-intelligence-product-roadmap-1…5.jpg` — per-initiative roadmap slides
    - `data-intelligence-platform-initiatives.jpg`
  - `icp-producers.webp`, `icp-consumers.webp`, `icp-controllers.webp` — ICP / persona screenshots
  - `data-intelligence-product.webp` — product intro
  - `vision-platform.webp`, `vision-diagram.webp`, `vision-agentic.webp` — product vision details
  - `value-prop-data-marketplace.webp`, `value-prop-knowledge-graph.webp` — value-prop examples
