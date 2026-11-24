/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib

/-!
# P2qJumps.Curve3936

Finite facts about the curve `E : y^2 = x^3 - x^2 - 12` (LMFDB 3936.b1), checked by the Lean
kernel with `norm_num`, `interval_cases` and `decide +kernel` only (no `native_decide`, no
`bv_decide`, no `Lean.ofReduceBool`).

What is proved here:

* `E3936_disc`: Mathlib's discriminant of this Weierstrass model is `-62976 = -2^9 * 3 * 41`.
* `sq_dvd_disc`: if `y^2 ∣ 62976` then `y ∈ {1, 2, 4, 8, 16}`.
* `no_point_of_small_sq`, `no_point_sq_dvd_disc`: no integer point `(x, y)` with `y = 0` or
  `y^2 ∣ Δ`. This is the finite part of the Nagell–Lutz argument for trivial torsion.
* `point_4_6`, `point_4_6_not_sq_dvd`: `(4, 6)` lies on `E`, and `6^2 ∤ 62976`.
* `affineCount_5`, `affineCount_7`, `affineCount_13`: the curve has `4`, `9`, `18` affine points
  over `𝔽_5`, `𝔽_7`, `𝔽_13`, so `#E(𝔽_5) = 5`, `#E(𝔽_7) = 10`, `#E(𝔽_13) = 19`. The primes
  `5, 7, 13` do not divide `Δ`. Note `gcd(5, 10) = 5`, so `𝔽_5` and `𝔽_7` alone do not force
  trivial torsion; `gcd(5, 19) = 1` does, given injectivity of reduction on torsion.

What is NOT proved here: the Nagell–Lutz theorem itself and the injectivity of reduction modulo
`p` on torsion are not in Mathlib and are not formalized here, so trivial torsion of `E(ℚ)` is
not a Lean theorem. Neither is any rank statement: Mathlib has no Mordell–Weil theorem, so the
rank of `E(ℚ)` is not even defined in Lean, and the upper bound `rank ≤ 1` (a 2-descent) is not
attempted. None of this file is used by any theorem about the jumps.
-/

namespace P2qJumps.Curve3936

/-- The Weierstrass model `y^2 = x^3 - x^2 - 12` over `ℚ`. -/
def E3936 : WeierstrassCurve ℚ := { a₁ := 0, a₂ := -1, a₃ := 0, a₄ := 0, a₆ := -12 }

/-- Mathlib's discriminant of the model is `-62976`. -/
theorem E3936_disc : E3936.Δ = -62976 := by
  norm_num [E3936, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]

/-- `62976 = 2^9 * 3 * 41`. -/
theorem disc_factor : (62976 : ℕ) = 2 ^ 9 * 3 * 41 := by norm_num

/-- Kernel check over `y < 251`. -/
theorem sq_dvd_disc_lt : ∀ y < 251, y ^ 2 ∣ 62976 →
    y = 0 ∨ y = 1 ∨ y = 2 ∨ y = 4 ∨ y = 8 ∨ y = 16 := by
  decide +kernel

/-- If `y^2 ∣ 62976` then `y ∈ {1, 2, 4, 8, 16}` (the disjunct `y = 0` is vacuous). -/
theorem sq_dvd_disc (y : ℕ) (h : y ^ 2 ∣ 62976) :
    y = 0 ∨ y = 1 ∨ y = 2 ∨ y = 4 ∨ y = 8 ∨ y = 16 := by
  have hle : y ^ 2 ≤ 62976 := Nat.le_of_dvd (by norm_num) h
  have hy : y < 251 := by
    by_contra hc
    push_neg at hc
    nlinarith
  exact sq_dvd_disc_lt y hy h

