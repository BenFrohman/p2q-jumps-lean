/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Tactic
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import P2qJumps.Arith

/-!
# Preamble facts: `p, q ≥ 5`, `N` odd, `N` not a square, `gcd(N, 6pq) = 1`

Paper, Proposition "2 or 3 divides n", Corollary "gcd" and Proposition "N is not a square".
-/

namespace P2qJumps

open Nat ArithmeticFunction Finset
open scoped ArithmeticFunction.sigma

/-- If a prime `r` divides `m > 0`, then `φ m + m / r ≤ m` (the multiples `0, r, …` of `r`
below `m` are not coprime to `m`). -/
lemma totient_add_div_le {m r : ℕ} (hr : r.Prime) (hrm : r ∣ m) : φ m + m / r ≤ m := by
  classical
  rw [Nat.totient_eq_card_coprime]
  set S := (range m).filter m.Coprime with hS
  set T := (range (m / r)).image (fun j => r * j) with hT
  have hTc : T.card = m / r := by
    rw [hT, Finset.card_image_of_injective _ (fun a b h => Nat.eq_of_mul_eq_mul_left hr.pos h)]
    simp
  have hdisj : Disjoint S T := by
    rw [Finset.disjoint_left]
    intro a ha haT
    rw [hS, Finset.mem_filter] at ha
    obtain ⟨j, _, rfl⟩ := Finset.mem_image.1 haT
    have h1 : r ∣ Nat.gcd m (r * j) := Nat.dvd_gcd hrm (dvd_mul_right r j)
    rw [Nat.Coprime.gcd_eq_one ha.2] at h1
    exact hr.one_lt.ne' (Nat.dvd_one.1 h1)
  have hsub : S ∪ T ⊆ range m := by
    intro a ha
    rcases Finset.mem_union.1 ha with h | h
    · exact (Finset.mem_filter.1 h).1
    · obtain ⟨j, hj, rfl⟩ := Finset.mem_image.1 h
      rw [Finset.mem_range] at hj ⊢
      calc r * j < r * (m / r) := (Nat.mul_lt_mul_left hr.pos).2 hj
        _ ≤ m := Nat.mul_div_le m r
  have := Finset.card_le_card hsub
  rw [Finset.card_union_of_disjoint hdisj, hTc, Finset.card_range] at this
  exact this

/-- A composite `m > 1` with `φ m + d ≥ m` (i.e. `A(m) ≤ d`) has a prime factor `r` with
`r * r ≤ m` and `m < r * (d + 1)`. -/
lemma composite_small_A {m d : ℕ} (hm : 1 < m) (hnp : ¬ m.Prime) (hA : m ≤ φ m + d) :
    m.minFac * m.minFac ≤ m ∧ m < m.minFac * (d + 1) := by
  have hr := Nat.minFac_prime (by omega : m ≠ 1)
  have hsq : m.minFac ^ 2 ≤ m := Nat.minFac_sq_le_self (by omega) hnp
  have h1 := totient_add_div_le hr (Nat.minFac_dvd m)
  have h2 : m / m.minFac ≤ d := by omega
  have h3 : m < m.minFac * (m / m.minFac + 1) := Nat.lt_mul_div_succ m hr.pos
  refine ⟨by nlinarith, lt_of_lt_of_le h3 (Nat.mul_le_mul_left _ (by omega))⟩

/-- `σ₁` of an odd square is odd. -/
lemma sigma_odd_of_odd_square {N : ℕ} (hodd : Odd N) (hsq : IsSquare N) : Odd (σ 1 N) := by
  classical
  obtain ⟨m, rfl⟩ := hsq
  have hm0 : m ≠ 0 := by rintro rfl; simp at hodd
  have hN0 : m * m ≠ 0 := mul_ne_zero hm0 hm0
  -- `σ₁ N ≡ #divisors N (mod 2)`, since every divisor of an odd number is odd.
  have h1 : σ 1 (m * m) % 2 = (m * m).divisors.card % 2 := by
    rw [sigma_one_apply, Finset.sum_nat_mod, Finset.card_eq_sum_ones, Finset.sum_nat_mod]
    congr 1
    apply Finset.sum_congr rfl
    intro d hd
    have hdo : Odd d := Odd.of_dvd_nat hodd (Nat.dvd_of_mem_divisors hd)
    rw [Nat.odd_iff.1 hdo]
  -- `#divisors (m^2) = ∏ (2 e + 1)` is odd.
  have h2 : (m * m).divisors.card % 2 = 1 := by
    rw [Nat.card_divisors hN0, Finset.prod_nat_mod]
    rw [Finset.prod_congr rfl (g := fun _ => 1)]
    · simp
    intro p _
    rw [Nat.factorization_mul hm0 hm0]
    simp only [Finsupp.coe_add, Pi.add_apply]
    omega
  rw [Nat.odd_iff, h1, h2]

