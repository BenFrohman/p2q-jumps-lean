/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Ext.Extensions

/-!
# Lemma K in parametrised form (`m`), derived from the actual arithmetic functions

For `U = rad N`, `K = N / U`, `P = ∏_{ℓ ∣ N} (ℓ - 1)`:
`N = U K`, `φ(N) = K P`, and there is an integer `m ≥ 1` with
`U - P = p m`, `K m = p + q - 1`, `K (p^2 m - U) = L(p)`.
-/

namespace P2qExclusions

open ArithmeticFunction P2qStructural
open scoped ArithmeticFunction.sigma ArithmeticFunction.Moebius

/-- `P(N) = ∏_{ℓ ∣ N} (ℓ - 1)` (equals `φ(rad N)`). -/
def Pm1 (N : ℕ) : ℕ := ∏ ℓ ∈ N.primeFactors, (ℓ - 1)

lemma rad_pos (N : ℕ) : 0 < rad N :=
  Finset.prod_pos (fun _ h => (Nat.prime_of_mem_primeFactors h).pos)

lemma N_eq_UK (N : ℕ) : N = rad N * (N / rad N) :=
  (Nat.mul_div_cancel' (Nat.prod_primeFactors_dvd N)).symm

lemma totient_eq_KP (N : ℕ) : Nat.totient N = (N / rad N) * Pm1 N := by
  have h := totient_rad N
  have hU := rad_pos N
  have h2 : Nat.totient N * rad N = ((N / rad N) * Pm1 N) * rad N := by
    rw [h]; unfold Pm1
    calc N * ∏ ℓ ∈ N.primeFactors, (ℓ - 1)
        = (rad N * (N / rad N)) * ∏ ℓ ∈ N.primeFactors, (ℓ - 1) := by rw [← N_eq_UK N]
      _ = _ := by ring
  exact Nat.eq_of_mul_eq_mul_right hU h2

lemma Pm1_lt_rad {N : ℕ} (hN : 1 < N) : Pm1 N < rad N := by
  unfold Pm1 rad
  apply Finset.prod_lt_prod_of_nonempty
  · intro ℓ h; have := (Nat.prime_of_mem_primeFactors h).two_le; omega
  · intro ℓ h; have := (Nat.prime_of_mem_primeFactors h).two_le; omega
  · exact Nat.nonempty_primeFactors.2 hN

lemma p_not_dvd_N {p q : ℕ} (hp : p.Prime) (hp5 : 5 ≤ p) : ¬ p ∣ p ^ 2 * q + 12 := by
  intro h
  have h1 : p ∣ p ^ 2 * q := Dvd.dvd.mul_right (dvd_pow_self p two_ne_zero) q
  have h12 : p ∣ 12 := (Nat.dvd_add_right h1).1 h
  have := Nat.le_of_dvd (by norm_num) h12
  interval_cases p <;> revert hp h12 <;> norm_num

/-- **Lemma K, parametrised.** -/
theorem setupK {p q : ℕ} (h : Jump p q) (hp5 : 5 ≤ p) :
    ∃ m : ℤ, 1 ≤ m ∧
      (rad (p ^ 2 * q + 12) : ℤ) - Pm1 (p ^ 2 * q + 12) = p * m ∧
      (((p ^ 2 * q + 12) / rad (p ^ 2 * q + 12) : ℕ) : ℤ) * m = p + q - 1 ∧
      (((p ^ 2 * q + 12) / rad (p ^ 2 * q + 12) : ℕ) : ℤ) * ((p : ℤ) ^ 2 * m - rad (p ^ 2 * q + 12))
        = L p := by
  set N := p ^ 2 * q + 12 with hNdef
  set U := rad N
  set K := N / U
  set P := Pm1 N
  have hNUK : (N : ℤ) = U * K := by exact_mod_cast N_eq_UK N
  have hφ : (Nat.totient N : ℤ) = K * P := by exact_mod_cast totient_eq_KP N
  obtain ⟨h1, -⟩ := jump_int h
  have hA : (K : ℤ) * ((U : ℤ) - P) = p * (p + q - 1) := by
    have : (N : ℤ) = p ^ 2 * q + 12 := by simp [hNdef]
    linear_combination hNUK.symm.trans this - hφ.symm.trans h1
  have hpK : ¬ (p : ℤ) ∣ K := by
    intro hd
    have : p ∣ K := Int.natCast_dvd_natCast.1 hd
    exact p_not_dvd_N h.hp hp5 (this.trans (Dvd.intro_left _ (N_eq_UK N).symm))
  have hpr : Prime (p : ℤ) := Nat.prime_iff_prime_int.1 h.hp
  have hdiv : (p : ℤ) ∣ (U : ℤ) - P :=
    (hpr.dvd_or_dvd (by rw [hA]; exact dvd_mul_right _ _)).resolve_left hpK
  obtain ⟨m, hm⟩ := hdiv
  have hpos : (0 : ℤ) < p := by exact_mod_cast h.hp.pos
  have hKm : (K : ℤ) * m = p + q - 1 := by
    rw [hm] at hA
    have : (p : ℤ) * (K * m - (p + q - 1)) = 0 := by linear_combination hA
    rcases mul_eq_zero.1 this with h0 | h0
    · omega
    · linarith
  have hlt : (P : ℤ) < U := by
    have : 1 < N := by omega
    exact_mod_cast Pm1_lt_rad this
  have hm1 : 1 ≤ m := by
    by_contra hc; push_neg at hc
    have : (p : ℤ) * m ≤ 0 := by nlinarith
    linarith
  refine ⟨m, hm1, hm, hKm, ?_⟩
  have hN' : (N : ℤ) = p ^ 2 * q + 12 := by simp [hNdef]
  unfold L
  linear_combination (-1 : ℤ) * hNUK.symm.trans hN' + (p : ℤ) ^ 2 * hKm

end P2qExclusions
