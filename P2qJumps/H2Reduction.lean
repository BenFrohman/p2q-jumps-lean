/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.ThreeRegimes
import P2qJumps.ImpliesCorrected

/-!
# P2qJumps.H2Reduction

Hypothesis H2 (`prop:implies-corrected`: no solution with `R(N) ≠ ∅`, `j(N) ∈ {1, 2}` and `N` not
of the form `r^a s`) follows from the emptiness of the two shapes `r^2 s^2 t` and `r^2 s^2 t u`
(distinct primes). Every other shape allowed by Theorem E with `j ∈ {1, 2}` (`r^2 s t`, `r^3 s t`)
is already excluded. Neither shape is proved empty here.
-/

namespace P2qJumps

open Nat

/-- The shape `r^2 s^2 t u` (distinct primes) has no solution. Open. -/
def R2S2TUEmpty : Prop :=
  ∀ p q r s t u : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → t.Prime → u.Prime → p ≠ q →
    r ≠ s → r ≠ t → r ≠ u → s ≠ t → s ≠ u → t ≠ u → Jumps (p ^ 2 * q) →
    p ^ 2 * q + 12 ≠ r ^ 2 * s ^ 2 * t * u

/-- A prime of the squarefree cofactor `V` of `A * V` (coprime) has exponent exactly `1`. -/
lemma mem_simple {A V s : ℕ} (hA : A ≠ 0) (hV : Squarefree V) (hcop : Nat.Coprime A V)
    (hs : s ∈ V.primeFactors) :
    s ∈ (A * V).primeFactors.filter (fun r => (A * V).factorization r = 1) := by
  have hsp := Nat.prime_of_mem_primeFactors hs
  have hsV := Nat.dvd_of_mem_primeFactors hs
  have hV0 : V ≠ 0 := Squarefree.ne_zero hV
  have hsA : ¬ s ∣ A := fun h =>
    hsp.not_dvd_one (by rw [← Nat.Coprime.gcd_eq_one hcop]; exact Nat.dvd_gcd h hsV)
  refine Finset.mem_filter.2 ⟨Nat.mem_primeFactors.2 ⟨hsp, hsV.trans (dvd_mul_left V A),
    mul_ne_zero hA hV0⟩, ?_⟩
  rw [Nat.factorization_mul hA hV0, Finsupp.add_apply,
    Nat.factorization_eq_zero_of_not_dvd hsA, zero_add]
  have h1 := hV.natFactorization_le_one s
  have h2 := hsp.factorization_pos_of_dvd hV0 hsV
  omega

lemma card_le_simpleCount {A V : ℕ} (hA : A ≠ 0) (hV : Squarefree V) (hcop : Nat.Coprime A V) :
    V.primeFactors.card ≤ simpleCount (A * V) :=
  Finset.card_le_card fun _ hs => mem_simple hA hV hcop hs

private lemma sqfree_card_one {V : ℕ} (hV : Squarefree V) (h1 : V.primeFactors.card = 1) :
    ∃ t, t.Prime ∧ V = t := by
  obtain ⟨t, ht⟩ := Finset.card_eq_one.1 h1
  have htm : t ∈ V.primeFactors := by rw [ht]; simp
  exact ⟨t, Nat.prime_of_mem_primeFactors htm,
    by rw [← Nat.prod_primeFactors_of_squarefree hV, ht, Finset.prod_singleton]⟩

private lemma sqfree_card_two {V : ℕ} (hV : Squarefree V) (h2 : V.primeFactors.card = 2) :
    ∃ s t, s.Prime ∧ t.Prime ∧ s ≠ t ∧ V = s * t := by
  obtain ⟨s, t, hst, he⟩ := Finset.card_eq_two.1 h2
  have hs : s ∈ V.primeFactors := by rw [he]; simp
  have ht : t ∈ V.primeFactors := by rw [he]; simp
  refine ⟨s, t, Nat.prime_of_mem_primeFactors hs, Nat.prime_of_mem_primeFactors ht, hst, ?_⟩
  rw [← Nat.prod_primeFactors_of_squarefree hV, he, Finset.prod_pair hst]

private lemma ne_of_cop {x V t : ℕ} (hx : x.Prime) (hcop : Nat.Coprime x V) (ht : t ∣ V) :
    x ≠ t := fun h => by
  subst h; exact (Nat.Prime.coprime_iff_not_dvd hx).1 hcop ht

