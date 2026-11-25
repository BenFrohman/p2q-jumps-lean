/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Data.Int.Sqrt
import Mathlib.Tactic.NormNum

/-!
# Multiplicative height box check

Proves by decide that for all 1 ≤ d ≤ 14 and all a with d² < a ≤ 204,
the integer a³ - a² d² - 12 d⁶ is never a square.

This is the finite check corresponding to the claimed height bound
max(|x.num|, x.den) ≤ 204. The argument that every torsion point
satisfies this bound is not included.
-/

namespace Curve3936b1

def heightBoxCheck : Bool :=
  (List.range 14).all fun i =>
    let d : ℤ := (i : ℤ) + 1
    let d2 : ℤ := d * d
    let d6 : ℤ := d2 * d2 * d2
    (List.range 205).all fun j =>
      let a : ℤ := (j : ℤ)
      if a ≤ d2 then
        true
      else
        let rhs : ℤ := a ^ 3 - a ^ 2 * d2 - 12 * d6
        let s : ℤ := Int.ofNat (Int.sqrt rhs)
        decide (s * s ≠ rhs)

theorem heightBoxCheck_true : heightBoxCheck = true := by
  decide

end Curve3936b1
