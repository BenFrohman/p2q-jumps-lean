/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Tactic
import P2qJumps.Arith
import P2qJumps.R3S
import P2qJumps.Preamble

/-!
# The shape `r^3 s` is empty (no bound on `p`)

Eliminating `s` and `q` from the three integer identities `E0`, `A(N) = A(n)` and
`B(N) = B(n)` for `N = r^3 s` gives the master equation `H(p, r) = 0`. With `r = p + k`,
`k ≥ 1` (Theorem L(iv) gives `p < r`), the quintic `G(p, k) = H(p, p + k)` has no integer root
`p ≥ 2`: it is negative for `p ≥ k^2 - 2k + 4` (all coefficients of `-G` are positive after
`p = k^2 - 2k + 4 + u`, `k = 1 + w`), positive for `1 ≤ p ≤ k^2 - 2k + 3` when `k ≥ 6` (since
`G(p)/p^5` is decreasing and `G(k^2 - 2k + 3) > 0`), and checked directly for `k ≤ 5`.
-/

namespace P2qJumps

/-- The master polynomial of the shape `r^3 s`, in `p` and `k = r - p`. -/
def Gr3s (p k : ℤ) : ℤ :=
  -p ^ 5 + (k ^ 2 - 6 * k + 2) * p ^ 4 + (4 * k ^ 3 - 12 * k ^ 2 + 4 * k - 1) * p ^ 3 +
    (6 * k ^ 4 - 12 * k ^ 3 + 4 * k ^ 2) * p ^ 2 + (4 * k ^ 5 - 6 * k ^ 4 + k ^ 3 + 12 * k - 12) * p +
    (k ^ 6 - k ^ 5 + 12 * k ^ 2)

/-- Upper range: `G(p, k) < 0` for `k ≥ 1` and `p ≥ k^2 - 2k + 4`. -/
lemma Gr3s_neg (p k : ℤ) (hk : 1 ≤ k) (hp : k ^ 2 - 2 * k + 4 ≤ p) : Gr3s p k < 0 := by
  obtain ⟨u, hu, rfl⟩ : ∃ u, 0 ≤ u ∧ p = k ^ 2 - 2 * k + 4 + u := ⟨p - (k ^ 2 - 2 * k + 4), by linarith, by ring⟩
  obtain ⟨w, hw, rfl⟩ : ∃ w, 0 ≤ w ∧ k = 1 + w := ⟨k - 1, by linarith, by ring⟩
  have e : -Gr3s ((1 + w) ^ 2 - 2 * (1 + w) + 4 + u) (1 + w) =
      u^5 + 4*u^4*w^2 + 4*u^4*w + 18*u^4 + 6*u^3*w^4 + 12*u^3*w^3 + 60*u^3*w^2 + 56*u^3*w
      + 131*u^3 + 4*u^2*w^6 + 12*u^2*w^5 + 66*u^2*w^4 + 120*u^2*w^3 + 335*u^2*w^2 + 292*u^2*w
      + 479*u^2 + u*w^8 + 4*u*w^7 + 24*u*w^6 + 68*u*w^5 + 227*u*w^4 + 387*u*w^3 + 819*u*w^2
      + 661*u*w + 877*u + 4*w^7 + 22*w^6 + 78*w^5 + 234*w^4 + 384*w^3 + 722*w^2 + 518*w
      + 630 := by
    unfold Gr3s; ring
  have : 0 < -Gr3s ((1 + w) ^ 2 - 2 * (1 + w) + 4 + u) (1 + w) := by rw [e]; positivity
  linarith

/-- `G(k^2 - 2k + 3, k) > 0` for `k ≥ 6`. -/
lemma Gr3s_at_c_pos (k : ℤ) (hk : 6 ≤ k) : 0 < Gr3s (k ^ 2 - 2 * k + 3) k := by
  obtain ⟨w, hw, rfl⟩ : ∃ w, 0 ≤ w ∧ k = 6 + w := ⟨k - 6, by linarith, by ring⟩
  have e : Gr3s ((6 + w) ^ 2 - 2 * (6 + w) + 3) (6 + w) =
      w^8 + 40*w^7 + 698*w^6 + 6918*w^5 + 42383*w^4 + 163055*w^3 + 379443*w^2 + 475458*w
      + 230472 := by
    unfold Gr3s; ring
  rw [e]; positivity

