/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith

/-!
# Finite exclusion for the model y² = x³ - x² - 12

Proves that no integral point on the curve satisfies y = 0 or y² | -62976.
The resultant identity (3x - 164)(x³ - x² - 12) + (-x² + 55x - 18)(3x² - 2x) = 1968
is recorded. The group-law argument that would control denominators of non-integral
points is not included; that step remains open.
-/

namespace Curve3936b1

theorem resultant_identity (x : ℤ) :
    (3 * x - 164) * (x ^ 3 - x ^ 2 - 12) +
      (-x ^ 2 + 55 * x - 18) * (3 * x ^ 2 - 2 * x) = 1968 := by
  ring

def deltaCandidates : List ℤ :=
  [-16, -8, -4, -2, -1, 0, 1, 2, 4, 8, 16]

theorem no_integral_point_in_box (x y : ℤ)
    (hcurve : y ^ 2 = x ^ 3 - x ^ 2 - 12)
    (hy : y ∈ deltaCandidates) : False := by
  have hy2 : 0 ≤ y ^ 2 ∧ y ^ 2 ≤ 256 := by
    have hcheck : deltaCandidates.all (fun z => decide (0 ≤ z ^ 2 ∧ z ^ 2 ≤ 256)) = true := by
      decide
    rw [List.all_eq_true] at hcheck
    exact of_decide_eq_true (hcheck y hy)
  have hx : -6 ≤ x ∧ x ≤ 6 := by
    constructor
    · by_contra hlt
      have : x ≤ -7 := by omega
      nlinarith [hy2.1]
    · by_contra hgt
      have : 7 ≤ x := by omega
      nlinarith [hy2.2]
  have hxmem : x ∈ (List.range 13).map (fun n : ℕ => (n : ℤ) - 6) := by
    rw [List.mem_map]
    refine ⟨(x + 6).toNat, List.mem_range.mpr ?_, ?_⟩ <;> omega
  have hbox :
      ((List.range 13).map (fun n : ℕ => (n : ℤ) - 6)).all (fun a =>
        deltaCandidates.all (fun b => decide (b ^ 2 ≠ a ^ 3 - a ^ 2 - 12))) = true := by
    decide
  rw [List.all_eq_true] at hbox
  have hrow := hbox x hxmem
  rw [List.all_eq_true] at hrow
  exact of_decide_eq_true (hrow y hy) hcurve

end Curve3936b1
