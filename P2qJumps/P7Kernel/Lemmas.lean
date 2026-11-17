/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.P7Defs

/-!
# P2qJumps.P7Kernel.Lemmas

Generic lemmas used to assemble the split kernel certificates of the `p = 7` descent checker `desc`
(`P2qJumps.P7Defs`): `desc_split` unfolds one branching step of `desc`, and `loopR_step`,
`loopR_stop`, `loopR_start` walk the scan `loopR`. They are proved, not evaluated.
-/

namespace P2qJumps

namespace P7Cert

/-- The conditions under which `desc` takes its branching step. -/
def splitCond (b h s : ℤ) (m : ℕ) : Bool :=
  decide (m ≠ 2) && decide (¬ m < 2) && decide (¬ 1 ≤ 6 * b - 7 * h) &&
    decide (¬ 1 ≤ 49 * s - 57 * b) && decide (¬ (6 * b - 7 * h = 0 ∨ 49 * s - 57 * b = 0)) &&
    decide (¬ 1 ≤ 342 * b * b - 343 * h * s)

/-- One branching step of `desc`. -/
theorem desc_split {fuel : ℕ} {b h s : ℤ} {last m : ℕ} (hc : splitCond b h s m = true) :
    desc (fuel + 1) b h s last m =
      loopR (fun r => desc fuel (b * (r : ℤ)) (h * ((r : ℤ) - 1)) (s * ((r : ℤ) + 1)) r (m - 1))
        (okR b h s m) 300 (max (last + 1) 11) := by
  simp only [splitCond, Bool.and_eq_true, decide_eq_true_eq] at hc
  obtain ⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩ := hc
  rw [desc, if_neg h1, if_neg h2, if_neg h3, if_neg h4, if_neg h5, if_neg h6]

/-- One step of the scan `loopR`. -/
theorem loopR_step {child ok : ℕ → Bool} {F r : ℕ} (hok : ok r = true)
    (hc : Nat.gcd r 210 = 1 → child r = true) (hn : loopR child ok F (r + 1) = true) :
    loopR child ok (F + 1) r = true := by
  rw [loopR, if_pos hok, Bool.and_eq_true]
  refine ⟨?_, hn⟩
  split
  · exact hc ‹_›
  · rfl

/-- The scan `loopR` stops (with `true`) where `ok` fails. -/
theorem loopR_stop {child ok : ℕ → Bool} {F r : ℕ} (hok : ok r = false) :
    loopR child ok (F + 1) r = true := by
  rw [loopR, if_neg (by rw [hok]; exact Bool.false_ne_true)]

/-- Normalize the starting point of the scan. -/
theorem loopR_start {child ok : ℕ → Bool} {F last r0 : ℕ} (h : max (last + 1) 11 = r0)
    (hn : loopR child ok F r0 = true) : loopR child ok F (max (last + 1) 11) = true := h ▸ hn

end P7Cert

end P2qJumps
