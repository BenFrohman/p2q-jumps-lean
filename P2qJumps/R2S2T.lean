/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Tactic
import P2qJumps.Arith
import P2qJumps.R3S
import P2qJumps.Preamble

/-!
# The shape `N = r^2 s^2 t`: `r s ∣ L(p)`

After Theorem L and the later v1.4 exclusions (`r^3 s` empty, `r^3 s t` empty, Theorem A),
the leading remaining ω = 3 residual is `N = r^2 s^2 t` (pairwise distinct primes).

From `N = n + 12` and the totient jump alone (the σ-jump is not used), the integer identity

  `(p - 1) E₀ - p E₁ = (r s) (p(r + s - 1) - r s) t - (L(p) - p r s (r-1)(s-1))`

holds identically, where `E₀ = (r s)^2 t - p^2 q - 12` and
`E₁ = r(r-1)s(s-1)(t-1) - p(p-1)(q-1) - 12`. Under both jumps both `E₀` and `E₁` vanish,
so `L(p) = (r s) · ((p(r+s-1) - r s) t + p (r-1)(s-1))`, hence `r s ∣ L(p)`.

This is a necessary condition, not an emptiness proof: the shape `r^2 s^2 t` remains open.
-/

namespace P2qJumps

open Nat ArithmeticFunction
open scoped ArithmeticFunction.sigma

