/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib

/-!
# Structural lemmas for the `p^2 q` case of length-12 totient/sigma jumps

Setting: `p ≠ q` primes, `n = p^2 q`, `N = n + 12`,
`φ(N) = φ(n) + 12` and `σ₁(N) = σ₁(n) + 12`, using Mathlib's `Nat.totient` and
`ArithmeticFunction.sigma 1`. All bridges from these functions are proved here.
-/

namespace P2qStructural

open ArithmeticFunction
open scoped ArithmeticFunction.sigma ArithmeticFunction.Moebius

/-- `L(p) = p^3 - p^2 - 12`. -/
def L (p : ℤ) : ℤ := p ^ 3 - p ^ 2 - 12

/-- `T(p) = p^4 - 13 p - 6`. -/
def T (p : ℤ) : ℤ := p ^ 4 - 13 * p - 6

/-- The jump hypothesis (1) for `n = p^2 q`, stated with Mathlib's arithmetic functions. -/
structure Jump (p q : ℕ) : Prop where
  hp : p.Prime
  hq : q.Prime
  hpq : p ≠ q
  hφ : Nat.totient (p ^ 2 * q + 12) = Nat.totient (p ^ 2 * q) + 12
  hσ : σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12

/-! ## Bridges -/

lemma sigma_prime {p : ℕ} (hp : p.Prime) : σ 1 p = p + 1 := by
  have h := sigma_one_apply_prime_pow (i := 1) hp
  rw [pow_one] at h
  rw [h]; simp [Finset.sum_range_succ]; ring

lemma sigma_prime_sq {p : ℕ} (hp : p.Prime) : σ 1 (p ^ 2) = 1 + p + p ^ 2 := by
  rw [sigma_one_apply_prime_pow hp]; simp [Finset.sum_range_succ]

lemma totient_p2q {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) :
    Nat.totient (p ^ 2 * q) = p * (p - 1) * (q - 1) := by
  have hc : Nat.Coprime (p ^ 2) q :=
    Nat.Coprime.pow_left 2 ((Nat.coprime_primes hp hq).2 hpq)
  rw [Nat.totient_mul hc, Nat.totient_prime_pow hp (by norm_num), Nat.totient_prime hq]
  ring

lemma sigma_p2q {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) :
    σ 1 (p ^ 2 * q) = (1 + p + p ^ 2) * (q + 1) := by
  have hc : Nat.Coprime (p ^ 2) q :=
    Nat.Coprime.pow_left 2 ((Nat.coprime_primes hp hq).2 hpq)
  rw [isMultiplicative_sigma.map_mul_of_coprime hc, sigma_prime_sq hp, sigma_prime hq]

/-- Integer form of the two jump equations. -/
lemma jump_int {p q : ℕ} (h : Jump p q) :
    ((Nat.totient (p ^ 2 * q + 12) : ℕ) : ℤ) = (p : ℤ) * ((p : ℤ) - 1) * ((q : ℤ) - 1) + 12 ∧
    ((σ 1 (p ^ 2 * q + 12) : ℕ) : ℤ) = (1 + (p : ℤ) + (p : ℤ) ^ 2) * ((q : ℤ) + 1) + 12 := by
  have h1 := h.hp.one_le; have h2 := h.hq.one_le
  constructor
  · rw [h.hφ, totient_p2q h.hp h.hq h.hpq]; push_cast [h1, h2]; ring
  · rw [h.hσ, sigma_p2q h.hp h.hq h.hpq]; push_cast; ring

/-! ## Lemma G (exact elimination of `q`) -/

/-- **Lemma G.** `p(p-1)σ(N) - (p^2+p+1)φ(N) = 2(p^4 - 13p - 6)`. -/
theorem lemmaG {p q : ℕ} (h : Jump p q) :
    (p : ℤ) * ((p : ℤ) - 1) * (σ 1 (p ^ 2 * q + 12) : ℤ)
      - ((p : ℤ) ^ 2 + p + 1) * (Nat.totient (p ^ 2 * q + 12) : ℤ) = 2 * T p := by
  obtain ⟨h1, h2⟩ := jump_int h
  rw [h1, h2]; unfold T; ring

/-- `q`-elimination using `N` and `φ(N)`: `(p-1)N - pφ(N) = L(p)`. -/
theorem phi_elim {p q : ℕ} (h : Jump p q) :
    ((p : ℤ) - 1) * ((p ^ 2 * q + 12 : ℕ) : ℤ)
      - (p : ℤ) * (Nat.totient (p ^ 2 * q + 12) : ℤ) = L p := by
  obtain ⟨h1, -⟩ := jump_int h
  rw [h1]; push_cast; unfold L; ring

/-! ## Lemma K -/

/-- Radical: product of the distinct prime factors. -/
def rad (N : ℕ) : ℕ := ∏ ℓ ∈ N.primeFactors, ℓ

