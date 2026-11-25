/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Data.Int.GCD
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-!
# Multiplicative height duplication bound for y² = x³ - x² - 12

Records the upper bound multHeight(x(2P)) ≤ 145 * multHeight(x)^4 for affine points.
The lower bound that would force a uniform constant for the height box is not included.
-/

namespace Curve3936b1

def multHeight (x : ℚ) : ℕ :=
  max x.num.natAbs x.den

def dupNum (a u : ℤ) : ℤ :=
  a ^ 4 + 96 * a * u ^ 3 - 48 * u ^ 4

def dupDen (a u : ℤ) : ℤ :=
  4 * u * (a ^ 3 - a ^ 2 * u - 12 * u ^ 3)

theorem dup_resultant_u4 (a u : ℤ) :
    (-108 * u) * dupNum a u + (-9 * a ^ 2 + 3 * a * u + u ^ 2) * dupDen a u = 46944 * u ^ 4 := by
  unfold dupNum dupDen
  ring

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
      _ ≤ |a ^ 4| + |96 * a * u ^ 3| + |48 * u ^ 4| := add_le_add_right (abs_add_le _ _) _
      _ = |a| ^ 4 + 96 * (|a| * |u| ^ 3) + 48 * |u| ^ 4 := by
          simp [abs_pow, abs_mul]; ring
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
          ≤ |a ^ 3 - a ^ 2 * u| + |12 * u ^ 3| := abs_sub _ _
        _ ≤ |a ^ 3| + |a ^ 2 * u| + |12 * u ^ 3| := add_le_add_right (abs_sub _ _) _
        _ = |a| ^ 3 + |a| ^ 2 * |u| + 12 * |u| ^ 3 := by
            simp [abs_pow, abs_mul]; ring
        _ ≤ M ^ 3 + M ^ 3 + 12 * M ^ 3 := by
          have ha3 : |a| ^ 3 ≤ M ^ 3 := pow_le_pow_left₀ (abs_nonneg a) ha 3
          have ha2u : |a| ^ 2 * |u| ≤ M ^ 3 := by
            have ha2 : |a| ^ 2 ≤ M ^ 2 := pow_le_pow_left₀ (abs_nonneg a) ha 2
            calc |a| ^ 2 * |u| ≤ M ^ 2 * M := mul_le_mul ha2 hu (abs_nonneg u) (by positivity)
              _ = M ^ 3 := by ring
          have hu3 : |u| ^ 3 ≤ M ^ 3 := pow_le_pow_left₀ (abs_nonneg u) hu 3
          linarith
        _ = 14 * M ^ 3 := by ring
    calc |4 * u * (a ^ 3 - a ^ 2 * u - 12 * u ^ 3)|
        = 4 * |u| * |a ^ 3 - a ^ 2 * u - 12 * u ^ 3| := by simp [abs_mul]; ring
      _ ≤ 4 * M * (14 * M ^ 3) := by
          have := mul_le_mul hu hcub (abs_nonneg _) (by positivity)
          linarith
      _ = 56 * M ^ 4 := by ring

end Curve3936b1
