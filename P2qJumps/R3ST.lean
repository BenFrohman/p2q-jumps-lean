/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Tactic
import P2qJumps.Arith
import P2qJumps.Preamble
import P2qJumps.Cert.Core

/-!
# The shape `r^3 s t` is empty (no bound on `p`)

For `N = r^3 s t` (pairwise distinct primes) put `S = s + t`, `P = s t`, `k = r - p`.

* `E0, E1, E2` (the identities `N = n + 12`, `φ(N) = φ(n) + 12`, `σ(N) = σ(n) + 12`) are linear
  in `(S, P, q)`; Cramer's rule gives `r^2 D S = NS`, `D q = NQ` with polynomials `D, NS, NQ`
  in `(p, r)`.
* `δ`-identity: `P (r^3 - p^2 (r+1)) = p^2 (2r^2+r+1) S + p^2 (2r^3+r+1) - 2p^3 - p^2 + 12`;
  it forces `r > p` (`k ≥ 1`).
* `X`-identity: `r^2 X = L(p)` with `X = p (r-1)(S-1) - k P`, so `0 < X < p`.
* `S^2 ≥ 4P` and `S ≥ 10` give `5 k S ≥ 16 p (r - 1)`; with `D > 0` (from `NQ > 0`) this gives
  `G(p, k) = 5 k NS - 16 p (r-1) r^2 D ≥ 0`. A certificate shows `G < 0` when `k ≥ 48` and
  `3p ≤ k^2`. Hence `k ≤ 47` or `k^2 < 3p`.
* With `i = X - p + 1 + 2k`: `i (p+k)^2 = (3k^2+2k) p + 2k^3 + k^2 - 12`, `1 ≤ i ≤ 2k`, and
  `i ≤ 9` when `k^2 < 3p`. Then `y = 2ip + 2ik - 3k^2 - 2k` satisfies
  `y^2 = Δ_i(k) = 9k^4 + (12-4i)k^3 + (4-4i)k^2 - 48i`.
* Runge: for `1 ≤ i ≤ 9`, `k ≥ 298`, `(27 y)^2` lies strictly between consecutive squares
  around `H = 81k^2 + 9(6-2i)k - 2i(3+i)`. The remaining `k ≤ 297` are a kernel certificate
  (`Δ_i(k)` is not a square except at five pairs `(i, k)`, each excluded by hand).
-/

namespace P2qJumps

open Nat ArithmeticFunction
open scoped ArithmeticFunction.sigma

/-- Cramer denominator (up to the factor `-r^2`). -/
def Dr3st (p r : ℤ) : ℤ :=
  p ^ 2 * r ^ 2 + p ^ 2 * r + 2 * p ^ 2 - 2 * p * r ^ 3 - p * r ^ 2 - p * r + r ^ 4 - r ^ 3

/-- Cramer numerator of `S = s + t`: `r^2 D S = NS`. -/
def NSr3st (p r : ℤ) : ℤ :=
  -p ^ 4 * r - p ^ 4 + 2 * p ^ 3 * r ^ 2 + p ^ 3 * r + p ^ 3 - 2 * p ^ 2 * r ^ 5 - p ^ 2 * r ^ 4
    - 2 * p ^ 2 * r ^ 3 + p ^ 2 * r ^ 2 + 2 * p * r ^ 6 + p * r ^ 4 - p * r ^ 3 + 12 * p * r
    + 12 * p + r ^ 6 - r ^ 5 - 12 * r ^ 2

/-- Cramer numerator of `q`: `D q = NQ`. -/
def NQr3st (p r : ℤ) : ℤ :=
  2 * p ^ 2 * r ^ 3 + p ^ 2 * r ^ 2 + p ^ 2 * r - 2 * p * r ^ 4 - p * r ^ 2 - p * r + 2 * r ^ 7
    - r ^ 4 - r ^ 3 - 12 * r ^ 2 - 12 * r - 24

