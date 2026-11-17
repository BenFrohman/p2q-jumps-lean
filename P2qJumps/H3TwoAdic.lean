/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/
import P2qJumps.ImpliesCorrected
import P2qJumps.Ext.Structural.TwoAdic

/-!
# P2qJumps.H3TwoAdic

A necessary condition for a counterexample to H3 (`R(N) ≠ ∅`, `j(N) ≥ 3`), from Theorem F:
`2^{j - 1}` divides `T(p) = p^4 - 13 p - 6`, hence `p ≡ 3 (mod 4)`. Consequently H3 holds for every
`p ≡ 1 (mod 4)`. H3 itself is not proved here.
-/

namespace P2qJumps

open Nat P2qStructural

/-- **Theorem F applied to H3**: a solution with `R(N) ≠ ∅` and `j(N) ≥ 3` has
`2^{j(N) - 1} ∣ T(p)` and `p ≡ 3 (mod 4)`. -/
theorem H3_twoAdic {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hj : 3 ≤ simpleCount (p ^ 2 * q + 12)) :
    (2 : ℤ) ^ (simpleCount (p ^ 2 * q + 12) - 1) ∣ T p ∧ p % 4 = 3 := by
  obtain ⟨hp5, -, hodd, -, -⟩ := preamble hp hq hpq hJ
  set N := p ^ 2 * q + 12 with hNdef
  have hF := theoremF' (⟨hp, hq, hpq, hJ.1, hJ.2⟩ : Jump p q)
  have h2 : ∀ ℓ ∈ N.primeFactors, ℓ ≠ 2 := fun ℓ hℓ h => by
    subst h; exact (Nat.not_even_iff_odd.2 hodd) (even_iff_two_dvd.2 (Nat.dvd_of_mem_primeFactors hℓ))
  have hle1 : simpleCount N ≤ omegaOdd N := by
    unfold simpleCount omegaOdd
    apply Finset.card_le_card
    intro ℓ hℓ
    have := Finset.mem_filter.1 hℓ
    exact Finset.mem_filter.2 ⟨this.1, h2 ℓ this.1⟩
  have hle2 : simpleCount N ≤ oddExpCount N := by
    unfold simpleCount oddExpCount
    apply Finset.card_le_card
    intro ℓ hℓ
    have := Finset.mem_filter.1 hℓ
    exact Finset.mem_filter.2 ⟨this.1, h2 ℓ this.1, by rw [this.2]; decide⟩
  have hmin : simpleCount N - 1 ≤ min (omegaOdd N) (oddExpCount N) - 1 := by
    have := le_min hle1 hle2; omega
  have hdvd : (2 : ℤ) ^ (simpleCount N - 1) ∣ T p := (pow_dvd_pow 2 hmin).trans hF
  refine ⟨hdvd, ?_⟩
  have h4 : (4 : ℤ) ∣ T p := by
    have : (2 : ℤ) ^ 2 ∣ T p := (pow_dvd_pow 2 (by omega)).trans hdvd
    simpa using this
  have hpodd : p % 2 = 1 := Nat.odd_iff.1 (hp.odd_of_ne_two (by omega))
  by_contra h3
  have h1 : (p : ℤ) ≡ 1 [ZMOD 4] := by rw [Int.ModEq]; omega
  have hT : T p ≡ 1 ^ 4 - 13 * 1 - 6 [ZMOD 4] := by
    unfold T
    exact ((h1.pow 4).sub (h1.mul_left 13)).sub (Int.ModEq.refl 6)
  rw [Int.ModEq] at hT
  have h0 : T p % 4 = 0 := Int.emod_eq_zero_of_dvd h4
  rw [h0] at hT
  norm_num at hT

/-- **H3 for `p ≡ 1 (mod 4)`**: no solution with `p ≡ 1 (mod 4)`, `R(N) ≠ ∅` and `j(N) ≥ 3`. -/
theorem H3_of_mod4 {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (h4 : p % 4 = 1) :
    ¬ ((repPrimes (p ^ 2 * q + 12)).Nonempty ∧ 3 ≤ simpleCount (p ^ 2 * q + 12)) := by
  rintro ⟨-, hj⟩
  have := (H3_twoAdic hp hq hpq hJ hj).2
  omega

end P2qJumps
