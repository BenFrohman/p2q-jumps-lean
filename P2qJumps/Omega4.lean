/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Tactic
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import P2qJumps.Arith
import P2qJumps.Preamble

/-!
# The constraints for `ω(N) ≥ 4`: `q ≥ 3 p^2` and every prime factor of `N` exceeds `p`

If `N = p^2 q + 12` has four distinct prime factors, then the pair inequality
`δ(N) · a b ≥ 2 N` (for distinct primes `a, b ∣ N`, `δ = σ + φ - 2·id`) applied to two disjoint
pairs gives `δ(N)^2 ≥ 4 N`. With `δ(N) = 2p + q + 1` this forces `q ≥ 3 p^2`, and then the totient
bound `φ(N) + N / r ≤ N` excludes every prime factor `r ≤ p`.
-/

namespace P2qJumps

open Nat ArithmeticFunction Finset
open scoped ArithmeticFunction.sigma

/-- `2 M ≤ σ₁(M) + φ(M)` for `M ≥ 1`: `M - φ(M) = ∑_{d ∣ M, d < M} φ(d) ≤ ∑_{d ∣ M, d < M} d`. -/
lemma two_mul_le_sigma_add_totient {M : ℕ} (hM : M ≠ 0) : 2 * M ≤ σ 1 M + φ M := by
  have h1 := Nat.sum_totient M
  rw [← Nat.insert_self_properDivisors hM, Finset.sum_insert Nat.self_notMem_properDivisors] at h1
  have h2 : σ 1 M = ∑ i ∈ M.properDivisors, i + M := by
    rw [sigma_one_apply, Nat.sum_divisors_eq_sum_properDivisors_add_self]
  have h3 : ∑ i ∈ M.properDivisors, φ i ≤ ∑ i ∈ M.properDivisors, i :=
    Finset.sum_le_sum (fun i _ => Nat.totient_le i)
  omega

/-- Lower bound for `σ₁` of a prime power `a^(k+1)`. -/
lemma sigma_prime_pow_succ_ge {a : ℕ} (ha : a.Prime) (k : ℕ) :
    a ^ k * (a + 1) ≤ σ 1 (a ^ (k + 1)) := by
  rw [sigma_one_apply_prime_pow ha, Finset.sum_range_succ, Finset.sum_range_succ]
  have : a ^ k * (a + 1) = a ^ k + a ^ (k + 1) := by ring
  omega

/-- The integer core of the pair inequality. -/
lemma delta_pair_core (a b α β X Y S F M : ℤ) (ha : 2 ≤ a) (hb : 2 ≤ b) (hα : 0 < α) (hβ : 0 < β)
    (hX : α * (a + 1) ≤ X) (hY : β * (b + 1) ≤ Y) (hSF : 2 * M ≤ S + F) (hF : F ≤ M)
    (hF0 : 0 ≤ F) :
    2 * (α * a * (β * b) * M) ≤
      (X * (Y * S) + α * (a - 1) * (β * (b - 1) * F) - 2 * (α * a * (β * b) * M)) * (a * b) := by
  have hS : 0 ≤ S := by linarith
  have hXY : α * (a + 1) * (β * (b + 1)) ≤ X * Y :=
    mul_le_mul hX hY (by nlinarith) (by nlinarith)
  have hXYS : α * (a + 1) * (β * (b + 1)) * S ≤ X * (Y * S) := by
    calc α * (a + 1) * (β * (b + 1)) * S ≤ X * Y * S := mul_le_mul_of_nonneg_right hXY hS
      _ = X * (Y * S) := by ring
  -- `(a+1)(b+1) S + (a-1)(b-1) F - 2 a b M - 2 M = (ab+1)(S+F-2M) + (a+b)(S-F) ≥ 0`
  have key : 2 * M ≤ (a + 1) * (b + 1) * S + (a - 1) * (b - 1) * F - 2 * (a * b * M) := by
    have e : (a + 1) * (b + 1) * S + (a - 1) * (b - 1) * F - 2 * (a * b * M) - 2 * M
        = (a * b + 1) * (S + F - 2 * M) + (a + b) * (S - F) := by ring
    have h1 : 0 ≤ (a * b + 1) * (S + F - 2 * M) :=
      mul_nonneg (by nlinarith) (by linarith)
    have h2 : 0 ≤ (a + b) * (S - F) := mul_nonneg (by linarith) (by linarith)
    linarith
  have hP : 0 < α * β := mul_pos hα hβ
  have h3 : α * β * (2 * M) ≤ α * β * ((a + 1) * (b + 1) * S + (a - 1) * (b - 1) * F
      - 2 * (a * b * M)) := mul_le_mul_of_nonneg_left key hP.le
  have h4 : 2 * (α * a * (β * b) * M) ≤ (α * (a + 1) * (β * (b + 1)) * S
      + α * (a - 1) * (β * (b - 1) * F) - 2 * (α * a * (β * b) * M)) * (a * b) := by
    have hab : 0 ≤ a * b := by nlinarith
    have := mul_le_mul_of_nonneg_right h3 hab
    linarith [this]
  have hab : 0 ≤ a * b := by nlinarith
  nlinarith [mul_le_mul_of_nonneg_right hXYS hab]

