/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Tactic
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import P2qJumps.Arith
import P2qJumps.R3S
import P2qJumps.Preamble
import P2qJumps.R3SEmpty

/-!
# Theorem A: `N` is not a prime power and not `r^a s` (`a ≥ 2`)

* `N_ne_prime_pow`: `N ≠ r^k` for a prime `r` and `k ≥ 1`.
* `ras_setup`: for `N = r^a s` (`a ≥ 1`), `p ∣ r + s - 1 = p m`, `s = p m - r + 1`,
  `q = R m - p + 1` with `R = r^(a-1)`, `m ≥ 1`, `L(p) = R (r (r-1) - p m (r - p))` and
  `m Q₁ = P₁` with `Q₁ = (p - r + 1) R - p`, `P₁ = (p+1)(r-1) - r R + 1`.
* `N_ne_ras`: `N ≠ r^a s` for distinct primes `r, s` and `a ≥ 2`.
-/

namespace P2qJumps

open Nat ArithmeticFunction Finset
open scoped ArithmeticFunction.sigma

/-- `N` is not a prime power `r^k`, `k ≥ 1`. -/
theorem N_ne_prime_pow {p q r k : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime) (hpq : p ≠ q)
    (hk : 1 ≤ k) (hJ : Jumps (p ^ 2 * q)) : p ^ 2 * q + 12 ≠ r ^ k := by
  intro hN
  obtain ⟨hp5, -, -, -, -⟩ := preamble hp hq hpq hJ
  obtain ⟨j1, -⟩ := jumps_p2q_int hp hq hpq hJ
  obtain ⟨k, rfl⟩ : ∃ j, k = j + 1 := ⟨k - 1, by omega⟩
  rw [hN, Nat.totient_prime_pow_succ hr] at j1
  push_cast [hr.one_le] at j1
  have E0 : (r : ℤ) ^ (k + 1) = (p : ℤ) ^ 2 * q + 12 := by exact_mod_cast hN.symm
  -- `A(N) = r^k = p (p + q - 1)`, so `N = r p (p + q - 1)` and `p (r (p+q-1) - p q) = 12`.
  have hA : (r : ℤ) ^ k = p * (p + q - 1) := by
    have : (r : ℤ) ^ (k + 1) = r ^ k * r := pow_succ _ _
    linear_combination E0 - j1 + this
  have h12 : (p : ℤ) * (r * (p + q - 1) - p * q) = 12 := by
    have : (r : ℤ) ^ (k + 1) = r ^ k * r := pow_succ _ _
    linear_combination -(r : ℤ) * hA - this + E0
  have hdvd : (p : ℤ) ∣ 12 := ⟨_, h12.symm⟩
  have hd : p ∣ 12 := by exact_mod_cast hdvd
  have := Nat.le_of_dvd (by norm_num) hd
  interval_cases p <;> revert hd hp <;> norm_num

/-- `σ₁(r^(b+1)) · (r - 1) = r^(b+2) - 1` in `ℤ`. -/
lemma sigma_prime_pow_mul_sub_one {r : ℕ} (hr : r.Prime) (b : ℕ) :
    (σ 1 (r ^ (b + 1)) : ℤ) * (r - 1) = (r : ℤ) ^ 2 * r ^ b - 1 := by
  rw [sigma_one_apply_prime_pow hr]
  push_cast
  rw [geom_sum_mul]
  ring

