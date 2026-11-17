/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Ext.Structural.Basic

/-!
# Theorem F (2-divisibility), using the true prime factorisation of `N`
-/

namespace P2qStructural

open ArithmeticFunction
open scoped ArithmeticFunction.sigma ArithmeticFunction.Moebius

/-- Number of odd primes dividing `N` (equals `ω(N)` when `N` is odd). -/
def omegaOdd (N : ℕ) : ℕ := (N.primeFactors.filter (fun ℓ => ℓ ≠ 2)).card

/-- Number of odd primes dividing `N` to an odd exponent. -/
def oddExpCount (N : ℕ) : ℕ :=
  (N.primeFactors.filter (fun ℓ => ℓ ≠ 2 ∧ Odd (N.factorization ℓ))).card

lemma geom_mod_two {ℓ : ℕ} (hℓ : Odd ℓ) (m : ℕ) :
    (∑ i ∈ Finset.range m, ℓ ^ i) % 2 = m % 2 := by
  induction m with
  | zero => simp
  | succ m ih =>
    rw [Finset.sum_range_succ, Nat.add_mod, ih, Nat.odd_iff.1 (hℓ.pow)]
    omega

lemma two_dvd_sigma_prime_pow {ℓ e : ℕ} (hℓ : ℓ.Prime) (h2 : ℓ ≠ 2) (he : Odd e) :
    2 ∣ σ 1 (ℓ ^ e) := by
  rw [sigma_one_apply_prime_pow hℓ, Nat.dvd_iff_mod_eq_zero,
    geom_mod_two (hℓ.odd_of_ne_two h2)]
  obtain ⟨k, rfl⟩ := he; omega

lemma two_pow_dvd_prod {S : Finset ℕ} (P : ℕ → Prop) [DecidablePred P] (f : ℕ → ℕ)
    (hf : ∀ ℓ ∈ S, P ℓ → 2 ∣ f ℓ) :
    2 ^ (S.filter P).card ∣ ∏ ℓ ∈ S, f ℓ := by
  rw [← Finset.prod_filter_mul_prod_filter_not S P]
  apply dvd_mul_of_dvd_left
  rw [← Finset.prod_const]
  apply Finset.prod_dvd_prod_of_dvd
  intro ℓ hℓ
  rw [Finset.mem_filter] at hℓ
  exact hf ℓ hℓ.1 hℓ.2

/-- `2^{omegaOdd N} ∣ φ(N)`. -/
theorem two_pow_dvd_totient (N : ℕ) (hN : N ≠ 0) : 2 ^ omegaOdd N ∣ Nat.totient N := by
  rw [Nat.totient_eq_prod_factorization hN, Finsupp.prod, Nat.support_factorization]
  apply two_pow_dvd_prod
  intro ℓ hℓ h2
  have hp := Nat.prime_of_mem_primeFactors hℓ
  apply dvd_mul_of_dvd_right
  have := hp.odd_of_ne_two h2
  obtain ⟨k, hk⟩ := this
  exact ⟨k, by omega⟩

/-- `2^{oddExpCount N} ∣ σ₁(N)`. -/
theorem two_pow_dvd_sigma (N : ℕ) (hN : N ≠ 0) : 2 ^ oddExpCount N ∣ σ 1 N := by
  rw [isMultiplicative_sigma.multiplicative_factorization (σ 1) hN, Finsupp.prod,
    Nat.support_factorization]
  apply two_pow_dvd_prod
  intro ℓ hℓ h
  exact two_dvd_sigma_prime_pow (Nat.prime_of_mem_primeFactors hℓ) h.1 h.2

/-- **Theorem F (formal form).** With `m = min(omegaOdd N, oddExpCount N)`,
`2^m ∣ 2 (p^4 - 13p - 6)`. -/
theorem theoremF {p q : ℕ} (h : Jump p q) :
    (2 : ℤ) ^ min (omegaOdd (p ^ 2 * q + 12)) (oddExpCount (p ^ 2 * q + 12)) ∣ 2 * T p := by
  set N := p ^ 2 * q + 12
  have hN : N ≠ 0 := by omega
  have hφ : (2 : ℤ) ^ min (omegaOdd N) (oddExpCount N) ∣ (Nat.totient N : ℤ) := by
    have := (pow_dvd_pow 2 (min_le_left (omegaOdd N) (oddExpCount N))).trans (two_pow_dvd_totient N hN)
    exact_mod_cast Int.natCast_dvd_natCast.2 this
  have hσ : (2 : ℤ) ^ min (omegaOdd N) (oddExpCount N) ∣ (σ 1 N : ℤ) := by
    have := (pow_dvd_pow 2 (min_le_right (omegaOdd N) (oddExpCount N))).trans (two_pow_dvd_sigma N hN)
    exact_mod_cast Int.natCast_dvd_natCast.2 this
  rw [← lemmaG h]
  exact dvd_sub (dvd_mul_of_dvd_right hσ _) (dvd_mul_of_dvd_right hφ _)

/-- **Theorem F (paper form).** `2^{m-1} ∣ p^4 - 13p - 6`, with `m` as above. -/
theorem theoremF' {p q : ℕ} (h : Jump p q) :
    (2 : ℤ) ^ (min (omegaOdd (p ^ 2 * q + 12)) (oddExpCount (p ^ 2 * q + 12)) - 1) ∣ T p := by
  have hF := theoremF h
  set m := min (omegaOdd (p ^ 2 * q + 12)) (oddExpCount (p ^ 2 * q + 12))
  rcases Nat.eq_zero_or_pos m with h0 | hpos
  · rw [h0]; simp
  · obtain ⟨k, hk⟩ : ∃ k, m = k + 1 := ⟨m - 1, by omega⟩
    rw [hk, pow_succ] at hF
    rw [hk, Nat.add_sub_cancel]
    rw [mul_comm] at hF
    exact (mul_dvd_mul_iff_left (by norm_num : (2 : ℤ) ≠ 0)).1 hF

end P2qStructural
