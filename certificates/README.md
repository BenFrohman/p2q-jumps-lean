# Certificates and logs (v1.4)

Lean sources commit: e2015979bd000d641f4e5a0f7b70c39a77a90a77 (toolchain leanprover/lean4:v4.26.0, Mathlib v4.26.0).
Recorded 2026-11-16 17:19 CST.

Kernel-checked (inside `lake build`; lake-build.log is a clean rebuild of all P2qJumps modules with Mathlib from cache):
- lake-build.log: full `lake build` (exit 0).
- axiom-audit.txt: `lake env lean AxiomAudit.lean` (1 99 declarations; only propext, Classical.choice, Quot.sound).
- verify-lock.log: `scripts/verify-lock.sh` (technical checks PASS; paper_claim PENDING AUTHOR APPROVAL).
- scan-sorry-admit-native_decide.txt: `scripts/check_no_sorry.py`.
- lean4checker.log: kernel replay of every P2qJumps module with lean4checker v4.26.0 (all exit 0).
- rad_identity_audit.md: audit of the false identity rad(N) = N/gcd(N, φ(N)) (not used anywhere).

External (NOT kernel-checked): external/ (PARI/LMFDB data for 3936.b1, root numbers, R2 r ≤ 10^6, jumps search).