/-- **Pair inequality.** For distinct primes `a, b` dividing `N ≠ 0`,
`2 N ≤ (σ₁(N) + φ(N) - 2 N) · a b` (in `ℤ`). -/
lemma delta_pair {N a b : ℕ} (hN : N ≠ 0) (ha : a.Prime) (hb : b.Prime) (hab : a ≠ b)
    (haN : a ∣ N) (hbN : b ∣ N) :
    2 * (N : ℤ) ≤ ((σ 1 N : ℤ) + φ N - 2 * N) * (a * b) := by
  obtain ⟨i, N1, hna, rfl⟩ := Nat.exists_eq_pow_mul_and_not_dvd hN a ha.ne_one
  have hN1 : N1 ≠ 0 := by rintro rfl; simp at hN
  have hi : i ≠ 0 := by rintro rfl; simp at haN; exact hna haN
  have hcab : Nat.Coprime a b := (Nat.coprime_primes ha hb).2 hab
  have hbN1 : b ∣ N1 :=
    (Nat.Coprime.dvd_mul_left (Nat.Coprime.pow_left i hcab).symm).1 hbN
  obtain ⟨j, M, hnb, rfl⟩ := Nat.exists_eq_pow_mul_and_not_dvd hN1 b hb.ne_one
  have hM : M ≠ 0 := by rintro rfl; simp at hN1
  have hj : j ≠ 0 := by rintro rfl; simp at hbN1; exact hnb hbN1
  have c1 : Nat.Coprime (a ^ i) (b ^ j * M) :=
    Nat.Coprime.pow_left i ((Nat.Prime.coprime_iff_not_dvd ha).2 hna)
  have c2 : Nat.Coprime (b ^ j) M :=
    Nat.Coprime.pow_left j ((Nat.Prime.coprime_iff_not_dvd hb).2 hnb)
  obtain ⟨i, rfl⟩ : ∃ k, i = k + 1 := ⟨i - 1, by omega⟩
  obtain ⟨j, rfl⟩ : ∃ k, j = k + 1 := ⟨j - 1, by omega⟩
  rw [isMultiplicative_sigma.map_mul_of_coprime c1, isMultiplicative_sigma.map_mul_of_coprime c2,
    Nat.totient_mul c1, Nat.totient_mul c2, Nat.totient_prime_pow_succ ha,
    Nat.totient_prime_pow_succ hb]
  have hX := sigma_prime_pow_succ_ge ha i
  have hY := sigma_prime_pow_succ_ge hb j
  have hSF := two_mul_le_sigma_add_totient hM
  have hF := Nat.totient_le M
  have h := delta_pair_core (a : ℤ) b (a ^ i : ℕ) (b ^ j : ℕ) (σ 1 (a ^ (i + 1)) : ℕ)
    (σ 1 (b ^ (j + 1)) : ℕ) (σ 1 M : ℕ) (φ M : ℕ) M (by exact_mod_cast ha.two_le)
    (by exact_mod_cast hb.two_le) (by exact_mod_cast pow_pos ha.pos i)
    (by exact_mod_cast pow_pos hb.pos j) (by exact_mod_cast hX) (by exact_mod_cast hY)
    (by exact_mod_cast hSF) (by exact_mod_cast hF) (by positivity)
  push_cast [Nat.cast_sub ha.one_le, Nat.cast_sub hb.one_le, pow_succ] at h ⊢
  linarith [h]

