# Status of the shape N = r^2 s^2 t (16 Nov 2026)

**Open.** No proof that the shape is empty.

Kernel-checked (standard axioms):
- `P2qJumps.omega4_or_r2s2t` (ThreeRegimes.lean:41): every solution has ω(N) ≥ 4 or N = r²s²t.
- `P2qJumps.threeRegimes_iff_r2s2t` (ThreeRegimes.lean:150): the "three regimes" claim (r³s, r²st, ω ≥ 4) is equivalent to the emptiness of r²s²t.
- For N = r²s²t: K = rs divides L(p) = p³ − p² − 12 (Lemma K); r s ∣ L(p) and q > 5p² − 4p − 3 (`theoremE_shapes`); given (p, r, s), the pair (t, q) is the unique solution of a nonsingular linear system (`propC_j1` with M = r²s²).

Why size inequalities do not close it: `scripts/r2s2t/real_scan.py` fixes p and r ≈ 1.5p, eliminates (t, q) with the N and φ equations, and scans s for sign changes of the σ residual. Real solutions with p < r < s, rs < p³, t > 1, q > 1 exist (the first change on each line is the pole of the linear system, the second a genuine real root):

```
p 101 r 152 s~ 301 t~ 6225598.67 q~ 1269224616331 t/p^2 610.293
p 101 r 152 s~ 402 t~ 1197.67 q~ 434846517 t/p^2 0.117
101 sign changes 2
p 1009 r 1514 s~ 3037 t~ 750600.34 q~ 15579318493503 t/p^2 0.737
p 1009 r 1514 s~ 3289 t~ 37689.21 q~ 917273246207 t/p^2 0.037
1009 sign changes 2
p 10007 r 15010 s~ 30123 t~ 8734587.46 q~ 17832308261236392 t/p^2 0.087
p 10007 r 15010 s~ 31035 t~ 916708.17 q~ 1986664402270542 t/p^2 0.009
10007 sign changes 2
```

So any proof must use arithmetic (integrality of t and q, or that r, s are the roots of x² − (r+s)x + rs with a square discriminant), as in the r²st proof (Theorem L(iii)). The external Proposition C enumeration (p < 10^6, not kernel-checked) covers this shape for p < 10^6.
