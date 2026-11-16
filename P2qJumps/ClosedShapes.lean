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
open scoped ArithmeticFunction.sigma

/-- Key ratio bound from the complementary discriminant in the rst case.
Uses the already-proved `g_ge_six`. -/
theorem discriminant_ratio_bound (t : ℝ) :
    0 < t → g t / 6 ≥ 1 := by
  intro ht
  have h := g_ge_six t
  rw [ge_iff_le, le_div_iff₀ (by norm_num : (0 : ℝ) < 6)]
  linarith

lemma sigma_one_prime {r : ℕ} (hr : r.Prime) : σ 1 r = r + 1 := by
  have h := sigma_one_apply_prime_pow (i := 1) hr
  simp [Finset.sum_range_succ] at h
  omega

lemma two_mul_odd_ne {a b q : ℕ} (ha : a.Prime) (hb : b.Prime) (ha2 : a ≠ 2) (hb2 : b ≠ 2)
    (h : 2 * (a * b) = 4 * q + 12) : False := by
  obtain ⟨k, hk⟩ := (ha.odd_of_ne_two ha2).mul (hb.odd_of_ne_two hb2)
  rw [hk] at h
  omega

lemma int_ineq_false (P Q : ℤ) (hP : 3 ≤ P) (hQ : 2 ≤ Q)
    (f1 : 6 * (2 * P ^ 2 + 2 * P * Q + Q - 1) ≤ (Q + 2 * P + 1) ^ 2)
    (f2 : 6 * (Q + 2 * P + 1) * (P ^ 2 * Q + 12) ≤ (2 * P ^ 2 + 2 * P * Q + Q - 1) ^ 2) :
    False := by
  have hQP : P < Q := by
    by_contra hc
    push_neg at hc
    nlinarith [mul_le_mul_of_nonneg_left hc (by linarith : (0:ℤ) ≤ Q)]
  have ha : 0 ≤ P ^ 3 * (Q - P) := mul_nonneg (by positivity) (by linarith)
  have hb : 0 ≤ Q ^ 2 * (2 * P ^ 2 - 4 * P - 1) := mul_nonneg (by positivity) (by nlinarith)
  have hc : 0 ≤ P ^ 2 * Q := by positivity
  have hd : 0 ≤ P * Q := by positivity
  nlinarith

/-- Theorem 28: if both length-12 jumps hold at `n = p^2 q`, then `n + 12` is not a
product of three distinct primes.

Proof. Write `N = r s t`. Multiplicativity of `φ` and `σ₁` turns the two jumps and
`N = p^2 q + 12` into
`2 (r + s + t) = q + 2p + 1` and `2 (rs + rt + st) = 2p^2 + 2pq + q - 1`.
* If `p = 2`, then `N = 4 (q + 3)` is divisible by `4`, impossible for distinct primes.
* If `p ≥ 3`, the elementary inequalities `e₁² ≥ 3 e₂` and `e₂² ≥ 3 e₁ e₃` (sums of squares)
  give two polynomial inequalities in `p, q` that are incompatible (`int_ineq_false`). -/
