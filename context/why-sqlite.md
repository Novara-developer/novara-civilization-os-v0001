# Why SQLite? (Novara Civilization OS v0.0001)

> This document explains why Novara v0.0001 uses **SQLite** instead of:
> - PostgreSQL / MySQL (traditional DB)
> - Blockchain (distributed ledger)
> - Cloud DB services (Firebase, Supabase, etc.)

---

## TL;DR

SQLite is **not the final answer**.  
It's the **minimum viable kernel** for proving the core idea:

> "Can we make AI decisions auditable with append-only logs and hash chains?"

Once that works, we can upgrade the storage layer.

---

## Why NOT Blockchain?

**Pros of blockchain**:
- Built-in immutability
- Distributed consensus
- Public verifiability

**Cons for v0.0001**:
- Too slow (1-2 sec per transaction)
- Too public (can't store private life logs)
- Too complex (need validators, gas fees, etc.)

**Decision**:
- Blockchain solves "distributed trust"
- But v0.0001 solves "local trust first"
- If I can't trust my own logs, I can't trust distributed logs either

---

## Why NOT PostgreSQL / MySQL?

**Pros of traditional DB**:
- Battle-tested at scale
- Rich query features
- Better for multi-user systems

**Cons for v0.0001**:
- Overkill for single-user prototype
- Requires server setup (not portable)
- Harder to inspect raw data

**Decision**:
- SQLite = single file = easy to backup/inspect
- v1.0 can migrate to PostgreSQL if needed

---

## Why NOT Cloud DB (Firebase, Supabase)?

**Pros of cloud DB**:
- No infrastructure management
- Built-in auth/API
- Easy scaling

**Cons for v0.0001**:
- Data lives on someone else's server
- Terms of service can change
- Harder to guarantee immutability

**Decision**:
- Civilization OS must be **self-hostable**
- Cloud integration can happen later, but the core must work offline

---

## What SQLite Gives Us (v0.0001)

✅ **Single-file portability**
- Entire database = one `.db` file
- Easy to backup, version control, migrate

✅ **Zero server setup**
- Works on laptop, VPS, Raspberry Pi
- No need for Docker/Postgres/etc. in Phase 0

✅ **Transparent inspection**
- Can open `.db` file with any SQLite client
- Can verify hash chain manually if needed

✅ **SQL triggers for immutability**
- Can enforce "no UPDATE/DELETE" at DB level
- Not reliant on application code alone

---

## Migration Path (v1.0+)

When Novara grows beyond personal use:

1. **Multi-user → PostgreSQL**
   - Better concurrency control
   - Proper user isolation

2. **Public audit → Blockchain anchoring**
   - Daily root hash → Git commit / Bitcoin OP_RETURN
   - Full logs stay private, summaries go public

3. **Enterprise scale → Distributed ledger**
   - Kafka + Postgres + TEE
   - But still compatible with v0.0001 schema

---

## Conclusion

SQLite is not the "best" database.  
It's the **right tool for proving the idea fast**.

If the idea fails, I wasted 2 weeks, not 2 months setting up infrastructure.  
If the idea works, the storage layer is easy to upgrade.

**Design philosophy**:
> Start with the **weakest viable guarantees**.  
> Add stronger guarantees only when you've proven you need them.

---

**Last updated**: 2025-11  
**Author**: Hinata
