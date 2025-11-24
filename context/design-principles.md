# Novara / Civilization OS – Design Principles (v0.0001)

_Last updated: 2025-11-24 (UTC)_

This document captures the **core principles** behind the system.
If the code and this file ever disagree, this file wins.

---

## Principle 1 – Evidence > Opinion

- Code can be wrong.
- Humans can lie.
- Logs + hashes + proofs are the final judge.
- The system should always be verifiable by a skeptic.

**Implication**:
- Every meaningful action must be:
  - Logged
  - Linked (prev_hash → hash)
  - Inspectable

---

## Principle 2 – Design for Skeptics

Assume:

- Auditors don’t trust you.
- Future-you might be compromised.
- Operators may try to cheat.

So:

- Make it easy to verify without trusting:
  - The server
  - The developer
  - The current operator

---

## Principle 3 – Local First, Global Later

- v0.0001 is about **one human + one device**.
- If it doesn’t work for a single person, it won’t work for a country.
- Start with:
  - SQLite
  - Single-node
  - Personal logs

Later:

- PostgreSQL
- TEEs
- Cross-institution federation

---

## Principle 4 – Append-Only History

- `audit_events` is append-only.
- UPDATE / DELETE are blocked at SQL level.
- “Fixing a mistake” means:
  - Writing a new event
  - Pointing to the old mistake

No silent history rewrite. Ever.

---

## Principle 5 – Self-Binding

- The creator (Hinata) is not above the system.
- `self_contracts` defines rules that bind the operator.
- Violations are:
  - Logged
  - Visible
  - Eventually enforceable (v0.0001 = logging only)

---

## Principle 6 – Explain the Trade-offs

- Every major choice (SQLite, Flask, hash format) must be documented.
- `context/*.md` is as important as the code.
- Future maintainers must understand **why**, not just **how**.