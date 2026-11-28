/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache-2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Tactic.NormNum

namespace SexticJacobian

open Polynomial

def jacPoincare : Polynomial ℕ :=
  (1 + X + X ^ 2 + X ^ 3 + X ^ 4) ^ 6

def hPrim (p : ℕ) : ℕ :=
  jacPoincare.coeff (24 - 6 * p)

def hTotal (p : ℕ) : ℕ :=
  hPrim p + if p = 2 then 1 else 0

theorem sextic_fourfold_hodge_numbers :
    hTotal 4 = 1 ∧
    hTotal 3 = 426 ∧
    hPrim 2 = 1751 ∧
    hTotal 2 = 1752 := by
  unfold hTotal hPrim jacPoincare
  refine ⟨?_, ?_, ?_, ?_⟩ <;> decide

end SexticJacobian