/-- `G(p, k) = 5 k NS - 16 p (r - 1) r^2 D` at `r = p + k`. -/
def Gr3st (p k : ℤ) : ℤ :=
  5 * k * NSr3st p (p + k) - 16 * p * (p + k - 1) * (p + k) ^ 2 * Dr3st p (p + k)

/-- `Δ_i(k)`, the discriminant of `i p^2 + (2ik - 3k^2 - 2k) p + (ik^2 - 2k^3 - k^2 + 12)`. -/
def Dlt (i k : ℤ) : ℤ := 9 * k ^ 4 + (12 - 4 * i) * k ^ 3 + (4 - 4 * i) * k ^ 2 - 48 * i

/-- `φ` and `σ₁` of `r^3 s t` for pairwise distinct primes. -/
lemma totient_sigma_r3st {r s t : ℕ} (hr : r.Prime) (hs : s.Prime) (ht : t.Prime)
    (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t) :
    (φ (r ^ 3 * s * t) : ℤ) = r ^ 2 * (r - 1) * (s - 1) * (t - 1) ∧
      (σ 1 (r ^ 3 * s * t) : ℤ) = (r ^ 3 + r ^ 2 + r + 1) * (s + 1) * (t + 1) := by
  have c1 : (r ^ 3).Coprime s := Nat.Coprime.pow_left 3 ((Nat.coprime_primes hr hs).2 hrs)
  have c2 : (r ^ 3 * s).Coprime t :=
    Nat.coprime_mul_iff_left.2 ⟨Nat.Coprime.pow_left 3 ((Nat.coprime_primes hr ht).2 hrt),
      (Nat.coprime_primes hs ht).2 hst⟩
  constructor
  · rw [Nat.totient_mul c2, Nat.totient_mul c1, Nat.totient_prime_pow hr (by norm_num),
      Nat.totient_prime hs, Nat.totient_prime ht]
    push_cast [hr.one_le, hs.one_le, ht.one_le]
    ring
  · rw [isMultiplicative_sigma.map_mul_of_coprime c2, isMultiplicative_sigma.map_mul_of_coprime c1,
      sigma_one_prime_cube hr, sigma_one_prime' hs, sigma_one_prime' ht]
    push_cast
    ring

set_option maxHeartbeats 4000000 in
/-- `NQ > 0` for `p ≥ 5`, `k ≥ 1` (all coefficients positive after `p = 5 + a`, `k = 1 + m`). -/
lemma NQr3st_pos (a m : ℕ) : 0 < NQr3st ((a : ℤ) + 5) ((a : ℤ) + 5 + ((m : ℤ) + 1)) := by
  unfold NQr3st; ring_nf; positivity

set_option maxHeartbeats 8000000 in
/-- **Certificate.** `G(p, k) < 0` for `p ≥ 5`, `k ≥ 48`, `3p ≤ k^2`: with `p = 5 + a`,
`k = 48 + m`, `-3G - Λ (k^2 - 3p)` has positive coefficients, where
`Λ = 16a^6 + 48a^5m + 4288a^5 + 461936a^4 + 24283264a^3 ≥ 0`. -/
lemma Gr3st_neg (a m : ℕ) (h : 3 * ((a : ℤ) + 5) ≤ ((m : ℤ) + 48) ^ 2) :
    Gr3st ((a : ℤ) + 5) ((m : ℤ) + 48) < 0 := by
  have hl : 0 ≤ (16 * (a : ℤ) ^ 6 + 48 * a ^ 5 * m + 4288 * a ^ 5 + 461936 * a ^ 4
      + 24283264 * a ^ 3) := by positivity
  have hg : 0 ≤ ((m : ℤ) + 48) ^ 2 - 3 * ((a : ℤ) + 5) := by linarith
  have key : 0 < -3 * Gr3st ((a : ℤ) + 5) ((m : ℤ) + 48)
      - (16 * (a : ℤ) ^ 6 + 48 * a ^ 5 * m + 4288 * a ^ 5 + 461936 * a ^ 4 + 24283264 * a ^ 3)
        * (((m : ℤ) + 48) ^ 2 - 3 * ((a : ℤ) + 5)) := by
    unfold Gr3st NSr3st Dr3st; ring_nf; positivity
  nlinarith [mul_nonneg hl hg]

