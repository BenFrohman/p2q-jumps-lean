# p2q-jumps-lean

[![certify.yml](https://github.com/BenFrohman/p2q-jumps-lean/actions/workflows/certify.yml/badge.svg?branch=main)](https://github.com/BenFrohman/p2q-jumps-lean/actions/workflows/certify.yml)

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.22727814.svg)](https://doi.org/10.5281/zenodo.22727814) [![License: Apache-2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

Lean 4 formalization for **Frohman, *Further constraints on simultaneous totient and divisor-sum jumps of
length 12: the form n = p^2 q*** (v1.4 paper: [`paper/p2q-jumps-v1.4.pdf`](paper/p2q-jumps-v1.4.pdf)).

Concept DOI: [10.5281/zenodo.22713135](https://doi.org/10.5281/zenodo.22713135)

Copyright (c) 2026 **Benjamin Stanley Frohman**. License: [Apache-2.0](LICENSE).

## What is proved (v1.4)

Assume `φ(N) = φ(n) + 12` and `σ(N) = σ(n) + 12` with `n = p^2 q`, `p ≠ q` primes, `N = n + 12`.
The locked public theorem is `P2qJumps.Semantics.theorem_L` (paper Theorem L; transcription
approved by the author on 2026-11-21, see [TRUTH_GATE.md](TRUTH_GATE.md)):

| Item | Lean theorem | Status |
|---|---|---|
| `N` is not prime | `N_not_prime` | proved |
| `N ≠ r s` (distinct primes) | `N_ne_rs` | proved |
| `N ≠ r s t` (Theorem 28) | `theorem28_holds` | **proved** (not a hypothesis) |
| `N ≠ r^2 s t` (distinct primes ≥ 5) | `r2st_empty` | proved (new in v1.4) |
| `N = r^3 s` ⇒ `p < r`, `r^2 ∣ p^3 - p^2 - 12`, `p > 10^4` | `r3s_bound` | proved |
| no solution with `n ≤ 10^4` (any shape) | `Cert.no_jumps_p2q_le_10000` | proved |

Beyond the locked Theorem L (kernel-checked, standard axioms; their own locked statement file is **pending**,
see `paper/CHANGES-v1.4.md`):

| Item | Lean theorem | Status |
|---|---|---|
| `p, q ≥ 5`, `N` odd, not a square, `gcd(N, 6pq) = 1` | `preamble` | proved |
| `N ≠ r^k` (`k ≥ 1`) | `N_ne_prime_pow` | proved |
| `N ≠ r^a s` for every `a ≥ 2` (Theorem A; includes `r^2 s`, `r s^2`) | `N_ne_ras` | proved |
| `N ≠ r^3 s` (no bound on `p`; Theorem L(iv) becomes vacuous) | `r3s_empty` | proved |
| `ω(N) ≥ 4` ⇒ `q ≥ 3p^2` and every prime factor of `N` exceeds `p` | `omega4_constraints` | proved |

Kernel certificates (`decide +kernel` on checkers with proved soundness; **no `native_decide`**):

| Certificate | Bound actually reached |
|---|---|
| `Cert.cert_line`: `2F(p)` not a square | every integer `5 ≤ p ≤ 10^4` |
| `Cert.cert_strip_0..7`: no prime `r > p` with `r^2 ∣ L(p)` | every prime `5 ≤ p ≤ 10^4` |
| `Cert.cert_pair_*`: the σ-jump fails (so the pair of jumps fails) | every `n = p^2 q ≤ 10^4` |

Axioms: `#print axioms P2qJumps.Semantics.theorem_L` → `[propext, Classical.choice, Quot.sound]`.
Certificate of record: the GitHub Actions artifact `lean-certificate-<commit sha>` from a fresh
[`certify.yml`](.github/workflows/certify.yml) run on the pushed commit (committed `lake-manifest.json`
+ sha256, toolchain, Mathlib rev, elan/lake versions, full build log, full `#print axioms` output).
Local logs ([`local-dev-logs/`](local-dev-logs/), historical [`certificates/`](certificates/)) are not certificates.

## External computations (NOT kernel-checked; not used by any Lean theorem)

- `scripts/r2/r2_rbound.py 1000000`: no prime `5 ≤ r ≤ 10^6` has a prime `5 ≤ p < r` with `r^2 ∣ L(p)` (SymPy); now kernel-checked as `P2qJumps.hensel_r_le_1e6` (certify artifact `lean-certificate-0b82cdddcfb5ee8edf517b3634ad74d68bf75979` on main).
- `scripts/omega4/jumps_pq_check.py`: no solution for distinct primes `p, q ≤ 10^4`, and none for
  `5 ≤ p ≤ 997`, `p^2 < q ≤ 10^6` (PARI factorization, no filter on ω(N) or on prime factors).
- ω(N) ≥ 4 residual (every prime factor of N exceeds p and q ≥ 3p^2, kernel-checked as
  `P2qJumps.omega4_constraints`, so q > p^2 for every such pair): searched over primes `5 ≤ p ≤ ⌊√Q⌋`, `p^2 < q ≤ Q`. Kernel: `n ≤ 10^4`. PARI: `Q = 10^4` and the
  `Q = 10^6` range, no filters, 0 hits. Optional `scripts/omega4/search_omega4_1e6.py` (sha256 `ab59fc89…5046`),
  `Q = 10^6`: **did not finish** (3-hour timeout, exit 124, no output; the same range has 0 hits in the no-filter PARI run, computationally verified, not kernel-checked). Details and exact wording: `scripts/omega4/README.md`.

## What remains open

- Conjecture 3 (no `n = p^2 q` satisfies both jumps).
- `ω(N) ≥ 4` beyond the bounds above; the paper's H2 (`p ≥ 10^6`) and H3; shapes such as `r^3 s t`, `r^2 s^2 t`;
  powerful `N` (paper Theorem B) and the exponent bounds of Theorem E are not yet in Lean.
- Uniform analytic bounds: David's theorem across all twist fibres of `y^2 = x^3 - x^2 - 12`
  (LMFDB 3936.b1, **rank 1**, trivial torsion) and effective genus-one bounds.

## Build

```
lake exe cache get && lake build
scripts/verify-lock.sh   # Truth Gate: static lock checks, scan, build, observation, axioms
```

Pinned toolchain: Lean 4.26.0 + Mathlib v4.26.0. Mathlib is fetched from the cache, never rebuilt.

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
- **Scope & Scientific Boundary:** Formalizes closed shapes, residual reductions and bounded kernel certificates for simultaneous +12 jumps of φ and σ at n = p^2 q. It does not prove Conjecture 3.

## Zenodo archive

- [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23867497.svg)](https://doi.org/10.5281/zenodo.23867497) Formal Verification of 2-Adic Valuation Shifts and p^2 q Jump Dynamics in Generalized Collatz Extensions (Lean 4) — all versions: [10.5281/zenodo.23867497](https://doi.org/10.5281/zenodo.23867497); latest version: [10.5281/zenodo.23905258](https://doi.org/10.5281/zenodo.23905258)

## License and attribution

This work is licensed under the Apache License 2.0 (see [LICENSE](LICENSE) and [NOTICE](NOTICE)). Any use, reproduction, or redistribution, in whole or in part, must retain the NOTICE file and credit Benjamin Stanley Frohman as the author. If you use this work in a publication, please cite it (see [CITATION.cff](CITATION.cff) / the Zenodo DOI).
