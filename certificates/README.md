# Certificates and logs (v1.4)

**Nothing in this folder is a certificate.** The certificate of record is only the GitHub Actions
artifact `lean-certificate-<commit sha>` uploaded by `.github/workflows/certify.yml` from a fresh CI run
on the pushed commit, built from the committed `lake-manifest.json` (see `AUDIT-2026-11-17.md`). Local
runs of `scripts/cert-bundle.sh` go to `../local-dev-logs/` and are marked
`NOT-THE-OFFICIAL-CERTIFICATE.txt`. The files below (16 Nov 2026) are historical local logs.

Lean sources commit: 4ae3e47f8e13edf2262528f0a8cc73657ccfc3cc (toolchain leanprover/lean4:v4.26.0, Mathlib v4.26.0).
Recorded 2026-11-16 17:19 CST.

SHA-256 hashes, the Lean sources commit, the toolchain (leanprover/lean4:v4.26.0, Mathlib v4.26.0), and the rebuild command for each file are in `certificates/MANIFEST`. Raw kernel logs were not rewritten.


Kernel-checked (inside `lake build`; lake-build.log is a clean rebuild of all P2qJumps modules with Mathlib from cache):
- lake-build.log: full `lake build` (exit 0).
- axiom-audit.txt: `lake env lean AxiomAudit.lean` (1 99 declarations; only propext, Classical.choice, Quot.sound).
- verify-lock.log: `scripts/verify-lock.sh` (technical checks PASS; paper_claim PENDING AUTHOR APPROVAL).
- scan-sorry-admit-native_decide.txt: `scripts/check_no_sorry.py`.
- lean4checker.log: kernel replay of every P2qJumps module with lean4checker v4.26.0 (all exit 0).
- rad_identity_audit.md: audit of the false identity rad(N) = N/gcd(N, φ(N)) (not used anywhere).

External (NOT kernel-checked): external/ (PARI/LMFDB data for 3936.b1, root numbers, R2 r ≤ 10^6, jumps search).
ω(N) ≥ 4: kernel bound n ≤ 10^4; PARI Q = 10^4 and Q = 10^6 range (no filters, 0 hits); optional
search_omega4_1e6.py at Q = 10^6 did not finish (3-hour timeout, exit 124, no output). Its r_i > p pre-sieve is justified for ω(N) ≥ 4 by the
kernel-checked theorem P2qJumps.omega4_constraints (q ≥ 3p^2, every prime factor of N exceeds p).
