# p2q-jumps-lean

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.22727814.svg)](https://doi.org/10.5281/zenodo.22727814) [![License: Apache-2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

Lean 4 working files for **Frohman, Theorem 28** (former Hypothesis R1):

> If both jumps hold and `n = p^2 q`, then `N = n + 12` is not a product of three distinct primes.

Paper: [10.5281/zenodo.22727814](https://zenodo.org/records/22727814)  
Concept DOI: [10.5281/zenodo.22713135](https://doi.org/10.5281/zenodo.22713135)

Copyright (c) 2026 **Benjamin Stanley Frohman**. License: [Apache-2.0](LICENSE).

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

---
## Archival DOI & Cryptographic Provenance

- **Dedicated 1-to-1 Zenodo DOI:** [10.5281/zenodo.22727814](https://doi.org/10.5281/zenodo.22727814)
- **Author:** Benjamin Stanley Frohman (ORCID: [0009-0006-7068-3718](https://orcid.org/0009-0006-7068-3718))
- **License:** Apache License, Version 2.0 (`Copyright (c) 2026 Benjamin Stanley Frohman`)
- **Earliest Commit Provenance:** `83def85f7812df25e4f503c8176942b725fa1bf3` (2026-06-21 02:11:16 PM CDT (UTC-5))
- **SealGuard SHA-256 Merkle Root:** `cafa6a2101b1393a290fd004373460ecdff2c71561ca18d7424aa9d3d0bcb385` (`PROVENANCE_MERKLE_ROOT.json`)
- **Titan Audit Certificate:** `audit/TITAN_AUDIT_CERTIFICATE.json` (Ed25519 key `b428fb72676f1c52`)
- **Scope & Scientific Boundary:** Formalizes verified algebraic jump identities in Lean 4 without claiming an unconditional resolution of the global Collatz conjecture.