/-- **Four prime factors.** If `N ≠ 0` has four pairwise distinct prime factors, then
`δ(N)^2 ≥ 4 N`, where `δ(N) = σ₁(N) + φ(N) - 2N`. -/
lemma four_primes_delta_sq {N a b c d : ℕ} (hN : N ≠ 0)
    (ha : a.Prime) (hb : b.Prime) (hc : c.Prime) (hd : d.Prime)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d) (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (haN : a ∣ N) (hbN : b ∣ N) (hcN : c ∣ N) (hdN : d ∣ N) :
    4 * (N : ℤ) ≤ ((σ 1 N : ℤ) + φ N - 2 * N) ^ 2 := by
  have e1 := delta_pair hN ha hb hab haN hbN
  have e2 := delta_pair hN hc hd hcd hcN hdN
  have cab := (Nat.coprime_primes ha hb).2 hab
  have cac := (Nat.coprime_primes ha hc).2 hac
  have cad := (Nat.coprime_primes ha hd).2 had
  have cbc := (Nat.coprime_primes hb hc).2 hbc
  have cbd := (Nat.coprime_primes hb hd).2 hbd
  have ccd := (Nat.coprime_primes hc hd).2 hcd
  have habd : a * b ∣ N := Nat.Coprime.mul_dvd_of_dvd_of_dvd cab haN hbN
  have hcdd : c * d ∣ N := Nat.Coprime.mul_dvd_of_dvd_of_dvd ccd hcN hdN
  have cabcd : Nat.Coprime (a * b) (c * d) :=
    Nat.Coprime.mul_left (Nat.Coprime.mul_right cac cad) (Nat.Coprime.mul_right cbc cbd)
  have hall : a * b * (c * d) ∣ N := Nat.Coprime.mul_dvd_of_dvd_of_dvd cabcd habd hcdd
  have hle : a * b * (c * d) ≤ N := Nat.le_of_dvd (Nat.pos_of_ne_zero hN) hall
  have zle : (a : ℤ) * b * (c * d) ≤ N := by exact_mod_cast hle
  have zN : (0 : ℤ) < N := by exact_mod_cast Nat.pos_of_ne_zero hN
  generalize ((σ 1 N : ℤ) + φ N - 2 * N) = δ at e1 e2 ⊢
  have z1 : (0 : ℤ) ≤ a * b := by positivity
  have z2 : (0 : ℤ) ≤ c * d := by positivity
  have hδ0 : 0 ≤ δ * (a * b) := by linarith
  have h1 : 2 * (N : ℤ) * (2 * N) ≤ (δ * (a * b)) * (δ * (c * d)) :=
    mul_le_mul e1 e2 (by linarith) hδ0
  have h2 : δ ^ 2 * ((a : ℤ) * b * (c * d)) ≤ δ ^ 2 * N :=
    mul_le_mul_of_nonneg_left zle (sq_nonneg δ)
  have h3 : 4 * (N : ℤ) * N ≤ δ ^ 2 * N := by
    have : (δ * (a * b)) * (δ * (c * d)) = δ ^ 2 * ((a : ℤ) * b * (c * d)) := by ring
    nlinarith
  nlinarith

/-- Integer core of `q ≥ 3 p^2`: for `p, q ≥ 5`, `4 (p^2 q + 12) ≤ (2p + q + 1)^2` forces
`q ≥ 3 p^2`. The identity used is
`(2p+q+1)^2 - 4(p^2 q + 12) = (q-5)(q-3p^2) - (p^2-4p-7) q - 11p^2 + 4p - 47`. -/
lemma q_ge_three_p_sq_core (p q : ℤ) (hp : 5 ≤ p) (hq : 5 ≤ q)
    (h : 4 * (p ^ 2 * q + 12) ≤ (2 * p + q + 1) ^ 2) : 3 * p ^ 2 ≤ q := by
  by_contra hcon
  push_neg at hcon
  have hneg : (q - 5) * (q - 3 * p ^ 2) ≤ 0 :=
    mul_nonpos_of_nonneg_of_nonpos (by linarith) (by linarith)
  have e : (2 * p + q + 1) ^ 2 - 4 * (p ^ 2 * q + 12)
      = (q - 5) * (q - 3 * p ^ 2) - (p ^ 2 - 4 * p - 7) * q - 11 * p ^ 2 + 4 * p - 47 := by ring
  rcases (show p = 5 ∨ 6 ≤ p by omega) with h5 | h6
  · subst h5; nlinarith
  · have hc : 5 ≤ p ^ 2 - 4 * p - 7 := by nlinarith
    have := mul_le_mul_of_nonneg_right hc (by linarith : (0 : ℤ) ≤ q)
    nlinarith

/-- **ω(N) ≥ 4 constraints.** Under both jumps at `n = p^2 q`, if `N = n + 12` has four pairwise
distinct prime factors, then `q ≥ 3 p^2` and every prime factor `r` of `N` satisfies `p < r`. -/
theorem omega4_constraints {p q a b c d : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q))
    (ha : a.Prime) (hb : b.Prime) (hc : c.Prime) (hd : d.Prime)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d) (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (haN : a ∣ p ^ 2 * q + 12) (hbN : b ∣ p ^ 2 * q + 12) (hcN : c ∣ p ^ 2 * q + 12)
    (hdN : d ∣ p ^ 2 * q + 12) :
    3 * p ^ 2 ≤ q ∧ ∀ r : ℕ, r.Prime → r ∣ p ^ 2 * q + 12 → p < r := by
  obtain ⟨hp5, hq5, _, _, hcop⟩ := preamble hp hq hpq hJ
  obtain ⟨j1, j2⟩ := jumps_p2q_int hp hq hpq hJ
  have hsq := four_primes_delta_sq (by omega) ha hb hc hd hab hac had hbc hbd hcd haN hbN hcN hdN
  rw [j1, j2] at hsq
  have zp : (5 : ℤ) ≤ p := by exact_mod_cast hp5
  have zq : (5 : ℤ) ≤ q := by exact_mod_cast hq5
  have hq3 : 3 * p ^ 2 ≤ q := by
    have h' : 4 * ((p : ℤ) ^ 2 * q + 12) ≤ (2 * p + q + 1) ^ 2 := by
      have e : ((p : ℤ) ^ 2 + p + 1) * (q + 1) + 12 + (p * (p - 1) * (q - 1) + 12)
          - 2 * ((p ^ 2 * q + 12 : ℕ) : ℤ) = 2 * p + q + 1 := by push_cast; ring
      rw [e] at hsq; push_cast at hsq; linarith
    exact_mod_cast q_ge_three_p_sq_core p q zp zq h'
  refine ⟨hq3, fun r hr hrN => ?_⟩
  by_contra hcon
  push_neg at hcon
  have hrp : r ≠ p := by
    rintro rfl
    have h1 := Nat.Coprime.coprime_dvd_right (⟨6 * q, by ring⟩ : r ∣ 6 * r * q)
      (Nat.Coprime.coprime_dvd_left hrN hcop)
    exact hr.one_lt.ne' ((Nat.coprime_self r).1 h1)
  have hrlt : r + 1 ≤ p := by omega
  have htot := totient_add_div_le hr hrN
  have hlt := Nat.lt_mul_div_succ (p ^ 2 * q + 12) hr.pos
  generalize ht : (p ^ 2 * q + 12) / r = t at htot hlt
  have zt : (t : ℤ) ≤ p * (p + q - 1) := by
    have : (φ (p ^ 2 * q + 12) : ℤ) + t ≤ ((p ^ 2 * q + 12 : ℕ) : ℤ) := by exact_mod_cast htot
    rw [j1] at this; push_cast at this; linarith
  have zlt : ((p ^ 2 * q + 12 : ℕ) : ℤ) < r * (t + 1) := by exact_mod_cast hlt
  push_cast at zlt
  have zr : (r : ℤ) ≤ p - 1 := by
    have : ((r + 1 : ℕ) : ℤ) ≤ p := by exact_mod_cast hrlt
    push_cast at this; linarith
  have zr0 : (0 : ℤ) ≤ r := by positivity
  have zt0 : (0 : ℤ) ≤ t := by positivity
  have hb1 : (r : ℤ) * (t + 1) ≤ (p - 1) * (p * (p + q - 1) + 1) :=
    mul_le_mul zr (by linarith) (by linarith) (by linarith)
  have zq3 : (3 : ℤ) * p ^ 2 ≤ q := by exact_mod_cast hq3
  nlinarith

end P2qJumps
