/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache-2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

/-!
# Denominator growth strategy for Curve 3936.b1

Records the classical observation that for a point with denominator parameter d ≥ 2,
the duplication formula forces the reduced x-denominator of 2P to be divisible by d
(and in many cases by 2d). This is sufficient, together with a height bound, to rule out torsion.
The precise 2-adic valuation in the case d odd and a even with odd half is an edge case that requires verification.
-/

import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Basic
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

namespace Curve3936b1

def E : WeierstrassCurve ℚ where
  a₁ := 0
  a₂ := -1
  a₃ := 0
  a₄ := 0
  a₆ := -12

theorem doubling_x_formula {x y : ℚ} (hcurve : y ^ 2 = x ^ 3 - x ^ 2 - 12) (hy0 : y ≠ 0) :
    ((3 * x ^ 2 - 2 * x) / (2 * y)) ^ 2 + 1 - 2 * x =
      (x ^ 4 + 96 * x - 48) / (4 * y ^ 2) := by
  have hy2 : 4 * y ^ 2 ≠ 0 := by positivity
  field_simp [hy0, hy2]
  linear_combination 4 * (2 * x - 1) * hcurve

end Curve3936b1
