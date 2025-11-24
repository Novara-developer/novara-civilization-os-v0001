# Novara / Civilization OS – Iterations Log v0.1

> This file records **version jumps** and why they happened.  
> Not a “user changelog”, but **proof that thinking evolved**.

---

## Iteration 0 – Direction Lock: “Civilization OS” (2025-11-18)

**Scope**: Vision / Architecture / Identity

### What changed
- Locked the core framing from “personal AGI assistant / life OS”  
  → **“Civilization OS” (evidence & verification infrastructure)**.
- Decided that Novara’s primary object is not “tasks” or “notes”,  
  but **evidence bundles + append-only ledgers**.
- Committed to the idea:
  > *“If you can’t audit it, you don’t own it.”*

### Why this version exists
- Before this day, ideas were fragmented: life OS, AGI coach, school, etc.
- This iteration forced a single question:
  > *“What is the one thing that still matters in 2040+?”*  
  Answer: **verifiable evidence of what AI did and why**.
- Everything else (apps, UI, products, companies) can change,  
  the **Civilization OS layer** stays.

### Impact
- Gave a stable north star for all future design:
  - Audit-first, not UX-first.
  - Evidence as a first-class object.
  - Logs > Features.

### Related artifacts
- Personal notes from 2025-11-18 (economics class)
- Early sketches of `novara-evidence-bundle-minimal`

---

## Iteration 1 – First Working Evidence Bundle (2025-11-19)

**Scope**: Scripts / Verifier / End-to-end path

### What changed
- Implemented `scripts/generate_demo_bundle.py` to create a demo bundle:
  - AAL log
  - meta / anchors
  - zipped into `examples/hinata-2025-11-19.zip`.
- Wired `verifier/verify.py` to:
  - Validate AAL integrity.
  - Check anchors.
  - Print **[OK]** / error messages in the terminal.
- Ran the full loop on a laptop and got:
  > “AAL verification: OK  
  > Anchors verification: OK”

### Why this version exists
- Before this, “evidence bundle” was only a concept in notes and specs.
- This iteration proved:
  - The format is **implementable**, not just “pretty words”.
  - A single person on a laptop can run the full chain end-to-end.
- It turned “idea of an Evidence OS” into **a concrete artifact**.

### Impact
- Defined a minimum demo:
  - `python3 scripts/generate_demo_bundle.py`
  - `python3 verifier/verify.py examples/...zip`
- Gave confidence that the spec is not fundamentally broken.

### Related artifacts
- `examples/hinata-2025-11-19.zip`
- Terminal screenshots of the first successful verification run

---

## Iteration 2 – “Civilization OS v0.0001” GitHub Birth (2025-11-24)

**Scope**: Repo structure / Kernel implementation / Public release

### What changed
- Created public repository: `novara-civilization-os-v0001`.
- Implemented the **local civilization kernel**:

  - `schema.sql`
    - `audit_events` table as an **append-only ledger**.
    - `self_contracts` table for future kill-switch / self-governance rules.
    - SQL triggers to **abort any UPDATE/DELETE** on `audit_events`.

  - `app/audit.py`
    - `canonical_json()` for deterministic JSON encoding.
    - `append_audit()` that:
      - Reads previous hash (or `GENESIS_BLOCK_NOVARA_V0`).
      - Computes `hash = SHA256(prev_hash + metadata + payload_json)`.
      - Inserts a new row into `audit_events`.

  - `app/routes.py`
    - `@app.route("/debug/audit-test")` endpoint:
      - Appends a sample audit event.
      - Returns the new `audit_hash` for quick manual testing.

  - `app/__init__.py`
    - Simple export: `from .routes import app`.

- Added **meta-docs** to freeze the design context:

  - Root:
    - `LICENSE` (MIT)
    - `README.md`
    - `failures.md`
    - `iterations.md`
    - `open-questions.md`
    - `ROADMAP.md`

  - `context/`:
    - `concept-hierarchy.md`
    - `design-principles.md`
    - `terminology.md`
    - `why-sqlite.md`

### Why this version exists
- Needed a **public, inspectable starting point** for “Civilization OS”.
- Proved that:
  - Even on SQLite + Flask, we can enforce **local immutability**.
  - “Kill your own power” is encoded at the DB level, not just in words.
- The repo became a **reference artifact**:
  - Something a professor, auditor, or engineer can actually clone and read.
  - A timestamped proof of “who thought this way, and when”.

### Design bets
- SQLite is **good enough** for v0.0001:
  - Single-file, easy to inspect, triggers are simple.
- Local hash chain is better than:
  - No chain.
  - Over-engineered distributed systems at phase 0.
- Human-readable JSON is more important than maximum compression:
  - Auditors and future-me should be able to read the payloads.

### Next questions
- How to anchor daily root hashes externally?
  - Git commits? Other ledgers? Public notarization?
- How to expose the ledger safely to others without leaking secrets?
- When to migrate from SQLite to PostgreSQL / anchored ledgers?

### Impact
- Time to create: ~48 minutes during an economics class.
- Upgraded the project from:
  > “Local experiments on one laptop”  
  to  
  > **“Public kernel of a Civilization OS v0.0001”**.

---
