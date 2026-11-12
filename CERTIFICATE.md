# Lean Kernel Certificate for Theorem 28 and Associated Results

**Record:** Zenodo 10.5281/zenodo.24024593 (concept 10.5281/zenodo.22713135)

**Date of independent audits:** 2026-11-06

## Summary

The Lean 4 formalizations of Theorem 28 (three distinct primes excluded for N = n + 12 when n = p²q and jumps hold), structural lemmas, and the squarefree H1 case (p=7 descent) have been independently audited.

- **Build:** `lake build` completed successfully (exit 0).
- **Sorry:** Zero `sorry`, `admit`, or custom axioms in the sources.
- **Axioms:** Only the standard Lean axioms: `propext`, `Classical.choice`, `Quot.sound`.
- **Toolchain:** Lean 4.22.0 (for the full packages); base repository on 4.26.0.

## Evidence

Extracted from independent audit logs (e.g., `p2q-theorem28-independent-audit-logs-2026-11-06.zip`):

```
'P2qTheorem28.theorem28' depends on axioms: [propext, Classical.choice, Quot.sound]
Build completed successfully.
```

Similar for structural lemmas (G, phi_elim, K divisibility, common_prime_LT, R, 2-power, F/F′, radical_q_elim, cleared-product S) and H1 squarefree.

The full sources and logs are archived in the Zenodo record. This repository integrates the statement and leading-form lemma; the complete proofs are in the accompanying ZIP packages and can be built against the pinned Mathlib of the respective toolchain.

## Status

Kernel-verified. Ready for inclusion in subsequent paper versions and repository updates.

Author: Benjamin Stanley Frohman
