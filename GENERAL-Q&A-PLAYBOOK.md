# GENERAL-Q&A-PLAYBOOK.md — Mode B: general product Q&A

How to answer product questions that **aren't** an RFI questionnaire, using the same knowledge base and the same
truth rules. `CLAUDE.md` governs what is true; this file governs what the answer looks like.

> **Mode A vs Mode B** is defined at the top of [`CLAUDE.md`](./CLAUDE.md). Mode B inherits Principles 0, 1, 3, 4, 5
> and 6. It skips the cell-schema work and Principle 2 (character limits) — there are no cells and no caps.

---

## When this applies

Anything that arrives as **questions about the product with no questionnaire attached**:

- a customer or prospect sending follow-up questions after a demo or a call
- a sales engineer forwarding a thread and asking "what do we say to this?"
- an internal question about what ships today versus what's coming
- a security, procurement or architecture review
- an RFP or due-diligence document that isn't a scored analyst questionnaire

The tell is simple: someone needs **defensible answers about the product**, and there is no
`outputs/blank-current-RFI/` target for this work.

**Do not write Mode B deliverables into `outputs/`.** That folder is the RFI cycle's working set, and Phase 0 checks
it is clear. Write next to the source material the user gave you, or wherever they ask.

---

## Before you answer

1. **Read the source in full first.** If it's a mail thread or a PDF, extract it and read all of it before answering
   anything. The structure of the reply depends on knowing who said what.

2. **Separate the voices.** These threads almost always carry three layers, and conflating them is the single most
   common way the output becomes unusable:
   - what the **customer** originally asked or required,
   - what **their stakeholder** followed up with,
   - what **we** already told them.

   Keep them distinct all the way through. The person you're writing for needs to see, at a glance, what was asked
   versus what we said versus what's now true.

3. **Get the PM roster.** Open `knowledge-base/pm-roster.md`. If it is missing or empty, **ask the user for it
   before drafting** — who owns which product area, and how they want them referred to. Without it you cannot route
   open questions, and a document full of unrouted gaps puts the work back on the requester. Ask once, plainly:
   *"Who owns which area? I'll tag open questions to them."*

4. **Check what's already been said for errors.** Prior answers in the thread are incumbents (Principle 6), but in
   Mode B they were often given live, from memory, under time pressure. Verify them like any other claim. Finding
   that we've already told a customer something wrong is one of the most valuable things this pass produces —
   surface it early and unmistakably.

---

## The response document

One section per question, always in the same order. Consistency is what makes it skimmable when there are twenty of
them.

```markdown
## Q<n>. <Short title — what the question is actually about>

> **<Customer>:** <the requirement, verbatim>. *Answered: "<what we said before>"*
>
> **<Stakeholder>:** "<their follow-up, verbatim>"
>
> **<Our person>:** "<what we replied, verbatim>"

<span style="color:#0563C1"><strong>Answer:</strong></span> <the PM answer>

**Suggested response for <customer> — please edit:** *"<drop-in wording>"*

<mark style="background-color:#FFE066">**@<PM>**</mark> — <the specific question they need to close>

Read more: [<Page name>](<deep link>) · [<Page name>](<deep link>)
```

**Quote the source verbatim** in the context block. Don't paraphrase what the customer asked — the requester needs to
recognise their own thread.

**Close with an open-points table** listing every unresolved item, who owns it, and which question it belongs to, so
nothing tagged inline gets lost.

### The elements

| Element | Rule |
| --- | --- |
| **`Answer:`** | Always `<span style="color:#0563C1"><strong>Answer:</strong></span>`. Blue, bold, at the start of every answer, so the reader can find where our position begins without reading the context again. |
| **Suggested response** | Label it **"Suggested response for `<customer>` — please edit:"**. Never imply it is ready to paste. Most answers carry a caveat the sender must decide how much of to pass on. |
| **PM tags** | `<mark style="background-color:#FFE066">**@Name**</mark>`, inline at the point of doubt *and* in the closing table. Highlighted so the requester can find them and turn them into real mentions or mail links. |
| **Corrections** | Bold **Correction** inline in the answer it belongs to — never a separate section at the top. A correction is only useful next to the thing it corrects. State the count in the intro. |
| **Read more** | Deep links to the specific published doc pages, never a breadcrumb or a repo path. A link the requester can forward, or nothing at all. |

### Resolving deep links

Send people to the page, not to the docs home. Both product doc sets are MkDocs sites with
`use_directory_urls: false`, so a repo path maps directly to a published URL:

```
docs/<path>/<page>.md   →   <site_url>/<path>/<page>.html
docs/<path>/README.md   →   <site_url>/<path>/index.html
```

Take `site_url` from the repo's `mkdocs.yml` rather than assuming it. **Verify every link before shipping it** —
a dead link in a customer-facing document is worse than no link:

```bash
curl -s -o /dev/null -w '%{http_code}  %{url_effective}\n' -L "<url>"
```

If a doc set isn't MkDocs, work out its mapping once and check the same way. If a page isn't published, cite the
capability without a link rather than linking somewhere that doesn't exist.

---

## Voice

Write as the product manager, to a colleague. The reader is on our team and knows the product, the org and the
disclosure obligations — you are supplying judgement and verified facts, not orientation.

**Do:**

- Lead with the answer, then support it.
- State limits plainly. "We have no propagation engine today" beats a paragraph that avoids the word no.
- Say what to tell the customer *and* what to volunteer before they find it. Getting to an uncomfortable fact first
  is worth more than a clean-looking answer.
- Give the reasoning when a limit is architectural, briefly. It converts a "no" into a design choice.
- Flag anything you'd want to be asked about: a prototype demoed as if shipped, a claim that would fail a POC, a
  commercial commitment nobody has approved.

**Don't:**

- Narrate your own process. Nobody needs "I searched the documentation set", "I checked both repos", "having
  reviewed the available material". State the finding; the finding is the contribution.
- Introduce people or teams the reader already knows.
- Restate the disclosure obligations the team already operates under — apply them, don't teach them.
- Pad with em-dash chains, tricolons, or "it's worth noting that". Short sentences. Full stops.
- Hedge a real answer into mush. If it's a no, it's a no.

---

## What Mode B inherits

Everything about truth, unchanged:

- **Provenance or a flag** (Principle 1). Every number and volatile claim is sourced, computed, or tagged
  `VERIFY` / `UNKNOWN`. A customer answer is quoted back at us in a POC exactly like an RFI answer is.
- **Capability boundaries need a negative search** (Principle 1). Every "no", "partial" and cross-module claim is
  checked against the docs of the module that *owns* the capability, before it is written down. This is the rule
  Mode B breaks most often, because a live thread invites answering from familiarity.
- **One corpus per module** (Principle 3). Read into every module you make claims about.
- **Commercialization is escalated, never inferred** (Phase 6). Pricing, packaging, licensing, entitlements,
  standalone-versus-bundled, per-environment terms — surface to the owner and ask. If they're unsure or only
  partly sure, offer `VERIFY` or `UNKNOWN` and let them pick. Sales owns commercial answers, not the docs.
- **Third-party-delivered capabilities are disclosed** (Principle 4), in every relevant answer.
- **Deliverables live on disk** (Principle 5), written as they are produced, and versioned if the user iterates.

## What it drops

- Cell schema extraction, dropdown validation, character-limit measurement — no cells, no caps.
- The formal frozen facts register. Still define each reusable number **once** and keep the provenance to hand;
  just don't build the full register apparatus for a dozen questions.
- Versioned workbook copies. The deliverable is one document.
