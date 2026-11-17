/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Tactic
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import P2qJumps.Main
import P2qJumps.Omega4
import P2qJumps.R3SEmpty
import P2qJumps.TheoremA

/-!
# Truth Gate: semantics lock for Theorem L2 (v1.4, strengthened statement)

**STATUS: PENDING AUTHOR APPROVAL.** `paper_claim2` below is a draft transcription prepared
for review. It is not approved until the author signs off in `truth-gate-L2.lock.json`.

* `paper_claim2` is an independent transcription of `paper/theorem-L2.tex`. It is written with
  `φ`, `σ`, `ω`, explicit prime factorizations and `10 ^ 4`, and does not mention `Jumps`,
  `Theorem28`, `Lpoly`, or any declaration used by the formal proof.
* `formal_claim2` is the conjunction of the proved statements in their native form
  (`Jumps`, `Theorem28`, the numeral `10000` and a contrapositive bound, and "four pairwise
  distinct primes dividing `N`" instead of `ω(N) ≥ 4`).
* `intended_correspondence2 : formal_claim2 ↔ paper_claim2` is proved by unfolding, by
  `10 ^ 4 = 10000`, the contrapositive for (v), and the lemmas `exists_four_primes_of_omega` /
  `omega_ge_four_of_primes` relating `ω(N) ≥ 4` to four distinct prime divisors; not by `rfl`.
* The public theorem `theorem_L2` is obtained through `intended_correspondence2.mp`.
* The lock for Theorem L (`Semantics.lean`, `truth-gate.lock.json`) is unchanged.
-/

namespace P2qJumps.Semantics2

open Nat ArithmeticFunction
open scoped ArithmeticFunction.sigma ArithmeticFunction.omega

/-- `ω(N) ≥ 4` gives four pairwise distinct primes dividing `N`. -/
lemma exists_four_primes_of_omega {N : ℕ} (h : 4 ≤ ω N) :
    ∃ a b c d : ℕ, a.Prime ∧ b.Prime ∧ c.Prime ∧ d.Prime ∧
      a ≠ b ∧ a ≠ c ∧ a ≠ d ∧ b ≠ c ∧ b ≠ d ∧ c ≠ d ∧ a ∣ N ∧ b ∣ N ∧ c ∣ N ∧ d ∣ N := by
  have hc : 4 ≤ N.primeFactors.card := by
    rw [cardDistinctFactors_apply, ← List.card_toFinset] at h; exact h
  obtain ⟨t, ht, htc⟩ := Finset.exists_subset_card_eq hc
  rw [Finset.card_eq_succ] at htc
  obtain ⟨a, t3, hat, rfl, h3⟩ := htc
  rw [Finset.card_eq_three] at h3
  obtain ⟨b, c, d, hbc, hbd, hcd, rfl⟩ := h3
  simp only [Finset.mem_insert, Finset.mem_singleton, not_or] at hat
  obtain ⟨hab, hac, had⟩ := hat
  have m : ∀ x ∈ ({a, b, c, d} : Finset ℕ), x.Prime ∧ x ∣ N := fun x hx => by
    have := ht hx; rw [Nat.mem_primeFactors] at this; exact ⟨this.1, this.2.1⟩
  simp only [Finset.mem_insert, Finset.mem_singleton, forall_eq_or_imp, forall_eq] at m
  exact ⟨a, b, c, d, m.1.1, m.2.1.1, m.2.2.1.1, m.2.2.2.1, hab, hac, had, hbc, hbd, hcd,
    m.1.2, m.2.1.2, m.2.2.1.2, m.2.2.2.2⟩

/-- Four pairwise distinct primes dividing `N ≠ 0` give `ω(N) ≥ 4`. -/
lemma omega_ge_four_of_primes {N a b c d : ℕ} (hN : N ≠ 0) (ha : a.Prime) (hb : b.Prime)
    (hc : c.Prime) (hd : d.Prime) (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d) (hbc : b ≠ c)
    (hbd : b ≠ d) (hcd : c ≠ d) (haN : a ∣ N) (hbN : b ∣ N) (hcN : c ∣ N) (hdN : d ∣ N) :
    4 ≤ ω N := by
  rw [cardDistinctFactors_apply, ← List.card_toFinset]
  change 4 ≤ N.primeFactors.card
  have hsub : ({a, b, c, d} : Finset ℕ) ⊆ N.primeFactors := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rw [Nat.mem_primeFactors]
    rcases hx with rfl | rfl | rfl | rfl <;> tauto
  have h4 : ({a, b, c, d} : Finset ℕ).card = 4 := by
    rw [Finset.card_insert_of_notMem (by simp [hab, hac, had]),
      Finset.card_insert_of_notMem (by simp [hbc, hbd]), Finset.card_pair hcd]
  rw [← h4]; exact Finset.card_le_card hsub

/-- **Paper claim 2 (PENDING AUTHOR APPROVAL).**

Source: `paper/theorem-L2.tex`
(sha256 `0014494d52f73f89e1a36b1287f92f5bcac3b84ff7dc2bdd2cec79c22cd86dba`),
input into `paper/p2q-jumps-v1.4.tex`, Section "Lean-certified reductions (v1.4)",
Theorem L2. Verbatim quote:

> Let p and q be distinct primes, n=p^2q and N=n+12, and suppose φ(N)=φ(n)+12 and
> σ(N)=σ(n)+12. Then:
> (i) N is not prime, and N is not a product of two distinct primes;
> (ii) N is not a product of three distinct primes;
> (iii) N is not of the form r^2st with pairwise distinct primes r,s,t ≥ 5;
> (iv) N is not of the form r^3s with distinct primes r,s;
> (v) n>10^4;
> (vi) N is not of the form r^k with r prime and k ≥ 1, and N is not of the form r^as with
> distinct primes r,s and a ≥ 2;
> (vii) if ω(N) ≥ 4, then q ≥ 3p^2 and every prime r dividing N satisfies r>p.
-/
def paper_claim2 : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    -- (i)
    (¬ (p ^ 2 * q + 12).Prime ∧
      ∀ r s : ℕ, r.Prime → s.Prime → r ≠ s → p ^ 2 * q + 12 ≠ r * s) ∧
    -- (ii)
    (∀ r s t : ℕ, r.Prime → s.Prime → t.Prime → r ≠ s → r ≠ t → s ≠ t →
      p ^ 2 * q + 12 ≠ r * s * t) ∧
    -- (iii)
    (∀ r s t : ℕ, r.Prime → s.Prime → t.Prime → r ≠ s → r ≠ t → s ≠ t →
      5 ≤ r → 5 ≤ s → 5 ≤ t → p ^ 2 * q + 12 ≠ r ^ 2 * s * t) ∧
    -- (iv)
    (∀ r s : ℕ, r.Prime → s.Prime → r ≠ s → p ^ 2 * q + 12 ≠ r ^ 3 * s) ∧
    -- (v)
    10 ^ 4 < p ^ 2 * q ∧
    -- (vi)
    ((∀ r k : ℕ, r.Prime → 1 ≤ k → p ^ 2 * q + 12 ≠ r ^ k) ∧
      ∀ r s a : ℕ, r.Prime → s.Prime → r ≠ s → 2 ≤ a → p ^ 2 * q + 12 ≠ r ^ a * s) ∧
    -- (vii)
    (4 ≤ ω (p ^ 2 * q + 12) →
      3 * p ^ 2 ≤ q ∧ ∀ r : ℕ, r.Prime → r ∣ p ^ 2 * q + 12 → p < r)

/-- **Formal claim 2**: the statements proved in the formalization, in their native form. -/
def formal_claim2 : Prop :=
  (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) → ¬ (p ^ 2 * q + 12).Prime) ∧
  (∀ p q r s : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → p ≠ q → r ≠ s →
    Jumps (p ^ 2 * q) → p ^ 2 * q + 12 ≠ r * s) ∧
  Theorem28 ∧
  (∀ p q r s t : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → t.Prime → p ≠ q → r ≠ s →
    r ≠ t → s ≠ t → 5 ≤ r → 5 ≤ s → 5 ≤ t → Jumps (p ^ 2 * q) →
    p ^ 2 * q + 12 ≠ r ^ 2 * s * t) ∧
  (∀ p q r s : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → p ≠ q → r ≠ s →
    Jumps (p ^ 2 * q) → p ^ 2 * q + 12 ≠ r ^ 3 * s) ∧
  (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → p ^ 2 * q ≤ 10000 → ¬ Jumps (p ^ 2 * q)) ∧
  (∀ p q r k : ℕ, p.Prime → q.Prime → r.Prime → p ≠ q → 1 ≤ k → Jumps (p ^ 2 * q) →
    p ^ 2 * q + 12 ≠ r ^ k) ∧
  (∀ p q r s a : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → p ≠ q → r ≠ s → 2 ≤ a →
    Jumps (p ^ 2 * q) → p ^ 2 * q + 12 ≠ r ^ a * s) ∧
  (∀ p q a b c d : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    a.Prime → b.Prime → c.Prime → d.Prime →
    a ≠ b → a ≠ c → a ≠ d → b ≠ c → b ≠ d → c ≠ d →
    a ∣ p ^ 2 * q + 12 → b ∣ p ^ 2 * q + 12 → c ∣ p ^ 2 * q + 12 → d ∣ p ^ 2 * q + 12 →
    3 * p ^ 2 ≤ q ∧ ∀ r : ℕ, r.Prime → r ∣ p ^ 2 * q + 12 → p < r)

