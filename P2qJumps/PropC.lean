/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.TheoremsBE
import P2qJumps.ClosedLedger

/-!
# P2qJumps.PropC

The structural clauses of Proposition C (`prop:C`). With a repeated prime, `K = N / rad N`
satisfies `K > 1`, `K ∣ L(p)` and `gcd(K, 6p) = 1`. For any divisor `M` of `N` with
`N = M s` (`j = 1`) or `N = M s t` (`j = 2`), the jumps are linear systems in `(s, q)`,
respectively `(q, S, Π) = (q, s + t, s t)`, whose determinants are nonzero because `p ∤ M`
(and, for `j = 2`, `p ∤ φ(N)`). Each system therefore has exactly one rational solution.
The enumeration for `p < 10^6` is not part of this file.
-/

namespace P2qJumps

open Nat ArithmeticFunction
open scoped ArithmeticFunction.sigma

/-- `p ∤ M` for every divisor `M` of `N`. -/
private lemma p_not_dvd_of_dvd_N {p q M : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hM : M ∣ p ^ 2 * q + 12) : ¬ (p : ℤ) ∣ M := by
  obtain ⟨-, -, -, -, hcop⟩ := preamble hp hq hpq hJ
  intro h
  have h' : p ∣ M := Int.natCast_dvd_natCast.1 h
  have hpN : p ∣ p ^ 2 * q + 12 := h'.trans hM
  have hp6 : p ∣ 6 * p * q := ⟨6 * q, by ring⟩
  have hg := Nat.dvd_gcd hpN hp6
  rw [Nat.Coprime.gcd_eq_one hcop] at hg
  exact hp.one_lt.ne' (Nat.dvd_one.1 hg)

/-- **Proposition C**, first clause: with a repeated prime, `K = N / rad N` has `K > 1`,
`K ∣ L(p)` and `gcd(K, 6p) = 1`. -/
theorem propC_K {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hR : ∃ r, r.Prime ∧ r ^ 2 ∣ p ^ 2 * q + 12) :
    1 < (p ^ 2 * q + 12) / P2qStructural.rad (p ^ 2 * q + 12) ∧
      (((p ^ 2 * q + 12) / P2qStructural.rad (p ^ 2 * q + 12) : ℕ) : ℤ) ∣
        (p : ℤ) ^ 3 - p ^ 2 - 12 ∧
      Nat.Coprime ((p ^ 2 * q + 12) / P2qStructural.rad (p ^ 2 * q + 12)) (6 * p) := by
  obtain ⟨-, -, -, -, hcop⟩ := preamble hp hq hpq hJ
  obtain ⟨r, hr, hr2⟩ := hR
  set N := p ^ 2 * q + 12 with hNdef
  have hN0 : N ≠ 0 := by omega
  have hrK : r ∣ N / P2qStructural.rad N := by
    have := pow_dvd_K (e := 1) hN0 hr hr2; rwa [pow_one] at this
  have hKN : N / P2qStructural.rad N ∣ N :=
    Nat.div_dvd_of_dvd (by unfold P2qStructural.rad; exact Nat.prod_primeFactors_dvd N)
  have hK0 : N / P2qStructural.rad N ≠ 0 := by
    intro h; rw [h] at hKN; exact hN0 (Nat.eq_zero_of_zero_dvd hKN)
  refine ⟨lt_of_lt_of_le hr.one_lt (Nat.le_of_dvd (Nat.pos_of_ne_zero hK0) hrK),
    lemmaK hp hq hpq hJ, ?_⟩
  exact Nat.Coprime.coprime_dvd_left hKN
    (Nat.Coprime.coprime_dvd_right ⟨q, by ring⟩ hcop)

