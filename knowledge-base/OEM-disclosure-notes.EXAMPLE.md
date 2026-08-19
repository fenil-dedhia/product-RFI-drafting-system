# Third-party capability disclosure notes — EXAMPLE / TEMPLATE

**This file is tracked and ships with the repo. It is a template, not the real thing.**

Only needed **if some capability in your product is delivered by another vendor** — white-labeled, OEM'd,
or embedded. If everything is built in-house, skip this file; the pre-flight check will ask you to confirm
that at the start of each run, so a newly-added third-party capability never slips through unnoticed.

To use it:

```bash
cp knowledge-base/OEM-disclosure-notes.EXAMPLE.md knowledge-base/OEM-disclosure-notes.md
```

Then fill in `OEM-disclosure-notes.md`. That path is **git-ignored** — the rule already ships in
`.gitignore` — because the arrangement is usually commercially sensitive. It never travels with a fork;
each teammate creates or obtains their own copy.

The agent reads it before drafting and applies the disclosure in **every** relevant answer, because an
analyst questionnaire is scored per line-item and a disclosure made once does not cover the rest.

---

## &lt;Capability name&gt; — delivered by a third party

**Fact to disclose:** &lt;Your product's capability X&gt; is a white-labeled OEM of &lt;vendor&gt;, resold under
our brand. An analyst will usually still let you claim the capability, but the arrangement must be
disclosed and its integration, delivery and support explained. If the capability is essential to the
evaluation's **inclusion criteria**, present it as a genuinely **pre-integrated module**.

**Upstream vendor documentation:** &lt;link, if you have one — useful for deep technical questions&gt;

**Approved disclosure wording** (adapt per answer; keep it factual):

- **Nature:** "&lt;Capability&gt; is a white-labeled OEM of &lt;vendor&gt;, offered as a pre-integrated module."
- **Integrated:** &lt;how its outputs reach the rest of your platform — which interface, what surfaces where&gt;
- **Delivered:** &lt;deployment model — managed SaaS, customer VPC, on-prem, and on which clouds&gt;
- **Supported:** &lt;who sells it, who contracts it, who owns the support relationship and escalation path&gt;

**Where to apply it:** &lt;list every question type and capability area that carries this — e.g. the module
list, and every answer touching profiling, monitoring, quality scoring, anomaly detection&gt;. Disclose it in
**each** such answer, not only once.

---

_Repeat the block above for each further third-party-delivered capability._
