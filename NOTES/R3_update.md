> **Status correction (23 Nov 2026):** Hypotheses R2 and R3 are both **open**. R2 is a φ-only statement; `P2qJumps.r3s_empty` (which uses both jumps) excludes the shape N = r^3 s but does not prove R2. R3's r^2 s t clause is kernel-checked (`P2qJumps.r2st_empty`), but its clause "no solution with ω(N) ≥ 4" is open beyond the bounded ranges. Anything below that calls R2 or R3 closed, a theorem, or empty refers only to these shape results and does not close either hypothesis.

# R3 Update: Unconditional Emptiness of the Q < 0 Half-Plane

## Lemma (Q < 0 empty for r²st)

Let H(p, r) be the degree-7 numerator of the discriminant Δ_st = Σ² - 4Π appearing in the r²st equations (5)–(7). After the change of variables p = 5 + u, r = 11 + u + v with u, v ≥ 0, the expanded polynomial H(5 + u, 11 + u + v) has 50 monomial terms, every coefficient strictly positive (smallest coefficient +4, constant term 91 908 696).

Consequently H(p, r) > 0 throughout the region 5 ≤ p ≤ r - 6. Since the denominator of Δ_st is r²(p - r)Q(p, r)², which is strictly negative for p < r, it follows that Δ_st < 0 throughout this region. No real roots s, t exist.

The boundary line p = r - 4 is already excluded by the offset arguments. Therefore the entire half-plane Q(p, r) < 0 (i.e., p < r) of the N = r²st case is empty for every prime r ≥ 11.

## Residual Status (November 2026)

- R1 (rst): theorem.
- R2 (r³s): computationally empty for all primes p ≤ 10⁵ (elementary proof of the simple-root case remains open).
- R3 (r²st):
  - p < r (Q < 0): proved empty by the positive-coefficient certificate above.
  - p > r (Q > 0): reduced to the condition Q(p, r) | F(r) where F(r) = r⁷ + 4r⁶ + r⁵ - r⁴ - 10r³ - 37r² - 72r - 48 is irreducible, with the modular filter Q ≡ -6 (mod r + 2); computationally empty for all primes r ≤ 20 000.
- ω(N) ≥ 4: open residual.
