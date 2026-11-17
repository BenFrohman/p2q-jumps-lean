# Extending the ω(N) ≥ 4 search to Q = 10^10: requirements and feasibility

Status: planning note (16 Nov 2026). Nothing here is run, proved, or cited by the paper. All costs below are
estimates from a 75-second timed sample (`scripts/omega4/bench/sample_1e10_cost.py`, PARI 2.17.2 via cypari2,
one core of the shared box), not measurements of a full run.

## 1. Range and pair count

By the kernel-checked theorem `P2qJumps.omega4_constraints` (v1.4; it was the unproved hypothesis H when this note
was first written), every prime factor of N = p^2 q + 12 exceeds p and q ≥ 3p^2 when ω(N) ≥ 4; so q > p^2 and,
for q ≤ Q, p < √Q. For Q = 10^10 the search is: primes 5 ≤ p ≤ 10^5 (9,590 primes), primes p^2 < q ≤ 10^10.

Pair count ≈ Σ_{5 ≤ p ≤ 10^5} (π(10^10) − π(p^2)) with π(10^10) = 455,052,511:
≈ 9,590 · 4.55·10^8 − Σ π(p^2) ≈ **3.0·10^12 pairs** (Σ π(p^2) estimated with x/(ln x − 1)).
For comparison, all distinct primes p, q ≤ 10^10 (no shape restriction) would be ≈ π(10^10)^2 ≈ 2·10^17 pairs: out of reach; for ω(N) ≥ 4 the restriction q > p^2 is now a theorem.

## 2. Why the current script cannot do it

`search_omega4_1e6.py` trial-divides each survivor up to √N. Here N ≤ 10^10 · 10^10 + 12 ≈ 10^20, so √N ≈ 10^10:
up to ~5·10^9 Python iterations per candidate, times ~10^11–10^12 candidates. Infeasible by many orders of
magnitude. (At Q = 10^6 the same design already runs far longer than "a few seconds".)

## 3. Algorithm changes needed

1. **Segmented prime sieve over q** (shared by all p): segments of ~10^7–10^8, bit-packed.
2. **Modular pre-sieve on N** (valid only under H): for each prime 5 ≤ r < p, strike q ≡ −12·p^{−2} (mod r)
   (so r ∣ N) in the segment. Measured survival of prime q: 0.64 (p = 11), 0.32 (p = 101), 0.22 (p = 1009),
   0.16 (p = 10007), 0.13 (p = 99991).
3. **Necessary condition for ω(N) ≥ 4 (early exit).** If N has ≥ 4 prime factors, its least prime factor is
   ≤ N^{1/4}. Under H that factor lies in (p, N^{1/4}], and N^{1/4} ≤ (10^10 p^2)^{1/4} ≈ 316·√p. So sieve N by the
   primes in (p, ⌊N^{1/4}⌋] as well, recording the factors found, and discard every q with no factor there. In
   the sample the fraction of pre-sieve survivors with ω(N) ≥ 4 was 0.127 (p = 11), 0.037 (p = 101),
   0.0077 (p = 1009), 0.0006 (p = 10007), 0 of 14,000 (p = 99991). For p near 10^5 the interval (p, N^{1/4}] is
   almost empty, so almost every q is discarded by the sieve alone. Repeat the bound on the cofactor
   (second least factor ≤ (N/r_1)^{1/3}) before factoring.
4. **Factor only the few survivors** with Pollard rho / ECM / SQUFOF on numbers ≤ 10^20 (PARI `factor`, FLINT,
   or yafu/msieve; gmpy2 for primality). Sampled PARI time per N: 13 µs (p = 11) to 386 µs (p ≈ 10^5).
   Then compare φ(N), σ(N) with the jump identities exactly (integer arithmetic).
5. **Language:** C or Rust (or Cython) for the sieve loops; Python only for orchestration. Parallelize over p
   (embarrassingly parallel); checkpoint per (p, segment) so an interruption loses little.

## 4. Cost estimates (order of magnitude)

- **Naive factoring of every pre-sieve survivor:** ≈ 3·10^12 × 0.13 × 3·10^−4 s ≈ 1·10^8 core-s ≈ **3·10^4 core-hours**.
- **With the N^{1/4} sieve (item 3):** the work is dominated by striding the sieve: per p roughly
  10^10 · Σ_{r ≤ X} 1/r ≈ 2–3·10^10 byte operations, times 9,590 values of p ≈ 2–3·10^14 operations. At an assumed
  10^9 simple operations per second per core in C, that is ≈ **10^2 core-hours**, plus negligible factoring.
  This figure is an extrapolation, not a measurement: benchmark a C port at Q = 10^7 and 10^8 first and scale.
- **Memory:** segmented, O(segment size + π(10^5)) per worker: under 1 GB per core.
- **Assumption-free variant (no H; sieve by all primes 5 ≤ r ≤ N^{1/4}, r ≠ p):** the "has a small factor"
  condition then keeps most N (any N divisible by 5, 7, …), so factoring cost returns to ~10^4 core-hours for the
  q > p^2 range; covering all p, q ≤ 10^10 is out of reach (§1).

**Feasibility:** feasible only as a C/Rust segmented-sieve program, and only conditional on H, at an estimated
~10^2 core-hours (to be confirmed by benchmark). Not feasible in pure Python, and not feasible without H.

## 5. Proof obligations before any paper text cites such a run

1. **Lemma H (every prime factor of N exceeds p) is proved in Lean** (`P2qJumps.omega4_constraints`, v1.4), with
   q ≥ 3p^2. The pre-sieve and the q > p^2 restriction are sound for ω(N) ≥ 4. (Superseded obligation.)
2. The least-factor bound (ω ≥ 4 ⇒ least prime factor ≤ N^{1/4}) and the cofactor bound are elementary but should
   be written out.
3. Correctness of the sieve root q ≡ −12·p^{−2} (mod r) and of segment boundaries; planted positive controls
   (modified targets that must hit) and an independent cross-check on a smaller Q (e.g. against
   `jumps_pq_check.py`, which uses no filters).
4. A run log with source sha256, exact command, version, start/end time and hit count.
5. Kernel checking at this size is out of reach; the result would be an ordinary computer-assisted statement.
