/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Ext.TheoremD.FiniteProduct

/-!
# P2qJumps.Ext.TheoremD.GeneralAnalytic

Machine-checked Lean 4 module.
-/

open scoped BigOperators
namespace P2qTheoremD

lemma finite_cauchy {ι : Type*} (s : Finset ι) (x : ι → ℝ)
    (hx : ∀ i ∈ s, 1 ≤ x i) :
    ((∏ i ∈ s, x i)-(∏ i ∈ s, (x i-1)))^2 *
      ((∏ i ∈ s, (x i-1))*(∏ i ∈ s, (x i+1))) ≤
    (s.card : ℝ)*((∏ i ∈ s, x i)^2-(∏ i ∈ s, (x i-1))*(∏ i ∈ s, (x i+1)))*(∏ i ∈ s, x i)^2 := by
  have hpos : 0 < ∏ i ∈ s, x i := Finset.prod_pos (fun i hi => by linarith [hx i hi])
  have hy : ∀ i ∈ s, 0 ≤ 1/x i ∧ 1/x i ≤ 1 := by
    intro i hi
    constructor
    · exact div_nonneg zero_le_one (by linarith [hx i hi])
    · exact (div_le_one (by linarith [hx i hi])).2 (hx i hi)
  have h := reciprocal_cauchy s (fun i => 1/x i) hy
  have hB : 1-(∏ i ∈ s, (1-1/x i)) =
      ((∏ i ∈ s, x i)-(∏ i ∈ s, (x i-1)))/(∏ i ∈ s, x i) := by
    have he : (∏ i ∈ s, (1-1/x i)) = (∏ i ∈ s, (x i-1))/(∏ i ∈ s, x i) := by
      rw [← Finset.prod_div_distrib]
      apply Finset.prod_congr rfl
      intro i hi
      have hi0 : x i ≠ 0 := by linarith [hx i hi]
      field_simp
    rw [he]
    field_simp
  have hP : (∏ i ∈ s, (1-(1/x i)^2)) =
      ((∏ i ∈ s, (x i-1))*(∏ i ∈ s, (x i+1)))/(∏ i ∈ s, x i)^2 := by
    rw [← Finset.prod_pow,← Finset.prod_mul_distrib,← Finset.prod_div_distrib]
    apply Finset.prod_congr rfl
    intro i hi
    have hi0 : x i ≠ 0 := by linarith [hx i hi]
    field_simp
    ring
  rw [hB,hP] at h
  field_simp at h
  linarith [h]

lemma q_bound_of_delta (p q k N : ℝ)
    (hp : 5 ≤ p) (hq : 5 ≤ q) (hk : 4 ≤ k)
    (hN : N=p^2*q+12) (hd : k*(k-1)*Real.sqrt N ≤ q+2*p+1) :
    p^2*(k^2-k-1)^2 ≤ q ∧ 121*p^2 ≤ q := by
  let x := Real.sqrt q
  let z := Real.sqrt N
  have hx : 0 ≤ x := Real.sqrt_nonneg _
  have hz : 0 ≤ z := Real.sqrt_nonneg _
  have hx2 : x^2=q := Real.sq_sqrt (by linarith)
  have hN0 : 0 ≤ N := by rw [hN]; positivity
  have hz2 : z^2=N := Real.sq_sqrt hN0
  have hpx : p*x < z := by
    have hn : 0 ≤ p*x := by positivity
    have he : (p*x)^2=p^2*q := by rw [mul_pow,hx2]
    nlinarith only [he,hN,hz2,hz,hn]
  have hsmall : 2*p+1 ≤ p*x := by
    have hn : 0 ≤ p*x := by positivity
    have h5 : 5*p^2 ≤ p^2*q := by nlinarith [mul_le_mul_of_nonneg_left hq (sq_nonneg p)]
    nlinarith [sq_nonneg (p-5)]
  have hC : 0 < k*(k-1) := by nlinarith
  have hm := mul_lt_mul_of_pos_left hpx hC
  have hxpos : 0 < x := by nlinarith
  have hi : p*(k^2-k-1)*x < q := by
    change k*(k-1)*z ≤ _ at hd
    nlinarith only [hm,hd,hsmall]
  have hxlarge : p*(k^2-k-1) ≤ x := by nlinarith only [hi,hx2,hxpos]
  have hc11 : 11 ≤ k^2-k-1 := by nlinarith [sq_nonneg (k-4)]
  have hbase0 : 0 ≤ p*(k^2-k-1) := by positivity
  have hsq := pow_le_pow_left₀ hbase0 hxlarge 2
  have hbound : p^2*(k^2-k-1)^2 ≤ q := by simpa only [mul_pow,hx2] using hsq
  constructor
  · exact hbound
  · have hc121 : 121 ≤ (k^2-k-1)^2 := by nlinarith
    nlinarith [mul_le_mul_of_nonneg_left hc121 (sq_nonneg p)]

end P2qTheoremD
