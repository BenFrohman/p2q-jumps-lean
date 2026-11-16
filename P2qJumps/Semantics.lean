/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/
import P2qJumps.Main

/-!
# Truth Gate: semantics lock for Theorem L (v1.4)

**STATUS: PENDING AUTHOR APPROVAL.** `paper_claim` below is a draft transcription prepared
for review. It is not approved until the author signs off in `truth-gate.lock.json`.

* `paper_claim` is an independent transcription of the paper statement. It does not mention
  `Jumps`, `Theorem28`, `Lpoly`, or any other definition used by the formal proof.
* `formal_claim` is the conjunction of the statements proved in `P2qJumps.Main`,
  `P2qJumps.ClosedShapes` and `P2qJumps.Cert.Pairs`, in their native form.
* `intended_correspondence : formal_claim ↔ paper_claim` is proved by unfolding and reordering,
  not by `rfl`.
* The public theorem `theorem_L` is obtained through `intended_correspondence.mp`.
-/

namespace P2qJumps.Semantics

open Nat ArithmeticFunction
open scoped ArithmeticFunction.sigma

/-- **Paper claim (PENDING AUTHOR APPROVAL).**

Source: `paper/theorem-L.tex`
(sha256 `8172e9beaa7d88aae2f595396bb4cdfa226f22926f67c9e7944de3a53ed634d1`),
input into `paper/p2q-jumps-v1.4.tex`, Section "Lean-certified reductions (v1.4)",
Theorem L. Verbatim quote:

> Let p and q be distinct primes, n=p^2q and N=n+12, and suppose φ(N)=φ(n)+12 and
> σ(N)=σ(n)+12. Then:
> (i) N is not prime, and N is not a product of two distinct primes;
> (ii) N is not a product of three distinct primes;
> (iii) N is not of the form r^2st with pairwise distinct primes r,s,t ≥ 5;
> (iv) if N=r^3s with distinct primes r,s ≥ 5, then p<r, r^2 divides p^3-p^2-12, and p>10^4;
> (v) n>10^4.
-/
def paper_claim : Prop :=
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
    (∀ r s : ℕ, r.Prime → s.Prime → r ≠ s → 5 ≤ r → 5 ≤ s →
      p ^ 2 * q + 12 = r ^ 3 * s →
      p < r ∧ ((r : ℤ) ^ 2 ∣ (p : ℤ) ^ 3 - (p : ℤ) ^ 2 - 12) ∧ 10 ^ 4 < p) ∧
    -- (v)
    10 ^ 4 < p ^ 2 * q

/-- **Formal claim**: the statements proved in the formalization, in their native form. -/
def formal_claim : Prop :=
  (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) → ¬ (p ^ 2 * q + 12).Prime) ∧
  (∀ p q r s : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → p ≠ q → r ≠ s →
    Jumps (p ^ 2 * q) → p ^ 2 * q + 12 ≠ r * s) ∧
  Theorem28 ∧
  (∀ p q r s t : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → t.Prime → p ≠ q → r ≠ s →
    r ≠ t → s ≠ t → 5 ≤ r → 5 ≤ s → 5 ≤ t → Jumps (p ^ 2 * q) →
    p ^ 2 * q + 12 ≠ r ^ 2 * s * t) ∧
  (∀ p q r s : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → p ≠ q → r ≠ s → 5 ≤ r → 5 ≤ s →
    Jumps (p ^ 2 * q) → p ^ 2 * q + 12 = r ^ 3 * s →
    p < r ∧ ((r : ℤ) ^ 2 ∣ Lpoly p) ∧ 10000 < p) ∧
  (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → p ^ 2 * q ≤ 10000 → ¬ Jumps (p ^ 2 * q))