/-- `φ` and `σ₁` of `r^2 s^2 t` for pairwise distinct primes. -/
lemma totient_sigma_r2s2t {r s t : ℕ} (hr : r.Prime) (hs : s.Prime) (ht : t.Prime)
    (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t) :
    (φ (r ^ 2 * s ^ 2 * t) : ℤ) = r * (r - 1) * s * (s - 1) * (t - 1) ∧
      (σ 1 (r ^ 2 * s ^ 2 * t) : ℤ) = (r ^ 2 + r + 1) * (s ^ 2 + s + 1) * (t + 1) := by
  have c1 : (r ^ 2).Coprime (s ^ 2) :=
    Nat.Coprime.pow_left 2 (Nat.Coprime.pow_right 2 ((Nat.coprime_primes hr hs).2 hrs))
  have c2 : (r ^ 2 * s ^ 2).Coprime t :=
    Nat.coprime_mul_iff_left.2
      ⟨Nat.Coprime.pow_left 2 ((Nat.coprime_primes hr ht).2 hrt),
        Nat.Coprime.pow_left 2 ((Nat.coprime_primes hs ht).2 hst)⟩
  constructor
  · rw [Nat.totient_mul c2, Nat.totient_mul c1, Nat.totient_prime_pow hr (by norm_num),
      Nat.totient_prime_pow hs (by norm_num), Nat.totient_prime ht]
    push_cast [hr.one_le, hs.one_le, ht.one_le]
    ring
  · rw [isMultiplicative_sigma.map_mul_of_coprime c2, isMultiplicative_sigma.map_mul_of_coprime c1,
      sigma_one_prime_sq hr, sigma_one_prime_sq hs, sigma_one_prime' ht]
    push_cast
    ring

/-- The polynomial identity that isolates `L(p)` from `E₀` (the sum `N = n + 12`) and `E₁`
(the totient jump), identically in `ℤ`. -/
lemma r2s2t_combo (p q r s t : ℤ) :
    (p - 1) * ((r * s) ^ 2 * t - p ^ 2 * q - 12)
      - p * (r * (r - 1) * s * (s - 1) * (t - 1) - p * (p - 1) * (q - 1) - 12) =
      (r * s) * (p * (r + s - 1) - r * s) * t
        - (Lpoly p - p * (r * s) * ((r - 1) * (s - 1))) := by
  unfold Lpoly
  ring

/-- `L(p) = p^3 - p^2 - 12` is positive for `p ≥ 5`. -/
lemma Lpoly_pos {p : ℕ} (hp : 5 ≤ p) : 0 < Lpoly p := by
  have hp5 : (5 : ℤ) ≤ p := by exact_mod_cast hp
  unfold Lpoly
  nlinarith

/-- **Shape `r^2 s^2 t`.** If both jumps hold at `n = p^2 q` (distinct primes) and
`n + 12 = r^2 s^2 t` with pairwise distinct primes `r, s, t`, then `r s ∣ L(p)` and
`r s ≤ L(p)` (in `ℕ`). The σ-jump is not used. -/
theorem r2s2t_rs_dvd_L {p q r s t : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime)
    (hs : s.Prime) (ht : t.Prime) (hpq : p ≠ q) (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t)
    (hJ : Jumps (p ^ 2 * q)) (hN : p ^ 2 * q + 12 = r ^ 2 * s ^ 2 * t) :
    ((r * s : ℕ) : ℤ) ∣ Lpoly p ∧ r * s ≤ (p ^ 3 - p ^ 2 - 12 : ℕ) := by
  obtain ⟨hp5, _, _, _, _⟩ := preamble hp hq hpq hJ
  obtain ⟨hφN, _⟩ := totient_sigma_r2s2t hr hs ht hrs hrt hst
  obtain ⟨hφJ, _⟩ := jumps_p2q_int hp hq hpq hJ
  have hE0 : ((r : ℤ) * s) ^ 2 * t - (p : ℤ) ^ 2 * q - 12 = 0 := by
    have : ((r ^ 2 * s ^ 2 * t : ℕ) : ℤ) = (p ^ 2 * q + 12 : ℕ) := by
      exact_mod_cast hN.symm
    push_cast at this
    linarith
  have hE1 : (r : ℤ) * (r - 1) * s * (s - 1) * (t - 1) - p * (p - 1) * (q - 1) - 12 = 0 := by
    have hφeq : (φ (r ^ 2 * s ^ 2 * t) : ℤ) = φ (p ^ 2 * q + 12) := by rw [hN]
    linarith
  have hid := r2s2t_combo (p : ℤ) q r s t
  have hR : (r : ℤ) * s * ((p : ℤ) * (r + s - 1) - r * s) * t
      - (Lpoly p - p * (r * s) * ((r - 1) * (s - 1))) = 0 := by
    simp [hE0, hE1] at hid
    exact hid.symm
  have hL : Lpoly p =
      (r : ℤ) * s * (((p : ℤ) * (r + s - 1) - r * s) * t + p * ((r - 1) * (s - 1))) := by
    linarith
  have hdvd : ((r * s : ℕ) : ℤ) ∣ Lpoly p := by
    rw [hL, Nat.cast_mul]
    exact dvd_mul_right _ _
  have hpos := Lpoly_pos hp5
  have hleZ : ((r * s : ℕ) : ℤ) ≤ Lpoly p :=
    Int.le_of_dvd hpos (by simpa [Nat.cast_mul] using hdvd)
  have hsub : 12 ≤ p ^ 3 - p ^ 2 := by
    have hp2 : 2 ≤ p := by omega
    have hpow : p ^ 2 ≤ p ^ 3 := Nat.pow_le_pow_right (by omega) (by omega)
    have heq : p ^ 3 - p ^ 2 = p ^ 2 * (p - 1) := by
      rw [Nat.pow_succ, Nat.mul_sub_left_distrib, Nat.mul_one]
    have : 5 ^ 2 * 4 ≤ p ^ 2 * (p - 1) :=
      Nat.mul_le_mul (Nat.pow_le_pow_left hp5 2) (by omega)
    rw [heq]
    exact le_trans (by norm_num) this
  have hLnat : Lpoly p = ((p ^ 3 - p ^ 2) - 12 : ℕ) := by
    have hpow : p ^ 2 ≤ p ^ 3 := Nat.pow_le_pow_right (by omega) (by omega)
    unfold Lpoly
    rw [Nat.cast_sub hsub, Nat.cast_sub hpow]
    push_cast
    ring
  refine ⟨hdvd, ?_⟩
  have : ((r * s : ℕ) : ℤ) ≤ (((p ^ 3 - p ^ 2) - 12 : ℕ) : ℤ) := by
    simpa [hLnat] using hleZ
  exact_mod_cast this

/-- Non-vacuity: the shape `p^2 q + 12 = r^2 s^2 t` occurs (here
`19^2 * 433 + 12 = 5^2 * 13^2 * 37`), and the jumps fail there, so the
divisibility is not automatic. -/
theorem r2s2t_jumps_hypothesis_needed :
    (19 : ℕ).Prime ∧ (433 : ℕ).Prime ∧ (5 : ℕ).Prime ∧ (13 : ℕ).Prime ∧ (37 : ℕ).Prime ∧
      (19 : ℕ) ≠ 433 ∧ (5 : ℕ) ≠ 13 ∧ (5 : ℕ) ≠ 37 ∧ (13 : ℕ) ≠ 37 ∧
      19 ^ 2 * 433 + 12 = 5 ^ 2 * 13 ^ 2 * 37 ∧ ¬ Jumps (19 ^ 2 * 433) := by
  refine ⟨by norm_num, by norm_num, by norm_num, by norm_num, by norm_num,
    by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, ?_⟩
  unfold Jumps
  intro ⟨hφ, _⟩
  -- φ(19²·433) = 19·18·432 = 147744, while
  -- φ(5²·13²·37) = 20·156·36 = 112320, so the totient jump fails.
  have hp : (19 : ℕ).Prime := by norm_num
  have hq : (433 : ℕ).Prime := by norm_num
  have hr : (5 : ℕ).Prime := by norm_num
  have hs : (13 : ℕ).Prime := by norm_num
  have ht : (37 : ℕ).Prime := by norm_num
  have hφn := (totient_sigma_p2q hp hq (by norm_num)).1
  have hφN := (totient_sigma_r2s2t hr hs ht (by norm_num) (by norm_num) (by norm_num)).1
  have hN : 19 ^ 2 * 433 + 12 = 5 ^ 2 * 13 ^ 2 * 37 := by norm_num
  have : (φ (19 ^ 2 * 433 + 12) : ℤ) = 112320 := by
    rw [hN, hφN]; norm_num
  have : (φ (19 ^ 2 * 433) : ℤ) + 12 = 147756 := by
    rw [hφn]; norm_num
  exact absurd (by linarith) (by norm_num : (112320 : ℤ) ≠ 147756)

end P2qJumps