/-- Lower range: `G(p, k) > 0` for `k ≥ 6` and `1 ≤ p ≤ k^2 - 2k + 3`. All coefficients of
`G` except the leading `-1` are positive, so `G(p)/p^5` decreases in `p > 0`. -/
lemma Gr3s_pos (p k : ℤ) (hk : 6 ≤ k) (hp1 : 1 ≤ p) (hp : p ≤ k ^ 2 - 2 * k + 3) :
    0 < Gr3s p k := by
  set c := k ^ 2 - 2 * k + 3 with hc
  have hGc := Gr3s_at_c_pos k hk
  have a4 : 0 ≤ k ^ 2 - 6 * k + 2 := by nlinarith
  have a3 : 0 ≤ 4 * k ^ 3 - 12 * k ^ 2 + 4 * k - 1 := by nlinarith
  have a2 : 0 ≤ 6 * k ^ 4 - 12 * k ^ 3 + 4 * k ^ 2 := by nlinarith
  have a1 : 0 ≤ 4 * k ^ 5 - 6 * k ^ 4 + k ^ 3 + 12 * k - 12 := by nlinarith
  have a0 : 0 ≤ k ^ 6 - k ^ 5 + 12 * k ^ 2 := by nlinarith
  have hp0 : 0 ≤ p := by linarith
  have hc0 : 0 ≤ c := by linarith
  -- termwise `p^i c^5 ≥ c^i p^5`
  have t : ∀ i : ℕ, i ≤ 5 → c ^ i * p ^ 5 ≤ p ^ i * c ^ 5 := by
    intro i hi
    have h1 : p ^ (5 - i) ≤ c ^ (5 - i) := pow_le_pow_left₀ hp0 hp _
    have e1 : p ^ 5 = p ^ i * p ^ (5 - i) := by rw [← pow_add]; congr 1; omega
    have e2 : c ^ 5 = c ^ i * c ^ (5 - i) := by rw [← pow_add]; congr 1; omega
    rw [e1, e2]
    have := mul_le_mul_of_nonneg_left h1 (mul_nonneg (pow_nonneg hc0 i) (pow_nonneg hp0 i))
    nlinarith
  have key : Gr3s c k * p ^ 5 ≤ Gr3s p k * c ^ 5 := by
    have t0 := t 0 (by norm_num); have t1 := t 1 (by norm_num); have t2 := t 2 (by norm_num)
    have t3 := t 3 (by norm_num); have t4 := t 4 (by norm_num)
    have e : Gr3s p k * c ^ 5 - Gr3s c k * p ^ 5 =
        (k ^ 2 - 6 * k + 2) * (p ^ 4 * c ^ 5 - c ^ 4 * p ^ 5)
        + (4 * k ^ 3 - 12 * k ^ 2 + 4 * k - 1) * (p ^ 3 * c ^ 5 - c ^ 3 * p ^ 5)
        + (6 * k ^ 4 - 12 * k ^ 3 + 4 * k ^ 2) * (p ^ 2 * c ^ 5 - c ^ 2 * p ^ 5)
        + (4 * k ^ 5 - 6 * k ^ 4 + k ^ 3 + 12 * k - 12) * (p ^ 1 * c ^ 5 - c ^ 1 * p ^ 5)
        + (k ^ 6 - k ^ 5 + 12 * k ^ 2) * (p ^ 0 * c ^ 5 - c ^ 0 * p ^ 5) := by
      unfold Gr3s; ring
    have : 0 ≤ Gr3s p k * c ^ 5 - Gr3s c k * p ^ 5 := by
      rw [e]
      have m4 := mul_nonneg a4 (by linarith : (0 : ℤ) ≤ p ^ 4 * c ^ 5 - c ^ 4 * p ^ 5)
      have m3 := mul_nonneg a3 (by linarith : (0 : ℤ) ≤ p ^ 3 * c ^ 5 - c ^ 3 * p ^ 5)
      have m2 := mul_nonneg a2 (by linarith : (0 : ℤ) ≤ p ^ 2 * c ^ 5 - c ^ 2 * p ^ 5)
      have m1 := mul_nonneg a1 (by linarith : (0 : ℤ) ≤ p ^ 1 * c ^ 5 - c ^ 1 * p ^ 5)
      have m0 := mul_nonneg a0 (by linarith : (0 : ℤ) ≤ p ^ 0 * c ^ 5 - c ^ 0 * p ^ 5)
      linarith
    linarith
  have hp5 : 0 < p ^ 5 := pow_pos (by linarith) 5
  have hc5 : 0 < c ^ 5 := pow_pos (by linarith) 5
  have : 0 < Gr3s p k * c ^ 5 := lt_of_lt_of_le (mul_pos hGc hp5) key
  exact pos_of_mul_pos_left this hc5.le

