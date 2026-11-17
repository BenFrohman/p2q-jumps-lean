# Squarefree p = 7 descent (paper Appendix `app:p7`)

`descent.py` is an exact-integer (CPython + sympy primality) reimplementation of the descent of
Appendix `app:p7`. **It is not kernel-checked.** Its inputs that *are* kernel-checked:

- `P2qJumps.p7_identities` (`P2qJumps/P7.lean`): 7φ(N) = 6N − 282, 49σ(N) = 57N + 2697,
  42σ − 57φ = 4608, 343φσ = 342N² + 108N − 760554.
- `P2qJumps.p7_mod`: N ≡ 5, φ(N) ≡ 5 (mod 7), so 7 ∤ φ(N) (the singular terminal case).
- `P2qJumps.p7_omega4_ge11`: when ω(N) ≥ 4 every prime factor of N is ≥ 11; the prime 5 is excluded.
- `P2qJumps.p7_prefix_bound`: if 342b² − 343·φ(b)σ(b) ≥ 1 at a prefix b with cofactor M, then M ≤ 872;
  with at least three remaining primes ≥ 11, M ≥ 11·13·17 = 2431 (`p7_prune_threshold`), so the branch is empty.

| run | domain | nodes | largest branch bound | solutions |
|---|---|---|---|---|
| `python3 descent.py 7 --pmin 5` | paper (primes ≥ 5, ≠ 7) | 93,159 | 790 | 0 |
| `python3 descent.py 7` | primes ≥ 11 | 93,158 | 790 | 0 |
| `python3 descent.py 8` | primes ≥ 11 | 1,804,945 | 1,416 | 0 |
| `python3 descent.py 9` | primes ≥ 11 | 37,791,873 | 2,542 | 0 |
| `python3 descent.py 7 --prune` | primes ≥ 11, prefix bound | 134 | 65 | 0 |
| `python3 descent.py 8 --prune` | primes ≥ 11, prefix bound | 748 | 86 | 0 |
| `python3 descent.py 9 --prune` | primes ≥ 11, prefix bound | 5,773 | 130 | 0 |

Dropping the prime 5 alone removes one node per k (paper: 93,159 / 1,804,946 / 37,791,874). The prefix
bound reduces the k = 9 tree from 37.8 million to 5,773 nodes and every branch bound to ≤ 130.

**Blocker for a Lean proof of the descent:** the soundness of the enumeration (the monotone branch
bounds 7h(r−1)^m < 6br^m and 49s(r+1)^m > 57br^m, the finite product enumeration in the d ≥ 1 / e ≥ 1
branches, and the two-prime terminal elimination) is not yet formalized. The pruned tree is small enough
for a kernel `decide` certificate once a verified checker and its soundness theorem exist.
