/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/
import Mathlib.Tactic
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.NumberTheory.ArithmeticFunction
import P2qJumps.Statement
import P2qJumps.LeadingForm

namespace P2qJumps

open Nat ArithmeticFunction

/-- Key ratio bound from the complementary discriminant in the rst case.
Uses the already-proved `g_ge_six`. -/
theorem discriminant_ratio_bound (t : ℝ) :
    0 < t → g t / 6 ≥ 1 := by
  intro ht
  have h := g_ge_six t
  exact div_le_div_of_nonneg_right h (by norm_num)

/-- Skeleton of the discriminant argument for Theorem 28.
The complementary polynomial's leading form is controlled by `g`.
Full case analysis on the three primes and the sign of the discriminant
is transcribed from the paper below. -/
theorem theorem28_discriminant :
    ∀ p q r s t : ℕ,
      p.Prime → q.Prime → r.Prime → s.Prime → t.Prime →
      p ≠ q → r ≠ s → r ≠ t → s ≠ t →
      Jumps (p ^ 2 * q) →
      p ^ 2 * q + 12 ≠ r * s * t := by
  intro p q r s t hp hq hr hs ht hpq hrs hrt hst hJ
  -- Step 1: reduce to the complementary quadratic having negative discriminant
  -- using the ratio bound from `g`.
  -- Step 2: case analysis on the ordering of r, s, t and the offset families.
  -- Full transcription of the paper's calculations pending detailed extraction.
  sorry

end P2qJumps
