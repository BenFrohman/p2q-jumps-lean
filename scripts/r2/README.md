# External computation: R2 strip for primes r ≤ 10^6 (NOT kernel-checked)

Necessary condition (proved in Lean, `P2qJumps.r3s_reduction`): if N = r^3 s then p < r and
r^2 ∣ L(p) = p^3 - p^2 - 12. Since p < r, p equals its residue mod r, so p is a root of L mod r.

`r2_rbound.py B` factors L mod r (SymPy) for every prime 5 ≤ r ≤ B, and tests r^2 ∣ L(a) and
primality for each root 5 ≤ a < r. Output for B = 10^6: `certificates/external/r2_rbound_1e6.out`
(root-count histogram {0: 26154, 1: 39269, 2: 1 (r = 41), 3: 13072}; hits: none).
Trust base: Python 3 + SymPy factorization mod r. This is not a Lean certificate.

Kernel-certified instead: for every prime 5 ≤ p ≤ 10^4, no prime r > p has r^2 ∣ L(p)
(`P2qJumps.Cert.strip_le_10000`).
