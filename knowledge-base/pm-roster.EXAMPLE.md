# PM roster — EXAMPLE / TEMPLATE

**This file is tracked and ships with the repo. It is a template, not the real thing.**

To use it:

```bash
cp knowledge-base/pm-roster.EXAMPLE.md knowledge-base/pm-roster.md
```

Then fill in `pm-roster.md` with your real owners. That path is **git-ignored** — the rule already
ships in `.gitignore`, so you don't need to add it — because the real file carries colleagues' names
and contact details. It never travels with a fork; each teammate creates their own copy.

The agent reads `knowledge-base/pm-roster.md` to route open questions to the right owner when
answering general product questions (Mode B — see [`GENERAL-Q&A-PLAYBOOK.md`](../GENERAL-Q&A-PLAYBOOK.md)),
tagging them inline next to the relevant answer and again in a closing open-points table. If the file
is missing or still empty, the agent stops and asks you for the roster rather than guessing.

---

## How to fill in the table

- **Area** — how you'd describe the domain in a sentence. The agent matches questions against this, so be
  generous: list the sub-topics and product names that belong to the area, not just a one-word label.
- **PM** — the person's name as you'd write it in a document.
- **Tag** — exactly how the agent should write the mention, e.g. `@Firstname`. Short and unambiguous.
- **Contact** — email or handle. Optional, but it saves the requester looking it up.

## Roster

| Area | PM | Tag | Contact |
| --- | --- | --- | --- |
| Data products, data contracts, marketplace, contract standards | _Name_ | `@Name` | _email_ |
| AI capabilities, agents, semantic matching, classification | _Name_ | `@Name` | _email_ |
| Connectivity, connectors, scanners, integrations | _Name_ | `@Name` | _email_ |
| Catalog, glossary, lineage, metamodel | _Name_ | `@Name` | _email_ |
| Platform, security, identity, deployment | _Name_ | `@Name` | _email_ |

Add or remove rows to match how your product is actually split. The areas above are only a starting shape.

## Escalation notes

Anything not owned by a PM above:

- **Commercialization** (pricing, packaging, licensing, entitlements, per-environment terms): _who?_
- **Security and compliance reviews:** _who?_
- **Anything unowned:** _default to whom?_
