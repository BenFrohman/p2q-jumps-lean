/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Tactic
import P2qJumps.Arith

/-!
# The shape `N = r^3 s`: reduction to the strip `p < r`, `r^2 ∣ L(p)`

Paper, Theorem 2(b) and Theorems "No cube-times-prime with `p > r`" and "Cube-times-prime strip":
if both jumps hold and `N = r^3 s`, then `r + s - 1 = p m`, `p + q - 1 = r^2 m`, hence
`L(p) = p^3 - p^2 - 12 = r^2 (r (r - 1) - p m (r - p))`, so `r^2 ∣ L(p)`.

The case `p > r` is excluded here with the `σ`-identity, which (after the substitution) reads
`m (p (r + 1) - r^2) = p - r^2 - r`; for `p > r` the left side is at least `p (r + 1) - r^2`,
which exceeds the right side by `p r + r > 0`.
-/

namespace P2qJumps

open Nat ArithmeticFunction
open scoped ArithmeticFunction.sigma

/-- `L(p) = p^3 - p^2 - 12`. -/
def Lpoly (p : ℤ) : ℤ := p ^ 3 - p ^ 2 - 12

/-- **Shape `r^3 s`.** If both jumps hold at `n = p^2 q` (distinct primes) and
`n + 12 = r^3 s` with distinct primes `r, s ≥ 5`, then `p < r` and `r^2 ∣ L(p)`. -/
theorem r3s_reduction {p q r s : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime) (hs : s.Prime)
    (hpq : p ≠ q) (hrs : r ≠ s) (hr5 : 5 ≤ r) (hs5 : 5 ≤ s) (hJ : Jumps (p ^ 2 * q))
    (hN : p ^ 2 * q + 12 = r ^ 3 * s) :
    p < r ∧ ((r : ℤ) ^ 2 ∣ Lpoly p) := by
  have hndvd : ∀ d, (d = 2 ∨ d = 3) → ¬ d ∣ r ^ 3 * s := by
    intro d hd hdvd
    have hdp : d.Prime := by rcases hd with rfl | rfl <;> norm_num
    rcases (Nat.Prime.dvd_mul hdp).1 hdvd with h | h
    · exact prime_ge_five_not_dvd hr hr5 d hd (hdp.dvd_of_dvd_pow h)
    · exact prime_ge_five_not_dvd hs hs5 d hd h
  obtain ⟨hp5, hpN⟩ := p_ge_five_of_dvd hp hN (hndvd 2 (Or.inl rfl)) (hndvd 3 (Or.inr rfl))
  have hpr : p ≠ r := by
    rintro rfl
    exact hpN ⟨p ^ 2 * s, by ring⟩
  obtain ⟨j1, j2⟩ := jumps_p2q_int hp hq hpq hJ
  obtain ⟨f1, f2⟩ := totient_sigma_r3s hr hs hrs
  rw [hN] at j1 j2
  have E0 : (r : ℤ) ^ 3 * s = (p : ℤ) ^ 2 * q + 12 := by
    have := congrArg (fun x : ℕ => (x : ℤ)) hN; push_cast at this; linarith
  have E1 : (r : ℤ) ^ 2 * (r - 1) * (s - 1) = (p : ℤ) * (p - 1) * (q - 1) + 12 := by
    rw [← f1, j1]
  have E2 : ((r : ℤ) ^ 3 + r ^ 2 + r + 1) * (s + 1) = ((p : ℤ) ^ 2 + p + 1) * (q + 1) + 12 := by
    rw [← f2, j2]
  -- `A(N) = A(n)`: `r^2 (r + s - 1) = p (p + q - 1)`.
  have hA : (r : ℤ) ^ 2 * (r + s - 1) = p * (p + q - 1) := by linear_combination E0 - E1
  -- `p ∣ r + s - 1`.
  have hcop : IsCoprime (p : ℤ) ((r : ℤ) ^ 2) := by
    have : Nat.Coprime p (r ^ 2) :=
      Nat.Coprime.pow_right 2 ((Nat.coprime_primes hp hr).2 hpr)
    exact Nat.isCoprime_iff_coprime.2 this |> fun h => by exact_mod_cast h
  have hdiv : (p : ℤ) ∣ (r : ℤ) + s - 1 := by
    have : (p : ℤ) ∣ (r : ℤ) ^ 2 * (r + s - 1) := ⟨p + q - 1, by rw [hA]⟩
    exact hcop.dvd_of_dvd_mul_left this
  obtain ⟨m, hm⟩ := hdiv
  have hp0 : (0 : ℤ) < p := by exact_mod_cast hp.pos
  have hs' : (s : ℤ) = p * m - r + 1 := by linarith
  have hq' : (q : ℤ) = r ^ 2 * m - p + 1 := by
    have h1 : (p : ℤ) * (r ^ 2 * m) = p * (p + q - 1) := by rw [← hA, hm]; ring
    have h2 : (r : ℤ) ^ 2 * m = p + q - 1 := mul_left_cancel₀ hp0.ne' h1
    linarith
  have hm1 : (1 : ℤ) ≤ m := by
    have hsr : (0 : ℤ) < (r : ℤ) + s - 1 := by
      have : (5 : ℤ) ≤ r := by exact_mod_cast hr5
      have : (5 : ℤ) ≤ s := by exact_mod_cast hs5
      linarith
    rw [hm] at hsr
    have : (0 : ℤ) < m := pos_of_mul_pos_right hsr hp0.le
    linarith
  -- The `σ`-identity after substitution.
  have hσ : m * ((p : ℤ) * (r + 1) - r ^ 2) = p - r ^ 2 - r := by
    linear_combination E2 - E0 - ((r : ℤ) ^ 2 + r + 1) * hs' + ((p : ℤ) + 1) * hq'
  -- `L(p) = r^2 (r (r - 1) - p m (r - p))`.
  have hL : Lpoly p = (r : ℤ) ^ 2 * (r * (r - 1) - p * m * (r - p)) := by
    unfold Lpoly
    linear_combination E0 - (r : ℤ) ^ 3 * hs' + (p : ℤ) ^ 2 * hq'
  refine ⟨?_, ⟨_, hL⟩⟩
  rcases lt_or_gt_of_ne hpr with h | h
  · exact h
  · exfalso
    have hpr' : (r : ℤ) + 1 ≤ p := by exact_mod_cast h
    have hr0 : (0 : ℤ) < r := by exact_mod_cast hr.pos
    have hpr0 : (0 : ℤ) < (p : ℤ) * r := by positivity
    have hQ : (0 : ℤ) < (p : ℤ) * (r + 1) - r ^ 2 := by nlinarith
    have h5 : 0 ≤ (m - 1) * ((p : ℤ) * (r + 1) - r ^ 2) := mul_nonneg (by linarith) hQ.le
    linarith [hσ, h5, hpr0, hr0]

end P2qJumps
