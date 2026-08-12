# knowledge-base/previous-RFIs/latest-RFI/

Holds the **single most recent finalized RFI** — and only that one file.

This is the highest-ranked source of current facts in the whole corpus. When the agent needs a prior answer or a reusable number, this file is checked first.

Each cycle, before you start a new RFI: move whatever is here down into the parent `previous-RFIs/` folder, then drop the newly finalized RFI (named with `FINAL` + date) in here. Keep exactly one file. See [`../../../SETUP-INSTRUCTIONS.md`](../../../SETUP-INSTRUCTIONS.md).

Nothing in this folder is committed to git except this guide — see [`../../../.gitignore`](../../../.gitignore).
