/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.TheoremsBE
import P2qJumps.ClosedLedger

/-!
# P2qJumps.ImpliesCorrected

Proposition `prop:implies-corrected` of the paper: Conjecture `conj:vanish` (`Conjecture3`)
holds if and only if H1, H2 and H3 hold. `R(N)` is the set of primes dividing `N` to exponent
at least `2` and `j(N)` is the number of primes dividing `N` to exponent exactly `1`.
None of H1, H2, H3 is proved here; the theorem is the equivalence only.
-/

namespace P2qJumps

open Nat

/-- `R(N)`: the primes dividing `N` to exponent at least `2`. -/
def repPrimes (N : ℕ) : Finset ℕ := N.primeFactors.filter (fun r => 2 ≤ N.factorization r)

/-- `j(N)`: the number of primes dividing `N` to exponent exactly `1`. -/
def simpleCount (N : ℕ) : ℕ := (N.primeFactors.filter (fun r => N.factorization r = 1)).card

/-- **H1**: no solution with `N` squarefree and `ω(N) ≥ 4`. -/
def H1 : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    ¬ (Squarefree (p ^ 2 * q + 12) ∧ 4 ≤ (p ^ 2 * q + 12).primeFactors.card)

/-- **H2**: no solution with `R ≠ ∅`, `j ∈ {1, 2}` and `N` not of the form `r^a s` (`a ≥ 2`). -/
def H2 : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    ¬ ((repPrimes (p ^ 2 * q + 12)).Nonempty ∧
      (simpleCount (p ^ 2 * q + 12) = 1 ∨ simpleCount (p ^ 2 * q + 12) = 2) ∧
      ¬ ∃ r s a : ℕ, r.Prime ∧ s.Prime ∧ r ≠ s ∧ 2 ≤ a ∧ p ^ 2 * q + 12 = r ^ a * s)

/-- **H3**: no solution with `R ≠ ∅` and `j ≥ 3`. -/
def H3 : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    ¬ ((repPrimes (p ^ 2 * q + 12)).Nonempty ∧ 3 ≤ simpleCount (p ^ 2 * q + 12))

/-- **Proposition** `prop:implies-corrected`: `Conjecture3 ↔ H1 ∧ H2 ∧ H3`. -/
theorem prop_implies_corrected : Conjecture3 ↔ H1 ∧ H2 ∧ H3 := by
  constructor
  · intro hC
    exact ⟨fun p q hp hq hpq hJ _ => hC p q hp hq hpq hJ,
      fun p q hp hq hpq hJ _ => hC p q hp hq hpq hJ,
      fun p q hp hq hpq hJ _ => hC p q hp hq hpq hJ⟩
  · rintro ⟨h1, h2, h3⟩ p q hp hq hpq hJ
    set N := p ^ 2 * q + 12 with hNdef
    have hN0 : N ≠ 0 := by omega
    by_cases hR : (repPrimes N).Nonempty
    · -- some repeated prime
      by_cases hj0 : simpleCount N = 0
      · apply N_not_powerful hp hq hpq hJ
        intro ℓ hℓ
        have hℓp := Nat.prime_of_mem_primeFactors hℓ
        have hpos : 1 ≤ N.factorization ℓ :=
          (Nat.Prime.dvd_iff_one_le_factorization hℓp hN0).1 (Nat.dvd_of_mem_primeFactors hℓ)
        have hne : N.factorization ℓ ≠ 1 := by
          intro h1'
          have hmem : ℓ ∈ N.primeFactors.filter (fun r => N.factorization r = 1) :=
            Finset.mem_filter.2 ⟨hℓ, h1'⟩
          unfold simpleCount at hj0
          rw [Finset.card_eq_zero] at hj0
          rw [hj0] at hmem
          exact Finset.notMem_empty _ hmem
        exact (Nat.Prime.pow_dvd_iff_le_factorization hℓp hN0).2 (by omega)
      · by_cases hj3 : 3 ≤ simpleCount N
        · exact h3 p q hp hq hpq hJ ⟨hR, hj3⟩
        · have hj12 : simpleCount N = 1 ∨ simpleCount N = 2 := by omega
          by_cases hras : ∃ r s a : ℕ, r.Prime ∧ s.Prime ∧ r ≠ s ∧ 2 ≤ a ∧ N = r ^ a * s
          · obtain ⟨r, s, a, hr, hs, hrs, ha, hN⟩ := hras
            exact N_ne_ras hp hq hr hs hpq hrs ha hJ hN
          · exact h2 p q hp hq hpq hJ ⟨hR, hj12, hras⟩
    · -- `N` squarefree
      have hsq : Squarefree N := by
        rw [Nat.squarefree_iff_factorization_le_one hN0]
        intro ℓ
        by_cases hℓ : ℓ ∈ N.primeFactors
        · by_contra h
          exact hR ⟨ℓ, Finset.mem_filter.2 ⟨hℓ, by omega⟩⟩
        · rw [← Nat.support_factorization] at hℓ
          rw [Finsupp.notMem_support_iff.1 hℓ]; exact zero_le_one
      have hprod := Nat.prod_primeFactors_of_squarefree hsq
      by_cases h4 : 4 ≤ N.primeFactors.card
      · exact h1 p q hp hq hpq hJ ⟨hsq, h4⟩
      · push_neg at h4
        interval_cases hc : N.primeFactors.card
        · rcases Nat.primeFactors_eq_empty.1 (Finset.card_eq_zero.1 hc) with h | h <;> omega
        · obtain ⟨a, ha⟩ := Finset.card_eq_one.1 hc
          rw [ha, Finset.prod_singleton] at hprod
          have hap : a.Prime := Nat.prime_of_mem_primeFactors (by rw [ha]; simp)
          exact N_not_prime hp hq hpq hJ (show N.Prime by rw [← hprod]; exact hap)
        · obtain ⟨a, b, hab, hab'⟩ := Finset.card_eq_two.1 hc
          have hap : a.Prime := Nat.prime_of_mem_primeFactors (by rw [hab']; simp)
          have hbp : b.Prime := Nat.prime_of_mem_primeFactors (by rw [hab']; simp)
          rw [hab', Finset.prod_pair hab] at hprod
          exact N_ne_rs hp hq hap hbp hpq hab hJ hprod.symm
        · obtain ⟨a, b, c, hab, hac, hbc, habc⟩ := Finset.card_eq_three.1 hc
          have hap : a.Prime := Nat.prime_of_mem_primeFactors (by rw [habc]; simp)
          have hbp : b.Prime := Nat.prime_of_mem_primeFactors (by rw [habc]; simp)
          have hcp : c.Prime := Nat.prime_of_mem_primeFactors (by rw [habc]; simp)
          rw [habc, Finset.prod_insert (by simp [hab, hac]), Finset.prod_pair hbc] at hprod
          exact theorem28_holds p q a b c hp hq hap hbp hcp hpq hab hac hbc hJ
            (show N = a * b * c by rw [← hprod]; ring)

/-- The last sentence of `prop:implies-corrected`: given H1 (a hypothesis here; proved as `H1_holds`
in `P2qJumps/H1.lean`, paper Theorem `thm:H1-comp`), `Conjecture3 ↔ H2 ∧ H3`. -/
theorem implies_corrected_of_H1 (h1 : H1) : Conjecture3 ↔ H2 ∧ H3 :=
  ⟨fun hC => (prop_implies_corrected.1 hC).2, fun h => prop_implies_corrected.2 ⟨h1, h⟩⟩

end P2qJumps
