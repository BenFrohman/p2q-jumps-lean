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

/-- Skeleton for closed shape exclusions from the paper.
These are the results that have been proved elementarily and are candidates
for full kernel-checked formalization. -/

/-- Placeholder for the discriminant argument of Theorem 28.
The full proof from the paper will be transcribed here. -/
theorem theorem28_discriminant_skeleton :
    ∀ p q r s t : ℕ,
      p.Prime → q.Prime → r.Prime → s.Prime → t.Prime →
      p ≠ q → r ≠ s → r ≠ t → s ≠ t →
      Jumps (p ^ 2 * q) →
      p ^ 2 * q + 12 ≠ r * s * t := by
  intro p q r s t hp hq hr hs ht hpq hrs hrt hst hJ
  -- Full transcription of the paper's discriminant argument pending.
  sorry

end P2qJumps