/-- No integer square strictly between `(H-1)^2` and `H^2`. -/
lemma no_sq_between_below {Y H : ℤ} (_hH : 1 ≤ H) (h1 : (H - 1) ^ 2 < Y ^ 2) (h2 : Y ^ 2 < H ^ 2) :
    False := by
  rw [← sq_abs Y] at h1 h2
  have a := lt_of_pow_lt_pow_left₀ 2 (by linarith) h2
  have b := lt_of_pow_lt_pow_left₀ 2 (abs_nonneg Y) h1
  omega

/-- No integer square strictly between `H^2` and `(H+1)^2`. -/
lemma no_sq_between_above {Y H : ℤ} (_hH : 0 ≤ H) (h1 : H ^ 2 < Y ^ 2) (h2 : Y ^ 2 < (H + 1) ^ 2) :
    False := by
  rw [← sq_abs Y] at h1 h2
  have a := lt_of_pow_lt_pow_left₀ 2 (by linarith) h2
  have b := lt_of_pow_lt_pow_left₀ 2 (abs_nonneg Y) h1
  omega

/-- **Runge step.** For `1 ≤ i ≤ 9` and `k ≥ 298`, `Δ_i(k)` is not a square: with
`H = 81k^2 + 9(6-2i)k - 2i(3+i)`, `729 Δ_i(k) - H^2 = -4i(i^3 + 6i^2 + 9i + 8748 + 18k(i^2-9))`. -/
lemma Dlt_not_sq (i k y : ℤ) (hi1 : 1 ≤ i) (hi9 : i ≤ 9) (hk : 298 ≤ k) (hy : y ^ 2 = Dlt i k) :
    False := by
  have e : (27 * y) ^ 2 = (81 * k ^ 2 + 9 * (6 - 2 * i) * k - 2 * i * (3 + i)) ^ 2
      - 4 * i * (i ^ 3 + 6 * i ^ 2 + 9 * i + 8748 + 18 * k * (i ^ 2 - 9)) := by
    rw [mul_pow, hy]; unfold Dlt; ring
  interval_cases i
  · exact no_sq_between_above (Y := 27 * y) (H := 81 * k ^ 2 + 9 * (6 - 2 * 1) * k - 2 * 1 * (3 + 1))
      (by nlinarith) (by rw [e]; nlinarith) (by rw [e]; nlinarith)
  · exact no_sq_between_above (Y := 27 * y) (H := 81 * k ^ 2 + 9 * (6 - 2 * 2) * k - 2 * 2 * (3 + 2))
      (by nlinarith) (by rw [e]; nlinarith) (by rw [e]; nlinarith)
  · exact no_sq_between_below (Y := 27 * y) (H := 81 * k ^ 2 + 9 * (6 - 2 * 3) * k - 2 * 3 * (3 + 3))
      (by nlinarith) (by rw [e]; nlinarith) (by rw [e]; nlinarith)
  · exact no_sq_between_below (Y := 27 * y) (H := 81 * k ^ 2 + 9 * (6 - 2 * 4) * k - 2 * 4 * (3 + 4))
      (by nlinarith) (by rw [e]; nlinarith) (by rw [e]; nlinarith)
  · exact no_sq_between_below (Y := 27 * y) (H := 81 * k ^ 2 + 9 * (6 - 2 * 5) * k - 2 * 5 * (3 + 5))
      (by nlinarith) (by rw [e]; nlinarith) (by rw [e]; nlinarith)
  · exact no_sq_between_below (Y := 27 * y) (H := 81 * k ^ 2 + 9 * (6 - 2 * 6) * k - 2 * 6 * (3 + 6))
      (by nlinarith) (by rw [e]; nlinarith) (by rw [e]; nlinarith)
  · exact no_sq_between_below (Y := 27 * y) (H := 81 * k ^ 2 + 9 * (6 - 2 * 7) * k - 2 * 7 * (3 + 7))
      (by nlinarith) (by rw [e]; nlinarith) (by rw [e]; nlinarith)
  · exact no_sq_between_below (Y := 27 * y) (H := 81 * k ^ 2 + 9 * (6 - 2 * 8) * k - 2 * 8 * (3 + 8))
      (by nlinarith) (by rw [e]; nlinarith) (by rw [e]; nlinarith)
  · exact no_sq_between_below (Y := 27 * y) (H := 81 * k ^ 2 + 9 * (6 - 2 * 9) * k - 2 * 9 * (3 + 9))
      (by nlinarith) (by rw [e]; nlinarith) (by rw [e]; nlinarith)