/-- Case `p = 2` of Proposition "2 or 3 divides n". -/
lemma p_ne_two {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q)) :
    p ≠ 2 := by
  rintro rfl
  obtain ⟨j1, _⟩ := jumps_p2q_int hp hq hpq hJ
  have h := totient_add_div_le Nat.prime_two (show 2 ∣ 2 ^ 2 * q + 12 from ⟨2 * q + 6, by ring⟩)
  have hq1 := hq.one_le
  have hdiv : (2 ^ 2 * q + 12) / 2 = 2 * q + 6 := by omega
  rw [hdiv] at h
  have : (φ (2 ^ 2 * q + 12) : ℤ) ≤ 2 * q + 6 := by
    have : φ (2 ^ 2 * q + 12) ≤ 2 * q + 6 := by omega
    exact_mod_cast this
  norm_num at j1 this
  linarith

/-- Case `q = 2` (with `p` odd). -/
lemma q_ne_two {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q))
    (hp2 : p ≠ 2) : q ≠ 2 := by
  rintro rfl
  obtain ⟨j1, _⟩ := jumps_p2q_int hp hq hpq hJ
  have hpodd : Odd p := hp.odd_of_ne_two hp2
  have hp3 : 3 ≤ p := by have := hp.two_le; rcases hpodd with ⟨k, hk⟩; omega
  set s := p ^ 2 + 6 with hs
  have hsodd : Odd s := by
    rw [hs]; exact (hpodd.pow).add_even (by decide)
  have hN : p ^ 2 * 2 + 12 = 2 * s := by rw [hs]; ring
  have hcop : Nat.Coprime 2 s := (Nat.coprime_two_left).2 hsodd
  rw [hN, Nat.totient_mul hcop, Nat.totient_two, one_mul] at j1
  -- `φ(s) = p^2 - p + 12`, i.e. `A(s) = p - 6`.
  have hphi : φ s + p = s + 6 := by
    have : (φ s : ℤ) + p = s + 6 := by rw [j1, hs]; push_cast; ring
    exact_mod_cast this
  have hle := Nat.totient_le s
  have hp7 : 7 ≤ p := by
    by_contra h
    have : p = 3 ∨ p = 5 := by rcases hpodd with ⟨k, hk⟩; omega
    omega
  by_cases hsp : s.Prime
  · rw [Nat.totient_prime hsp] at hphi
    have hs1 : 1 ≤ s := hsp.one_le
    have : p = 7 := by omega
    subst this
    exact absurd hsp (by norm_num [hs])
  · have hs1 : 1 < s := by rw [hs]; nlinarith
    obtain ⟨h1, h2⟩ := composite_small_A hs1 hsp (d := p - 6) (by omega)
    set r := s.minFac
    have hr : r < p - 5 := by
      by_contra h; push_neg at h
      have : r * (p - 6 + 1) ≤ r * r := Nat.mul_le_mul_left r (by omega)
      omega
    have : s < (p - 5) * (p - 5) := by
      calc s < r * (p - 6 + 1) := h2
        _ ≤ (p - 5) * (p - 5) := Nat.mul_le_mul (by omega) (by omega)
    have hp5 : (p - 5) * (p - 5) ≤ p ^ 2 := by
      calc (p - 5) * (p - 5) ≤ p * p := Nat.mul_le_mul (by omega) (by omega)
        _ = p ^ 2 := by ring
    omega

