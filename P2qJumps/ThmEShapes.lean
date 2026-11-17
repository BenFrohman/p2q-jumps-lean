/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.TheoremsBE
import P2qJumps.ClosedLedger

/-!
# P2qJumps.ThmEShapes

The final sentence of Theorem E (paper `thm:E`) as one theorem: if both jumps hold at
`n = p^2 q` and some prime square divides `N = n + 12`, then either `N = r^2 V` or `N = r^3 V`
with `V` squarefree, prime to `r`, and `ω(V) ≥ 2`; or `N = r₁^2 r₂^2 V` with `V` squarefree,
prime to `r₁ r₂`, `ω(V) ≥ 1`, `r₁ r₂ ∣ L(p)` and `q > 5p^2 - 4p - 3`.
-/

namespace P2qJumps

open Nat

/-- Splitting off the full power of a prime that divides `m` at least to the second power. -/
private lemma split_sq {m r : ℕ} (hm : m ≠ 0) (hr : r.Prime) (h2 : r ^ 2 ∣ m) :
    ∃ e W, 2 ≤ e ∧ ¬ r ∣ W ∧ m = r ^ e * W := by
  obtain ⟨e, W, hW, hmW⟩ := Nat.exists_eq_pow_mul_and_not_dvd hm r hr.ne_one
  refine ⟨e, W, ?_, hW, hmW⟩
  by_contra he
  push_neg at he
  interval_cases e
  · rw [pow_zero, one_mul] at hmW
    exact hW (hmW ▸ (dvd_pow_self r two_ne_zero).trans h2)
  · rw [hmW, pow_one, pow_two] at h2
    exact hW (Nat.dvd_of_mul_dvd_mul_left hr.pos h2)

/-- A squarefree number with exactly one prime factor is that prime. -/
private lemma eq_of_sqfree_card_one {W : ℕ} (hW : Squarefree W) (h1 : W.primeFactors.card = 1) :
    ∃ s, s.Prime ∧ W = s := by
  obtain ⟨s, hs⟩ := Finset.card_eq_one.1 h1
  have hsW : s ∈ W.primeFactors := by rw [hs]; exact Finset.mem_singleton_self s
  refine ⟨s, Nat.prime_of_mem_primeFactors hsW, ?_⟩
  rw [← Nat.prod_primeFactors_of_squarefree hW, hs, Finset.prod_singleton]