/-- No integer `x` satisfies `k^2 = x^3 - x^2 - 12` for `k ∈ {0, 1, 2, 4, 8, 16}`. -/
theorem no_point_of_small_sq (x : ℤ) (k : ℕ)
    (hk : k = 0 ∨ k = 1 ∨ k = 2 ∨ k = 4 ∨ k = 8 ∨ k = 16) :
    (k : ℤ) ^ 2 ≠ x ^ 3 - x ^ 2 - 12 := by
  intro h
  have hc : 0 ≤ (k : ℤ) ^ 2 ∧ (k : ℤ) ^ 2 ≤ 256 := by
    rcases hk with rfl | rfl | rfl | rfl | rfl | rfl <;> norm_num
  obtain ⟨hc0, hc1⟩ := hc
  have hlo : 2 ≤ x := by
    by_contra hx
    push_neg at hx
    nlinarith [mul_nonneg (sq_nonneg x) (show (0 : ℤ) ≤ 1 - x by linarith)]
  have hhi : x ≤ 7 := by
    by_contra hx
    push_neg at hx
    nlinarith [mul_nonneg (sq_nonneg x) (show (0 : ℤ) ≤ x - 8 by linarith),
      mul_nonneg (show (0 : ℤ) ≤ x - 8 by linarith) (show (0 : ℤ) ≤ x + 8 by linarith)]
  interval_cases x <;> rcases hk with rfl | rfl | rfl | rfl | rfl | rfl <;> norm_num at h

/-- **Finite Nagell–Lutz step.** No integer point `(x, y)` on `E` has `y^2 ∣ Δ` (this includes
`y = 0`, since then `|y|^2 = 0` does not divide `62976`; `y = 0` is excluded separately by
`no_point_of_small_sq` with `k = 0`). -/
theorem no_point_sq_dvd_disc (x y : ℤ) (hy : y.natAbs ^ 2 ∣ 62976) :
    y ^ 2 ≠ x ^ 3 - x ^ 2 - 12 := by
  rw [← Int.natAbs_sq y]
  exact no_point_of_small_sq x y.natAbs (sq_dvd_disc y.natAbs hy)

/-- No integer point with `y = 0` (no integer root of `x^3 - x^2 - 12`). -/
theorem no_point_y_zero (x : ℤ) : (0 : ℤ) ≠ x ^ 3 - x ^ 2 - 12 := by
  have := no_point_of_small_sq x 0 (Or.inl rfl)
  simpa using this

/-- `(4, 6)` lies on `E`. -/
theorem point_4_6 : (6 : ℤ) ^ 2 = 4 ^ 3 - 4 ^ 2 - 12 := by norm_num

/-- `6^2 ∤ 62976`, so `(4, 6)` fails the Nagell–Lutz condition. -/
theorem point_4_6_not_sq_dvd : ¬ (6 ^ 2 ∣ (62976 : ℕ)) := by decide

/-- Affine points of `y^2 = x^3 - x^2 - 12` over `𝔽_p`: pairs `0 ≤ x, y < p` with
`y^2 + x^2 + 12 ≡ x^3 (mod p)`. Then `#E(𝔽_p) = affineCount p + 1`. -/
def affineCount (p : ℕ) : ℕ :=
  ((Finset.range p ×ˢ Finset.range p).filter
    (fun xy : ℕ × ℕ => (xy.2 ^ 2 + xy.1 ^ 2 + 12) % p = xy.1 ^ 3 % p)).card

theorem affineCount_5 : affineCount 5 = 4 := by decide +kernel

theorem affineCount_7 : affineCount 7 = 9 := by decide +kernel

theorem affineCount_13 : affineCount 13 = 18 := by decide +kernel

/-- `5`, `7` and `13` do not divide the discriminant (good reduction for this model). -/
theorem good_primes : ¬ 5 ∣ (62976 : ℕ) ∧ ¬ 7 ∣ (62976 : ℕ) ∧ ¬ 13 ∣ (62976 : ℕ) := by
  decide

/-- `gcd(#E(𝔽_5), #E(𝔽_7)) = 5` but `gcd(#E(𝔽_5), #E(𝔽_13)) = 1`. -/
theorem count_gcds : Nat.gcd (affineCount 5 + 1) (affineCount 7 + 1) = 5 ∧
    Nat.gcd (affineCount 5 + 1) (affineCount 13 + 1) = 1 := by
  rw [affineCount_5, affineCount_7, affineCount_13]
  decide

end P2qJumps.Curve3936