/-- **Proposition C**, `j = 1`: for `N = M s` (`s` prime, `gcd(M, s) = 1`) the jumps are the
linear system in `(s, q)` below; its determinant `p^2 φ(M) - p(p-1) M` is nonzero since
`p ∤ M`, so `(s, q)` is its only rational solution. -/
theorem propC_j1 {p q M s : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hs : s.Prime) (hMs : Nat.Coprime M s)
    (hN : p ^ 2 * q + 12 = M * s) :
    ((M : ℤ) * s - p ^ 2 * q = 12 ∧
      (φ M : ℤ) * s - p * (p - 1) * q = φ M - p * (p - 1) + 12 ∧
      (σ 1 M : ℤ) * s - (p ^ 2 + p + 1) * q = (p ^ 2 + p + 1) + 12 - σ 1 M) ∧
    (p : ℤ) ^ 2 * φ M - p * (p - 1) * M ≠ 0 ∧
    ∀ x y : ℚ, (M : ℚ) * x - p ^ 2 * y = 12 →
      (φ M : ℚ) * x - p * (p - 1) * y = φ M - p * (p - 1) + 12 → x = s ∧ y = q := by
  obtain ⟨j1, j2⟩ := jumps_p2q_int hp hq hpq hJ
  rw [hN, Nat.totient_mul hMs, Nat.totient_prime hs] at j1
  rw [hN, isMultiplicative_sigma.map_mul_of_coprime hMs, sigma_one_prime' hs] at j2
  have hs1 : 1 ≤ s := hs.one_lt.le
  push_cast [hs1] at j1 j2
  have e0 : (M : ℤ) * s - p ^ 2 * q = 12 := by
    have : ((p ^ 2 * q + 12 : ℕ) : ℤ) = ((M * s : ℕ) : ℤ) := by rw [hN]
    push_cast at this; linarith
  have e1 : (φ M : ℤ) * s - p * (p - 1) * q = φ M - p * (p - 1) + 12 := by linear_combination j1
  have e2 : (σ 1 M : ℤ) * s - (p ^ 2 + p + 1) * q = (p ^ 2 + p + 1) + 12 - σ 1 M := by
    linear_combination j2
  have hpM : ¬ (p : ℤ) ∣ M := p_not_dvd_of_dvd_N hp hq hpq hJ ⟨s, hN⟩
  have hdet : (p : ℤ) ^ 2 * φ M - p * (p - 1) * M ≠ 0 := by
    intro h0
    apply hpM
    have h1 : (p : ℤ) * (p * φ M - (p - 1) * M) = 0 := by linear_combination h0
    have h2 := (mul_eq_zero.1 h1).resolve_left (by exact_mod_cast hp.ne_zero)
    exact ⟨M - φ M, by linear_combination h2⟩
  refine ⟨⟨e0, e1, e2⟩, hdet, ?_⟩
  intro x y hx hy
  have e0' : (M : ℚ) * s - p ^ 2 * q = 12 := by exact_mod_cast e0
  have e1' : (φ M : ℚ) * s - p * (p - 1) * q = φ M - p * (p - 1) + 12 := by exact_mod_cast e1
  have hdetQ : (p : ℚ) ^ 2 * φ M - p * (p - 1) * M ≠ 0 := by exact_mod_cast hdet
  have hp0 : (p : ℚ) ≠ 0 := by exact_mod_cast hp.ne_zero
  have hxs : x = s := by
    have : ((p : ℚ) ^ 2 * φ M - p * (p - 1) * M) * (x - s) = 0 := by
      linear_combination (p : ℚ) ^ 2 * (hy - e1') - p * (p - 1) * (hx - e0')
    exact sub_eq_zero.1 ((mul_eq_zero.1 this).resolve_left hdetQ)
  refine ⟨hxs, ?_⟩
  have : (p : ℚ) ^ 2 * (y - q) = 0 := by rw [hxs] at hx; linear_combination e0' - hx
  exact sub_eq_zero.1 ((mul_eq_zero.1 this).resolve_left (pow_ne_zero 2 hp0))

/-- **Proposition C**, `j = 2`: for `N = M s t` (`s ≠ t` primes, `gcd(M, s t) = 1`) the jumps
are the linear system in `(q, S, Π) = (q, s + t, s t)` below. Its determinant
`M (p(p-1) σ(M) + (p^2+p+1) φ(M)) - 2 p^2 φ(M) σ(M)` is nonzero: otherwise `p ∣ M φ(M)`,
while `p ∤ M` and `p ∤ φ(N)`. So `(q, S, Π)` is its only rational solution. -/
theorem propC_j2 {p q M s t : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hs : s.Prime) (ht : t.Prime) (hst : s ≠ t)
    (hMst : Nat.Coprime M (s * t)) (hN : p ^ 2 * q + 12 = M * s * t) :
    ((M : ℤ) * (s * t) - p ^ 2 * q = 12 ∧
      (φ M : ℤ) * (s * t) - φ M * (s + t) - p * (p - 1) * q = 12 - p * (p - 1) - φ M ∧
      (σ 1 M : ℤ) * (s * t) + σ 1 M * (s + t) - (p ^ 2 + p + 1) * q =
        (p ^ 2 + p + 1) + 12 - σ 1 M) ∧
    (M : ℤ) * (p * (p - 1) * σ 1 M + (p ^ 2 + p + 1) * φ M) - 2 * p ^ 2 * φ M * σ 1 M ≠ 0 ∧
    ∀ x S P : ℚ, (M : ℚ) * P - p ^ 2 * x = 12 →
      (φ M : ℚ) * P - φ M * S - p * (p - 1) * x = 12 - p * (p - 1) - φ M →
      (σ 1 M : ℚ) * P + σ 1 M * S - (p ^ 2 + p + 1) * x = (p ^ 2 + p + 1) + 12 - σ 1 M →
      x = q ∧ S = s + t ∧ P = s * t := by
  obtain ⟨hp5, -, -, -, -⟩ := preamble hp hq hpq hJ
  obtain ⟨j1, j2⟩ := jumps_p2q_int hp hq hpq hJ
  have hcst : Nat.Coprime s t := (Nat.coprime_primes hs ht).2 hst
  have hN' : p ^ 2 * q + 12 = M * (s * t) := by rw [hN, mul_assoc]
  have hφN : φ (p ^ 2 * q + 12) = φ M * ((s - 1) * (t - 1)) := by
    rw [hN', Nat.totient_mul hMst, Nat.totient_mul hcst, Nat.totient_prime hs,
      Nat.totient_prime ht]
  rw [hφN] at j1
  rw [hN', isMultiplicative_sigma.map_mul_of_coprime hMst,
    isMultiplicative_sigma.map_mul_of_coprime hcst, sigma_one_prime' hs,
    sigma_one_prime' ht] at j2
  have hs1 : 1 ≤ s := hs.one_lt.le
  have ht1 : 1 ≤ t := ht.one_lt.le
  push_cast [hs1, ht1] at j1 j2
  have e0 : (M : ℤ) * (s * t) - p ^ 2 * q = 12 := by
    have : ((p ^ 2 * q + 12 : ℕ) : ℤ) = ((M * (s * t) : ℕ) : ℤ) := by rw [hN']
    push_cast at this; linarith
  have e1 : (φ M : ℤ) * (s * t) - φ M * (s + t) - p * (p - 1) * q = 12 - p * (p - 1) - φ M := by
    linear_combination j1
  have e2 : (σ 1 M : ℤ) * (s * t) + σ 1 M * (s + t) - (p ^ 2 + p + 1) * q =
      (p ^ 2 + p + 1) + 12 - σ 1 M := by linear_combination j2
  have hpM : ¬ (p : ℤ) ∣ M := p_not_dvd_of_dvd_N hp hq hpq hJ ⟨s * t, hN'⟩
  -- `p ∤ φ(M)`: otherwise `p ∣ φ(N) = p(p-1)(q-1) + 12`, so `p ∣ 12`.
  have hpf : ¬ (p : ℤ) ∣ φ M := by
    rintro ⟨c, hc⟩
    have h12 : (p : ℤ) ∣ 12 :=
      ⟨c * ((s - 1) * (t - 1)) - (p - 1) * (q - 1), by rw [hc] at j1; linear_combination -j1⟩
    have : p ∣ 12 := by exact_mod_cast h12
    have hle := Nat.le_of_dvd (by norm_num) this
    interval_cases p <;> first | omega | exact absurd hp (by norm_num)
  have hdet : (M : ℤ) * (p * (p - 1) * σ 1 M + (p ^ 2 + p + 1) * φ M) -
      2 * p ^ 2 * φ M * σ 1 M ≠ 0 := by
    intro h0
    have hMf : (p : ℤ) ∣ M * φ M :=
      ⟨-(M * (p - 1) * σ 1 M + M * (p + 1) * φ M - 2 * p * φ M * σ 1 M),
        by linear_combination h0⟩
    rcases (Int.Prime.dvd_mul' hp hMf) with h | h
    · exact hpM h
    · exact hpf h
  refine ⟨⟨e0, e1, e2⟩, hdet, ?_⟩
  intro x S P hx hS hP
  have e0' : (M : ℚ) * (s * t) - p ^ 2 * q = 12 := by exact_mod_cast e0
  have e1' : (φ M : ℚ) * (s * t) - φ M * (s + t) - p * (p - 1) * q = 12 - p * (p - 1) - φ M := by
    exact_mod_cast e1
  have e2' : (σ 1 M : ℚ) * (s * t) + σ 1 M * (s + t) - (p ^ 2 + p + 1) * q =
      (p ^ 2 + p + 1) + 12 - σ 1 M := by exact_mod_cast e2
  have hdetQ : (M : ℚ) * (p * (p - 1) * σ 1 M + (p ^ 2 + p + 1) * φ M) -
      2 * p ^ 2 * φ M * σ 1 M ≠ 0 := by exact_mod_cast hdet
  have hp0 : (p : ℚ) ≠ 0 := by exact_mod_cast hp.ne_zero
  have hM0 : M ≠ 0 := by rintro rfl; simp at hN
  have hf0 : (φ M : ℚ) ≠ 0 := by exact_mod_cast (Nat.totient_pos.2 (Nat.pos_of_ne_zero hM0)).ne'
  have hPst : P = s * t := by
    have : ((M : ℚ) * (p * (p - 1) * σ 1 M + (p ^ 2 + p + 1) * φ M) -
        2 * p ^ 2 * φ M * σ 1 M) * (P - s * t) = 0 := by
      linear_combination (p * (p - 1) * (σ 1 M : ℚ) + (p ^ 2 + p + 1) * φ M) * (hx - e0') -
        (p : ℚ) ^ 2 * (σ 1 M * (hS - e1') + φ M * (hP - e2'))
    exact sub_eq_zero.1 ((mul_eq_zero.1 this).resolve_left hdetQ)
  have hxq : x = q := by
    have : (p : ℚ) ^ 2 * (x - q) = 0 := by rw [hPst] at hx; linear_combination e0' - hx
    exact sub_eq_zero.1 ((mul_eq_zero.1 this).resolve_left (pow_ne_zero 2 hp0))
  refine ⟨hxq, ?_, hPst⟩
  have : (φ M : ℚ) * (S - (s + t)) = 0 := by
    rw [hPst, hxq] at hS; linear_combination e1' - hS
  exact sub_eq_zero.1 ((mul_eq_zero.1 this).resolve_left hf0)

end P2qJumps
