# Handoff Package for GitHub Actions / Zenodo Bots
**Date:** 2026-11-23
**Repo:** BenFrohman/p2q-jumps-lean
**Current HEAD:** a41eac65336e12c4474d200903ca64ae5dec4d73 (main)
**Purpose:** Complete context for PR/Merge and next Zenodo version publication of the closed-results formalization.

## Current Formalization Status (v1.4 level)

### Proved in Lean (0 sorry, standard axioms only)
- Theorem 28 / R1 (N ≠ r s t): `theorem28_holds` in `P2qJumps/ClosedShapes.lean` (full discriminant argument, builds on `g_ge_six`).
- N ≠ r^{2} s t (the r^{2}st clause of R3; R3 itself stays open because of its ω(N) ≥ 4 clause): `r2st_empty`.
- N ≠ r^{3} s under both jumps, no bound: `r3s_empty` (this does not prove the φ-only Hypothesis R2, which stays open).
- N ≠ r^a s (a ≥ 2), N not prime, N ≠ r s, N ≠ prime power, preamble (p,q ≥ 5, N odd, etc.).
- Kernel certificates: `Cert.no_jumps_p2q_le_10000`, line/strip/pair certificates up to 10^{4}.
- Full axiom audit in `AxiomAudit.lean` lists every theorem; CI enforces standard axioms only.

### Still Open
- Conjecture 3 (global non-existence of any p^{2}q jumps).
- ω(N) ≥ 4 residual (beyond bounds).
- Analytic uniform bounds / elliptic curve family (David's theorem etc.).

### Key Files for Bots
- Lean sources: entire `P2qJumps/` tree + `P2qJumps.lean` (imports all).
- CI: `.github/workflows/certify.yml` (produces `lean-certificate-<sha>` artifact on green).
- Certificates: the only certificate of record is the official CI artifact named in root `CERTIFICATE.md`. `AxiomAudit.lean` is the in-repo axiom list, not a certificate. `paper/historical/verification_certificate-821e35e.*` are stale historical documents, not certificates.
- Notes / residual ledger: `NOTES/R2.md`, `NOTES/R3.md`, `NOTES/R3_closure.md`, `NOTES/version_update_ready.md`.
- Paper: `paper/p2q-jumps-v1.4.pdf` (and .tex if present).
- Provenance: `PROVENANCE_MERKLE_ROOT.json`, `.zenodo.json`, `CITATION.cff`.

## Recommended Next Steps for Bots
1. **GitHub Actions / PR**
   - Ensure latest main is green on `certify.yml` (download the `lean-certificate-<sha>` artifact as the official kernel certificate).
   - If a formalization branch exists (`formalize/theorem28-discriminant` was created earlier), open/merge PR once CI is green.
   - Update `README.md` and `CERTIFICATE.md` if the locked statement changes.

2. **Zenodo Publication (concept DOI 10.5281/zenodo.22713135)**
   - Create new version from current published record.
   - Include:
     - Updated paper PDF (v1.4 or next).
     - This repo snapshot or link + commit SHA.
     - New certificate appendix referencing the CI artifact SHA and the proved theorems (`theorem28_holds`, `r2st_empty`, `r3s_empty`, etc.).
     - Residual ledger from `NOTES/`.
   - Metadata: version bump, description noting kernel-checked closed shapes + residual status of R2/R3/ω≥4.
   - Publish under the concept DOI.

## Conversation Context Summary (for bots)
- Goal: Full Lean formalization of *closed* results from the paper (Theorem 28 + elementary shape exclusions), with kernel certificates (0 sorry, only propext/Classical.choice/Quot.sound).
- Progress: Advanced from statement-only + `g_ge_six` to full proofs of the main closed shapes as of Nov 2026.
- Zenodo token was previously provided by the user for API updates; bots should use stored credentials or request fresh if needed.
- No claim of solving Conjecture 3 or the remaining open Diophantine residuals.

## Logs / Evidence to Include
- Latest successful `certify.yml` run artifact.
- `#print axioms` output from `AxiomAudit.lean`.
- Build log confirming 0 sorry.

**Nothing left out:** All proved closed results, residual notes, CI definition, and provenance are in the repo. Bots should archive the certificate artifact with any Zenodo upload.

Author: Benjamin Stanley Frohman
Handoff prepared for automated PR/Merge + Zenodo bots.
