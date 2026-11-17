/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Ext.TheoremD.Analytic
import P2qJumps.Ext.TheoremD.Certificate

/-!
# P2qJumps.Ext.TheoremD.FourAnalytic

Machine-checked Lean 4 module.
-/

namespace P2qTheoremD

lemma four_q_bound (p q a b c d : ℝ)
    (hp : 5 ≤ p) (hq : 5 ≤ q)
    (ha : 0 ≤ a) (hb : 0 ≤ b) (hc : 0 ≤ c) (hd : 0 ≤ d)
    (hN : a*b*c*d = p^2*q+12)
    (hdelta : 2*(a*b+a*c+a*d+b*c+b*d+c*d+1) = q+2*p+1) :
    121*p^2 ≤ q := by
  let z := Real.sqrt (a*b*c*d)
  let x := Real.sqrt q
  have hz : 0 ≤ z := Real.sqrt_nonneg _
  have hx : 0 ≤ x := Real.sqrt_nonneg _
  have hz2 : z^2 = a*b*c*d := Real.sq_sqrt (by positivity)
  have hx2 : x^2 = q := Real.sq_sqrt (by linarith)
  have h1 : 2*z ≤ a*b+c*d := by
    have hn : 0 ≤ a*b+c*d := by positivity
    nlinarith [sq_nonneg (a*b-c*d)]
  have h2 : 2*z ≤ a*c+b*d := by
    have hn : 0 ≤ a*c+b*d := by positivity
    nlinarith [sq_nonneg (a*c-b*d)]
  have h3 : 2*z ≤ a*d+b*c := by
    have hn : 0 ≤ a*d+b*c := by positivity
    nlinarith [sq_nonneg (a*d-b*c)]
  have hpx : p*x < z := by
    have hn : 0 ≤ p*x := by positivity
    nlinarith [sq_nonneg (z-p*x)]
  have hsmall : 2*p+1 ≤ p*x := by
    have hn : 0 ≤ p*x := by positivity
    have h5 : 5*p^2 ≤ p^2*q := by nlinarith [mul_le_mul_of_nonneg_left hq (sq_nonneg p)]
    have hv := sq_nonneg (p-5)
    nlinarith
  have hxpos : 0 < x := by nlinarith
  have hineq : 11*p*x < q := by nlinarith
  have hxlarge : 11*p < x := by nlinarith
  nlinarith

/-- The universal four-variable Cauchy estimate, with no estimate hypotheses. -/
lemma four_cauchy (a b c d : ℝ)
    (ha : 1 < a) (hb : 1 < b) (hc : 1 < c) (hd : 1 < d) :
    (a*b*c*d-(a-1)*(b-1)*(c-1)*(d-1))^2 *
      ((a-1)*(b-1)*(c-1)*(d-1)*((a+1)*(b+1)*(c+1)*(d+1))) ≤
    4*((a*b*c*d)^2-(a-1)*(b-1)*(c-1)*(d-1)*((a+1)*(b+1)*(c+1)*(d+1)))*(a*b*c*d)^2 := by
  let x : Fin 4 → ℝ := ![1/a,1/b,1/c,1/d]
  have hx : ∀ i ∈ (Finset.univ : Finset (Fin 4)), 0 ≤ x i ∧ x i ≤ 1 := by
    intro i hi
    fin_cases i <;> simp [x] <;> constructor
    all_goals first | positivity | (apply inv_le_one_of_one_le₀; linarith)
  have h := reciprocal_cauchy Finset.univ x hx
  simp [x, Fin.prod_univ_succ] at h
  have ha0 : a ≠ 0 := by linarith
  have hb0 : b ≠ 0 := by linarith
  have hc0 : c ≠ 0 := by linarith
  have hd0 : d ≠ 0 := by linarith
  have hB : 1 - (1-1/a)*((1-1/b)*((1-1/c)*(1-1/d))) =
      (a*b*c*d-(a-1)*(b-1)*(c-1)*(d-1))/(a*b*c*d) := by
    field_simp
  have hP : (1-(1/a)^2)*((1-(1/b)^2)*((1-(1/c)^2)*(1-(1/d)^2))) =
      ((a-1)*(b-1)*(c-1)*(d-1)*((a+1)*(b+1)*(c+1)*(d+1)))/(a*b*c*d)^2 := by
    field_simp
    ring
  simp only [one_div, inv_pow] at hB hP
  rw [hB,hP] at h
  have hNpos : 0 < a*b*c*d := by positivity
  field_simp at h
  linarith [h]

/-- Algebraic closure of the four-factor branch. -/
lemma no_symmetric_four (p q a b c d : ℝ)
    (hp : 5 ≤ p) (hq : 5 ≤ q)
    (ha : 1 < a) (hb : 1 < b) (hc : 1 < c) (hd : 1 < d)
    (hN : a*b*c*d = p^2*q+12)
    (hphi : (a-1)*(b-1)*(c-1)*(d-1) = p*(p-1)*(q-1)+12)
    (hsigma : (a+1)*(b+1)*(c+1)*(d+1) = (1+p+p^2)*(q+1)+12) : False := by
  have hdelta : 2*(a*b+a*c+a*d+b*c+b*d+c*d+1) = q+2*p+1 := by
    linear_combination hphi + hsigma - 2*hN
  have hqbound := four_q_bound p q a b c d hp hq
    (by linarith) (by linarith) (by linarith) (by linarith) hN hdelta
  have hA : a*b*c*d-(a-1)*(b-1)*(c-1)*(d-1) = defectA p q := by
    unfold defectA
    linear_combination hN-hphi
  have hQ : (a*b*c*d)^2 - (a-1)*(b-1)*(c-1)*(d-1)*((a+1)*(b+1)*(c+1)*(d+1)) = invariantQ p q := by
    rw [hN,hphi,hsigma]
    unfold invariantQ
    ring
  have hC := four_cauchy a b c d ha hb hc hd
  have hprod : (a-1)*(b-1)*(c-1)*(d-1)*((a+1)*(b+1)*(c+1)*(d+1)) =
      (shiftedN p q)^2-invariantQ p q := by
    unfold shiftedN
    rw [hN] at hQ
    linarith only [hQ]
  rw [hA,hQ,hprod,hN] at hC
  change (defectA p q)^2*((shiftedN p q)^2-invariantQ p q) ≤
      4*invariantQ p q*(shiftedN p q)^2 at hC
  have hprod0 : 0 ≤ (shiftedN p q)^2-invariantQ p q := by
    rw [← hprod]
    have ha1 : 0 ≤ a-1 := by linarith
    have hb1 : 0 ≤ b-1 := by linarith
    have hc1 : 0 ≤ c-1 := by linarith
    have hd1 : 0 ≤ d-1 := by linarith
    positivity
  have hL : 0 ≤ (defectA p q)^2*((shiftedN p q)^2-invariantQ p q) :=
    mul_nonneg (sq_nonneg _) hprod0
  have hQN : 0 ≤ invariantQ p q*(shiftedN p q)^2 := by nlinarith only [hC,hL]
  have hmul := mul_nonneg (show 0 ≤ p-5 by linarith) hQN
  have hpos := gapH_positive p q hp hqbound
  unfold gapH at hpos
  nlinarith only [hmul,hC,hpos]

end P2qTheoremD