/-! ## Kernel certificate for `k ≤ 297` -/

/-- Positive part of `Δ_i(k)`. -/
def dPosR3st (k : ℕ) : ℕ := 9 * k ^ 4 + 12 * k ^ 3 + 4 * k ^ 2

/-- Negative part of `Δ_i(k)`. -/
def dNegR3st (i k : ℕ) : ℕ := 4 * i * k ^ 3 + 4 * i * k ^ 2 + 48 * i

/-- The five pairs `(i, k)` in the checked range at which `Δ_i(k)` is a square. -/
def excR3st (i k : ℕ) : Bool :=
  (decide (i = 2) && decide (k = 2)) || (decide (i = 2) && decide (k = 5)) ||
    (decide (i = 4) && decide (k = 8)) || (decide (i = 5) && decide (k = 4)) ||
    (decide (i = 27) && decide (k = 15))

/-- One pair: `Δ_i(k) < 0`, or `Δ_i(k)` is not a square, or `(i, k)` is an exception. -/
def r3stB (i k : ℕ) : Bool :=
  decide (dPosR3st k < dNegR3st i k) || Cert.notSquareB (dPosR3st k - dNegR3st i k) || excR3st i k

/-- All pairs `k < 298`, `1 ≤ i < 95`, `i ≤ 2k`, with `i ≤ 9` when `k ≥ 48`. -/
def r3stCheck : Bool :=
  Cert.allBelow (fun k => Cert.allBelow (fun i => decide (i = 0) || decide (2 * k < i) ||
    (decide (47 < k) && decide (9 < i)) || r3stB i k) 95) 298

theorem cert_r3st : r3stCheck = true := by decide +kernel

lemma r3stCheck_sound {i k : ℕ} (hk : k < 298) (hi1 : 1 ≤ i) (hi : i < 95) (hik : i ≤ 2 * k)
    (hsmall : k ≤ 47 ∨ i ≤ 9) {y : ℤ} (hy : y ^ 2 = Dlt i k) : excR3st i k = true := by
  have h := Cert.allBelow_spec (Cert.allBelow_spec cert_r3st k hk) i hi
  have h0 : ¬ (i = 0) := by omega
  have h1 : ¬ (2 * k < i) := by omega
  have h2 : ¬ (47 < k ∧ 9 < i) := by omega
  simp only [Bool.or_eq_true, Bool.and_eq_true, decide_eq_true_eq, h0, h1, h2, false_or] at h
  unfold r3stB at h
  simp only [Bool.or_eq_true, decide_eq_true_eq] at h
  have e : Dlt i k = (dPosR3st k : ℤ) - dNegR3st i k := by
    unfold Dlt dPosR3st dNegR3st; push_cast; ring
  rcases h with (h | h) | h
  · exfalso
    have : (dPosR3st k : ℤ) < dNegR3st i k := by exact_mod_cast h
    nlinarith [sq_nonneg y]
  · exfalso
    by_cases hle : dNegR3st i k ≤ dPosR3st k
    · apply Cert.notSquareB_spec_int h y
      rw [hy, e]; push_cast [hle]; ring
    · push_neg at hle
      have : (dPosR3st k : ℤ) < dNegR3st i k := by exact_mod_cast hle
      nlinarith [sq_nonneg y]
  · exact h

