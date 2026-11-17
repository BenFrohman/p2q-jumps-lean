/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib

/-!
# P2qJumps.Ext.TheoremD.Analytic

Machine-checked Lean 4 module.
-/

open scoped BigOperators
namespace P2qTheoremD

/-- Elementary union bound, proved by induction, not an assumed estimate. -/
lemma union_bound {ι : Type*} (s : Finset ι) (x : ι → ℝ)
    (hx : ∀ i ∈ s, 0 ≤ x i ∧ x i ≤ 1) :
    1 - ∏ i ∈ s, (1-x i) ≤ ∑ i ∈ s, x i := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | @insert a s ha ih =>
    have hxa := hx a (Finset.mem_insert_self a s)
    have hxs : ∀ i ∈ s, 0 ≤ x i ∧ x i ≤ 1 :=
      fun i hi => hx i (Finset.mem_insert_of_mem hi)
    have hp : 0 ≤ ∏ i ∈ s, (1-x i) :=
      Finset.prod_nonneg (fun i hi => sub_nonneg.mpr (hxs i hi).2)
    have hs : 0 ≤ ∑ i ∈ s, x i := Finset.sum_nonneg (fun i hi => (hxs i hi).1)
    have hb := ih hxs
    simp only [Finset.prod_insert ha, Finset.sum_insert ha]
    nlinarith [mul_nonneg hxa.1 (show 0 ≤ (∑ i ∈ s, x i) - (1 - ∏ i ∈ s, (1-x i)) by linarith)]

/-- Log-free product estimate supplying the quadratic reciprocal budget. -/
lemma product_budget {ι : Type*} (s : Finset ι) (y : ι → ℝ)
    (hy : ∀ i ∈ s, 0 ≤ y i ∧ y i ≤ 1) :
    (∏ i ∈ s, (1-y i)) * (1 + ∑ i ∈ s, y i) ≤ 1 := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | @insert a s ha ih =>
    have hya := hy a (Finset.mem_insert_self a s)
    have hys : ∀ i ∈ s, 0 ≤ y i ∧ y i ≤ 1 :=
      fun i hi => hy i (Finset.mem_insert_of_mem hi)
    have hp : 0 ≤ ∏ i ∈ s, (1-y i) :=
      Finset.prod_nonneg (fun i hi => sub_nonneg.mpr (hys i hi).2)
    have hs : 0 ≤ ∑ i ∈ s, y i := Finset.sum_nonneg (fun i hi => (hys i hi).1)
    have hb := ih hys
    simp only [Finset.prod_insert ha, Finset.sum_insert ha]
    nlinarith [mul_nonneg hp (mul_nonneg hya.1 hs), mul_nonneg hp (sq_nonneg (y a))]

/-- Cauchy, union bound, and product budget in one universal inequality. -/
lemma reciprocal_cauchy {ι : Type*} (s : Finset ι) (x : ι → ℝ)
    (hx : ∀ i ∈ s, 0 ≤ x i ∧ x i ≤ 1) :
    (1 - ∏ i ∈ s, (1-x i))^2 * (∏ i ∈ s, (1-(x i)^2)) ≤
      (s.card : ℝ) * (1 - ∏ i ∈ s, (1-(x i)^2)) := by
  have hy : ∀ i ∈ s, 0 ≤ (x i)^2 ∧ (x i)^2 ≤ 1 := by
    intro i hi
    obtain ⟨h0,h1⟩ := hx i hi
    constructor
    · positivity
    · nlinarith
  have hP : 0 ≤ ∏ i ∈ s, (1-(x i)^2) :=
    Finset.prod_nonneg (fun i hi => sub_nonneg.mpr (hy i hi).2)
  have hU : 0 ≤ 1 - ∏ i ∈ s, (1-x i) := by
    have : ∏ i ∈ s, (1-x i) ≤ 1 := Finset.prod_le_one
      (fun i hi => sub_nonneg.mpr (hx i hi).2)
      (fun i hi => by linarith [(hx i hi).1])
    linarith
  have hB := union_bound s x hx
  have hC : (∑ i ∈ s, x i)^2 ≤ (s.card : ℝ) * (∑ i ∈ s, (x i)^2) := by
    simpa using (Finset.sum_mul_sq_le_sq_mul_sq s (fun _ => (1:ℝ)) x)
  have hPB := product_budget s (fun i => (x i)^2) hy
  have hcard : (0:ℝ) ≤ s.card := Nat.cast_nonneg _
  have hsq : (1 - ∏ i ∈ s, (1-x i))^2 ≤ (s.card : ℝ) * (∑ i ∈ s, (x i)^2) := by
    nlinarith
  calc
    _ ≤ ((s.card : ℝ) * (∑ i ∈ s, (x i)^2)) * (∏ i ∈ s, (1-(x i)^2)) := mul_le_mul_of_nonneg_right hsq hP
    _ ≤ _ := by nlinarith [mul_le_mul_of_nonneg_left hPB hcard]

end P2qTheoremD
