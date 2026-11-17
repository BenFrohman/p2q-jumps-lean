/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Omega4

/-!
# P2qJumps.P7

The equations of the squarefree `p = 7` residual (paper Appendix `app:p7`),
the exclusion of the prime `5` (and of every prime `≤ 7`) when `ω(N) ≥ 4`,
and the prefix bound used to prune the descent. The finite descent itself is
not formalized here.
-/

namespace P2qJumps

open Nat ArithmeticFunction
open scoped ArithmeticFunction.sigma

/-- The `p = 7` equations, in `ℤ`. -/
theorem p7_identities {q : ℕ} (hq : q.Prime) (hq7 : q ≠ 7) (hJ : Jumps (7 ^ 2 * q)) :
    (φ (7 ^ 2 * q + 12) : ℤ) = 42 * q - 30 ∧
    (σ 1 (7 ^ 2 * q + 12) : ℤ) = 57 * q + 69 ∧
    7 * (φ (7 ^ 2 * q + 12) : ℤ) = 6 * ((7 ^ 2 * q + 12 : ℕ) : ℤ) - 282 ∧
    49 * (σ 1 (7 ^ 2 * q + 12) : ℤ) = 57 * ((7 ^ 2 * q + 12 : ℕ) : ℤ) + 2697 ∧
    42 * (σ 1 (7 ^ 2 * q + 12) : ℤ) - 57 * (φ (7 ^ 2 * q + 12) : ℤ) = 4608 ∧
    343 * (φ (7 ^ 2 * q + 12) : ℤ) * (σ 1 (7 ^ 2 * q + 12) : ℤ)
      = 342 * ((7 ^ 2 * q + 12 : ℕ) : ℤ) ^ 2 + 108 * ((7 ^ 2 * q + 12 : ℕ) : ℤ) - 760554 := by
  obtain ⟨j1, j2⟩ := jumps_p2q_int (by norm_num : (7 : ℕ).Prime) hq (Ne.symm hq7) hJ
  push_cast at j1 j2 ⊢
  refine ⟨by rw [j1]; ring, by rw [j2]; ring, by rw [j1]; ring, by rw [j2]; ring,
    by rw [j1, j2]; ring, by rw [j1, j2]; ring⟩

/-- For `p = 7`: `N ≡ 5` and `φ(N) ≡ 5 (mod 7)`; in particular `7 ∤ φ(N)`. -/
theorem p7_mod {q : ℕ} (hq : q.Prime) (hq7 : q ≠ 7) (hJ : Jumps (7 ^ 2 * q)) :
    (7 ^ 2 * q + 12) % 7 = 5 ∧ φ (7 ^ 2 * q + 12) % 7 = 5 ∧ ¬ 7 ∣ φ (7 ^ 2 * q + 12) := by
  obtain ⟨h1, -⟩ := p7_identities hq hq7 hJ
  have hq5 : 5 ≤ q := (preamble (by norm_num : (7 : ℕ).Prime) hq (Ne.symm hq7) hJ).2.1
  have hφ : φ (7 ^ 2 * q + 12) = 42 * q - 30 := by omega
  refine ⟨by omega, by omega, by omega⟩

/-- For `p = 7` and four distinct prime factors of `N`, every prime factor of `N`
is at least `11`; in particular `5 ∤ N`. -/
theorem p7_omega4_ge11 {q a b c d : ℕ} (hq : q.Prime) (hq7 : q ≠ 7) (hJ : Jumps (7 ^ 2 * q))
    (ha : a.Prime) (hb : b.Prime) (hc : c.Prime) (hd : d.Prime)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d) (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (haN : a ∣ 7 ^ 2 * q + 12) (hbN : b ∣ 7 ^ 2 * q + 12) (hcN : c ∣ 7 ^ 2 * q + 12)
    (hdN : d ∣ 7 ^ 2 * q + 12) :
    (∀ r : ℕ, r.Prime → r ∣ 7 ^ 2 * q + 12 → 11 ≤ r) ∧ ¬ 5 ∣ 7 ^ 2 * q + 12 := by
  have h := (omega4_constraints (by norm_num : (7 : ℕ).Prime) hq (Ne.symm hq7) hJ
    ha hb hc hd hab hac had hbc hbd hcd haN hbN hcN hdN).2
  have key : ∀ r : ℕ, r.Prime → r ∣ 7 ^ 2 * q + 12 → 11 ≤ r := by
    intro r hr hrN
    have h7 := h r hr hrN
    by_contra hlt; push_neg at hlt
    interval_cases r <;> norm_num at hr
  exact ⟨key, fun h5 => by have := key 5 (by norm_num) h5; omega⟩

/-- Prefix bound (prune of the `p = 7` descent). Write `N = b M`, `φ(N) = h F₋`,
`σ(N) = s F₊` with `F₋ F₊ ≤ M ^ 2`. If `343 φ σ = 342 N² + 108 N − 760554` and
`342 b² − 343 h s ≥ 1`, then `M ≤ 872`. -/
theorem p7_prefix_bound (b h s M Fm Fp : ℤ) (hb : 0 ≤ b) (hh : 0 ≤ h) (hs : 0 ≤ s)
    (hM : 0 ≤ M) (hF : Fm * Fp ≤ M ^ 2)
    (hid : 343 * (h * Fm) * (s * Fp) = 342 * (b * M) ^ 2 + 108 * (b * M) - 760554)
    (hd : 1 ≤ 342 * b ^ 2 - 343 * h * s) : M ≤ 872 := by
  have hhs : 0 ≤ h * s := mul_nonneg hh hs
  have h1 : 343 * (h * s) * (Fm * Fp) ≤ 343 * (h * s) * M ^ 2 :=
    mul_le_mul_of_nonneg_left hF (by positivity)
  have h2 : M ^ 2 ≤ 760554 := by
    have hbM : 0 ≤ b * M := mul_nonneg hb hM
    nlinarith [sq_nonneg M]
  nlinarith [sq_nonneg (M - 873)]

/-- The prune applies whenever at least three prime factors `≥ 11` remain:
their product is at least `11 · 13 · 17 = 2431 > 872`. -/
theorem p7_prune_threshold : (872 : ℕ) < 11 * 13 * 17 := by norm_num

end P2qJumps
