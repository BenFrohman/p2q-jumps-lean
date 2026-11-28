/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-!
# Arithmetic core for y² = x³ - x² - 12

Self-contained proofs of the denominator form, the absence of rational
roots, and the resultant identities. These are the arithmetic ingredients
of the torsion argument. The steps that require the group law on
WeierstrassCurve.Affine.Point are not included.
-/

namespace Curve3936b1

theorem nat_cube_eq_sq_imp_pow {u v : ℕ} (hu : 1 ≤ u) (heq : u ^ 3 = v ^ 2) :
    ∃ d : ℕ, 1 ≤ d ∧ u = d ^ 2 ∧ v = d ^ 3 := by
  have hu_pos : (0 : ℚ) < u := Nat.cast_pos.mpr (by omega)
  let q : ℚ := (v : ℚ) / (u : ℚ)
  have hq2 : q ^ 2 = (u : ℚ) := by
    dsimp [q]
    field_simp [ne_of_gt hu_pos]
    exact_mod_cast heq.symm
  have hq_den : q.den = 1 := by
    have h1 : (q ^ 2).den = q.den ^ 2 := Rat.den_pow q 2
    rw [hq2, Rat.natCast_den] at h1
    exact Nat.eq_one_of_mul_eq_one_right (by simpa [sq] using h1.symm)
  have hq_nonneg : 0 ≤ q := by positivity
  obtain ⟨d, hd_eq⟩ : ∃ d : ℕ, q = (d : ℚ) := by
    refine ⟨q.num.toNat, ?_⟩
    have hnum_nonneg : 0 ≤ q.num := Rat.num_nonneg.mpr hq_nonneg
    calc q = (q.num : ℚ) / (q.den : ℚ) := (Rat.num_div_den q).symm
      _ = (q.num : ℚ) / 1 := by rw [hq_den]; norm_num
      _ = ((q.num.toNat : ℤ) : ℚ) := by rw [Int.toNat_of_nonneg hnum_nonneg]; ring
  have hu_eq : u = d ^ 2 := by
    have hq2' : ((d : ℚ) ^ 2) = (u : ℚ) := by rw [← hd_eq]; exact hq2
    exact_mod_cast hq2'.symm
  have hv_eq : v = d ^ 3 := by
    have hq3 : ((d : ℚ) ^ 3) = (v : ℚ) := by
      calc ((d : ℚ) ^ 3) = ((d : ℚ) ^ 2) * (d : ℚ) := by ring
        _ = (u : ℚ) * q := by rw [← hd_eq, hq2]
        _ = (v : ℚ) := by dsimp [q]; field_simp [ne_of_gt hu_pos]
    exact_mod_cast hq3.symm
  refine ⟨d, ?_, hu_eq, hv_eq⟩
  rcases Nat.eq_zero_or_pos d with rfl | hd_pos
  · omega
  · exact hd_pos

theorem cubic_no_int_root (a : ℤ) : a ^ 3 - a ^ 2 - 12 ≠ 0 := by
  intro h
  have hbound : -3 ≤ a ∧ a ≤ 3 := by
    constructor
    · by_contra hlt; have : a ≤ -4 := by omega; nlinarith
    · by_contra hgt; have : 4 ≤ a := by omega; nlinarith
  have hmem : a ∈ (List.range 7).map (fun n : ℕ => (n : ℤ) - 3) := by
    rw [List.mem_map]
    refine ⟨(a + 3).toNat, List.mem_range.mpr ?_, ?_⟩ <;> omega
  have hcheck :
      ((List.range 7).map (fun n : ℕ => (n : ℤ) - 3)).all
        (fun z => decide (z ^ 3 - z ^ 2 - 12 ≠ 0)) = true := by
    decide
  rw [List.all_eq_true] at hcheck
  exact of_decide_eq_true (hcheck a hmem) h

theorem resultant_identity (x : ℤ) :
    (3 * x - 164) * (x ^ 3 - x ^ 2 - 12) +
      (-x ^ 2 + 55 * x - 18) * (3 * x ^ 2 - 2 * x) = 1968 := by
  ring

theorem dup_num_from_deriv (x : ℤ) :
    x ^ 4 + 96 * x - 48 =
      (3 * x ^ 2 - 2 * x) ^ 2 - 4 * (2 * x - 1) * (x ^ 3 - x ^ 2 - 12) := by
  ring

end Curve3936b1