/-- The exceptional pairs `(i, k)`: each contradicts `i (p+k)^2 = (3k^2+2k) p + 2k^3 + k^2 - 12`
for `p ≥ 5`, except `(4, 8)`, which forces `p = 41`, `r = 49`. -/
lemma r3st_exceptions {i k p : ℤ} (hp : 5 ≤ p)
    (hrel : i * (p + k) ^ 2 = (3 * k ^ 2 + 2 * k) * p + 2 * k ^ 3 + k ^ 2 - 12)
    (hex : (i = 2 ∧ k = 2) ∨ (i = 2 ∧ k = 5) ∨ (i = 4 ∧ k = 8) ∨ (i = 5 ∧ k = 4) ∨
      (i = 27 ∧ k = 15)) : p = 41 ∧ k = 8 := by
  rcases hex with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
  · exfalso; nlinarith
  · exfalso
    have h : (p + 3) * (2 * p - 71) = 0 := by linear_combination hrel
    rcases mul_eq_zero.1 h with h | h <;> omega
  · have h4 : 4 * ((p - 41) * (p + 5)) = 0 := by linear_combination hrel
    have h : (p - 41) * (p + 5) = 0 := by omega
    rcases mul_eq_zero.1 h with h | h <;> omega
  · exfalso
    have h : (p + 2) * (5 * p - 26) = 0 := by linear_combination hrel
    rcases mul_eq_zero.1 h with h | h <;> omega
  · exfalso
    have h3 : 3 * ((p + 8) * (9 * p - 37)) = 0 := by linear_combination hrel
    have h : (p + 8) * (9 * p - 37) = 0 := by omega
    rcases mul_eq_zero.1 h with h | h <;> omega

