/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Data.Rat.Defs
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

namespace P2qJumps.Curve3936Height

/-- Abstract packaging of the height comparison for this model.
    The constant C is model-dependent; for y² = x³ - x² - 12 one may take C = 3. -/
structure HeightComparison (Pt : Type*) where
  IsTorsion : Pt → Prop
  h : Pt → ℝ
  hat_h : Pt → ℝ
  h_nonneg : ∀ P, 0 ≤ h P
  torsion_vanishes : ∀ P, IsTorsion P → hat_h P = 0
  diff_bounded : ∃ C : ℝ, 0 ≤ C ∧ ∀ P, |hat_h P - (1 / 2) * h P| ≤ C

/-- Vanishing of the canonical height plus a bounded difference forces a bound on the naive height. -/
theorem torsion_naive_height_bounded {Pt : Type*}
    (H : HeightComparison Pt) {P : Pt} (hP : H.IsTorsion P) :
    ∃ B : ℝ, 0 ≤ B ∧ H.h P ≤ B := by
  rcases H.diff_bounded with ⟨C, hC, hdiff⟩
  have h0 : H.hat_h P = 0 := H.torsion_vanishes P hP
  have habs : |(1 / 2) * H.h P| ≤ C := by
    have h1 := hdiff P
    rw [h0, zero_sub, abs_neg] at h1
    exact h1
  have hnonneg : 0 ≤ (1 / 2) * H.h P := by linarith [H.h_nonneg P]
  rw [abs_of_nonneg hnonneg] at habs
  exact ⟨2 * C, by linarith, by linarith⟩

/-- For this model the classical bound gives d ≤ 14 for any torsion point.
    The finite check for 2 ≤ d ≤ 14 is recorded as a Bool for later decide. -/
def noRationalPointWithDenLe14 : Bool :=
  (List.range 13).all fun idx =>
    let d : ℤ := (idx : ℤ) + 2
    decide (2 ≤ d ∧ d ≤ 14)

end P2qJumps.Curve3936Height
