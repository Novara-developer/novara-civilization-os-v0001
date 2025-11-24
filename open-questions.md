# Novara / Civilization OS – Open Questions v0.1

> These are not bugs.  
> These are **riddles** I want to solve over the next 5–10 years.

---

## Q-001: Multi-TEE / Multi-Region Attestation

- **Question**
  - How should Novara represent “trust” when attestation comes from:
    - TPM / TDX / SGX / Nitro / SNP…
    - different regions / legal zones…
  - as a single **evidence object**?

- **Notes**
  - Might require a “trust vector” instead of pass/fail.
  - Could tie into “Independence Index” later.

---

## Q-002: Human privacy vs. Public verifiability

- **Question**
  - How much of the AAL should be:
    - fully public
    - anonymized
    - fully sealed  
  - while still giving external auditors something to verify?

- **Notes**
  - Education PoC is a good first testbed.
  - I need patterns for “public summary from private logs”.

---

## Q-003: Kill-switch vs. Agency

- **Question**
  - How strict should `self_contracts` be?
  - When does a “helpful constraint” become a “prison”?

- **Notes**
  - I want Novara to stop me from self-destruction,
    but not from taking **calculated, conscious risks**.
