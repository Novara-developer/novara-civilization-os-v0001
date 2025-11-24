# Novara / Civilization OS – Terminology

_Last updated: 2025-11-24 (UTC)_

This file defines key terms used across the project.

---

## “Civilization OS”

Not a literal operating system.  
A mental model for:

> “Infrastructure that defines how decisions are logged, audited, and trusted.”

---

## “Evidence Bundle”

A package (ZIP) that contains:

- Raw logs (`aal.ndjson`)
- Metadata (`meta.json`)
- Proofs (signatures, hashes, anchors)
- Optional:
  - Screenshots
  - Config snapshots

Goal:
- Make it easy for a third party to verify:
  - What happened
  - In what order
  - Under what rules

---

## “AAL” (Action Accounting Ledger)

- The table `audit_events`
- One row = one action
- Contains:
  - `created_at`
  - `actor`
  - `action`
  - `entity_type` / `entity_id`
  - `payload_json`
  - `prev_hash`
  - `hash`

Idea:
> “Treat every action like a financial transaction.”

---

## “Self Contract”

- A rule stored in `self_contracts`
- Example:
  - “Max 4 coffee per day”
  - “No spending > $500 without double-check”

They don’t block behavior in v0.0001.  
They **record violations** so future systems can enforce or reflect.

---

## “Independence Index” (Future)

A metric to quantify:

> “How independent is this AI/system from a single vendor or political power?”

Not implemented in v0.0001.  
Kept here as a **north star concept**.

---

## “Anchors” (Future)

Ways to connect local logs to external trust sources:

- Git commits
- Bitcoin / Ethereum OP_RETURN
- Public transparency logs

v0.0001 only prepares the structure for this.