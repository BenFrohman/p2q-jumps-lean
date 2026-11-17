/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Ext.Structural
import P2qJumps.Ext.TheoremD

/-!
# Corollary F1: squarefree residual reduces to `p = 7`, `k ∈ {7, 8, 9}`

Combines Theorem D (`P2qTheoremD.theoremD`, copied verbatim) with Theorem F
(`P2qStructural.theoremF'`, copied verbatim).
-/

namespace P2qExtensions

open ArithmeticFunction P2qStructural
open scoped ArithmeticFunction.sigma ArithmeticFunction.Moebius

lemma pow_four_lt_two_pow (p : ℕ) (hp : 19 ≤ p) : p ^ 4 < 2 ^ (p - 1) := by
  induction p, hp using Nat.le_induction with
  | base => norm_num
  | succ m hm ih =>
    have h1 : (m + 1) ^ 4 < 2 * m ^ 4 := by
      obtain ⟨x, rfl⟩ : ∃ x, m = x + 19 := ⟨m - 19, by omega⟩
      ring_nf; nlinarith [sq_nonneg x, pow_pos (show (0:ℕ) < x + 1 by omega) 3]
    have h2 : 2 ^ (m + 1 - 1) = 2 * 2 ^ (m - 1) := by
      rw [show m + 1 - 1 = (m - 1) + 1 by omega, pow_succ]; ring
    rw [h2]; omega

lemma odd_N {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hp5 : 5 ≤ p) (hq5 : 5 ≤ q) :
    ¬ 2 ∣ p ^ 2 * q + 12 := by
  have ho : Odd p := hp.odd_of_ne_two (by omega)
  have hoq : Odd q := hq.odd_of_ne_two (by omega)
  have : Odd (p ^ 2 * q + 12) := (ho.pow.mul hoq).add_even (by decide)
  exact fun h => (Nat.not_even_iff_odd.2 this) (even_iff_two_dvd.2 h)

lemma omegaOdd_eq {N : ℕ} (hN : ¬ 2 ∣ N) : omegaOdd N = N.primeFactors.card := by
  unfold omegaOdd; congr 1
  apply Finset.filter_true_of_mem
  intro ℓ hℓ h; subst h; exact hN (Nat.dvd_of_mem_primeFactors hℓ)

lemma oddExpCount_eq {N : ℕ} (hN : ¬ 2 ∣ N) (hsq : Squarefree N) :
    oddExpCount N = N.primeFactors.card := by
  unfold oddExpCount; congr 1
  apply Finset.filter_true_of_mem
  intro ℓ hℓ
  refine ⟨fun h => by subst h; exact hN (Nat.dvd_of_mem_primeFactors hℓ), ?_⟩
  have h1 : N.factorization ℓ ≤ 1 := hsq.natFactorization_le_one ℓ
  have h2 : 0 < N.factorization ℓ := by
    exact Nat.pos_of_ne_zero (Finsupp.mem_support_iff.1 (by rw [Nat.support_factorization]; exact hℓ))
  have : N.factorization ℓ = 1 := by omega
  rw [this]; decide

/-- **Corollary F1.** For distinct primes `p, q ≥ 5` with the two actual jumps,
if `N = p^2 q + 12` is squarefree with `k = ω(N) ≥ 4`, then `p = 7` and `k ∈ {7, 8, 9}`. -/
theorem corollaryF1 (p q : ℕ) (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hp5 : 5 ≤ p) (hq5 : 5 ≤ q)
    (hphi : Nat.totient (p ^ 2 * q + 12) = Nat.totient (p ^ 2 * q) + 12)
    (hsigma : σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12)
    (hsq : Squarefree (p ^ 2 * q + 12)) (hk4 : 4 ≤ (p ^ 2 * q + 12).primeFactors.card) :
    p = 7 ∧ 7 ≤ (p ^ 2 * q + 12).primeFactors.card ∧ (p ^ 2 * q + 12).primeFactors.card ≤ 9 := by
  have hD := (P2qTheoremD.theoremD p q hp hq hpq hp5 hq5 hphi hsigma hsq hk4).2.2
  have hJ : Jump p q := ⟨hp, hq, hpq, hphi, hsigma⟩
  have hF := theoremF' hJ
  have hodd := odd_N hp hq hp5 hq5
  rw [omegaOdd_eq hodd, oddExpCount_eq hodd hsq, min_self] at hF
  set k := (p ^ 2 * q + 12).primeFactors.card
  -- move to ℕ
  have hTnat : T (p : ℤ) = ((p ^ 4 - 13 * p - 6 : ℕ) : ℤ) := by
    have : 13 * p + 6 ≤ p ^ 4 := by nlinarith [pow_le_pow_left₀ (by omega : 0 ≤ 5) hp5 3]
    unfold T; push_cast [Nat.sub_sub, Nat.cast_sub this]; ring
  rw [hTnat] at hF
  have hdvd : 2 ^ (k - 1) ∣ p ^ 4 - 13 * p - 6 := by exact_mod_cast hF
  have hdp : 2 ^ (p - 1) ∣ p ^ 4 - 13 * p - 6 :=
    (pow_dvd_pow 2 (by omega)).trans hdvd
  have hpos : 0 < p ^ 4 - 13 * p - 6 := by
    have : 13 * p + 6 < p ^ 4 := by nlinarith [pow_le_pow_left₀ (by omega : 0 ≤ 5) hp5 3]
    omega
  have hle := Nat.le_of_dvd hpos hdp
  have hp17 : p ≤ 17 := by
    by_contra h
    have h19 : 19 ≤ p := by
      rcases (show p = 18 ∨ 19 ≤ p by omega) with h | h
      · subst h; norm_num at hp
      · exact h
    have h4 := pow_four_lt_two_pow p h19
    have h3 : p ^ 4 - 13 * p - 6 ≤ p ^ 4 := le_trans (Nat.sub_le _ _) (Nat.sub_le _ _)
    exact absurd (hle.trans h3) (not_le.2 h4)
  have hp7 : p = 7 := by
    interval_cases p <;> first | rfl | (norm_num at hp hdp ⊢) | omega
  subst hp7
  refine ⟨rfl, by omega, ?_⟩
  have hle2 := Nat.le_of_dvd (by norm_num) hdvd
  by_contra hk
  have h10 : 2 ^ 9 ∣ 7 ^ 4 - 13 * 7 - 6 := (pow_dvd_pow 2 (by omega)).trans hdvd
  norm_num at h10

end P2qExtensions
