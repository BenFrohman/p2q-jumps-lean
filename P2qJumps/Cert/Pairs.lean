/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/
import P2qJumps.Cert.Core

/-!
# Kernel certificate: no `n = p^2 q ≤ 10000` satisfies both jumps

One chunk per prime `p ≤ 100`; each chunk checks every prime `q ≤ 10000 / p^2`, `q ≠ p`, by
computing `σ₁(p^2 q + 12)` exactly (`sigFast`, proved equal to `σ 1`) and comparing it with
`σ₁(p^2 q) + 12`. Checked by kernel reduction (`decide +kernel`); no `native_decide`.
-/

namespace P2qJumps.Cert

theorem cert_pair_2 : pairFastChunk 2 0 (10000 / (2 * 2) + 1) = true := by decide +kernel
theorem cert_pair_3 : pairFastChunk 3 0 (10000 / (3 * 3) + 1) = true := by decide +kernel
theorem cert_pair_5 : pairFastChunk 5 0 (10000 / (5 * 5) + 1) = true := by decide +kernel
theorem cert_pair_7 : pairFastChunk 7 0 (10000 / (7 * 7) + 1) = true := by decide +kernel
theorem cert_pair_11 : pairFastChunk 11 0 (10000 / (11 * 11) + 1) = true := by decide +kernel
theorem cert_pair_13 : pairFastChunk 13 0 (10000 / (13 * 13) + 1) = true := by decide +kernel
theorem cert_pair_17 : pairFastChunk 17 0 (10000 / (17 * 17) + 1) = true := by decide +kernel
theorem cert_pair_19 : pairFastChunk 19 0 (10000 / (19 * 19) + 1) = true := by decide +kernel
theorem cert_pair_23 : pairFastChunk 23 0 (10000 / (23 * 23) + 1) = true := by decide +kernel
theorem cert_pair_29 : pairFastChunk 29 0 (10000 / (29 * 29) + 1) = true := by decide +kernel
theorem cert_pair_31 : pairFastChunk 31 0 (10000 / (31 * 31) + 1) = true := by decide +kernel
theorem cert_pair_37 : pairFastChunk 37 0 (10000 / (37 * 37) + 1) = true := by decide +kernel
theorem cert_pair_41 : pairFastChunk 41 0 (10000 / (41 * 41) + 1) = true := by decide +kernel
theorem cert_pair_43 : pairFastChunk 43 0 (10000 / (43 * 43) + 1) = true := by decide +kernel
theorem cert_pair_47 : pairFastChunk 47 0 (10000 / (47 * 47) + 1) = true := by decide +kernel
theorem cert_pair_53 : pairFastChunk 53 0 (10000 / (53 * 53) + 1) = true := by decide +kernel
theorem cert_pair_59 : pairFastChunk 59 0 (10000 / (59 * 59) + 1) = true := by decide +kernel
theorem cert_pair_61 : pairFastChunk 61 0 (10000 / (61 * 61) + 1) = true := by decide +kernel
theorem cert_pair_67 : pairFastChunk 67 0 (10000 / (67 * 67) + 1) = true := by decide +kernel
theorem cert_pair_71 : pairFastChunk 71 0 (10000 / (71 * 71) + 1) = true := by decide +kernel
theorem cert_pair_73 : pairFastChunk 73 0 (10000 / (73 * 73) + 1) = true := by decide +kernel
theorem cert_pair_79 : pairFastChunk 79 0 (10000 / (79 * 79) + 1) = true := by decide +kernel
theorem cert_pair_83 : pairFastChunk 83 0 (10000 / (83 * 83) + 1) = true := by decide +kernel
theorem cert_pair_89 : pairFastChunk 89 0 (10000 / (89 * 89) + 1) = true := by decide +kernel
theorem cert_pair_97 : pairFastChunk 97 0 (10000 / (97 * 97) + 1) = true := by decide +kernel

/-- **Exhaustive search, kernel-checked.** No `n = p^2 q ≤ 10000` (distinct primes) satisfies
both length-12 jumps. -/
theorem no_jumps_p2q_le_10000 {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hn : p ^ 2 * q ≤ 10000) : ¬ P2qJumps.Jumps (p ^ 2 * q) := by
  have hq1 := hq.one_le
  have hpp : p * p ≤ 10000 := by
    have : p * p ≤ p ^ 2 * q := by rw [← pow_two]; exact Nat.le_mul_of_pos_right _ hq1
    omega
  have hp100 : p ≤ 100 := by nlinarith
  have hqb : q < 10000 / (p * p) + 1 := by
    have hpos : 0 < p * p := Nat.mul_pos hp.pos hp.pos
    have : q * (p * p) ≤ 10000 := by rw [← pow_two, mul_comm]; exact hn
    have := (Nat.le_div_iff_mul_le hpos).2 this
    omega
  interval_cases p
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_2) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact (pairFastChunk_sound cert_pair_3) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_5) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_7) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_11) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_13) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_17) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_19) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_23) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_29) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_31) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_37) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_41) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_43) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_47) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_53) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_59) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_61) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_67) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_71) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_73) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_79) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_83) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_89) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact (pairFastChunk_sound cert_pair_97) hp q hq (Ne.symm hpq) (Nat.zero_le _) (by omega)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)
  · exact absurd hp (by norm_num)

end P2qJumps.Cert
