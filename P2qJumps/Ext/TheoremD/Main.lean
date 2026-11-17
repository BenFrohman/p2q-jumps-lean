/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Ext.TheoremD.GeneralAnalytic
import P2qJumps.Ext.TheoremD.SquarefreeArithmetic

/-!
# P2qJumps.Ext.TheoremD.Main

Machine-checked Lean 4 module.
-/

open scoped BigOperators
namespace P2qTheoremD
open ArithmeticFunction
open scoped ArithmeticFunction.sigma ArithmeticFunction.Moebius

/-- Theorem D with the q-bound in the reals and the actual prime-factor count. -/
theorem theoremD_real (p q : ℕ)
    (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hp5 : 5 ≤ p) (hq5 : 5 ≤ q)
    (hphi : Nat.totient (p^2*q+12) = Nat.totient (p^2*q)+12)
    (hsigma : σ 1 (p^2*q+12) = σ 1 (p^2*q)+12)
    (hsq : Squarefree (p^2*q+12)) (hk4 : 4 ≤ (p^2*q+12).primeFactors.card) :
    (p:ℝ)^2*(((p^2*q+12).primeFactors.card:ℝ)^2-(p^2*q+12).primeFactors.card-1)^2 ≤ q ∧
    121*(p:ℝ)^2 ≤ q ∧ p ≤ (p^2*q+12).primeFactors.card := by
  let N := p^2*q+12
  let k := N.primeFactors.card
  have hpR : (5:ℝ) ≤ p := by exact_mod_cast hp5
  have hqR : (5:ℝ) ≤ q := by exact_mod_cast hq5
  have hkR : (4:ℝ) ≤ k := by exact_mod_cast hk4
  have hp1 := hp.one_le
  have hq1 := hq.one_le
  have hphiR : (Nat.totient N:ℝ) = (p:ℝ)*(p-1)*(q-1)+12 := by
    have h := hphi
    rw [totient_p2q hp hq hpq] at h
    exact_mod_cast h
  have hsigmaR : (σ 1 N:ℝ) = (1+(p:ℝ)+p^2)*(q+1)+12 := by
    have h := hsigma
    rw [sigma_p2q hp hq hpq] at h
    exact_mod_cast h
  obtain ⟨hNprod,hF,hS⟩ := squarefree_products N hsq
  have hx3 : ∀ r ∈ N.primeFactors, (3:ℝ) ≤ r := by
    intro r hr
    exact_mod_cast shifted_primeFactors_three p q r hp hq hp5 hq5 hr
  have hx1 : ∀ r ∈ N.primeFactors, (1:ℝ) ≤ r := fun r hr => by linarith [hx3 r hr]
  have hd0 := finite_delta_bound_sharp N.primeFactors (fun r => (r:ℝ)) hx3 hk4
  rw [hNprod,hF,hS] at hd0
  have hdelta : (σ 1 N:ℝ)+(Nat.totient N:ℝ)-2*(N:ℝ) = (q:ℝ)+2*p+1 := by
    rw [hphiR,hsigmaR]
    dsimp [N]
    push_cast
    ring
  rw [hdelta] at hd0
  have hNR : (N:ℝ) = (p:ℝ)^2*q+12 := by dsimp [N]; push_cast; rfl
  have hd : (k:ℝ)*((k:ℝ)-1)*Real.sqrt (N:ℝ) ≤ (q:ℝ)+2*p+1 := hd0
  obtain ⟨hqb,hq121⟩ := q_bound_of_delta (p:ℝ) q k N hpR hqR hkR hNR hd
  have hC := finite_cauchy N.primeFactors (fun r => (r:ℝ)) hx1
  rw [hNprod,hF,hS] at hC
  have hA : (N:ℝ)-(Nat.totient N:ℝ) = defectA p q := by
    rw [hphiR,hNR]
    unfold defectA
    ring
  have hQ : (N:ℝ)^2-(Nat.totient N:ℝ)*(σ 1 N:ℝ) = invariantQ p q := by
    rw [hphiR,hsigmaR,hNR]
    unfold invariantQ
    ring
  have hprod : (Nat.totient N:ℝ)*(σ 1 N:ℝ) = (shiftedN p q)^2-invariantQ p q := by
    change _ = ((p:ℝ)^2*q+12)^2-invariantQ p q
    rw [← hNR]
    linarith only [hQ]
  rw [hA,hQ,hprod] at hC
  have hNeq : (N:ℝ) = shiftedN p q := hNR
  rw [hNeq] at hC
  change (defectA p q)^2*((shiftedN p q)^2-invariantQ p q) ≤
      (k:ℝ)*invariantQ p q*(shiftedN p q)^2 at hC
  have hprod0 : 0 ≤ (shiftedN p q)^2-invariantQ p q := by rw [← hprod]; positivity
  have hL : 0 ≤ (defectA p q)^2*((shiftedN p q)^2-invariantQ p q) :=
    mul_nonneg (sq_nonneg _) hprod0
  have hkpos : (0:ℝ) < k := by linarith
  have hQN : 0 ≤ invariantQ p q*(shiftedN p q)^2 := by
    nlinarith only [hC,hL,hkpos]
  refine ⟨hqb,hq121,?_⟩
  change p ≤ k
  by_contra hpk
  have hkpNat : k+1 ≤ p := by omega
  have hkpR : (k:ℝ)+1 ≤ p := by exact_mod_cast hkpNat
  have hmul := mul_nonneg (show 0 ≤ (p:ℝ)-1-k by linarith) hQN
  have hpos := gapH_positive (p:ℝ) q hpR hq121
  unfold gapH at hpos
  nlinarith only [hmul,hC,hpos]

