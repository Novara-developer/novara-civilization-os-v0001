# Novara / Civilization OS – Roadmap v0.1

> This is not a promise.  
> This is a **public commitment** and a **public threat to myself**.

If I don't hit some of these, future me has full permission to laugh at 2025 me.

---

## Phase 0: Kernel (2025-11) ✅ DONE

**Goal**: Prove the core idea is real, not a tweet.

- [x] `audit_events` table with hash chain
- [x] SQL triggers to block history rewrites
- [x] `append_audit()` function
- [x] Basic Flask skeleton (`/ping`, `/debug/audit-sample`)
- [x] `audit-design.md`, `failures.md`, `iterations.md`, `open-questions.md`

**Status**: `v0.0001` – Genesis block exists.

**Kill condition** (when to admit it’s fake):  
If I don’t write any new audit events for 30 days, this repo is just cosplay.

---

## Phase 1: Personal OS (2025-12 ~ 2026-03)

**Goal**: Run this as **my own life OS** for 60–90 days.

- [ ] Add `life_logs` table (daily entries linked to `audit_events`)
- [ ] `/log` endpoint – POST one daily log (goals, actions, results)
- [ ] `/history` endpoint – GET my own audit chain with basic verification
- [ ] Store daily root hash somewhere visible (README badge or log)
- [ ] Hit **60+ consecutive days** of logs without breaking the chain

**Success metric**:
- I can open `/history` and *see* my last 2–3 months as a verifiable timeline.

**Failure line (hard rule)**:
- If I break the chain more than **3 times** in this phase →  
  I must write a public note in `failures.md` titled  
  `"[Phase 1] I couldn't even log my own life properly"`.

---

## Phase 2: Education PoC Seed (2026-04 ~ 2026-10)

(Aligned with my 2026/10 speech & Novara Format declaration)

**Goal**: Touch **one real learner** or small group with this system.

- [ ] Add `education_events` table
- [ ] Model: `student_id`, `session_id`, `plan`, `result`, `evidence_hash`
- [ ] Simple `/edu/log` endpoint for study sessions
- [ ] Run a **small pilot (3–5 people)** for ≥4 weeks
- [ ] Produce **1 Evidence Pack**:
  - anonymized AAL excerpt  
  - before/after results  
  - small PDF or markdown report

**Success metric**:
- At least **one person** says  
  > "This log + feedback actually helped me study better."

**Failure line**:
- If nobody completes 4 weeks, write in `failures.md`:
  - why they dropped
  - what was too heavy / too nerdy
  - what I will *not* repeat in Phase 3.

---

## Phase 3: NUS / Research-Grade Evidence (2026-11 ~ 2028-09)

(Aligned with my NUS / SG top grad school roadmap)

**Goal**: Turn Novara into a **research topic**, not just a side project.

- [ ] Make this repo the base of at least **one formal project**:
  - graduation project / independent study / research module
- [ ] Write an **8–12 page technical report** in English:
  - architecture  
  - hash-chain model  
  - education pilot results  
  - limitations & next steps
- [ ] Get **1–2 professors** to read and comment (any country ok)
- [ ] Upload a polished version as:
  - workshop paper / preprint / extended tech report

**Success metric**:
- I can attach this repo + paper to NUS / SG grad applications  
  and say:  
  > "This is not an idea. This is a running system with evidence."

**Failure line**:
- If I fail to produce any public PDF / preprint by end of Phase 3 →  
  I must write:  
  `"I stayed in the ‘cool idea’ zone for too long."`  
  in `failures.md` and cut some features from the next plan.

---

## Phase 4: Independence Index α (2028-10 ~ 2030+)

**Goal**: Move from **“my life + my PoC”** to **“public metric for others”**.

- [ ] Define a rough **Independence Index** spec:
  - how to rate AI systems / institutions  
  - what metrics matter (anchors, diversity, refusal behavior, etc.)
- [ ] Build a tiny public dashboard:
  - even static JSON + HTML is ok at first
- [ ] Evaluate **≥3 systems** (could be AI tools I actually use)
- [ ] Publish a **"Trust / Independence Report v0"**:
  - self-critique included

**Success metric**:
- At least one serious engineer / researcher asks:  
  > "Can I add my system to this index?"

**Failure line**:
- If I can’t evaluate even **one** external system,  
  I must admit in `iterations.md` that I over-scoped Phase 4.

---

## Phase 5: Civilization OS v1.0 (2030+)

> This part is intentionally blurry.  
> If the early phases are fake, this will never matter.

**Very long-term goals** (not promises):

- Standard (or ideas) adopted by ≥3 serious institutions:
  - governments / universities / regulators / large platforms
- Serious people use phrases like:
  - "We need Novara-style evidence."
  - "Do you have an Independence Index score?"
- It becomes **embarrassing** to ship important AI systems  
  *without* auditability and verifiable logs.

---

## Non-Goals (What This Is NOT)

- ❌ A blockchain project  
  Too slow, too public, not the point.
- ❌ A token / coin  
  No speculation layer. Evidence is the asset.
- ❌ A “move fast and break things” startup  
  This is **slow, boring infrastructure** on purpose.
- ❌ A fan-club  
  I don’t want followers.  
  I want other people who can **independently kill my ideas**.

---

## How to Use This Roadmap (for future me)

- If I miss a phase → write it in `failures.md`, don’t pretend it didn’t happen.  
- If I change a phase → record it in `iterations.md` with a clear reason.  
- If I get stuck → add a new item to `open-questions.md` instead of silently stalling.

**Last updated**: 2025-11  
**Maintained by**: Hinata (`@Novara-developer`)

## Founder Policy (v0.0001)

- Until graduate school is complete, and until at least one serious external contributor
  arrives **through Novara itself** (issues/PR/spec discussion),
  Novara remains a **single-founder project**.
- No equity, no "co-founder" title is given to real-life friends just because they are close.
- After v1.0, contributors are evaluated only by:
  - quality of criticism,
  - quality of evidence,
  - and alignment with the protocol, not personal history.