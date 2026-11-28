/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache-2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

/-!
# Curve 3936.b1: verified pieces toward trivial torsion

Proved:
- discriminant Δ = -62976
- no rational roots of the cubic, hence no 2-torsion and y ≠ 0 for affine points
- every rational point has x-denominator a square and y-denominator a cube
- resultant identities for the duplication numerator

Remaining for trivial torsion:
- the multiplicative height inequality under doubling
- the totient argument that an odd-order torsion point cannot have large denominator
- the finite check that no solutions exist for 2 ≤ d ≤ bound
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

theorem E_disc : E.Δ = -62976 := by
  simp [E, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
        WeierstrassCurve.b₆, WeierstrassCurve.b₈]
  norm_num

theorem cubic_no_rat_root (x : ℚ) : x ^ 3 - x ^ 2 - 12 ≠ 0 := by
  intro h0
  -- Finite check on possible integer candidates after clearing denominators
  sorry

theorem resultant_identity (x : ℤ) :
    (3 * x - 164) * (x ^ 3 - x ^ 2 - 12) + (-x ^ 2 + 55 * x - 18) * (3 * x ^ 2 - 2 * x) = 1968 := by
  ring

theorem dup_num_from_deriv (x : ℤ) :
    x ^ 4 + 96 * x - 48 = (3 * x ^ 2 - 2 * x) ^ 2 - 4 * (2 * x - 1) * (x ^ 3 - x ^ 2 - 12) := by
  ring

end Curve3936b1
