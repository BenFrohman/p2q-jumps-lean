# Optional external computation: ω(N) ≥ 4 residual, p, q ≤ 10^6 (slot)

**Status: script added (sha256 `ab59fc89f59e79970b1e4185db678a19edcba66cd87de456e8dc4b4e55e15046`); no completed run for v1.4. Not kernel-checked.**

Exact range of the script: primes `5 ≤ p ≤ 997`, primes `p^2 < q ≤ 10^6` (not all `p, q ≤ 10^6`).
Run command: `python3 search_omega4_1e6.py` (Python 3.13.5). No claim of full coverage in `q`.

Assumption-free run over the same range: `python3 jumps_pq_check.py B 997 1000000` (PARI factorization, no filter):
8,912,452 pairs, 0 hits, 71 s (`certificates/external/jumps_pq_B_997_1e6.log`). Distinct primes `p, q ≤ 10^4`:
`python3 jumps_pq_check.py A 10000`: 1,509,212 pairs, 0 hits, 13 s.

This directory is reserved for `search_omega4_1e6.py` (author's pure-Python script) and its run log.
It is an external Python computation. It is NOT checked by the Lean kernel and is NOT used by any
Lean theorem. The Lean statement keeps the kernel-certified bound `n = p^2 q ≤ 10^4`
(`P2qJumps.Cert.no_jumps_p2q_le_10000`).

When the script is added, record in `run.log`:
- `sha256sum search_omega4_1e6.py`
- exact run command, Python version, start/end time (America/Chicago), wall time
- hit count

Review items that must be resolved before any paper text cites the run:
1. The claim "covers all 5 ≤ p ≤ 997 unconditionally via N > p^4" does not follow from the paper:
   `N > p^4` is a lower bound, while unconditional coverage of a fixed p needs an upper bound on q.
   Theorem D gives only the lower bound q ≥ p^2 (k^2-k-1)^2 ≥ 121 p^2 for squarefree ω(N) = k ≥ 4,
   so q ≤ 10^6 covers a fixed p only up to q = 10^6, not all q.
2. A check that discards N when any prime factor is ≤ p (`factor_omega_min_prime` returning None)
   is sound only if a proved lemma says every prime factor of N exceeds p. The paper proves only
   gcd(N, 6p) = 1 (prime factors ≥ 5 and ≠ p); the p = 7 descent explicitly allows the factor 5.
   Unless such a lemma is supplied, that filter can discard valid candidates.
3. No step may use rad(N) = N / gcd(N, φ(N)); that identity is false (N = 12: 3 ≠ 6).
