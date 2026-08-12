# knowledge-base/

Everything the agent reads **from** to draft answers.

- **[`doc-sources.md`](./doc-sources.md)** — the single registry of authoritative product-doc sources (docs GitHub repos and live docs sites). The "what ships today" source of truth.
- **`OEM-disclosure-notes.md`** — team-confidential notes on any capability that is actually delivered by another vendor: the approved wording for disclosing how each is integrated, delivered, and supported, plus upstream vendor doc links. The agent reads it and applies those disclosures in **every** relevant answer. It is **git-ignored**, so it is **not** in the public repo and does **not** travel with a fork — teammates pull it from the restricted team drive (see [`../SETUP-INSTRUCTIONS.md`](../SETUP-INSTRUCTIONS.md)).
- **`references/`** — this cycle's current source material (strategy deck, screenshots), with roadmap material in **`references/roadmap/`**. Refreshed every cycle.
- **`previous-RFIs/`** — the corpus of prior completed RFIs and reports, with the single most recent one in **`previous-RFIs/latest-RFI/`**.

The blank RFI you are filling this cycle does **not** live here — it goes in `outputs/blank-current-RFI/`.

**Cold start:** the public repo ships these folders empty. Seed them once from the team drive (see [`../SETUP-INSTRUCTIONS.md`](../SETUP-INSTRUCTIONS.md)) so you aren't starting from nothing. Precedence and recency rules are in [`../CLAUDE.md`](../CLAUDE.md).