/-- **Theorem D**. All quantities, including k, are standard natural-number objects.
Both estimates and the cardinal conclusion follow from the two actual jumps. -/
theorem theoremD (p q : ℕ)
    (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hp5 : 5 ≤ p) (hq5 : 5 ≤ q)
    (hphi : Nat.totient (p^2*q+12) = Nat.totient (p^2*q)+12)
    (hsigma : ArithmeticFunction.sigma 1 (p^2*q+12) = ArithmeticFunction.sigma 1 (p^2*q)+12)
    (hsq : Squarefree (p^2*q+12)) (hk4 : 4 ≤ (p^2*q+12).primeFactors.card) :
    p^2*((p^2*q+12).primeFactors.card^2-(p^2*q+12).primeFactors.card-1)^2 ≤ q ∧
    121*p^2 ≤ p^2*((p^2*q+12).primeFactors.card^2-(p^2*q+12).primeFactors.card-1)^2 ∧
    p ≤ (p^2*q+12).primeFactors.card := by
  obtain ⟨hqb,hq121,hpk⟩ := theoremD_real p q hp hq hpq hp5 hq5 hphi hsigma hsq hk4
  let k := (p^2*q+12).primeFactors.card
  have hk : 4 ≤ k := hk4
  have hkk : k ≤ k^2 := by nlinarith only [hk]
  have hkplus : k+1 ≤ k^2 := by nlinarith only [hk]
  have hsub : 1 ≤ k^2-k := Nat.le_sub_of_add_le (by omega)
  have hcast : ((k^2-k-1:ℕ):ℝ) = (k:ℝ)^2-k-1 := by
    rw [Nat.cast_sub hsub,Nat.cast_sub hkk,Nat.cast_pow,Nat.cast_one]
  have hcastBound : ((p^2*(k^2-k-1)^2:ℕ):ℝ) = (p:ℝ)^2*((k:ℝ)^2-k-1)^2 := by
    push_cast
    rw [hcast]
  have hqbNat : p^2*(k^2-k-1)^2 ≤ q := by
    have hh : ((p^2*(k^2-k-1)^2:ℕ):ℝ) ≤ q := by rw [hcastBound]; exact hqb
    exact_mod_cast hh
  have hkR : (4:ℝ) ≤ k := by exact_mod_cast hk
  have hc11 : (11:ℝ) ≤ (k:ℝ)^2-k-1 := by nlinarith [sq_nonneg ((k:ℝ)-4)]
  have h11Nat : 11 ≤ k^2-k-1 := by
    have hh : (11:ℝ) ≤ ((k^2-k-1:ℕ):ℝ) := by rw [hcast]; exact hc11
    exact_mod_cast hh
  have h121Nat : 121 ≤ (k^2-k-1)^2 := by nlinarith only [h11Nat]
  refine ⟨hqbNat,?_,hpk⟩
  change 121*p^2 ≤ p^2*(k^2-k-1)^2
  nlinarith only [Nat.mul_le_mul_left (p^2) h121Nat]

/-- Intrinsic four-prime corollary of the full Theorem D. -/
theorem theoremD_four_prime_corollary (p q : ℕ)
    (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hp5 : 5 ≤ p) (hq5 : 5 ≤ q)
    (hphi : Nat.totient (p^2*q+12) = Nat.totient (p^2*q)+12)
    (hsigma : ArithmeticFunction.sigma 1 (p^2*q+12) = ArithmeticFunction.sigma 1 (p^2*q)+12)
    (hsq : Squarefree (p^2*q+12)) : (p^2*q+12).primeFactors.card ≠ 4 := by
  intro hk
  have h := (theoremD p q hp hq hpq hp5 hq5 hphi hsigma hsq (by omega)).2.2
  omega

end P2qTheoremD
