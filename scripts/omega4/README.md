# Optional external computation: ω(N) ≥ 4 residual, Q = 10^6 (not kernel-checked)

## Residual statement (as committed in the paper's ledger)

Four or more distinct prime factors (ω(N) ≥ 4). Every prime factor of N exceeds p, and q ≥ 3p^2, hence N > p^4
(kernel-checked, `P2qJumps.omega4_constraints`, v1.4). Consequently an exhaustive search over all distinct primes
5 ≤ p ≤ ⌊√Q⌋ and all primes q with p^2 < q ≤ Q covers every pair with ω(N) ≥ 4 and q ≤ Q. The Lean kernel certificate covers
n = p^2 q ≤ 10^4 (any shape of N; no hypothesis needed); the external PARI search covers Q = 10^4 (in fact all
distinct primes p, q ≤ 10^4, any shape, no hypothesis, 0 hits) and the Q = 10^6 range 5 ≤ p ≤ 997,
p^2 < q ≤ 10^6 (any shape, no filter, 0 hits); the optional Python certificate search_omega4_1e6.py (not
kernel-checked; sha256 ab59fc89f59e79970b1e4185db678a19edcba66cd87de456e8dc4b4e55e15046) covers Q = 10^6
[result pending]. The main theorem keeps the bound n ≤ 10^4.

## search_omega4_1e6.py

- sha256: `ab59fc89f59e79970b1e4185db678a19edcba66cd87de456e8dc4b4e55e15046`
- Range: primes `5 ≤ p ≤ 997` (= primes ≤ ⌊√10^6⌋), primes `p^2 < q ≤ 10^6`. It is not a search of all `p, q ≤ 10^6`.
- Run command: `python3 search_omega4_1e6.py` (Python 3.13.5).
- Pre-sieve and `factor_omega_min_prime` discard every `N` with a prime factor `≤ p`: valid only under the
  hypothesis above.
- Result: **[result pending]** hit count: ____ ; elapsed: ____ ; full console output: ____ .

## Assumption-free runs (PARI factorization; no filter on ω(N) or on prime factors)

- `python3 jumps_pq_check.py A 10000`: all distinct primes `2 ≤ p, q ≤ 10^4`: 1,509,212 pairs, 0 hits, 13 s.
- `python3 jumps_pq_check.py B 997 1000000`: primes `5 ≤ p ≤ 997`, `p^2 < q ≤ 10^6`: 8,912,452 pairs, 0 hits, 71 s.
  Logs: `certificates/external/jumps_pq_*.log`.

Review items:
1. (Resolved in v1.4: the r_i > p constraint and q ≥ 3p^2 are kernel-checked, `omega4_constraints`.) `N > p^4`
   is a lower bound; full coverage of a fixed p in q would need an upper bound on q.
   Theorem D gives only the lower bound q ≥ p^2 (k^2-k-1)^2 ≥ 121 p^2 for squarefree ω(N) = k ≥ 4,
   so q ≤ 10^6 covers a fixed p only up to q = 10^6, not all q.
2. A check that discards N when any prime factor is ≤ p (`factor_omega_min_prime` returning None)
   is sound only if a proved lemma says every prime factor of N exceeds p. The paper proves only
   gcd(N, 6p) = 1 (prime factors ≥ 5 and ≠ p); the p = 7 descent explicitly allows the factor 5.
   Unless such a lemma is supplied, that filter can discard valid candidates.
3. No step may use rad(N) = N / gcd(N, φ(N)); that identity is false (N = 12: 3 ≠ 6).
