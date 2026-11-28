/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Data.Rat.Defs
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

namespace P2qJumps.Curve3936HeightDuplication

def multHeight (x : ℚ) : ℕ := max x.num.natAbs x.den

def dupNum (a u : ℤ) : ℤ := a ^ 4 + 96 * a * u ^ 3 - 48 * u ^ 4
def dupDen (a u : ℤ) : ℤ := 4 * u * (a ^ 3 - a ^ 2 * u - 12 * u ^ 3)

theorem dup_upper_bounds (a u : ℤ) :
    |dupNum a u| ≤ 145 * (max |a| |u|) ^ 4 ∧
    |dupDen a u| ≤ 56 * (max |a| |u|) ^ 4 := by
  set M := max |a| |u|
  have hM0 : 0 ≤ M := le_trans (abs_nonneg a) (le_max_left _ _)
  have ha : |a| ≤ M := le_max_left _ _
  have hu : |u| ≤ M := le_max_right _ _
  constructor
  · unfold dupNum
    calc |a ^ 4 + 96 * a * u ^ 3 - 48 * u ^ 4|
        ≤ |a ^ 4 + 96 * a * u ^ 3| + |48 * u ^ 4| := abs_sub _ _
      _ ≤ |a| ^ 4 + 96 * (|a| * |u| ^ 3) + 48 * |u| ^ 4 := by simp [abs_pow, abs_mul]; ring
      _ ≤ M ^ 4 + 96 * M ^ 4 + 48 * M ^ 4 := by
          have ha4 : |a| ^ 4 ≤ M ^ 4 := pow_le_pow_left₀ (abs_nonneg a) ha 4
          have hu4 : |u| ^ 4 ≤ M ^ 4 := pow_le_pow_left₀ (abs_nonneg u) hu 4
          have hau3 : |a| * |u| ^ 3 ≤ M ^ 4 := by
            calc |a| * |u| ^ 3 ≤ M * M ^ 3 := mul_le_mul ha (pow_le_pow_left₀ (abs_nonneg u) hu 3) (by positivity) hM0
              _ = M ^ 4 := by ring
          linarith
      _ = 145 * M ^ 4 := by ring
  · unfold dupDen
    have hcub : |a ^ 3 - a ^ 2 * u - 12 * u ^ 3| ≤ 14 * M ^ 3 := by
      calc |a ^ 3 - a ^ 2 * u - 12 * u ^ 3|
          ≤ |a| ^ 3 + |a| ^ 2 * |u| + 12 * |u| ^ 3 := by
            simp [abs_pow, abs_mul, abs_sub]
            ring
        _ ≤ M ^ 3 + M ^ 3 + 12 * M ^ 3 := by
            have ha3 : |a| ^ 3 ≤ M ^ 3 := pow_le_pow_left₀ (abs_nonneg a) ha 3
            have hu3 : |u| ^ 3 ≤ M ^ 3 := pow_le_pow_left₀ (abs_nonneg u) hu 3
            have ha2u : |a| ^ 2 * |u| ≤ M ^ 3 := by
              calc |a| ^ 2 * |u| ≤ M ^ 2 * M := mul_le_mul (pow_le_pow_left₀ (abs_nonneg a) ha 2) hu (abs_nonneg u) (by positivity)
                _ = M ^ 3 := by ring
            linarith
        _ = 14 * M ^ 3 := by ring
    calc |4 * u * (a ^ 3 - a ^ 2 * u - 12 * u ^ 3)|
        = 4 * |u| * |a ^ 3 - a ^ 2 * u - 12 * u ^ 3| := by simp [abs_mul]
      _ ≤ 4 * M * (14 * M ^ 3) := by
          have := mul_le_mul hu hcub (abs_nonneg _) (by positivity)
          linarith
      _ = 56 * M ^ 4 := by ring

end P2qJumps.Curve3936HeightDuplication