/-- The formal claim 2 holds. -/
theorem formal_claim2_holds : formal_claim2 :=
  ⟨fun _ _ hp hq hpq hJ => N_not_prime hp hq hpq hJ,
   fun _ _ _ _ hp hq hr hs hpq hrs hJ => N_ne_rs hp hq hr hs hpq hrs hJ,
   theorem28_holds,
   fun _ _ _ _ _ hp hq hr hs ht hpq hrs hrt hst hr5 hs5 ht5 hJ =>
     r2st_empty hp hq hr hs ht hpq hrs hrt hst hr5 hs5 ht5 hJ,
   fun _ _ _ _ hp hq hr hs hpq hrs hJ => r3s_empty hp hq hr hs hpq hrs hJ,
   fun _ _ hp hq hpq hn => Cert.no_jumps_p2q_le_10000 hp hq hpq hn,
   fun _ _ _ _ hp hq hr hpq hk hJ => N_ne_prime_pow hp hq hr hpq hk hJ,
   fun _ _ _ _ _ hp hq hr hs hpq hrs ha hJ => N_ne_ras hp hq hr hs hpq hrs ha hJ,
   fun _ _ _ _ _ _ hp hq hpq hJ ha hb hc hd hab hac had hbc hbd hcd haN hbN hcN hdN =>
     omega4_constraints hp hq hpq hJ ha hb hc hd hab hac had hbc hbd hcd haN hbN hcN hdN⟩

