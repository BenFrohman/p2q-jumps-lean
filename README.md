# p2q-jumps-lean

Lean 4 working files for **Frohman, Theorem 28** (former Hypothesis R1):

> If both jumps hold and `n = p^2 q`, then `N = n + 12` is not a product of three distinct primes.

Paper: [10.5281/zenodo.22727814](https://zenodo.org/records/22727814)  
Concept DOI: [10.5281/zenodo.22713135](https://doi.org/10.5281/zenodo.22713135)

Copyright (c) 2026 **Benjamin Frohman**. License: [CC BY 4.0](LICENSE).

## What this repository is

- Author-owned public snapshot of the theorem *statement*
- One algebraic lemma from the paper, written so it can be checked: `g t ≥ 6` for the leading form `g(t) = 4t^4+4t^3+11t^2+6t+7`
- Notes for the still-open Hypotheses R2 and R3

## What this repository is not

- Not a completed Lean certificate of Theorem 28
- Not a mathlib PR
- Not a proof of Conjecture 3 (no `n = p^2 q` at all)

The file `P2qJumps/Statement.lean` ends in `sorry`. Until that `sorry` is gone and `lake build` is green on CI, do not cite this repo as a machine-checked proof.

## Build (when Lean is installed)

```
lake update
lake build
```

Pinned toolchain: Lean 4.26.0 + mathlib v4.26.0. This session did not run `lake build`.

## Attribution

Cite the paper as Frohman, *Further constraints on simultaneous totient and divisor-sum jumps of length 12: the form n = p^2 q*, Zenodo 2026, 10.5281/zenodo.22713135.
