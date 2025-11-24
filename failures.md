# Novara / Civilization OS – Failures Log v0.1

> This file records design & execution failures.  
> The point is not to avoid failure, but to **make it impossible to lie about it later.**

---

## 2025-11 – Evidence & Ledger Design

### F-001: AAL v0.1 was “cool” but useless

- **What I tried**
  - Designed a very complex AAL format with too many optional fields.
  - Tried to support *every* possible future use case in one schema.

- **Why it failed**
  - I couldn’t even use it for my own life logs.
  - Writing one entry felt like writing a tax form.
  - No 90-day log was possible with that complexity.

- **What I learned**
  - If I can’t use it daily, nobody else will.
  - v1.0 must be “boring but durable”.
  - Civilization OS must start as **personal OS** first.

- **Fix / Next**
  - v1.0 = small JSON, stable fields, append-only.
  - Complexity moves to tooling, not schema.

---

## 2025-11 – Hash Chain & Audit

### F-002: Almost forgot “append-only” at the DB level

- **What I tried**
  - Initially thought “I’ll just not write UPDATE/DELETE in my app code”.

- **Why it failed conceptually**
  - Future me might be tired, scared, or tempted.
  - App bugs / migrations could still break history.

- **What I learned**
  - **“I won’t do it” is not a safety property.**
  - The DB itself must refuse history rewrites.

- **Fix / Next**
  - Added `audit_events_no_update` and `_no_delete` triggers in `schema.sql`.
  - Treat SQLite schema as part of the “constitution”, not just storage.