/-- **Lemma K.** `N / rad N` divides `L(p)`. -/
theorem lemmaK {p q : ℕ} (h : Jump p q) :
    (((p ^ 2 * q + 12) / rad (p ^ 2 * q + 12) : ℕ) : ℤ) ∣ L p := by
  set N := p ^ 2 * q + 12
  have hKN : (N / rad N) ∣ N := Nat.div_dvd_of_dvd (Nat.prod_primeFactors_dvd N)
  have hKφ : (N / rad N) ∣ Nat.totient N := by
    rw [Nat.totient_eq_div_primeFactors_mul N]; exact Dvd.intro _ rfl
  rw [← phi_elim h]
  exact dvd_sub (dvd_mul_of_dvd_right (Int.natCast_dvd_natCast.2 hKN) _)
    (dvd_mul_of_dvd_right (Int.natCast_dvd_natCast.2 hKφ) _)

/-! ## Lemma R -/

/-- Any prime `ℓ` dividing both `L(p)` and `T(p)` is `2` or `3` (resultant `432`). -/
theorem common_prime_LT {ℓ : ℕ} (hℓ : ℓ.Prime) (p : ℤ)
    (hL : (ℓ : ℤ) ∣ L p) (hT : (ℓ : ℤ) ∣ T p) : ℓ = 2 ∨ ℓ = 3 := by
  have hpr : Prime (ℓ : ℤ) := Nat.prime_iff_prime_int.1 hℓ
  have a : (ℓ : ℤ) ∣ p ^ 2 - p + 6 := by
    have : p ^ 2 - p + 6 = T p - p * L p - L p := by unfold T L; ring
    rw [this]; exact dvd_sub (dvd_sub hT (dvd_mul_of_dvd_right hL _)) hL
  have b : (ℓ : ℤ) ∣ 6 * (p + 2) := by
    have : 6 * (p + 2) = p * (p ^ 2 - p + 6) - L p := by unfold L; ring
    rw [this]; exact dvd_sub (dvd_mul_of_dvd_right a _) hL
  by_contra hne
  push_neg at hne
  have h6 : ¬ (ℓ : ℤ) ∣ 6 := by
    intro hd
    have : ℓ ∣ 6 := Int.natCast_dvd_natCast.1 hd
    have hle : ℓ ≤ 6 := Nat.le_of_dvd (by norm_num) this
    interval_cases ℓ <;> simp_all <;> exact absurd hℓ (by decide)
  have c : (ℓ : ℤ) ∣ p + 2 := (hpr.dvd_or_dvd b).resolve_left h6
  have d : (ℓ : ℤ) ∣ 12 := by
    have : (12 : ℤ) = (p ^ 2 - p + 6) - (p + 2) * (p - 3) := by ring
    rw [this]; exact dvd_sub a (dvd_mul_of_dvd_left c _)
  exact h6 (by
    have : (12 : ℤ) = 2 * 6 := by norm_num
    rw [this] at d
    rcases hpr.dvd_or_dvd d with h2 | h2
    · exfalso
      have : ℓ ∣ 2 := Int.natCast_dvd_natCast.1 h2
      have := (Nat.prime_dvd_prime_iff_eq hℓ Nat.prime_two).1 this
      exact hne.1 this
    · exact h2)

/-- **Lemma R.** A prime `r ≥ 5` with `r^2 ∣ N` does not divide `σ₁(N)`. -/
theorem lemmaR {p q r : ℕ} (h : Jump p q) (hr : r.Prime) (hr5 : 5 ≤ r)
    (hrN : r ^ 2 ∣ p ^ 2 * q + 12) : ¬ r ∣ σ 1 (p ^ 2 * q + 12) := by
  intro hσ
  set N := p ^ 2 * q + 12
  have hrN1 : r ∣ N := (dvd_pow_self r two_ne_zero).trans hrN
  have hrφ : r ∣ Nat.totient N := by
    have h1 : Nat.totient (r ^ 2) ∣ Nat.totient N := Nat.totient_dvd_of_dvd hrN
    rw [Nat.totient_prime_pow hr (by norm_num)] at h1
    norm_num at h1
    exact (dvd_mul_right r (r - 1)).trans h1
  have hL : (r : ℤ) ∣ L p := by
    rw [← phi_elim h]
    exact dvd_sub (dvd_mul_of_dvd_right (Int.natCast_dvd_natCast.2 hrN1) _)
      (dvd_mul_of_dvd_right (Int.natCast_dvd_natCast.2 hrφ) _)
  have h2T : (r : ℤ) ∣ 2 * T p := by
    rw [← lemmaG h]
    exact dvd_sub (dvd_mul_of_dvd_right (Int.natCast_dvd_natCast.2 hσ) _)
      (dvd_mul_of_dvd_right (Int.natCast_dvd_natCast.2 hrφ) _)
  have hpr : Prime (r : ℤ) := Nat.prime_iff_prime_int.1 hr
  have hT : (r : ℤ) ∣ T p := by
    rcases hpr.dvd_or_dvd h2T with h2 | h2
    · have : r ∣ 2 := Int.natCast_dvd_natCast.1 h2
      have := Nat.le_of_dvd (by norm_num) this; omega
    · exact h2
  rcases common_prime_LT hr p hL hT with h | h <;> omega

end P2qStructural
