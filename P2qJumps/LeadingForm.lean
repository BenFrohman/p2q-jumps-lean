/-
Copyright (c) 2026 Benjamin Frohman. CC BY 4.0.
-/
import Mathlib.Tactic
import Mathlib.Data.Real.Basic

namespace P2qJumps

/-- Leading ratio form from the complementary discriminant of an `rst` solution. -/
def g (t : ℝ) : ℝ := 4 * t ^ 4 + 4 * t ^ 3 + 11 * t ^ 2 + 6 * t + 7

/-- Sum-of-squares identity used in the p ≥ 13 comparison of Theorem 28. -/
theorem g_sub_six_eq (t : ℝ) :
    g t - 6 = (2 * t ^ 2 + t) ^ 2 + 10 * t ^ 2 + 6 * t + 1 := by
  unfold g
  ring

theorem quad_sos (t : ℝ) :
    10 * t ^ 2 + 6 * t + 1 = 10 * (t + 3 / 10) ^ 2 + (1 / 10 : ℝ) := by
  ring

/-- `g t ≥ 6` for every real `t`. This is the leading-form bound in the paper. -/
theorem g_ge_six (t : ℝ) : g t ≥ 6 := by
  have h1 := g_sub_six_eq t
  have h2 := quad_sos t
  have hs1 : 0 ≤ (2 * t ^ 2 + t) ^ 2 := sq_nonneg _
  have hs2 : 0 ≤ (t + 3 / 10) ^ 2 := sq_nonneg _
  have hpos : 0 ≤ 10 * (t + 3 / 10) ^ 2 + (1 / 10 : ℝ) := by
    nlinarith
  nlinarith

end P2qJumps