/-- The formal claim holds. -/
theorem formal_claim_holds : formal_claim :=
  ⟨fun _ _ hp hq hpq hJ => N_not_prime hp hq hpq hJ,
   fun _ _ _ _ hp hq hr hs hpq hrs hJ => N_ne_rs hp hq hr hs hpq hrs hJ,
   theorem28_holds,
   fun _ _ _ _ _ hp hq hr hs ht hpq hrs hrt hst hr5 hs5 ht5 hJ =>
     r2st_empty hp hq hr hs ht hpq hrs hrt hst hr5 hs5 ht5 hJ,
   fun _ _ _ _ hp hq hr hs hpq hrs hr5 hs5 hJ hN =>
     r3s_bound hp hq hr hs hpq hrs hr5 hs5 hJ hN,
   fun _ _ hp hq hpq hn => Cert.no_jumps_p2q_le_10000 hp hq hpq hn⟩

/-- **Intended correspondence.** The formal claim (stated with `Jumps`, `Lpoly`, the
numeral `10000`, and a contrapositive bound) is equivalent to the paper claim (stated with
`φ`, `σ`, the inline polynomial, `10 ^ 4`, and one hypothesis block per `(p, q)`). -/
theorem intended_correspondence : formal_claim ↔ paper_claim := by
  have h104 : (10 : ℕ) ^ 4 = 10000 := by norm_num
  have hL : ∀ p : ℕ, Lpoly (p : ℤ) = (p : ℤ) ^ 3 - (p : ℤ) ^ 2 - 12 := fun _ => by simp only [Lpoly]
  constructor
  · rintro ⟨h1, h2, h3, h4, h5, h6⟩ p q hp hq hpq hφ hσ
    have hJ : Jumps (p ^ 2 * q) := ⟨hφ, hσ⟩
    refine ⟨⟨h1 p q hp hq hpq hJ, fun r s hr hs hrs => h2 p q r s hp hq hr hs hpq hrs hJ⟩,
      fun r s t hr hs ht hrs hrt hst => h3 p q r s t hp hq hr hs ht hpq hrs hrt hst hJ,
      fun r s t hr hs ht hrs hrt hst hr5 hs5 ht5 =>
        h4 p q r s t hp hq hr hs ht hpq hrs hrt hst hr5 hs5 ht5 hJ,
      fun r s hr hs hrs hr5 hs5 hN => ?_, ?_⟩
    · obtain ⟨a, b, c⟩ := h5 p q r s hp hq hr hs hpq hrs hr5 hs5 hJ hN
      exact ⟨a, hL p ▸ b, h104 ▸ c⟩
    · rw [h104]; by_contra hle; push_neg at hle
      exact h6 p q hp hq hpq hle hJ
  · intro h
    refine ⟨fun p q hp hq hpq hJ => (h p q hp hq hpq hJ.1 hJ.2).1.1,
      fun p q r s hp hq hr hs hpq hrs hJ => (h p q hp hq hpq hJ.1 hJ.2).1.2 r s hr hs hrs,
      fun p q r s t hp hq hr hs ht hpq hrs hrt hst hJ =>
        (h p q hp hq hpq hJ.1 hJ.2).2.1 r s t hr hs ht hrs hrt hst,
      fun p q r s t hp hq hr hs ht hpq hrs hrt hst hr5 hs5 ht5 hJ =>
        (h p q hp hq hpq hJ.1 hJ.2).2.2.1 r s t hr hs ht hrs hrt hst hr5 hs5 ht5,
      fun p q r s hp hq hr hs hpq hrs hr5 hs5 hJ hN => ?_,
      fun p q hp hq hpq hn hJ => ?_⟩
    · obtain ⟨a, b, c⟩ := (h p q hp hq hpq hJ.1 hJ.2).2.2.2.1 r s hr hs hrs hr5 hs5 hN
      exact ⟨a, (hL p).symm ▸ b, h104 ▸ c⟩
    · have := (h p q hp hq hpq hJ.1 hJ.2).2.2.2.2
      rw [h104] at this
      omega

/-- **Theorem L** (v1.4), obtained from the formal proof through the semantics lock. -/
theorem theorem_L : paper_claim := intended_correspondence.mp formal_claim_holds

end P2qJumps.Semantics
