# Handoff Summary for GitHub Actions & Zenodo Bots (2026-11-23)

## Current Status (as of main @ a41eac65)

**Closed & Kernel-Checked Results (Lean 4.26.0 + Mathlib v4.26.0)**
- Theorem 28 (N ≠ r s t for distinct primes): **proved** as `theorem28_holds` (not a hypothesis). Axioms: only propext, Classical.choice, Quot.sound.
- Elementary closed shapes: N not prime, N ≠ r s, N ≠ r^k, N ≠ r^a s (a≥2), N ≠ r^2 s t, etc.
- Bounded certificates: no solutions for n = p^{2}q ≤ 10^{4}; no r^{2} | L(p) for primes p ≤ 10^{4}; etc.
- See README.md for full table of proved items.

**Open Residuals**
- Hypothesis R2 (r^{3}s form): infinite family of elliptic curves E_k (k unbounded). Siegel finiteness per curve; no uniform closure. Computational searches empty in tested ranges.
- Hypothesis R3 (r^{2}st and ω(N)≥4): explicit formulae; empty in searched ranges; no general obstruction.
- Full Conjecture 3 remains open.

**Key Files & Artifacts**
- Lean sources: P2qJumps/ (ClosedShapes.lean, LeadingForm.lean, Cert/, Ext/, etc.)
- CI: .github/workflows/certify.yml, kernel-certificate.yml, truth-gate.yml
- Certificates: CERTIFICATE.md, audit/, local-dev-logs/ (historical)
- Paper notes: paper/, NOTES/
- Provenance: PROVENANCE_MERKLE_ROOT.json, .zenodo.json

**Zenodo Concept DOI**
- 10.5281/zenodo.22713135 (all versions)
- Latest public versions include v1.3 (Theorem 28 proved wording) and earlier certificate additions.
- Update after major Lean milestones by creating a new version that references the current commit SHA and certificate status.

**Handoff Instructions for Bots**
1. On green `certify.yml` / `kernel-certificate.yml` run: extract the artifact `lean-certificate-<sha>`, confirm 0 sorry + standard axioms only.
2. For PR/Merge: ensure the lock checks in scripts/verify-lock.sh pass; update README status table if new theorems are closed.
3. For Zenodo publication: use the concept DOI; new version description should cite the exact commit, the proved theorems (especially theorem28_holds), and explicitly note that R2/R3 remain open.
4. All drafts, audit logs, and NOTES/ are already in the repo; no external context is missing for the closed results.

Author: Benjamin Stanley Frohman
License: Apache-2.0 (Lean), CC BY 4.0 (paper)
