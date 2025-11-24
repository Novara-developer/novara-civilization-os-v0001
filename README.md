# Novara Civilization OS v0.0001

Tiny prototype of a **Civilization OS**:
an immutable local audit log for human + AI decisions.

## Why

Money and media let a few actors control "truth".  
My answer is: **control evidence and verification instead.**

Novara is a small step toward that:
- append-only `audit_events` ledger
- self-contracts (rules that can block even myself)
- hash-chained history on a cheap SQLite DB

## Repo Structure

- `schema.sql` – DB kernel (audit_events, self_contracts, triggers)
- `app/` – Python code (audit append function, Flask glue later)
- `docs/audit-design.md` – design memo of v0.0001
- `failures.md` / `iterations.md` / `open-questions.md`
  – meta logs (what failed / how it evolved / what’s still hard)