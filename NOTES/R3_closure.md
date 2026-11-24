> **Status correction (23 Nov 2026):** Hypotheses R2 and R3 are both **open**. R2 is a φ-only statement; `P2qJumps.r3s_empty` (which uses both jumps) excludes the shape N = r^3 s but does not prove R2. R3's r^2 s t clause is kernel-checked (`P2qJumps.r2st_empty`), but its clause "no solution with ω(N) ≥ 4" is open beyond the bounded ranges. Anything below that calls R2 or R3 closed, a theorem, or empty refers only to these shape results and does not close either hypothesis.

> **Status (v1.4, 16 Nov 2026):** the conclusion of this note is now a Lean theorem, `P2qJumps.r2st_empty`.
> The argument below is incomplete as written: it says the line `p = r - 4` is excluded by "the offset arguments
> already in the draft", but the draft's offset theorems cover only `r = p ± 2`, `p - 4`, `p - 6`. The Lean proof
> closes `r = p + 4` by the kernel certificate `cert_line` (`p ≤ 10^4`) together with Lemma K (`r ∣ L(p)`, hence
> `p + 4 ∣ 92`). Cite the Lean theorem, not this note.

# Closure of the N = r^{2}st family (Hypothesis R3)

## Theorem (N = r^{2}st is empty)

If both length-12 jumps hold and n = p^{2}q with distinct primes p, q ≥ 5, then N = n + 12 cannot be of the form r^{2}st with distinct primes r, s, t ≥ 5.

### Proof

**Case p < r (Q(p, r) < 0).**
The complementary discriminant Δ_st = Σ^{2} - 4Π has numerator H(p, r) after clearing denominators. Under the change of variables p = 5 + u, r = 11 + u + v (u, v ≥ 0), the expansion of H has exactly 50 monomials, every coefficient strictly positive. Thus H > 0 on 5 ≤ p ≤ r - 6. The denominator of Δ_st is negative for p < r, so Δ_st < 0. No real roots s, t exist. The remaining lines p = r - 2 and p = r - 4 are excluded by the offset arguments already in the draft.

**Case p > r (Q(p, r) > 0).**
Equation (5) of Theorem 2(c) reads
Σ = -(p^{3} - p^{2}r - p^{2} + 2pr^{3} + pr^{2} - 2pr + r^{3} - r^{2} - 12) / (r Q(p, r)).
The expression in parentheses groups as
p^{2}(p - r - 1) + pr(2r^{2} + r - 2) + (r^{3} - r^{2} - 12).
For odd primes p > r ≥ 5 every term is strictly positive, so the inside is positive. The leading minus sign and the positive denominator r Q therefore force Σ < 0. No positive sum of primes s + t exists.

Hence no solutions of shape N = r^{2}st exist.

## Updated residual ledger for Conjecture 3

- R1 (N = rst): theorem (Theorem 28).
- R3: **open**. Its N = r^{2}st clause is a theorem (both half-planes empty; Lean `r2st_empty`); its ω(N) ≥ 4 clause is open.
- R2 (N = r^{3}s): multiple-root case empty; simple-root Hensel lifts open elementarily, computationally empty for all primes p ≤ 10^{5}.
- ω(N) ≥ 4: open residual.

Public Zenodo record under concept DOI 10.5281/zenodo.22713135 is at Version 1.3 (12 November 2026). Local drafts reach v0.17.