set_option maxHeartbeats 1000000 in
/-- **Theorem A.** Under both jumps at `n = p^2 q`, `N = n + 12` is not of the form `r^a s`
with distinct primes `r, s` and `a ≥ 2`. -/
theorem N_ne_ras {p q r s a : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime) (hs : s.Prime)
    (hpq : p ≠ q) (hrs : r ≠ s) (ha : 2 ≤ a) (hJ : Jumps (p ^ 2 * q)) :
    p ^ 2 * q + 12 ≠ r ^ a * s := by
  intro hN
  obtain ⟨hp5, hq5, -, -, hcop⟩ := preamble hp hq hpq hJ
  have h6 : Nat.Coprime (r ^ a * s) (6 * p * q) := by rw [← hN]; exact hcop
  have hcr : Nat.Coprime r (6 * p * q) :=
    Nat.Coprime.coprime_dvd_left ⟨r ^ (a - 1) * s, by
      rw [← mul_assoc, ← pow_succ']; congr 2; omega⟩ h6
  have hcs : Nat.Coprime s (6 * p * q) := Nat.Coprime.coprime_dvd_left ⟨r ^ a, by ring⟩ h6
  have five : ∀ x : ℕ, x.Prime → Nat.Coprime x (6 * p * q) → 5 ≤ x := by
    intro x hx hxc
    have := hx.two_le
    by_contra hlt; push_neg at hlt
    interval_cases x
    · have := Nat.Coprime.coprime_dvd_right (⟨3 * p * q, by ring⟩ : 2 ∣ 6 * p * q) hxc
      norm_num at this
    · have := Nat.Coprime.coprime_dvd_right (⟨2 * p * q, by ring⟩ : 3 ∣ 6 * p * q) hxc
      norm_num at this
    · exact absurd hx (by norm_num)
  have hr5 := five r hr hcr
  have hs5 := five s hs hcs
  have hrp : r ≠ p := by
    rintro rfl
    have := Nat.Coprime.coprime_dvd_right (⟨6 * q, by ring⟩ : r ∣ 6 * r * q) hcr
    exact hr.one_lt.ne' ((Nat.coprime_self r).1 this)
  -- `a = b + 1`, `R = r^b`
  obtain ⟨b, rfl⟩ : ∃ b, a = b + 1 := ⟨a - 1, by omega⟩
  have c1 : (r ^ (b + 1)).Coprime s := Nat.Coprime.pow_left _ ((Nat.coprime_primes hr hs).2 hrs)
  obtain ⟨j1, j2⟩ := jumps_p2q_int hp hq hpq hJ
  rw [hN, Nat.totient_mul c1, Nat.totient_prime_pow_succ hr, Nat.totient_prime hs] at j1
  rw [hN, isMultiplicative_sigma.map_mul_of_coprime c1, sigma_one_prime' hs] at j2
  have hG := sigma_prime_pow_mul_sub_one hr b
  push_cast [hr.one_le, hs.one_le] at j1 j2
  generalize (σ 1 (r ^ (b + 1)) : ℤ) = G at j2 hG
  have E0 : (r : ℤ) ^ b * r * s = (p : ℤ) ^ 2 * q + 12 := by
    have := congrArg (fun x : ℕ => (x : ℤ)) hN; push_cast at this
    have e : (r : ℤ) ^ (b + 1) = r ^ b * r := pow_succ _ _
    linear_combination -this - (s : ℤ) * e
  generalize hRdef : (r : ℤ) ^ b = R at j1 hG E0
  -- `A(N) = A(n)`
  have hA : R * (r + s - 1) = p * (p + q - 1) := by linear_combination E0 - j1
  have hcop' : IsCoprime (p : ℤ) R := by
    rw [← hRdef]
    have : Nat.Coprime p (r ^ b) := Nat.Coprime.pow_right b ((Nat.coprime_primes hp hr).2 hrp.symm)
    exact_mod_cast Nat.isCoprime_iff_coprime.2 this
  obtain ⟨m, hm⟩ : (p : ℤ) ∣ (r : ℤ) + s - 1 :=
    hcop'.dvd_of_dvd_mul_left ⟨p + q - 1, by rw [hA]⟩
  have hp0 : (0 : ℤ) < p := by exact_mod_cast hp.pos
  have zr5 : (5 : ℤ) ≤ r := by exact_mod_cast hr5
  have zs5 : (5 : ℤ) ≤ s := by exact_mod_cast hs5
  have zq5 : (5 : ℤ) ≤ q := by exact_mod_cast hq5
  have zp5 : (5 : ℤ) ≤ p := by exact_mod_cast hp5
  have hs' : (s : ℤ) = p * m - r + 1 := by linarith
  have hq' : (q : ℤ) = R * m - p + 1 := by
    have h1 : (p : ℤ) * (R * m) = p * (p + q - 1) := by rw [← hA, hm]; ring
    have h2 : R * m = p + q - 1 := mul_left_cancel₀ hp0.ne' h1
    linarith
  have hm1 : (1 : ℤ) ≤ m := by
    have : (0 : ℤ) < p * m := by rw [← hm]; linarith
    have : (0 : ℤ) < m := pos_of_mul_pos_right this hp0.le
    linarith
  -- `m Q₁ = P₁`
  have hB : m * ((p - r + 1) * R - p) = (p + 1) * (r - 1) - r * R + 1 := by
    linear_combination (r - 1 : ℤ) * j2 - (r - 1 : ℤ) * E0 - ((s : ℤ) + 1) * hG
      - ((r : ℤ) * R - 1) * hs' + ((r : ℤ) - 1) * (1 + p) * hq'
  -- `L(p) = R (r (r - 1) - p m (r - p))`
  have hL : (p : ℤ) ^ 3 - p ^ 2 - 12 = R * (r * (r - 1) - p * m * (r - p)) := by
    linear_combination E0 - (r : ℤ) * R * hs' + (p : ℤ) ^ 2 * hq'
  have hR1 : (r : ℤ) ≤ R ∨ b = 0 := by
    rcases Nat.eq_zero_or_pos b with h | h
    · right; exact h
    · left; rw [← hRdef]; exact le_self_pow₀ (by linarith) (by omega)
  rcases Nat.lt_or_ge b 2 with hb | hb
  · -- `a = 2`: `R = r`, so `(m - 1) Q₁ = 0`
    have hb1 : b = 1 := by omega
    subst hb1
    have hRr : R = r := by rw [← hRdef]; ring
    subst hRr
    have hQ : ((p : ℤ) - r + 1) * r - p ≠ 0 := by
      intro h0
      have : (r : ℤ) ∣ p := ⟨p - r + 1, by linarith⟩
      have : r ∣ p := by exact_mod_cast this
      exact hrp ((Nat.prime_dvd_prime_iff_eq hr hp).1 this)
    have hm1' : m = 1 := by
      have : (m - 1) * (((p : ℤ) - r + 1) * r - p) = 0 := by linear_combination hB
      rcases mul_eq_zero.1 this with h | h
      · linarith
      · exact absurd h hQ
    subst hm1'
    linarith
  · have hRr2 : (r : ℤ) ^ 2 ≤ R := by
      rw [← hRdef]; exact pow_le_pow_right₀ (by linarith) hb
    rcases lt_or_gt_of_ne hrp with hlt | hgt
    · -- `r < p`: `Q₁ - P₁ = (p+1)(R - r) > 0` forces a contradiction
      have zlt : (r : ℤ) + 1 ≤ p := by exact_mod_cast hlt
      have hRgt : (r : ℤ) < R := by
        have : (r : ℤ) < r ^ 2 := by nlinarith
        linarith
      rcases le_or_gt ((p + 1) * (r - 1) - r * R + 1 : ℤ) 0 with hP | hP
      · have hQ1 : ((p : ℤ) - r + 1) * R - p ≤ 0 := by
          by_contra hc; push_neg at hc
          have : 0 < m * (((p : ℤ) - r + 1) * R - p) := mul_pos (by linarith) hc
          linarith
        have hR0 : (0 : ℤ) ≤ R := by linarith
        have h2R : 2 * R ≤ p := by
          have := mul_le_mul_of_nonneg_right (by linarith : (2 : ℤ) ≤ (p : ℤ) - r + 1) hR0
          linarith
        have h1 := mul_le_mul_of_nonneg_left h2R (by linarith : (0 : ℤ) ≤ r)
        have h2 := mul_nonneg (by linarith : (0 : ℤ) ≤ p) (by linarith : (0 : ℤ) ≤ (r : ℤ) - 2)
        linarith
      · have hQP : ((p + 1) * (r - 1) - r * R + 1 : ℤ) < ((p : ℤ) - r + 1) * R - p := by
          have h0 : (0 : ℤ) < ((p : ℤ) + 1) * (R - r) := mul_pos (by linarith) (by linarith)
          have e : ((p : ℤ) - r + 1) * R - p - ((p + 1) * (r - 1) - r * R + 1)
              = ((p : ℤ) + 1) * (R - r) := by ring
          linarith
        have : ((p : ℤ) - r + 1) * R - p ≤ m * (((p : ℤ) - r + 1) * R - p) := by
          have := mul_le_mul_of_nonneg_right hm1 (by linarith : (0 : ℤ) ≤ ((p : ℤ) - r + 1) * R - p)
          linarith
        linarith
    · -- `p < r`
      rcases Nat.lt_or_ge b 3 with hb3 | hb3
      · have hb2 : b = 2 := by omega
        subst hb2
        exact r3s_empty hp hq hr hs hpq hrs hJ hN
      · have hRr3 : (r : ℤ) ^ 3 ≤ R := by
          rw [← hRdef]; exact pow_le_pow_right₀ (by linarith) hb3
        have zgt : (p : ℤ) + 1 ≤ r := by exact_mod_cast hgt
        have hLpos : (0 : ℤ) < (p : ℤ) ^ 3 - p ^ 2 - 12 := by
          have hp2' : (5 : ℤ) ^ 2 ≤ (p : ℤ) ^ 2 := pow_le_pow_left₀ (by norm_num) zp5 2
          have h4 : (5 : ℤ) ^ 2 * 4 ≤ (p : ℤ) ^ 2 * (p - 1) :=
            mul_le_mul hp2' (by linarith) (by norm_num) (sq_nonneg _)
          have e : (p : ℤ) ^ 3 - p ^ 2 = p ^ 2 * (p - 1) := by ring
          linarith only [h4, e]
        have hr0 : (0 : ℤ) < r := by linarith only [zr5]
        have hr3 : (0 : ℤ) < (r : ℤ) ^ 3 := by positivity
        have hR0 : (0 : ℤ) ≤ R := by linarith only [hr3, hRr3]
        have hX : (1 : ℤ) ≤ r * (r - 1) - p * m * (r - p) := by
          by_contra hc; push_neg at hc
          have hc' := Int.lt_iff_add_one_le.mp hc
          have := mul_le_mul_of_nonneg_left
            (by linarith only [hc'] : r * (r - 1) - p * m * (r - p) ≤ (0 : ℤ)) hR0
          linarith only [this, hL, hLpos]
        have hp3 : (p : ℤ) ^ 3 < r ^ 3 :=
          pow_lt_pow_left₀ (by linarith only [zgt] : (p : ℤ) < r) hp0.le (by norm_num : (3 : ℕ) ≠ 0)
        have h1 := mul_le_mul_of_nonneg_left hX hR0
        have hp2 : (0 : ℤ) ≤ (p : ℤ) ^ 2 := sq_nonneg _
        linarith only [h1, hL, hp3, hRr3, hp2]

end P2qJumps
