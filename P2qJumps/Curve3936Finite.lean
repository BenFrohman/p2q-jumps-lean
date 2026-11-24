/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib
import P2qJumps.Curve3936

/-!
# P2qJumps.Curve3936Finite

Finite and algebraic facts for `E : y^2 = f(x)`, `f(x) = x^3 - x^2 - 12` (LMFDB 3936.b1), used
by the Nagell–Lutz step. Everything is checked by the Lean kernel (`ring`, `norm_num`,
`decide +kernel`); no `native_decide`, no `bv_decide`.

* `bezout_identity`: `(3x - 164) f(x) + (-x^2 + 55x - 18) f'(x) = 1968`. The cofactors proposed
  in an earlier sketch, `(-27x^2 + 36x - 4) f + (9x^3 - 15x^2 + 2x - 108) f' = 3936`, are wrong:
  `sketch_identity_false` shows the left side is `48` at `x = 0`.
* `dvd_1968_of_dvd_deriv`: if `y^2 = f(x)` and `y ∣ f'(x)` then `y ∣ 1968`.
* `validYList`: the integers `y` with `|y| ≤ 3936` and `y = 0 ∨ y^2 ∣ 3936^2`; the `y = 0` case is
  tested explicitly, because `3936^2 % 0 = 3936^2` in Lean. `validYList_eq` lists it (49 values).
* `point_4_6_in_validYList`, `noIntegralPointsWithDivisorY_false`: the claim "no integer point
  has `y = 0` or `y ∣ 3936`" is FALSE, since `(4, ±6)` lies on `E` and `6 ∣ 3936`. The correct
  finite Nagell–Lutz condition is `y = 0 ∨ y^2 ∣ D` with `D = 3936` (or `y^2 ∣ Δ = 62976`).
* `no_point_y_zero_or_sq_dvd`: no integer point has `y = 0` or `y^2 ∣ 3936`.
* `deltaYSet`, `sq_dvd_delta_iff`: `y = 0 ∨ y^2 ∣ 62976 ↔ y ∈ {0, ±1, ±2, ±4, ±8, ±16}`.
* `no_point_delta_table` (`decide +kernel`), `no_point_y_zero_or_sq_dvd_delta`: no integer point
  has `y = 0` or `y^2 ∣ 62976` (the full Nagell–Lutz set for `Δ = -62976`).

Not proved here: that a torsion point of `E(ℚ)` is integral and satisfies `y = 0 ∨ y^2 ∣ D`.
-/

namespace P2qJumps.Curve3936

/-- Bezout identity for `f = x^3 - x^2 - 12` and `f' = 3x^2 - 2x`. -/
theorem bezout_identity (x : ℤ) :
    (3 * x - 164) * (x ^ 3 - x ^ 2 - 12) + (-x ^ 2 + 55 * x - 18) * (3 * x ^ 2 - 2 * x)
      = 1968 := by
  ring

/-- The identity proposed in the forwarded sketch does not hold (it gives `48` at `x = 0`). -/
theorem sketch_identity_false :
    ¬ ∀ x : ℤ, (-27 * x ^ 2 + 36 * x - 4) * (x ^ 3 - x ^ 2 - 12) +
      (9 * x ^ 3 - 15 * x ^ 2 + 2 * x - 108) * (3 * x ^ 2 - 2 * x) = 3936 := by
  intro h
  have h0 := h 0
  norm_num at h0

/-- If `y^2 = f(x)` and `y ∣ f'(x)` then `y ∣ 1968`. -/
theorem dvd_1968_of_dvd_deriv (x y : ℤ) (hc : y ^ 2 = x ^ 3 - x ^ 2 - 12)
    (hd : y ∣ 3 * x ^ 2 - 2 * x) : y ∣ 1968 := by
  rw [← bezout_identity x, ← hc]
  exact dvd_add (Dvd.dvd.mul_left (dvd_pow_self y two_ne_zero) _) (Dvd.dvd.mul_left hd _)

/-- Integers `y` with `|y| ≤ 3936` and `y = 0 ∨ y^2 ∣ 3936^2` (the `y = 0` test is explicit). -/
def validYList : List ℤ :=
  (List.range 7873).filterMap fun n =>
    let y : ℤ := (n : ℤ) - 3936
    if y == 0 || (3936 ^ 2) % (y ^ 2) == 0 then some y else none

theorem validYList_eq :
    validYList = [-3936, -1968, -1312, -984, -656, -492, -328, -246, -164, -123,
      -96, -82, -48, -41, -32, -24, -16, -12, -8, -6, -4, -3, -2, -1,
      0, 1, 2, 3, 4, 6, 8, 12, 16, 24, 32, 41, 48, 82, 96, 123, 164,
      246, 328, 492, 656, 984, 1312, 1968, 3936] := by
  decide +kernel

/-- Search over `y ∈ validYList` and `-252 ≤ x ≤ 252` for integer points. -/
def noIntegralPointsWithDivisorY : Bool :=
  validYList.all fun y =>
    (List.range 505).all fun n =>
      let x : ℤ := (n : ℤ) - 252
      decide (y ^ 2 ≠ x ^ 3 - x ^ 2 - 12)

