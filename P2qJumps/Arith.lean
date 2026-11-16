/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/
import Mathlib.Tactic
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import P2qJumps.Statement

/-!
# Totient and divisor-sum values for the factor shapes used in the paper

Exact values of `φ` and `σ₁` at `p^2 q`, `r^2 s t` and `r^3 s` for distinct primes, and the
translation of `Jumps (p^2 q)` into two integer polynomial identities.
-/

namespace P2qJumps

open Nat ArithmeticFunction
open scoped ArithmeticFunction.sigma

lemma sigma_one_prime' {r : ℕ} (hr : r.Prime) : σ 1 r = r + 1 := by
  have h := sigma_one_apply_prime_pow (i := 1) hr
  simp [Finset.sum_range_succ] at h
  omega

lemma sigma_one_prime_sq {r : ℕ} (hr : r.Prime) : σ 1 (r ^ 2) = r ^ 2 + r + 1 := by
  rw [sigma_one_apply_prime_pow hr]
  simp [Finset.sum_range_succ]
  ring

lemma sigma_one_prime_cube {r : ℕ} (hr : r.Prime) : σ 1 (r ^ 3) = r ^ 3 + r ^ 2 + r + 1 := by
  rw [sigma_one_apply_prime_pow hr]
  simp [Finset.sum_range_succ]
  ring

/-- `φ (p^2 q)` and `σ₁ (p^2 q)` for distinct primes `p, q`, as integers. -/
lemma totient_sigma_p2q {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) :
    (φ (p ^ 2 * q) : ℤ) = p * (p - 1) * (q - 1) ∧
      (σ 1 (p ^ 2 * q) : ℤ) = (p ^ 2 + p + 1) * (q + 1) := by
  have cpq : (p ^ 2).Coprime q := Nat.Coprime.pow_left 2 ((Nat.coprime_primes hp hq).2 hpq)
  constructor
  · rw [Nat.totient_mul cpq, Nat.totient_prime_pow hp (by norm_num), Nat.totient_prime hq]
    have h1 := hp.one_le
    have h2 := hq.one_le
    push_cast [h1, h2]
    ring
  · rw [isMultiplicative_sigma.map_mul_of_coprime cpq, sigma_one_prime_sq hp, sigma_one_prime' hq]
    push_cast
    ring

/-- `φ` and `σ₁` of `r^2 s t` for pairwise distinct primes. -/
lemma totient_sigma_r2st {r s t : ℕ} (hr : r.Prime) (hs : s.Prime) (ht : t.Prime)
    (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t) :
    (φ (r ^ 2 * s * t) : ℤ) = r * (r - 1) * (s - 1) * (t - 1) ∧
      (σ 1 (r ^ 2 * s * t) : ℤ) = (r ^ 2 + r + 1) * (s + 1) * (t + 1) := by
  have c1 : (r ^ 2).Coprime s := Nat.Coprime.pow_left 2 ((Nat.coprime_primes hr hs).2 hrs)
  have c2 : (r ^ 2 * s).Coprime t :=
    Nat.coprime_mul_iff_left.2 ⟨Nat.Coprime.pow_left 2 ((Nat.coprime_primes hr ht).2 hrt),
      (Nat.coprime_primes hs ht).2 hst⟩
  constructor
  · rw [Nat.totient_mul c2, Nat.totient_mul c1, Nat.totient_prime_pow hr (by norm_num),
      Nat.totient_prime hs, Nat.totient_prime ht]
    have := hr.one_le; have := hs.one_le; have := ht.one_le
    push_cast [hr.one_le, hs.one_le, ht.one_le]
    ring
  · rw [isMultiplicative_sigma.map_mul_of_coprime c2, isMultiplicative_sigma.map_mul_of_coprime c1,
      sigma_one_prime_sq hr, sigma_one_prime' hs, sigma_one_prime' ht]
    push_cast
    ring

/-- `φ` and `σ₁` of `r^3 s` for distinct primes. -/
lemma totient_sigma_r3s {r s : ℕ} (hr : r.Prime) (hs : s.Prime) (hrs : r ≠ s) :
    (φ (r ^ 3 * s) : ℤ) = r ^ 2 * (r - 1) * (s - 1) ∧
      (σ 1 (r ^ 3 * s) : ℤ) = (r ^ 3 + r ^ 2 + r + 1) * (s + 1) := by
  have c1 : (r ^ 3).Coprime s := Nat.Coprime.pow_left 3 ((Nat.coprime_primes hr hs).2 hrs)
  constructor
  · rw [Nat.totient_mul c1, Nat.totient_prime_pow hr (by norm_num), Nat.totient_prime hs]
    push_cast [hr.one_le, hs.one_le]
    ring
  · rw [isMultiplicative_sigma.map_mul_of_coprime c1, sigma_one_prime_cube hr, sigma_one_prime' hs]
    push_cast
    ring

/-- `Jumps (p^2 q)` as two integer identities in `φ (N)` and `σ₁ (N)`, `N = p^2 q + 12`. -/
lemma jumps_p2q_int {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) :
    (φ (p ^ 2 * q + 12) : ℤ) = p * (p - 1) * (q - 1) + 12 ∧
      (σ 1 (p ^ 2 * q + 12) : ℤ) = (p ^ 2 + p + 1) * (q + 1) + 12 := by
  obtain ⟨h1, h2⟩ := totient_sigma_p2q hp hq hpq
  obtain ⟨j1, j2⟩ := hJ
  constructor
  · rw [j1]; push_cast; rw [h1]
  · rw [j2]; push_cast; rw [h2]

/-- If every prime factor of `N` is at least `5` (witnessed by a factorization into primes
`≥ 5`), then the jumps force `p ≥ 5` and `p ∤ N`: helper for the shape theorems. -/
lemma p_ge_five_of_dvd {p q N : ℕ} (hp : p.Prime) (hN : p ^ 2 * q + 12 = N)
    (h2 : ¬ 2 ∣ N) (h3 : ¬ 3 ∣ N) : 5 ≤ p ∧ ¬ p ∣ N := by
  have hp2 := hp.two_le
  have h5 : 5 ≤ p := by
    by_contra hlt
    push_neg at hlt
    interval_cases p
    · exact h2 ⟨2 * q + 6, by omega⟩
    · exact h3 ⟨3 * q + 4, by omega⟩
    · exact absurd hp (by norm_num)
  refine ⟨h5, fun hd => ?_⟩
  have h12 : p ∣ 12 := by
    have : p ∣ p ^ 2 * q := Dvd.dvd.mul_right (dvd_pow_self p (by norm_num)) q
    have := (Nat.dvd_add_right this).1 (hN ▸ hd)
    exact this
  have := Nat.le_of_dvd (by norm_num) h12
  interval_cases p <;> omega

lemma prime_ge_five_not_dvd {r : ℕ} (hr : r.Prime) (h5 : 5 ≤ r) (d : ℕ) (hd : d = 2 ∨ d = 3) :
    ¬ d ∣ r := by
  intro h
  rcases hd with rfl | rfl
  · have := (Nat.prime_dvd_prime_iff_eq Nat.prime_two hr).1 h; omega
  · have := (Nat.prime_dvd_prime_iff_eq Nat.prime_three hr).1 h; omega

end P2qJumps
