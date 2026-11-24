/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.H2K.Kernel
import P2qJumps.H2Reduction
import P2qJumps.TheoremA

/-!
# P2qJumps.H2K

**H2 has no counterexample with `p < 10^6`, kernel-checked.** For distinct primes `p, q` with
`Jumps (p^2 q)` and `p < 10^6`, it is not the case that `N = p^2 q + 12` has a repeated prime,
`j(N) ∈ {1, 2}`, and `N` is not of the form `r^a s` (`a ≥ 2`). This is hypothesis `H2`
(`P2qJumps.H2`) restricted to `p < 10^6`.

Proof: as in `H2_of_shapes`, the shapes `r^2 s t` and `r^3 s t` are excluded, and the remaining
shapes are `N = r₁² r₂² t` and `N = r₁² r₂² t u` with `r₁ r₂ ∣ L(p)` (`theoremE_shapes`). The
kernel certificates (`H2K.good_upto`) give `ref p r₁ r₂ = true` for all such pairs, and
`H2K.ref_sound_j1` / `H2K.ref_sound_j2` refute both shapes through Proposition C.
-/

namespace P2qJumps

open Nat

private lemma sqfree_card_one' {V : ℕ} (hV : Squarefree V) (h1 : V.primeFactors.card = 1) :
    ∃ t, t.Prime ∧ V = t := by
  obtain ⟨t, ht⟩ := Finset.card_eq_one.1 h1
  have htm : t ∈ V.primeFactors := by rw [ht]; simp
  exact ⟨t, Nat.prime_of_mem_primeFactors htm,
    by rw [← Nat.prod_primeFactors_of_squarefree hV, ht, Finset.prod_singleton]⟩

private lemma sqfree_card_two' {V : ℕ} (hV : Squarefree V) (h2 : V.primeFactors.card = 2) :
    ∃ s t, s.Prime ∧ t.Prime ∧ s ≠ t ∧ V = s * t := by
  obtain ⟨s, t, hst, he⟩ := Finset.card_eq_two.1 h2
  have hs : s ∈ V.primeFactors := by rw [he]; simp
  have ht : t ∈ V.primeFactors := by rw [he]; simp
  refine ⟨s, t, Nat.prime_of_mem_primeFactors hs, Nat.prime_of_mem_primeFactors ht, hst, ?_⟩
  rw [← Nat.prod_primeFactors_of_squarefree hV, he, Finset.prod_pair hst]

/-- A prime factor of `N = p^2 q + 12` is at least `5`. -/
private lemma five_le_of_dvd_N {p q r : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hr : r.Prime) (hrN : r ∣ p ^ 2 * q + 12) : 5 ≤ r := by
  obtain ⟨-, -, -, -, hcop⟩ := preamble hp hq hpq hJ
  have h6 : ¬ r ∣ 6 := fun h => by
    have := Nat.dvd_gcd hrN (h.trans ⟨p * q, by ring⟩ : r ∣ 6 * p * q)
    rw [Nat.Coprime.gcd_eq_one hcop] at this
    exact hr.ne_one (Nat.dvd_one.1 this)
  have h2 := hr.two_le
  by_contra hc
  interval_cases r <;> simp_all (config := { decide := true })