/-- `(4, 6)` is an integer point with `6 ∈ validYList`, i.e. `6 ∣ 3936`. -/
theorem point_4_6_in_validYList :
    (6 : ℤ) ∈ validYList ∧ (6 : ℤ) ^ 2 = 4 ^ 3 - 4 ^ 2 - 12 ∧ (6 : ℤ) ∣ 3936 := by
  rw [validYList_eq]
  decide

/-- The search returns `false`: "no integer point with `y = 0` or `y ∣ 3936`" is false. -/
theorem noIntegralPointsWithDivisorY_false : noIntegralPointsWithDivisorY = false := by
  decide +kernel

/-- **Finite Nagell–Lutz step (correct form).** No integer point of `E` has `y = 0` or
`y^2 ∣ 3936`. -/
theorem no_point_y_zero_or_sq_dvd (x y : ℤ) (h : y ^ 2 = x ^ 3 - x ^ 2 - 12) :
    y ≠ 0 ∧ ¬ y ^ 2 ∣ 3936 := by
  refine ⟨?_, ?_⟩
  · rintro rfl
    have h0 : (0 : ℤ) = x ^ 3 - x ^ 2 - 12 := by rw [← h]; ring
    exact no_point_y_zero x h0
  · intro hd
    have h2 : y.natAbs ^ 2 ∣ 62976 := by
      have h3 : ((y.natAbs : ℤ)) ^ 2 ∣ 62976 := by
        rw [Int.natAbs_sq]
        exact dvd_trans hd ⟨16, by norm_num⟩
      exact_mod_cast h3
    exact no_point_sq_dvd_disc x y h2 h

/-- The full Nagell–Lutz candidate set for `Δ = -62976 = -2^9 * 3 * 41`:
`y = 0` or `y^2 ∣ 62976`, i.e. `y ∈ {0, ±1, ±2, ±4, ±8, ±16}`. -/
def deltaYSet : Finset ℤ := {0, 1, -1, 2, -2, 4, -4, 8, -8, 16, -16}

/-- `y = 0 ∨ y^2 ∣ 62976` iff `y ∈ deltaYSet`. The hard direction goes through `y.natAbs` and the
kernel-decided `sq_dvd_disc` (a search over `y < 251` in `ℕ`). -/
theorem sq_dvd_delta_iff (y : ℤ) : (y = 0 ∨ y ^ 2 ∣ 62976) ↔ y ∈ deltaYSet := by
  constructor
  · rintro (rfl | h)
    · simp [deltaYSet]
    · have hn : y.natAbs ^ 2 ∣ 62976 := by
        have h3 : ((y.natAbs : ℤ)) ^ 2 ∣ 62976 := by
          rw [Int.natAbs_sq]
          exact h
        exact_mod_cast h3
      have hk := sq_dvd_disc y.natAbs hn
      have hv : y = 0 ∨ y = 1 ∨ y = -1 ∨ y = 2 ∨ y = -2 ∨ y = 4 ∨ y = -4 ∨ y = 8 ∨ y = -8 ∨
          y = 16 ∨ y = -16 := by
        omega
      rcases hv with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
        simp [deltaYSet]
  · intro h
    simp only [deltaYSet, Finset.mem_insert, Finset.mem_singleton] at h
    rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> norm_num

/-- Kernel table: no `y ∈ deltaYSet` and `0 ≤ x < 8` give a point of `E`. -/
theorem no_point_delta_table :
    ∀ y ∈ deltaYSet, ∀ n < 8, y ^ 2 ≠ (n : ℤ) ^ 3 - (n : ℤ) ^ 2 - 12 := by
  decide +kernel

/-- No integer point of `E` has `y = 0` or `y^2 ∣ 62976` (the full Nagell–Lutz set for `Δ`). -/
theorem no_point_y_zero_or_sq_dvd_delta (x y : ℤ) (h : y ^ 2 = x ^ 3 - x ^ 2 - 12) :
    ¬ (y = 0 ∨ y ^ 2 ∣ 62976) := by
  intro hy
  have hmem : y ∈ deltaYSet := (sq_dvd_delta_iff y).1 hy
  have hy2 : y ^ 2 ≤ 256 := by
    simp only [deltaYSet, Finset.mem_insert, Finset.mem_singleton] at hmem
    rcases hmem with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> norm_num
  have hlo : 2 ≤ x := by
    by_contra hx
    push_neg at hx
    nlinarith [sq_nonneg y, mul_nonneg (sq_nonneg x) (show (0 : ℤ) ≤ 1 - x by linarith)]
  have hhi : x ≤ 7 := by
    by_contra hx
    push_neg at hx
    nlinarith [mul_nonneg (sq_nonneg x) (show (0 : ℤ) ≤ x - 8 by linarith),
      mul_nonneg (show (0 : ℤ) ≤ x - 8 by linarith) (show (0 : ℤ) ≤ x + 8 by linarith)]
  obtain ⟨n, rfl⟩ := Int.eq_ofNat_of_zero_le (show (0 : ℤ) ≤ x by omega)
  have hn : n < 8 := by omega
  exact no_point_delta_table y hmem n hn h

end P2qJumps.Curve3936