theorem theorem28_discriminant :
    ∀ p q r s t : ℕ,
      p.Prime → q.Prime → r.Prime → s.Prime → t.Prime →
      p ≠ q → r ≠ s → r ≠ t → s ≠ t →
      Jumps (p ^ 2 * q) →
      p ^ 2 * q + 12 ≠ r * s * t := by
  intro p q r s t hp hq hr hs ht hpq hrs hrt hst hJ hN
  obtain ⟨hφ, hσ⟩ := hJ
  rw [hN] at hφ hσ
  have cpq : (p ^ 2).Coprime q := Nat.Coprime.pow_left 2 ((Nat.coprime_primes hp hq).2 hpq)
  have crs : r.Coprime s := (Nat.coprime_primes hr hs).2 hrs
  have crst : (r * s).Coprime t :=
    Nat.coprime_mul_iff_left.2 ⟨(Nat.coprime_primes hr ht).2 hrt, (Nat.coprime_primes hs ht).2 hst⟩
  rw [Nat.totient_mul crst, Nat.totient_mul crs, Nat.totient_prime hr, Nat.totient_prime hs,
    Nat.totient_prime ht, Nat.totient_mul cpq, Nat.totient_prime_pow hp (by norm_num),
    Nat.totient_prime hq] at hφ
  rw [isMultiplicative_sigma.map_mul_of_coprime crst, isMultiplicative_sigma.map_mul_of_coprime crs,
    isMultiplicative_sigma.map_mul_of_coprime cpq, sigma_one_apply_prime_pow hp,
    sigma_one_prime hr, sigma_one_prime hs, sigma_one_prime ht, sigma_one_prime hq] at hσ
  simp [Finset.sum_range_succ] at hσ
  -- Case p = 2: N = 4(q + 3) is divisible by 4, impossible for distinct primes.
  rcases hp.eq_two_or_odd' with hp2 | hpodd
  · subst hp2
    have h4 : r * s * t = 4 * q + 12 := by rw [← hN]; ring
    have hev : 2 ∣ r * s * t := ⟨2 * q + 6, by omega⟩
    rcases (Nat.prime_two.dvd_mul).1 hev with h | h
    · rcases (Nat.prime_two.dvd_mul).1 h with h | h
      · have hr2 := ((Nat.prime_dvd_prime_iff_eq Nat.prime_two hr).1 h).symm
        subst hr2
        exact two_mul_odd_ne hs ht (Ne.symm hrs) (Ne.symm hrt) (by rw [← h4]; ring)
      · have hs2 := ((Nat.prime_dvd_prime_iff_eq Nat.prime_two hs).1 h).symm
        subst hs2
        exact two_mul_odd_ne hr ht hrs (Ne.symm hst) (by rw [← h4]; ring)
    · have ht2 := ((Nat.prime_dvd_prime_iff_eq Nat.prime_two ht).1 h).symm
      subst ht2
      exact two_mul_odd_ne hr hs hrt hst (by rw [← h4]; ring)
  -- Case p ≥ 3: symmetric-function inequalities are incompatible.
  · have hp3 : 3 ≤ p := by
      rcases hpodd with ⟨k, hk⟩
      have := hp.two_le
      omega
    have hq2 := hq.two_le
    have hr1 := hr.one_le
    have hs1 := hs.one_le
    have ht1 := ht.one_le
    have hp1 := hp.one_le
    have hq1 := hq.one_le
    zify [hr1, hs1, ht1, hp1, hq1] at hφ
    zify at hσ hN
    have hP3 : (3 : ℤ) ≤ p := by exact_mod_cast hp3
    have hQ2 : (2 : ℤ) ≤ q := by exact_mod_cast hq2
    set P : ℤ := (p : ℤ)
    set Q : ℤ := (q : ℤ)
    set R : ℤ := (r : ℤ)
    set S : ℤ := (s : ℤ)
    set T : ℤ := (t : ℤ)
    have h1 : 2 * (R + S + T) = Q + 2 * P + 1 := by linear_combination hφ + hσ + 2 * hN
    have h2 : 2 * (R * S + R * T + S * T) = 2 * P ^ 2 + 2 * P * Q + Q - 1 := by
      linear_combination hσ - hφ
    have n1 : 3 * (R * S + R * T + S * T) ≤ (R + S + T) ^ 2 := by
      nlinarith [sq_nonneg (R - S), sq_nonneg (S - T), sq_nonneg (R - T)]
    have n2 : 3 * (R + S + T) * (R * S * T) ≤ (R * S + R * T + S * T) ^ 2 := by
      nlinarith [sq_nonneg (R * S - S * T), sq_nonneg (S * T - R * T), sq_nonneg (R * S - R * T)]
    have f1 : 6 * (2 * P ^ 2 + 2 * P * Q + Q - 1) ≤ (Q + 2 * P + 1) ^ 2 := by
      rw [← h1, ← h2]; nlinarith
    have f2 : 6 * (Q + 2 * P + 1) * (P ^ 2 * Q + 12) ≤ (2 * P ^ 2 + 2 * P * Q + Q - 1) ^ 2 := by
      rw [← h1, ← h2]
      have hc : R * S * T = P ^ 2 * Q + 12 := by linear_combination -hN
      rw [← hc]; nlinarith
    exact int_ineq_false P Q hP3 hQ2 f1 f2

/-- `Theorem28` (stated in `P2qJumps.Statement`) holds unconditionally. -/
theorem theorem28_holds : Theorem28 := theorem28_discriminant

/-- Non-vacuity check for `theorem28_discriminant`: the shape `p^2 q + 12 = r s t` with all
side conditions except `Jumps` does occur (`3^2 * 17 + 12 = 165 = 3 * 5 * 11`), and `Jumps`
fails there (checked by `decide`). So the conclusion is not automatic; `Jumps` does the work. -/
theorem theorem28_jumps_hypothesis_needed :
    (3 : ℕ).Prime ∧ (17 : ℕ).Prime ∧ (3 : ℕ).Prime ∧ (5 : ℕ).Prime ∧ (11 : ℕ).Prime ∧
      (3 : ℕ) ≠ 17 ∧ (3 : ℕ) ≠ 5 ∧ (3 : ℕ) ≠ 11 ∧ (5 : ℕ) ≠ 11 ∧
      3 ^ 2 * 17 + 12 = 3 * 5 * 11 ∧ ¬ Jumps (3 ^ 2 * 17) := by
  refine ⟨by norm_num, by norm_num, by norm_num, by norm_num, by norm_num,
    by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, ?_⟩
  unfold Jumps
  intro ⟨h, _⟩
  revert h
  decide

end P2qJumps