/-- `G(p, k) ≠ 0` for all integers `k ≥ 1`, `p ≥ 2`. -/
lemma Gr3s_ne_zero (p k : ℤ) (hk : 1 ≤ k) (hp : 2 ≤ p) : Gr3s p k ≠ 0 := by
  rcases le_or_gt (k ^ 2 - 2 * k + 4) p with h | h
  · exact (Gr3s_neg p k hk h).ne
  · rcases le_or_gt 6 k with hk6 | hk6
    · exact (Gr3s_pos p k hk6 (by linarith) (by linarith)).ne'
    · -- `k ≤ 5` and `p ≤ k^2 - 2k + 3 ≤ 18`: direct evaluation
      have hp18 : p ≤ 18 := by nlinarith
      interval_cases k <;> interval_cases p <;> simp [Gr3s]

/-- **The shape `r^3 s` is empty.** Under both jumps at `n = p^2 q`, `N = n + 12` is not of the
form `r^3 s` with distinct primes `r, s`. -/
theorem r3s_empty {p q r s : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime) (hs : s.Prime)
    (hpq : p ≠ q) (hrs : r ≠ s) (hJ : Jumps (p ^ 2 * q)) :
    p ^ 2 * q + 12 ≠ r ^ 3 * s := by
  intro hN
  obtain ⟨hp5, -, -, -, hcop⟩ := preamble hp hq hpq hJ
  -- `r, s ≥ 5` since `gcd(N, 6) = 1`
  have h6 : Nat.Coprime (r ^ 3 * s) 6 := by
    rw [← hN]; exact Nat.Coprime.coprime_dvd_right ⟨p * q, by ring⟩ hcop
  have five : ∀ x : ℕ, x.Prime → x ∣ r ^ 3 * s → 5 ≤ x := by
    intro x hx hxd
    have := hx.two_le
    by_contra hlt; push_neg at hlt
    interval_cases x
    · have := Nat.Coprime.coprime_dvd_left hxd h6; norm_num at this
    · have := Nat.Coprime.coprime_dvd_left hxd h6; norm_num at this
    · exact absurd hx (by norm_num)
  have hr5 := five r hr ⟨r ^ 2 * s, by ring⟩
  have hs5 := five s hs ⟨r ^ 3, by ring⟩
  obtain ⟨hpr, -⟩ := r3s_reduction hp hq hr hs hpq hrs hr5 hs5 hJ hN
  obtain ⟨j1, j2⟩ := jumps_p2q_int hp hq hpq hJ
  obtain ⟨f1, f2⟩ := totient_sigma_r3s hr hs hrs
  rw [hN] at j1 j2
  have E0 : (r : ℤ) ^ 3 * s = (p : ℤ) ^ 2 * q + 12 := by
    have := congrArg (fun x : ℕ => (x : ℤ)) hN; push_cast at this; linarith
  have E1 : (r : ℤ) ^ 2 * (r - 1) * (s - 1) = (p : ℤ) * (p - 1) * (q - 1) + 12 := by
    rw [← f1, j1]
  have E2 : ((r : ℤ) ^ 3 + r ^ 2 + r + 1) * (s + 1) = ((p : ℤ) ^ 2 + p + 1) * (q + 1) + 12 := by
    rw [← f2, j2]
  -- master equation `H(p, r) = 0`, with `H(p, p + k) = G(p, k)`
  have hH : Gr3s p ((r : ℤ) - p) = 0 := by
    unfold Gr3s
    linear_combination ((p : ℤ) * r + p - r ^ 2) * E0
      + (-(p : ℤ) ^ 2 * r ^ 2 - p ^ 2 * r - p ^ 2 + p * r ^ 3 + r ^ 3) * (E0 - E1)
      + ((p : ℤ) ^ 2 * r ^ 2 - p * r ^ 3) * (E2 - E0)
  have hk : (1 : ℤ) ≤ (r : ℤ) - p := by
    have : ((p + 1 : ℕ) : ℤ) ≤ r := by exact_mod_cast hpr
    push_cast at this; linarith
  exact Gr3s_ne_zero p ((r : ℤ) - p) hk (by exact_mod_cast (by omega : 2 ≤ p)) hH

end P2qJumps