set_option maxHeartbeats 16000000 in
/-- **The shape `r^3 s t` is empty.** Under both jumps at `n = p^2 q`, `N = n + 12` is not of
the form `r^3 s t` with pairwise distinct primes `r, s, t`. No bound on `p`. -/
theorem r3st_empty {p q r s t : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime) (hs : s.Prime)
    (ht : t.Prime) (hpq : p ≠ q) (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t)
    (hJ : Jumps (p ^ 2 * q)) : p ^ 2 * q + 12 ≠ r ^ 3 * s * t := by
  intro hN
  obtain ⟨hp5, hq5, -, -, hcop⟩ := preamble hp hq hpq hJ
  have h6 : Nat.Coprime (r ^ 3 * s * t) 6 := by
    rw [← hN]; exact Nat.Coprime.coprime_dvd_right ⟨p * q, by ring⟩ hcop
  have five : ∀ x : ℕ, x.Prime → x ∣ r ^ 3 * s * t → 5 ≤ x := by
    intro x hx hxd
    have := hx.two_le
    by_contra hlt; push_neg at hlt
    interval_cases x
    · have := Nat.Coprime.coprime_dvd_left hxd h6; norm_num at this
    · have := Nat.Coprime.coprime_dvd_left hxd h6; norm_num at this
    · exact absurd hx (by norm_num)
  have hr5 := five r hr ⟨r ^ 2 * s * t, by ring⟩
  have hs5 := five s hs ⟨r ^ 3 * t, by ring⟩
  have ht5 := five t ht ⟨r ^ 3 * s, by ring⟩
  obtain ⟨j1, j2⟩ := jumps_p2q_int hp hq hpq hJ
  obtain ⟨f1, f2⟩ := totient_sigma_r3st hr hs ht hrs hrt hst
  rw [hN] at j1 j2
  have E0 : (r : ℤ) ^ 3 * ((s : ℤ) * t) = (p : ℤ) ^ 2 * q + 12 := by
    have := congrArg (fun x : ℕ => (x : ℤ)) hN; push_cast at this; linarith
  have E1 : (r : ℤ) ^ 2 * (r - 1) * ((s : ℤ) * t - ((s : ℤ) + t) + 1)
      = (p : ℤ) * (p - 1) * (q - 1) + 12 := by
    have := f1.symm.trans j1; linear_combination this
  have E2 : ((r : ℤ) ^ 3 + r ^ 2 + r + 1) * ((s : ℤ) * t + ((s : ℤ) + t) + 1)
      = ((p : ℤ) ^ 2 + p + 1) * (q + 1) + 12 := by
    have := f2.symm.trans j2; linear_combination this
  have zs : (5 : ℤ) ≤ s := by exact_mod_cast hs5
  have zt : (5 : ℤ) ≤ t := by exact_mod_cast ht5
  have hAM0 : 4 * ((s : ℤ) * t) ≤ ((s : ℤ) + t) ^ 2 := by nlinarith [sq_nonneg ((s : ℤ) - t)]
  have hS10 : (10 : ℤ) ≤ (s : ℤ) + t := by linarith
  have hP0 : (0 : ℤ) < (s : ℤ) * t := by positivity
  have zp : (5 : ℤ) ≤ p := by exact_mod_cast hp5
  have zq : (5 : ℤ) ≤ q := by exact_mod_cast hq5
  have zr : (5 : ℤ) ≤ r := by exact_mod_cast hr5
  generalize (s : ℤ) + t = S at E1 E2 hAM0 hS10
  generalize (s : ℤ) * t = P at E0 E1 E2 hAM0 hP0
  generalize hR : (r : ℤ) = R at E0 E1 E2 zr
  generalize hp' : (p : ℤ) = x at E0 E1 E2 zp
  generalize hq' : (q : ℤ) = y at E0 E1 E2 zq
  -- the δ-identity, the X-identity, and Cramer's rule
  have hb : P * (R ^ 3 - x ^ 2 * (R + 1)) = x ^ 2 * (2 * R ^ 2 + R + 1) * S
      + x ^ 2 * (2 * R ^ 3 + R + 1) - 2 * x ^ 3 - x ^ 2 + 12 := by
    linear_combination (2 * x ^ 2 + 1) * E0 - x ^ 2 * E1 - x ^ 2 * E2
  have hX : R ^ 2 * (x * (R - 1) * (S - 1) - (R - x) * P) = x ^ 3 - x ^ 2 - 12 := by
    linear_combination (x - 1) * E0 - x * E1
  have hNS : R ^ 2 * Dr3st x R * S = NSr3st x R := by
    unfold Dr3st NSr3st
    linear_combination (-(2 * x ^ 2 * R ^ 2 + x ^ 2 * R + x ^ 2 - 2 * x * R ^ 3 - x * R - x
      - R ^ 3 + R ^ 2)) * E0 - (-x ^ 2 * R ^ 2 - x ^ 2 * R - x ^ 2 + x * R ^ 3 + R ^ 3) * E1
      - (-x * R ^ 2 * (x - R)) * E2
  have hNQ : Dr3st x R * y = NQr3st x R := by
    unfold Dr3st NQr3st
    linear_combination (2 * (R - 1) * (R + 1) * (R ^ 2 + 1)) * E0
      - (R * (R + 1) * (R ^ 2 + 1)) * E1 - (R ^ 3 * (R - 1)) * E2
  -- Step: `x < R`
  have hxR : x < R := by
    by_contra hle; push_neg at hle
    have hR2 : R ^ 2 ≤ x ^ 2 := by nlinarith
    have c1 : R ^ 3 - x ^ 2 * (R + 1) < 0 := by
      nlinarith [mul_le_mul_of_nonneg_left hR2 (by linarith : (0:ℤ) ≤ R)]
    have hneg : P * (R ^ 3 - x ^ 2 * (R + 1)) < 0 := mul_neg_of_pos_of_neg hP0 c1
    have hpos : 0 < x ^ 2 * (2 * R ^ 3 + R + 1) := by positivity
    have h1 : x ^ 2 * ((2 * R ^ 2 + R + 1) * S) < x ^ 2 * (2 * x + 1) := by nlinarith
    have h2 : (2 * R ^ 2 + R + 1) * S < 2 * x + 1 :=
      lt_of_mul_lt_mul_left h1 (by positivity)
    have h3 : R ^ 2 * S ≤ x := by nlinarith
    have h4 : (R ^ 2 * S) ^ 2 ≤ x ^ 2 := by
      have : 0 ≤ R ^ 2 * S := by positivity
      nlinarith
    have h5 : 4 * (R * (R ^ 3 * P)) ≤ x ^ 2 := by nlinarith
    rw [E0] at h5
    have h6 : 0 ≤ (R - 5) * (x ^ 2 * y) := mul_nonneg (by linarith) (by positivity)
    have h7 : 0 ≤ x ^ 2 * (y - 5) := mul_nonneg (by positivity) (by linarith)
    nlinarith
  obtain ⟨k, rfl⟩ : ∃ k, R = x + k := ⟨R - x, by ring⟩
  have hk1 : 1 ≤ k := by linarith
  -- `0 < X < x`
  set X := x * (x + k - 1) * (S - 1) - (x + k - x) * P with hXdef
  have hL : 0 < x ^ 3 - x ^ 2 - 12 := by nlinarith
  have hXpos : 0 < X := by
    by_contra h; push_neg at h
    nlinarith [sq_nonneg (x + k)]
  have hXlt : X < x := by
    by_contra h; push_neg at h
    have h1 : (x + k) ^ 2 * x ≤ (x + k) ^ 2 * X := mul_le_mul_of_nonneg_left h (sq_nonneg _)
    have h2 : 0 < (x + k) ^ 2 * x - (x ^ 3 - x ^ 2 - 12) := by
      have : (x + k) ^ 2 * x - (x ^ 3 - x ^ 2 - 12) = 2 * k * x ^ 2 + k ^ 2 * x + x ^ 2 + 12 := by
        ring
      rw [this]; positivity
    have h3 : (x + k) ^ 2 * X = x ^ 3 - x ^ 2 - 12 := by rw [← hX]
    linarith
  -- `5 k S ≥ 16 x (r - 1)`
  have hkP : k * P = x * (x + k - 1) * (S - 1) - X := by rw [hXdef]; ring
  have hkS2 : 4 * x * (x + k - 1) * (S - 2) ≤ k * S ^ 2 := by nlinarith
  have hkS : 16 * x * (x + k - 1) ≤ 5 * k * S := by
    by_contra h; push_neg at h
    have hS0 : (0 : ℤ) < S := by linarith
    have h1 := mul_lt_mul_of_pos_right h hS0
    have hW : 0 ≤ x * (x + k - 1) * (S - 10) := mul_nonneg (mul_nonneg (by linarith) (by linarith))
      (by linarith)
    nlinarith
  -- `D > 0`
  obtain ⟨a, ha⟩ : ∃ a : ℕ, x = (a : ℤ) + 5 := ⟨(x - 5).toNat, by omega⟩
  obtain ⟨m, hm⟩ : ∃ m : ℕ, k = (m : ℤ) + 1 := ⟨(k - 1).toNat, by omega⟩
  have hNQpos : 0 < NQr3st x (x + k) := by rw [ha, hm]; exact NQr3st_pos a m
  have hD : 0 < Dr3st x (x + k) := by
    by_contra h; push_neg at h
    have := mul_nonpos_of_nonpos_of_nonneg h (by linarith : (0 : ℤ) ≤ y)
    linarith
  -- `G ≥ 0`
  have hG : 0 ≤ Gr3st x k := by
    have e : Gr3st x k = (x + k) ^ 2 * Dr3st x (x + k) * (5 * k * S - 16 * x * (x + k - 1)) := by
      unfold Gr3st; rw [← hNS]; ring
    rw [e]
    exact mul_nonneg (mul_nonneg (sq_nonneg _) hD.le) (by linarith)
  -- `k ≥ 48 → k^2 < 3x`
  have hband : 48 ≤ k → k ^ 2 < 3 * x := by
    intro h48
    by_contra h3; push_neg at h3
    obtain ⟨m', hm'⟩ : ∃ m' : ℕ, k = (m' : ℤ) + 48 := ⟨(k - 48).toNat, by omega⟩
    have := Gr3st_neg a m' (by rw [← ha, ← hm']; exact h3)
    rw [← ha, ← hm'] at this
    linarith
  -- the parameter `i`
  obtain ⟨i, hi⟩ : ∃ i, i = X - x + 1 + 2 * k := ⟨_, rfl⟩
  have hrel : i * (x + k) ^ 2 = (3 * k ^ 2 + 2 * k) * x + 2 * k ^ 3 + k ^ 2 - 12 := by
    rw [hi]; linear_combination hX
  have hi1 : 1 ≤ i := by
    by_contra h; push_neg at h
    have : i * (x + k) ^ 2 ≤ 0 := mul_nonpos_of_nonpos_of_nonneg (by linarith) (sq_nonneg _)
    nlinarith
  have hi2k : i ≤ 2 * k := by linarith
  have hi9 : k ^ 2 < 3 * x → i ≤ 9 := by
    intro h3
    by_contra h; push_neg at h
    have h10 : 10 * (x + k) ^ 2 ≤ i * (x + k) ^ 2 :=
      mul_le_mul_of_nonneg_right (by linarith) (sq_nonneg _)
    nlinarith [mul_le_mul_of_nonneg_right h3.le (by linarith : (0:ℤ) ≤ x),
      mul_le_mul_of_nonneg_right h3.le (by linarith : (0:ℤ) ≤ k)]
  have hy : (2 * i * x + 2 * i * k - 3 * k ^ 2 - 2 * k) ^ 2 = Dlt i k := by
    unfold Dlt; linear_combination (4 * i) * hrel
  rcases le_or_gt 298 k with hk298 | hk298
  · exact Dlt_not_sq i k _ hi1 (hi9 (hband (by linarith))) hk298 hy
  · -- kernel certificate
    lift i to ℕ using (by linarith)
    lift k to ℕ using (by linarith)
    have hex := r3stCheck_sound (i := i) (k := k) (by omega) (by exact_mod_cast hi1)
      (by
        rcases le_or_gt k 47 with h | h
        · have : (i : ℤ) ≤ 2 * k := hi2k; omega
        · have := hi9 (hband (by exact_mod_cast h)); omega)
      (by exact_mod_cast hi2k)
      (by
        rcases le_or_gt k 47 with h | h
        · exact Or.inl h
        · exact Or.inr (by have := hi9 (hband (by exact_mod_cast h)); omega))
      hy
    simp only [excR3st, Bool.or_eq_true, Bool.and_eq_true, decide_eq_true_eq] at hex
    have hex' : ((i : ℤ) = 2 ∧ (k : ℤ) = 2) ∨ ((i : ℤ) = 2 ∧ (k : ℤ) = 5) ∨
        ((i : ℤ) = 4 ∧ (k : ℤ) = 8) ∨ ((i : ℤ) = 5 ∧ (k : ℤ) = 4) ∨
        ((i : ℤ) = 27 ∧ (k : ℤ) = 15) := by omega
    obtain ⟨h41, h8⟩ := r3st_exceptions (by linarith) hrel hex'
    have : r = 49 := by omega
    subst this
    exact absurd hr (by norm_num)

end P2qJumps
