#!/usr/bin/env bash
# AGENTS.md must stay in step with CLAUDE.md.
#
# WHY. The constitution ships twice: CLAUDE.md for Claude Code, AGENTS.md for Codex and the
# other tools that read the AGENTS.md standard. Two copies of the same rules with nothing
# holding them equal is how one of them quietly becomes wrong, and a stale constitution is
# worse than none, because it carries a rule's authority.
#
# THE INVARIANT is deliberately simple, because this repo has no test harness to host anything
# larger: AGENTS.md is its own header followed by CLAUDE.md, byte for byte. Nothing in this
# constitution is specific to one agent, so there is no sanctioned difference to allow for.
#
#   ./tooling/check-agents-md.sh     exits 0 if they agree, 1 and a diff if they do not
set -euo pipefail
cd "$(dirname "$0")/.."

[ -f CLAUDE.md ] || { echo "check-agents-md: CLAUDE.md is missing"; exit 1; }
[ -f AGENTS.md ] || { echo "check-agents-md: AGENTS.md is missing. It ships alongside CLAUDE.md."; exit 1; }

claude_bytes=$(wc -c < CLAUDE.md)
agents_bytes=$(wc -c < AGENTS.md)

# The tail of AGENTS.md, the same length as CLAUDE.md, must be CLAUDE.md.
if ! cmp -s <(tail -c "$claude_bytes" AGENTS.md) CLAUDE.md; then
  echo "check-agents-md: AGENTS.md has drifted from CLAUDE.md."
  echo
  echo "  The body of AGENTS.md must be CLAUDE.md byte for byte, after its header."
  echo "  Edit CLAUDE.md, then rebuild AGENTS.md as: header + CLAUDE.md"
  echo
  diff <(tail -c "$claude_bytes" AGENTS.md) CLAUDE.md | head -40 || true
  exit 1
fi

if [ "$agents_bytes" -le "$claude_bytes" ]; then
  echo "check-agents-md: AGENTS.md has lost its header."; exit 1
fi

# Codex stops reading at project_doc_max_bytes, 32768 by default, and truncates silently.
# This constitution is already over it; the header carries the setting that raises it, which is
# why the header is first. Warn rather than fail, so the check stays about drift.
if [ "$agents_bytes" -ge 32768 ]; then
  echo "check-agents-md: in step, but AGENTS.md is ${agents_bytes} bytes."
  echo "  Codex truncates at 32768 by default. The header tells readers to raise it."
  echo "  Getting under the cap is the durable fix."
  exit 0
fi

echo "check-agents-md: AGENTS.md is in step with CLAUDE.md (${agents_bytes} bytes)."
