/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.H1
import P2qJumps.H3TwoAdic
import P2qJumps.H2K

/-!
# P2qJumps.Conjecture3Tail

**Corollary.** Conjecture `conj:vanish` (`Conjecture3`) holds if and only if

* H2 holds for every prime `p ≥ 10^6`, and
* H3 holds for every prime `p ≡ 3 (mod 4)`.

Both sides use the repository's own `H2` and `H3` predicates (`P2qJumps/ImpliesCorrected.lean`),
with the restriction written as an extra hypothesis. The proof uses only
`conjecture_iff_H2_H3` (Conjecture 3 ↔ H2 ∧ H3), `h2_p_lt_1e6` (H2 for `p < 10^6`) and
`H3_of_mod4` (H3 for `p ≡ 1 (mod 4)`). The case `p = 2` of H3 is handled explicitly: `preamble`
gives `5 ≤ p` under the jump hypotheses, so `p = 2` cannot occur. No new axiom is introduced;
neither H2, H3 nor Conjecture 3 is assumed or proved here.
-/

namespace P2qJumps

open Nat

/-- **Conjecture 3 ↔ (H2 for `p ≥ 10^6`) ∧ (H3 for `p ≡ 3 (mod 4)`).** -/
theorem conjecture3_iff_tail :
    Conjecture3 ↔
      (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) → 10 ^ 6 ≤ p →
        ¬ ((repPrimes (p ^ 2 * q + 12)).Nonempty ∧
          (simpleCount (p ^ 2 * q + 12) = 1 ∨ simpleCount (p ^ 2 * q + 12) = 2) ∧
          ¬ ∃ r s a : ℕ, r.Prime ∧ s.Prime ∧ r ≠ s ∧ 2 ≤ a ∧ p ^ 2 * q + 12 = r ^ a * s)) ∧
      (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) → p % 4 = 3 →
        ¬ ((repPrimes (p ^ 2 * q + 12)).Nonempty ∧ 3 ≤ simpleCount (p ^ 2 * q + 12))) := by
  rw [conjecture_iff_H2_H3]
  constructor
  · rintro ⟨h2, h3⟩
    exact ⟨fun p q hp hq hpq hJ _ => h2 p q hp hq hpq hJ,
      fun p q hp hq hpq hJ _ => h3 p q hp hq hpq hJ⟩
  · rintro ⟨h2t, h3t⟩
    refine ⟨fun p q hp hq hpq hJ => ?_, fun p q hp hq hpq hJ => ?_⟩
    · by_cases hp6 : p < 10 ^ 6
      · exact h2_p_lt_1e6 hp hq hpq hJ hp6
      · exact h2t p q hp hq hpq hJ (Nat.le_of_not_lt hp6)
    · obtain ⟨hp5, -, -, -, -⟩ := preamble hp hq hpq hJ
      rcases hp.eq_two_or_odd with h2 | hodd
      · -- `p = 2` contradicts `5 ≤ p`
        omega
      · rcases (show p % 4 = 1 ∨ p % 4 = 3 by omega) with h | h
        · exact H3_of_mod4 hp hq hpq hJ h
        · exact h3t p q hp hq hpq hJ h

end P2qJumps
