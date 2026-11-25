/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Basic
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

namespace P2qJumps.Curve3936Torsion

def E : WeierstrassCurve ℚ where
  a₁ := 0
  a₂ := -1
  a₃ := 0
  a₄ := 0
  a₆ := -12

theorem E_disc : E.Δ = -62976 := by
  simp [E, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
        WeierstrassCurve.b₆, WeierstrassCurve.b₈]
  norm_num

theorem resultant_identity (x : ℤ) :
    (3 * x - 164) * (x ^ 3 - x ^ 2 - 12) + (-x ^ 2 + 55 * x - 18) * (3 * x ^ 2 - 2 * x) = 1968 := by
  ring

/-- No rational roots of the cubic, so no 2-torsion. -/
theorem cubic_no_rat_root (x : ℚ) : x ^ 3 - x ^ 2 - 12 ≠ 0 := by
  sorry -- finite check on possible denominators; to be completed with the existing exclusion

/-- Multiplicative height growth under doubling. -/
theorem mulHeight_two_nsmul_ge {x y : ℚ} (hns : E.Nonsingular x y) :
    (max x.num.natAbs x.den) ^ 4 ≤ max ((x ^ 4 + 96 * x - 48) / (4 * y ^ 2)).num.natAbs
      ((x ^ 4 + 96 * x - 48) / (4 * y ^ 2)).den * (2 ^ 38 * 1968 ^ 2) := by
  sorry -- reduced-denominator analysis of the duplication formula

/-- The totient collapse and finite verification remain to be completed against the Point API. -/
theorem torsion_trivial : True := by
  trivial -- placeholder; the full argument is the composition of the above lemmas

end P2qJumps.Curve3936Torsion