/-- **Theorem E, final sentence** (`thm:E`): the shapes left for a repeated-prime solution. -/
theorem theoremE_shapes {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hR : ∃ r, r.Prime ∧ r ^ 2 ∣ p ^ 2 * q + 12) :
    (∃ r V : ℕ, r.Prime ∧ Squarefree V ∧ Nat.Coprime r V ∧ 2 ≤ V.primeFactors.card ∧
        (p ^ 2 * q + 12 = r ^ 2 * V ∨ p ^ 2 * q + 12 = r ^ 3 * V)) ∨
      (∃ r₁ r₂ V : ℕ, r₁.Prime ∧ r₂.Prime ∧ r₁ ≠ r₂ ∧ Squarefree V ∧
        Nat.Coprime (r₁ * r₂) V ∧ 1 ≤ V.primeFactors.card ∧
        p ^ 2 * q + 12 = r₁ ^ 2 * r₂ ^ 2 * V ∧
        ((r₁ * r₂ : ℕ) : ℤ) ∣ (p : ℤ) ^ 3 - p ^ 2 - 12 ∧ 5 * (p : ℤ) ^ 2 - 4 * p - 3 < q) := by
  set N := p ^ 2 * q + 12 with hNdef
  have hN0 : N ≠ 0 := by omega
  obtain ⟨r, hr, hr2⟩ := hR
  obtain ⟨e, W, he2, hrW, hNW⟩ := split_sq hN0 hr hr2
  have hW0 : W ≠ 0 := by rintro rfl; simp at hNW; exact hN0 hNW
  -- exponent at most 3 (Theorem E(i))
  have he3 : e ≤ 3 := by
    by_contra h; push_neg at h
    have h4 : r ^ 4 ∣ N := by
      rw [hNW]; exact (pow_dvd_pow r (by omega)).trans (dvd_mul_right _ _)
    exact theoremE_i hp hq hpq hJ hr h4
  have hcopW : Nat.Coprime r W := (Nat.Prime.coprime_iff_not_dvd hr).2 hrW
  by_cases hsq : Squarefree W
  · -- one repeated prime
    left
    refine ⟨r, W, hr, hsq, hcopW, ?_, ?_⟩
    · by_contra hc; push_neg at hc
      interval_cases hcard : W.primeFactors.card
      · have : W = 0 ∨ W = 1 := Nat.primeFactors_eq_empty.1 (Finset.card_eq_zero.1 hcard)
        rcases this with h | h
        · exact hW0 h
        · rw [h, mul_one] at hNW
          exact N_ne_prime_pow hp hq hr hpq (by omega) hJ hNW
      · obtain ⟨s, hs, hWs⟩ := eq_of_sqfree_card_one hsq hcard
        rw [hWs] at hNW hrW
        have hrs : r ≠ s := by
          intro h; rw [h] at hrW; exact hrW (dvd_refl s)
        exact N_ne_ras hp hq hr hs hpq hrs he2 hJ hNW
    · interval_cases e
      · exact Or.inl hNW
      · exact Or.inr hNW
  · -- a second repeated prime
    right
    rw [Nat.squarefree_iff_prime_squarefree] at hsq
    push_neg at hsq
    obtain ⟨s, hs, hssW⟩ := hsq
    have hsr : r ≠ s := by
      rintro rfl; exact hrW ((dvd_mul_right r r).trans hssW)
    have hs2N : s ^ 2 ∣ N := by
      rw [hNW, pow_two]; exact hssW.trans (dvd_mul_left W _)
    have hr2N : r ^ 2 ∣ N := hr2
    have he : e = 2 := by
      by_contra h
      have h3 : r ^ 3 ∣ N := by
        have : e = 3 := by omega
        rw [hNW, this]; exact dvd_mul_right _ _
      exact cube_excludes_second_square hp hq hpq hJ hr hs hsr h3 hs2N
    subst he
    obtain ⟨f, V, hf2, hsV, hWV⟩ := split_sq hW0 hs (by rw [pow_two]; exact hssW)
    have hf : f = 2 := by
      by_contra h
      have hfle : 3 ≤ f := by omega
      have h3 : s ^ 3 ∣ N := by
        rw [hNW, hWV]
        exact (pow_dvd_pow s hfle).trans ((dvd_mul_right _ V).trans (dvd_mul_left _ _))
      exact cube_excludes_second_square hp hq hpq hJ hs hr hsr.symm h3 hr2N
    subst hf
    have hV0 : V ≠ 0 := by rintro rfl; simp at hWV; exact hW0 hWV
    have hNV : N = r ^ 2 * s ^ 2 * V := by rw [hNW, hWV, mul_assoc]
    have hrV : ¬ r ∣ V := fun h => hrW (h.trans (by rw [hWV]; exact dvd_mul_left V _))
    have hcopV : Nat.Coprime (r * s) V :=
      Nat.Coprime.mul_left ((Nat.Prime.coprime_iff_not_dvd hr).2 hrV)
        ((Nat.Prime.coprime_iff_not_dvd hs).2 hsV)
    have hVsq : Squarefree V := by
      rw [Nat.squarefree_iff_prime_squarefree]
      intro ℓ hℓ hℓV
      have hℓr : ℓ ≠ r := by rintro rfl; exact hrV ((dvd_mul_right ℓ ℓ).trans hℓV)
      have hℓs : ℓ ≠ s := by rintro rfl; exact hsV ((dvd_mul_right ℓ ℓ).trans hℓV)
      have hℓN : ℓ ^ 2 ∣ N := by rw [hNV, pow_two]; exact hℓV.trans (dvd_mul_left V _)
      exact theoremE_iii hp hq hpq hJ hr hs hℓ hsr hℓr.symm hℓs.symm hr2N hs2N hℓN
    have hVcard : 1 ≤ V.primeFactors.card := by
      by_contra hc; push_neg at hc
      have hV1 : V = 1 := by
        have := Nat.primeFactors_eq_empty.1
          (Finset.card_eq_zero.1 (show V.primeFactors.card = 0 by omega))
        omega
      apply N_not_powerful hp hq hpq hJ
      intro ℓ hℓ
      have hℓp := Nat.prime_of_mem_primeFactors hℓ
      have hℓd : ℓ ∣ r ^ 2 * s ^ 2 := by
        have := Nat.dvd_of_mem_primeFactors hℓ; rw [← hNdef, hNV, hV1, mul_one] at this
        exact this
      rcases (Nat.Prime.dvd_mul hℓp).1 hℓd with h | h
      · rw [Nat.prime_dvd_prime_iff_eq hℓp hr |>.1 (hℓp.dvd_of_dvd_pow h)]; exact hr2N
      · rw [Nat.prime_dvd_prime_iff_eq hℓp hs |>.1 (hℓp.dvd_of_dvd_pow h)]; exact hs2N
    obtain ⟨t, htV⟩ := Finset.card_pos.1 hVcard
    have ht := Nat.prime_of_mem_primeFactors htV
    have htVd := Nat.dvd_of_mem_primeFactors htV
    have htr : t ≠ r := by rintro rfl; exact hrV htVd
    have hts : t ≠ s := by rintro rfl; exact hsV htVd
    have htN : t ∣ N := by rw [hNV]; exact htVd.trans (dvd_mul_left V _)
    exact ⟨r, s, V, hr, hs, hsr, hVsq, hcopV, hVcard, hNV,
      theoremE_iv_dvd hp hq hpq hJ hr hs hsr hr2N hs2N,
      theoremE_ii hp hq hpq hJ hr hs ht hsr htr hts hr2N hs2N htN⟩

end P2qJumps