/-- **Intended correspondence 2.** The formal claim (stated with `Jumps`, `Theorem28`, the
numeral `10000`, a contrapositive bound, and four distinct prime divisors) is equivalent to the
paper claim (stated with `φ`, `σ`, `10 ^ 4`, `ω`, and one hypothesis block per `(p, q)`). -/
theorem intended_correspondence2 : formal_claim2 ↔ paper_claim2 := by
  have h104 : (10 : ℕ) ^ 4 = 10000 := by norm_num
  constructor
  · rintro ⟨h1, h2, h3, h4, h5, h6, h7, h8, h9⟩ p q hp hq hpq hφ hσ
    have hJ : Jumps (p ^ 2 * q) := ⟨hφ, hσ⟩
    refine ⟨⟨h1 p q hp hq hpq hJ, fun r s hr hs hrs => h2 p q r s hp hq hr hs hpq hrs hJ⟩,
      fun r s t hr hs ht hrs hrt hst => h3 p q r s t hp hq hr hs ht hpq hrs hrt hst hJ,
      fun r s t hr hs ht hrs hrt hst hr5 hs5 ht5 =>
        h4 p q r s t hp hq hr hs ht hpq hrs hrt hst hr5 hs5 ht5 hJ,
      fun r s hr hs hrs => h5 p q r s hp hq hr hs hpq hrs hJ, ?_,
      ⟨fun r k hr hk => h7 p q r k hp hq hr hpq hk hJ,
        fun r s a hr hs hrs ha => h8 p q r s a hp hq hr hs hpq hrs ha hJ⟩,
      fun hω => ?_⟩
    · rw [h104]; by_contra hle; push_neg at hle
      exact h6 p q hp hq hpq hle hJ
    · obtain ⟨a, b, c, d, ha, hb, hc, hd, hab, hac, had, hbc, hbd, hcd, haN, hbN, hcN, hdN⟩ :=
        exists_four_primes_of_omega hω
      exact h9 p q a b c d hp hq hpq hJ ha hb hc hd hab hac had hbc hbd hcd haN hbN hcN hdN
  · intro h
    refine ⟨fun p q hp hq hpq hJ => (h p q hp hq hpq hJ.1 hJ.2).1.1,
      fun p q r s hp hq hr hs hpq hrs hJ => (h p q hp hq hpq hJ.1 hJ.2).1.2 r s hr hs hrs,
      fun p q r s t hp hq hr hs ht hpq hrs hrt hst hJ =>
        (h p q hp hq hpq hJ.1 hJ.2).2.1 r s t hr hs ht hrs hrt hst,
      fun p q r s t hp hq hr hs ht hpq hrs hrt hst hr5 hs5 ht5 hJ =>
        (h p q hp hq hpq hJ.1 hJ.2).2.2.1 r s t hr hs ht hrs hrt hst hr5 hs5 ht5,
      fun p q r s hp hq hr hs hpq hrs hJ =>
        (h p q hp hq hpq hJ.1 hJ.2).2.2.2.1 r s hr hs hrs,
      fun p q hp hq hpq hn hJ => ?_,
      fun p q r k hp hq hr hpq hk hJ =>
        (h p q hp hq hpq hJ.1 hJ.2).2.2.2.2.2.1.1 r k hr hk,
      fun p q r s a hp hq hr hs hpq hrs ha hJ =>
        (h p q hp hq hpq hJ.1 hJ.2).2.2.2.2.2.1.2 r s a hr hs hrs ha,
      fun p q a b c d hp hq hpq hJ ha hb hc hd hab hac had hbc hbd hcd haN hbN hcN hdN =>
        (h p q hp hq hpq hJ.1 hJ.2).2.2.2.2.2.2
          (omega_ge_four_of_primes (by omega) ha hb hc hd hab hac had hbc hbd hcd
            haN hbN hcN hdN)⟩
    have := (h p q hp hq hpq hJ.1 hJ.2).2.2.2.2.1
    rw [h104] at this
    omega

/-- **Theorem L2** (v1.4), obtained from the formal proof through the semantics lock. -/
theorem theorem_L2 : paper_claim2 := intended_correspondence2.mp formal_claim2_holds

end P2qJumps.Semantics2
