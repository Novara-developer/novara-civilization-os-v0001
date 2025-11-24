# Novara / Civilization OS – Iterations Log v0.1

> This file records **version jumps** and why they happened.  
> Not “changelog for users”, but “proof that thinking evolved”.

---

## Iteration 1 – “Civilization OS v0.0001” (2025-11)

- **What changed**
  - Introduced `audit_events` as an append-only ledger.
  - Added hash chaining: `prev_hash` + `hash` with SHA-256.
  - Introduced `self_contracts` (future kill-switch rules).
  - Added SQL triggers to block UPDATE/DELETE on `audit_events`.
  - Implemented `append_audit()` in `app/audit.py`.
  - Created `/debug/audit-test` endpoint in `app/routes.py`.

- **Why this version exists**
  - I needed a **minimum viable “civilization kernel”**:
    - You can’t lie about the past.
    - Every action is linked to the previous one.
    - Even I (Hinata) must go through the same gate as any user.

- **Design bets**
  - SQLite is “good enough” for v0.0001.
  - Local hash chain is better than no chain.
  - Human-readable JSON is more valuable than maximum compression.

- **Next questions**
  - How to anchor daily root hashes externally? (e.g., Git commits, other ledgers)
  - How to expose this ledger safely to other people without leaking secrets?