/-- Case `p = 3`. -/
lemma p_ne_three {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q)) :
    p ≠ 3 := by
  rintro rfl
  obtain ⟨j1, j2⟩ := jumps_p2q_int hp hq hpq hJ
  set u := 3 * q + 4 with hu
  have hN : 3 ^ 2 * q + 12 = 3 * u := by rw [hu]; ring
  have hcop : Nat.Coprime 3 u :=
    (Nat.Prime.coprime_iff_not_dvd Nat.prime_three).2 (by omega)
  rw [hN, Nat.totient_mul hcop, Nat.totient_prime Nat.prime_three] at j1
  rw [hN, isMultiplicative_sigma.map_mul_of_coprime hcop, sigma_one_prime' Nat.prime_three] at j2
  -- `φ(u) = u - 1`, so `u` is prime.
  have hphi : φ u + 1 = u := by
    have : (φ u : ℤ) + 1 = u := by
      push_cast at j1; rw [hu]; push_cast; linarith
    exact_mod_cast this
  have hu0 : 0 < u := by omega
  have hup : u.Prime := (Nat.totient_eq_iff_prime hu0).1 (by omega)
  rw [sigma_one_prime' hup] at j2
  push_cast at j2
  rw [hu] at j2; push_cast at j2
  have hq0 : (0 : ℤ) ≤ q := by positivity
  linarith

/-- Case `q = 3` (with `p ≥ 5`). -/
lemma q_ne_three {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q))
    (hp2 : p ≠ 2) (hp3 : p ≠ 3) : q ≠ 3 := by
  rintro rfl
  obtain ⟨j1, _⟩ := jumps_p2q_int hp hq hpq hJ
  have hp5 : 5 ≤ p := by
    have := hp.two_le
    by_contra h; push_neg at h
    interval_cases p <;> first | omega | exact absurd hp (by norm_num)
  have hp3' : ¬ 3 ∣ p := fun h => hp3 ((Nat.prime_dvd_prime_iff_eq Nat.prime_three hp).1 h).symm
  set t := p ^ 2 + 4 with ht
  have hN : p ^ 2 * 3 + 12 = 3 * t := by rw [ht]; ring
  have ht3 : t % 3 = 2 := by
    have : p % 3 = 1 ∨ p % 3 = 2 := by omega
    rw [ht, Nat.add_mod, Nat.pow_mod]
    rcases this with h | h <;> rw [h]
  have hcop : Nat.Coprime 3 t :=
    (Nat.Prime.coprime_iff_not_dvd Nat.prime_three).2 (by omega)
  rw [hN, Nat.totient_mul hcop, Nat.totient_prime Nat.prime_three] at j1
  -- `φ(t) = p^2 - p + 6`, i.e. `A(t) = t - φ(t) = p - 2`.
  have hphi : φ t + p = t + 2 := by
    have : (φ t : ℤ) + p = t + 2 := by
      push_cast at j1; rw [ht]; push_cast; linarith
    exact_mod_cast this
  have hle := Nat.totient_le t
  by_cases htp : t.Prime
  · rw [Nat.totient_prime htp] at hphi
    have := htp.one_le
    omega
  · have ht1 : 1 < t := by rw [ht]; nlinarith
    obtain ⟨h1, h2⟩ := composite_small_A ht1 htp (d := p - 2) (by omega)
    set r := t.minFac
    have hr : r < p - 1 := by
      by_contra h; push_neg at h
      have : r * (p - 2 + 1) ≤ r * r := Nat.mul_le_mul_left r (by omega)
      omega
    have : t < (p - 1) * (p - 1) := by
      calc t < r * (p - 2 + 1) := h2
        _ ≤ (p - 1) * (p - 1) := Nat.mul_le_mul (by omega) (by omega)
    have hp5' : (p - 1) * (p - 1) ≤ p ^ 2 := by
      calc (p - 1) * (p - 1) ≤ p * p := Nat.mul_le_mul (by omega) (by omega)
        _ = p ^ 2 := by ring
    omega

/-- **Preamble facts** (paper Corollary "gcd" and Proposition "N is not a square"): under both
jumps at `n = p^2 q`, `p, q ≥ 5`, `N = n + 12` is odd, `N` is not a square, and
`gcd(N, 6pq) = 1`. -/
theorem preamble {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q)) :
    5 ≤ p ∧ 5 ≤ q ∧ Odd (p ^ 2 * q + 12) ∧ ¬ IsSquare (p ^ 2 * q + 12) ∧
      Nat.Coprime (p ^ 2 * q + 12) (6 * p * q) := by
  have hp2 := p_ne_two hp hq hpq hJ
  have hq2 := q_ne_two hp hq hpq hJ hp2
  have hp3 := p_ne_three hp hq hpq hJ
  have hq3 := q_ne_three hp hq hpq hJ hp2 hp3
  have five : ∀ {x : ℕ}, x.Prime → x ≠ 2 → x ≠ 3 → 5 ≤ x := by
    intro x hx h2 h3
    have := hx.two_le
    by_contra h; push_neg at h
    interval_cases x <;> first | omega | exact absurd hx (by norm_num)
  have hp5 := five hp hp2 hp3
  have hq5 := five hq hq2 hq3
  have hpo : Odd p := hp.odd_of_ne_two hp2
  have hqo : Odd q := hq.odd_of_ne_two hq2
  have hodd : Odd (p ^ 2 * q + 12) := (hpo.pow.mul hqo).add_even (by decide)
  refine ⟨hp5, hq5, hodd, ?_, ?_⟩
  · -- `N` not a square: then `σ(N)` would be odd, but `σ(n) + 12` is even.
    intro hsq
    have hs := sigma_odd_of_odd_square hodd hsq
    obtain ⟨_, j2⟩ := jumps_p2q_int hp hq hpq hJ
    obtain ⟨b, hb⟩ := hs
    obtain ⟨k, hk⟩ := hqo
    have e2 : (σ 1 (p ^ 2 * q + 12) : ℤ) = 2 * b + 1 := by exact_mod_cast hb
    have e3 : (q : ℤ) = 2 * k + 1 := by exact_mod_cast hk
    rw [e2, e3] at j2
    have : (2 * b + 1 : ℤ) = 2 * (((p : ℤ) ^ 2 + p + 1) * (k + 1) + 6) := by rw [j2]; ring
    omega
  · -- `gcd(N, 6pq) = 1`.
    have c2 : Nat.Coprime (p ^ 2 * q + 12) 2 :=
      Nat.Coprime.symm ((Nat.coprime_two_left).2 hodd)
    have hp3' : ¬ 3 ∣ p := fun h => hp3 ((Nat.prime_dvd_prime_iff_eq Nat.prime_three hp).1 h).symm
    have hq3' : ¬ 3 ∣ q := fun h => hq3 ((Nat.prime_dvd_prime_iff_eq Nat.prime_three hq).1 h).symm
    have c3 : Nat.Coprime (p ^ 2 * q + 12) 3 := by
      apply Nat.Coprime.symm
      apply (Nat.Prime.coprime_iff_not_dvd Nat.prime_three).2
      intro h
      have h' : 3 ∣ p ^ 2 * q := (Nat.dvd_add_left (by norm_num : 3 ∣ 12)).1 h
      rcases (Nat.Prime.dvd_mul Nat.prime_three).1 h' with h'' | h''
      · exact hp3' (Nat.prime_three.dvd_of_dvd_pow h'')
      · exact hq3' h''
    have cx : ∀ {x : ℕ}, x.Prime → 5 ≤ x → x ∣ p ^ 2 * q → Nat.Coprime (p ^ 2 * q + 12) x := by
      intro x hx hx5 hxn
      apply Nat.Coprime.symm
      apply (Nat.Prime.coprime_iff_not_dvd hx).2
      intro h
      have h12 : x ∣ 12 := (Nat.dvd_add_right hxn).1 h
      have := Nat.le_of_dvd (by norm_num) h12
      interval_cases x <;> first | omega | exact absurd hx (by norm_num)
    have cp := cx hp hp5 (Dvd.dvd.mul_right (dvd_pow_self p (by norm_num)) q)
    have cq := cx hq hq5 (dvd_mul_left q _)
    have c6 : Nat.Coprime (p ^ 2 * q + 12) 6 := by
      rw [show (6 : ℕ) = 2 * 3 by norm_num]; exact Nat.Coprime.mul_right c2 c3
    exact Nat.Coprime.mul_right (Nat.Coprime.mul_right c6 cp) cq

end P2qJumps