/-- **H2 for `p < 10^6`.** -/
theorem h2_p_lt_1e6 {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hp6 : p < 10 ^ 6) :
    ¬ ((repPrimes (p ^ 2 * q + 12)).Nonempty ∧
      (simpleCount (p ^ 2 * q + 12) = 1 ∨ simpleCount (p ^ 2 * q + 12) = 2) ∧
      ¬ ∃ r s a : ℕ, r.Prime ∧ s.Prime ∧ r ≠ s ∧ 2 ≤ a ∧ p ^ 2 * q + 12 = r ^ a * s) := by
  rintro ⟨⟨r, hrR⟩, hj, -⟩
  obtain ⟨hp5, -, -, -, -⟩ := preamble hp hq hpq hJ
  set N := p ^ 2 * q + 12 with hNdef
  have hN0 : N ≠ 0 := by omega
  have hjle : simpleCount N ≤ 2 := by omega
  have hrR' := Finset.mem_filter.1 hrR
  have hrp := Nat.prime_of_mem_primeFactors hrR'.1
  have hr2 : r ^ 2 ∣ N := (hrp.pow_dvd_iff_le_factorization hN0).2 hrR'.2
  rcases theoremE_shapes hp hq hpq hJ ⟨r, hrp, hr2⟩ with
    ⟨r, V, hr, hV, hrV, hV2, hNV⟩ | ⟨r₁, r₂, V, hr₁, hr₂, h12, hV, hcop, hV1, hNV, hL, -⟩
  · try rw [← hNdef] at hNV
    have hcard : ∀ e, e ≠ 0 → N = r ^ e * V → V.primeFactors.card ≤ 2 := fun e he h => by
      have := card_le_simpleCount (pow_ne_zero e hr.ne_zero) hV (Nat.Coprime.pow_left e hrV)
      rw [← h] at this; omega
    have hc2 : V.primeFactors.card = 2 := by
      rcases hNV with h | h
      · have := hcard 2 (by norm_num) h; omega
      · have := hcard 3 (by norm_num) h; omega
    obtain ⟨s, t, hs, ht, hst, rfl⟩ := sqfree_card_two' hV hc2
    have hrs : r ≠ s := fun h => by
      subst h; exact (Nat.Prime.coprime_iff_not_dvd hr).1 hrV (dvd_mul_right r t)
    have hrt : r ≠ t := fun h => by
      subst h; exact (Nat.Prime.coprime_iff_not_dvd hr).1 hrV (dvd_mul_left r s)
    rcases hNV with h | h
    · exact N_ne_r2st hp hq hpq hJ hr hs ht hrs hrt hst (by rw [← mul_assoc] at h; exact h)
    · exact r3st_empty hp hq hr hs ht hpq hrs hrt hst hJ (by rw [← mul_assoc] at h; exact h)
  · try rw [← hNdef] at hNV
    have hA0 : r₁ ^ 2 * r₂ ^ 2 ≠ 0 :=
      mul_ne_zero (pow_ne_zero _ hr₁.ne_zero) (pow_ne_zero _ hr₂.ne_zero)
    have hcopA : Nat.Coprime (r₁ ^ 2 * r₂ ^ 2) V := by
      rw [← mul_pow]; exact Nat.Coprime.pow_left 2 hcop
    have hle := card_le_simpleCount hA0 hV hcopA
    rw [← hNV] at hle
    -- the kernel certificate for `p`
    have hLnat : ((p * p * p - p * p - 12 : ℕ) : ℤ) = (p : ℤ) ^ 3 - p ^ 2 - 12 := by
      have h1 : p * p * 5 ≤ p * p * p := Nat.mul_le_mul_left _ hp5
      have h2 : 12 + p * p ≤ p * p * p := by nlinarith
      push_cast [show 12 ≤ p * p * p - p * p by omega, show p * p ≤ p * p * p by omega]
      ring
    have hdvdL : ∀ x, x ∣ r₁ * r₂ → x ∣ p * p * p - p * p - 12 := fun x hx => by
      have : ((x : ℕ) : ℤ) ∣ ((p * p * p - p * p - 12 : ℕ) : ℤ) := by
        rw [hLnat]; exact (Int.natCast_dvd_natCast.2 hx).trans (by exact_mod_cast hL)
      exact Int.natCast_dvd_natCast.1 this
    have hr₁N : r₁ ∣ N := by rw [hNV]; exact ⟨r₁ * r₂ ^ 2 * V, by ring⟩
    have hr₂N : r₂ ∣ N := by rw [hNV]; exact ⟨r₁ ^ 2 * r₂ * V, by ring⟩
    have hgood := H2K.good_upto p hp5 (by norm_num at hp6; omega) hp r₁ r₂ hr₁ hr₂ h12
      (five_le_of_dvd_N hp hq hpq hJ hr₁ hr₁N) (five_le_of_dvd_N hp hq hpq hJ hr₂ hr₂N)
      (hdvdL r₁ (dvd_mul_right _ _)) (hdvdL r₂ (dvd_mul_left _ _))
    rcases (show V.primeFactors.card = 1 ∨ V.primeFactors.card = 2 by omega) with hc | hc
    · obtain ⟨t, ht, rfl⟩ := sqfree_card_one' hV hc
      exact H2K.ref_sound_j1 hp hq hpq hJ hr₁ hr₂ h12 ht hcopA hNV hgood
    · obtain ⟨s, t, hs, ht, hst, rfl⟩ := sqfree_card_two' hV hc
      exact H2K.ref_sound_j2 hp hq hpq hJ hr₁ hr₂ h12 hs ht hst hcopA
        (by have h := hNV; rw [hNdef] at h; rw [h]; ring) hgood

/-- **Proposition C, enumeration clause, for `p < 10^6`** (paper `prop:C`: "An independently
reproduced exact enumeration finds no solution for any prime `5 ≤ p < 10^6`"): for distinct primes
`p, q` with `Jumps (p^2 q)` and `p < 10^6`, `N = p^2 q + 12` does not have both a repeated prime
(`R ≠ ∅`) and `j(N) ∈ {1, 2}`. The shape `N = r^a s` (`a ≥ 2`) is excluded by Theorem A
(`N_ne_ras`), and the rest is `h2_p_lt_1e6`. -/
theorem propC_p_lt_1e6 {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hp6 : p < 10 ^ 6) :
    ¬ ((repPrimes (p ^ 2 * q + 12)).Nonempty ∧
      (simpleCount (p ^ 2 * q + 12) = 1 ∨ simpleCount (p ^ 2 * q + 12) = 2)) := by
  rintro ⟨hR, hj⟩
  by_cases hras : ∃ r s a : ℕ, r.Prime ∧ s.Prime ∧ r ≠ s ∧ 2 ≤ a ∧ p ^ 2 * q + 12 = r ^ a * s
  · obtain ⟨r, s, a, hr, hs, hrs, ha, hN⟩ := hras
    exact N_ne_ras hp hq hr hs hpq hrs ha hJ hN
  · exact h2_p_lt_1e6 hp hq hpq hJ hp6 ⟨hR, hj, hras⟩

end P2qJumps