/-- **Reduction of H2**: if the shapes `r^2 s^2 t` and `r^2 s^2 t u` are empty, H2 holds. -/
theorem H2_of_shapes (h1 : R2S2TEmpty) (h2 : R2S2TUEmpty) : H2 := by
  rintro p q hp hq hpq hJ ⟨⟨r, hrR⟩, hj, -⟩
  set N := p ^ 2 * q + 12 with hNdef
  have hN0 : N ≠ 0 := by omega
  have hjle : simpleCount N ≤ 2 := by omega
  have hrR' := Finset.mem_filter.1 hrR
  have hrp := Nat.prime_of_mem_primeFactors hrR'.1
  have hr2 : r ^ 2 ∣ N := (hrp.pow_dvd_iff_le_factorization hN0).2 hrR'.2
  rcases theoremE_shapes hp hq hpq hJ ⟨r, hrp, hr2⟩ with
    ⟨r, V, hr, hV, hrV, hV2, hNV⟩ | ⟨r₁, r₂, V, hr₁, hr₂, h12, hV, hcop, hV1, hNV, -, -⟩
  · try rw [← hNdef] at hNV
    have hcard : ∀ e, e ≠ 0 → N = r ^ e * V → V.primeFactors.card ≤ 2 := fun e he h => by
      have := card_le_simpleCount (pow_ne_zero e hr.ne_zero) hV (Nat.Coprime.pow_left e hrV)
      rw [← h] at this; omega
    have hc2 : V.primeFactors.card = 2 := by
      rcases hNV with h | h
      · have := hcard 2 (by norm_num) h; omega
      · have := hcard 3 (by norm_num) h; omega
    obtain ⟨s, t, hs, ht, hst, rfl⟩ := sqfree_card_two hV hc2
    have hrs := ne_of_cop hr hrV (dvd_mul_right s t)
    have hrt := ne_of_cop hr hrV (dvd_mul_left t s)
    rcases hNV with h | h
    · exact N_ne_r2st hp hq hpq hJ hr hs ht hrs hrt hst (by rw [← mul_assoc] at h; exact h)
    · exact r3st_empty hp hq hr hs ht hpq hrs hrt hst hJ (by rw [← mul_assoc] at h; exact h)
  · try rw [← hNdef] at hNV
    have hA0 : r₁ ^ 2 * r₂ ^ 2 ≠ 0 := mul_ne_zero (pow_ne_zero _ hr₁.ne_zero) (pow_ne_zero _ hr₂.ne_zero)
    have hcopA : Nat.Coprime (r₁ ^ 2 * r₂ ^ 2) V := by
      rw [← mul_pow]; exact Nat.Coprime.pow_left 2 hcop
    have hle := card_le_simpleCount hA0 hV hcopA
    rw [← hNV] at hle
    have hc1 : Nat.Coprime r₁ V := Nat.Coprime.coprime_mul_right hcop
    have hc2 : Nat.Coprime r₂ V := Nat.Coprime.coprime_mul_left hcop
    rcases (show V.primeFactors.card = 1 ∨ V.primeFactors.card = 2 by omega) with hc | hc
    · obtain ⟨t, ht, hVt⟩ := sqfree_card_one hV hc
      rw [hVt] at hNV hc1 hc2
      exact h1 p q r₁ r₂ t hp hq hr₁ hr₂ ht hpq h12 (ne_of_cop hr₁ hc1 dvd_rfl)
        (ne_of_cop hr₂ hc2 dvd_rfl) hJ hNV
    · obtain ⟨t, u, ht, hu, htu, rfl⟩ := sqfree_card_two hV hc
      exact h2 p q r₁ r₂ t u hp hq hr₁ hr₂ ht hu hpq h12
        (ne_of_cop hr₁ hc1 (dvd_mul_right t u)) (ne_of_cop hr₁ hc1 (dvd_mul_left u t))
        (ne_of_cop hr₂ hc2 (dvd_mul_right t u)) (ne_of_cop hr₂ hc2 (dvd_mul_left u t)) htu hJ
        (by rw [← mul_assoc] at hNV; exact hNV)

end P2qJumps
