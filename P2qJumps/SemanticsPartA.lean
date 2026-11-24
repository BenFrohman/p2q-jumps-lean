/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.H1
import P2qJumps.Hensel
import P2qJumps.H2Reduction
import P2qJumps.H3TwoAdic
import P2qJumps.ThmEShapes
import P2qJumps.PropC
import P2qJumps.ThreeRegimes
import P2qJumps.ClosedLedger
import P2qJumps.R2S2T

/-!
# Truth Gate: semantics locks for the remaining kernel-proved Part A statements (v1.4.1)

Theorems L and L2 remain locked in `Semantics.lean` / `Semantics2.lean` and are not changed here.
Each `paper_claim_*` below is an independent transcription of the cited v1.4.1 paper statement.
It does not mention `Jumps`, `Theorem28`, `Lpoly`, or other names used by the formal proof.
Each `formal_claim_*` is the native Lean theorem (or the exact conjunction of native theorems).
Each `intended_correspondence_*` is proved by unfolding and reordering, not by `rfl`.
Each public theorem is obtained through `intended_correspondence_*.mp`.

Open items are not closed here: H2 in full, H3 for `p ≡ 3 (mod 4)`, the emptiness of
`r^2 s^2 t` and `r^2 s^2 t u`, and Conjecture 3 remain named hypotheses or open `Prop`s.

The v1.4.1 paper and PDF are not edited. Quotes are taken from `paper/p2q-jumps-v1.4.tex`
as published at commit `033e12d` (sha256
`48d680bc3287b76434970dffd9bb80cdfa122affd6c76c8b70bb7061f20c5767`).
-/

namespace P2qJumps.SemanticsPartA

open Nat ArithmeticFunction
open scoped ArithmeticFunction.sigma
open P2qStructural (T rad)

/-! ### Theorem 28 (`sec:A-ii`)

Source: `paper/p2q-jumps-v1.4.tex`, Section "Proof of Theorem L(ii): Theorem 28".
Verbatim:

> Let p and q be distinct primes, n=p^2q and N=n+12, and suppose φ(N)=φ(n)+12 and
> σ(N)=σ(n)+12. Then N is not a product of three distinct primes.
-/

def paper_claim_theorem28 : Prop :=
  ∀ p q r s t : ℕ,
    p.Prime → q.Prime → r.Prime → s.Prime → t.Prime →
    p ≠ q → r ≠ s → r ≠ t → s ≠ t →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    p ^ 2 * q + 12 ≠ r * s * t

def formal_claim_theorem28 : Prop := Theorem28

theorem formal_claim_theorem28_holds : formal_claim_theorem28 :=
  theorem28_holds

theorem intended_correspondence_theorem28 :
    formal_claim_theorem28 ↔ paper_claim_theorem28 := by
  constructor
  · intro h p q r s t hp hq hr hs ht hpq hrs hrt hst hφ hσ
    exact h p q r s t hp hq hr hs ht hpq hrs hrt hst ⟨hφ, hσ⟩
  · intro h p q r s t hp hq hr hs ht hpq hrs hrt hst hJ
    exact h p q r s t hp hq hr hs ht hpq hrs hrt hst hJ.1 hJ.2

theorem theorem_theorem28 : paper_claim_theorem28 :=
  intended_correspondence_theorem28.mp formal_claim_theorem28_holds

/-! ### Preamble (`prop:A-preamble`)

> If (eq:jumps) holds, then p≥5, q≥5, N is odd, N is not a square, and gcd(N,6pq)=1.
-/

def paper_claim_preamble : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    5 ≤ p ∧ 5 ≤ q ∧ Odd (p ^ 2 * q + 12) ∧ ¬ IsSquare (p ^ 2 * q + 12) ∧
      Nat.Coprime (p ^ 2 * q + 12) (6 * p * q)

def formal_claim_preamble : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    5 ≤ p ∧ 5 ≤ q ∧ Odd (p ^ 2 * q + 12) ∧ ¬ IsSquare (p ^ 2 * q + 12) ∧
      Nat.Coprime (p ^ 2 * q + 12) (6 * p * q)

theorem formal_claim_preamble_holds : formal_claim_preamble :=
  fun _ _ hp hq hpq hJ => preamble hp hq hpq hJ

theorem intended_correspondence_preamble :
    formal_claim_preamble ↔ paper_claim_preamble := by
  constructor
  · intro h p q hp hq hpq hφ hσ
    exact h p q hp hq hpq ⟨hφ, hσ⟩
  · intro h p q hp hq hpq hJ
    exact h p q hp hq hpq hJ.1 hJ.2

theorem theorem_preamble : paper_claim_preamble :=
  intended_correspondence_preamble.mp formal_claim_preamble_holds

/-! ### r^2 s t empty (`thm:A-r2st-empty`)

> N≠r^2st for pairwise distinct primes r,s,t≥5.
-/

def paper_claim_r2st : Prop :=
  ∀ p q r s t : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → t.Prime →
    p ≠ q → r ≠ s → r ≠ t → s ≠ t → 5 ≤ r → 5 ≤ s → 5 ≤ t →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    p ^ 2 * q + 12 ≠ r ^ 2 * s * t

def formal_claim_r2st : Prop :=
  ∀ p q r s t : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → t.Prime →
    p ≠ q → r ≠ s → r ≠ t → s ≠ t → 5 ≤ r → 5 ≤ s → 5 ≤ t →
    Jumps (p ^ 2 * q) → p ^ 2 * q + 12 ≠ r ^ 2 * s * t

theorem formal_claim_r2st_holds : formal_claim_r2st :=
  fun _ _ _ _ _ hp hq hr hs ht hpq hrs hrt hst hr5 hs5 ht5 hJ =>
    r2st_empty hp hq hr hs ht hpq hrs hrt hst hr5 hs5 ht5 hJ

theorem intended_correspondence_r2st :
    formal_claim_r2st ↔ paper_claim_r2st := by
  constructor
  · intro h p q r s t hp hq hr hs ht hpq hrs hrt hst hr5 hs5 ht5 hφ hσ
    exact h p q r s t hp hq hr hs ht hpq hrs hrt hst hr5 hs5 ht5 ⟨hφ, hσ⟩
  · intro h p q r s t hp hq hr hs ht hpq hrs hrt hst hr5 hs5 ht5 hJ
    exact h p q r s t hp hq hr hs ht hpq hrs hrt hst hr5 hs5 ht5 hJ.1 hJ.2

theorem theorem_r2st : paper_claim_r2st :=
  intended_correspondence_r2st.mp formal_claim_r2st_holds

/-! ### ω(N)≥4 constraints (`thm:A-omega4`)

> Assume (eq:jumps). If N has at least four distinct prime factors, then q≥3p^2 and every
> prime factor r of N satisfies r>p. In particular N>p^4.

The paper cites `omega4_constraints`; the "in particular" clause is `omega4_size`.
Both native statements are locked.
-/

def paper_claim_omega4 : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    4 ≤ (p ^ 2 * q + 12).primeFactors.card →
    3 * p ^ 2 ≤ q ∧ (∀ r : ℕ, r.Prime → r ∣ p ^ 2 * q + 12 → p < r) ∧
      p ^ 4 < p ^ 2 * q + 12

def formal_claim_omega4 : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    4 ≤ (p ^ 2 * q + 12).primeFactors.card →
    3 * p ^ 2 ≤ q ∧ (∀ r : ℕ, r.Prime → r ∣ p ^ 2 * q + 12 → p < r) ∧
      p ^ 4 < p ^ 2 * q + 12

theorem formal_claim_omega4_holds : formal_claim_omega4 :=
  fun _ _ hp hq hpq hJ hω => omega4_size hp hq hpq hJ hω

theorem intended_correspondence_omega4 :
    formal_claim_omega4 ↔ paper_claim_omega4 := by
  constructor
  · intro h p q hp hq hpq hφ hσ hω
    exact h p q hp hq hpq ⟨hφ, hσ⟩ hω
  · intro h p q hp hq hpq hJ hω
    exact h p q hp hq hpq hJ.1 hJ.2 hω

theorem theorem_omega4 : paper_claim_omega4 :=
  intended_correspondence_omega4.mp formal_claim_omega4_holds

def paper_claim_omega4_constraints : Prop :=
  ∀ p q a b c d : ℕ, p.Prime → q.Prime → p ≠ q →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    a.Prime → b.Prime → c.Prime → d.Prime →
    a ≠ b → a ≠ c → a ≠ d → b ≠ c → b ≠ d → c ≠ d →
    a ∣ p ^ 2 * q + 12 → b ∣ p ^ 2 * q + 12 → c ∣ p ^ 2 * q + 12 →
    d ∣ p ^ 2 * q + 12 →
    3 * p ^ 2 ≤ q ∧ ∀ r : ℕ, r.Prime → r ∣ p ^ 2 * q + 12 → p < r

def formal_claim_omega4_constraints : Prop :=
  ∀ p q a b c d : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    a.Prime → b.Prime → c.Prime → d.Prime →
    a ≠ b → a ≠ c → a ≠ d → b ≠ c → b ≠ d → c ≠ d →
    a ∣ p ^ 2 * q + 12 → b ∣ p ^ 2 * q + 12 → c ∣ p ^ 2 * q + 12 →
    d ∣ p ^ 2 * q + 12 →
    3 * p ^ 2 ≤ q ∧ ∀ r : ℕ, r.Prime → r ∣ p ^ 2 * q + 12 → p < r

theorem formal_claim_omega4_constraints_holds : formal_claim_omega4_constraints :=
  fun _ _ _ _ _ _ hp hq hpq hJ ha hb hc hd hab hac had hbc hbd hcd haN hbN hcN hdN =>
    omega4_constraints hp hq hpq hJ ha hb hc hd hab hac had hbc hbd hcd haN hbN hcN hdN

theorem intended_correspondence_omega4_constraints :
    formal_claim_omega4_constraints ↔ paper_claim_omega4_constraints := by
  constructor
  · intro h p q a b c d hp hq hpq hφ hσ ha hb hc hd hab hac had hbc hbd hcd haN hbN hcN hdN
    exact h p q a b c d hp hq hpq ⟨hφ, hσ⟩ ha hb hc hd hab hac had hbc hbd hcd haN hbN hcN hdN
  · intro h p q a b c d hp hq hpq hJ ha hb hc hd hab hac had hbc hbd hcd haN hbN hcN hdN
    exact h p q a b c d hp hq hpq hJ.1 hJ.2 ha hb hc hd hab hac had hbc hbd hcd haN hbN hcN hdN

theorem theorem_omega4_constraints : paper_claim_omega4_constraints :=
  intended_correspondence_omega4_constraints.mp formal_claim_omega4_constraints_holds

/-! ### r^3 s empty (`thm:A-r3s-empty`)

> Assume (eq:jumps). Then N is not of the form r^3s with distinct primes r,s.
-/

def paper_claim_r3s : Prop :=
  ∀ p q r s : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → p ≠ q → r ≠ s →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    p ^ 2 * q + 12 ≠ r ^ 3 * s

def formal_claim_r3s : Prop :=
  ∀ p q r s : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → p ≠ q → r ≠ s →
    Jumps (p ^ 2 * q) → p ^ 2 * q + 12 ≠ r ^ 3 * s

theorem formal_claim_r3s_holds : formal_claim_r3s :=
  fun _ _ _ _ hp hq hr hs hpq hrs hJ => r3s_empty hp hq hr hs hpq hrs hJ

theorem intended_correspondence_r3s :
    formal_claim_r3s ↔ paper_claim_r3s := by
  constructor
  · intro h p q r s hp hq hr hs hpq hrs hφ hσ
    exact h p q r s hp hq hr hs hpq hrs ⟨hφ, hσ⟩
  · intro h p q r s hp hq hr hs hpq hrs hJ
    exact h p q r s hp hq hr hs hpq hrs hJ.1 hJ.2

theorem theorem_r3s : paper_claim_r3s :=
  intended_correspondence_r3s.mp formal_claim_r3s_holds

/-! ### Theorem A (`thm:A-ras`)

> Assume (eq:jumps). Then N≠r^as for all distinct primes r,s and all a≥2.
> (Since r^as=s r^a, this also excludes rs^a.)
-/

def paper_claim_theoremA : Prop :=
  ∀ p q r s a : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → p ≠ q → r ≠ s → 2 ≤ a →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    p ^ 2 * q + 12 ≠ r ^ a * s ∧ p ^ 2 * q + 12 ≠ r * s ^ a

def formal_claim_theoremA : Prop :=
  ∀ p q r s a : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → p ≠ q → r ≠ s → 2 ≤ a →
    Jumps (p ^ 2 * q) → p ^ 2 * q + 12 ≠ r ^ a * s ∧ p ^ 2 * q + 12 ≠ r * s ^ a

theorem formal_claim_theoremA_holds : formal_claim_theoremA :=
  fun p q r s a hp hq hr hs hpq hrs ha hJ =>
    theoremA hp hq hpq hJ hr hs hrs ha

theorem intended_correspondence_theoremA :
    formal_claim_theoremA ↔ paper_claim_theoremA := by
  constructor
  · intro h p q r s a hp hq hr hs hpq hrs ha hφ hσ
    exact h p q r s a hp hq hr hs hpq hrs ha ⟨hφ, hσ⟩
  · intro h p q r s a hp hq hr hs hpq hrs ha hJ
    exact h p q r s a hp hq hr hs hpq hrs ha hJ.1 hJ.2

theorem theorem_theoremA : paper_claim_theoremA :=
  intended_correspondence_theoremA.mp formal_claim_theoremA_holds

def paper_claim_prime_pow : Prop :=
  ∀ p q r k : ℕ, p.Prime → q.Prime → r.Prime → p ≠ q → 1 ≤ k →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    p ^ 2 * q + 12 ≠ r ^ k

def formal_claim_prime_pow : Prop :=
  ∀ p q r k : ℕ, p.Prime → q.Prime → r.Prime → p ≠ q → 1 ≤ k →
    Jumps (p ^ 2 * q) → p ^ 2 * q + 12 ≠ r ^ k

theorem formal_claim_prime_pow_holds : formal_claim_prime_pow :=
  fun _ _ _ _ hp hq hr hpq hk hJ => N_ne_prime_pow hp hq hr hpq hk hJ

theorem intended_correspondence_prime_pow :
    formal_claim_prime_pow ↔ paper_claim_prime_pow := by
  constructor
  · intro h p q r k hp hq hr hpq hk hφ hσ
    exact h p q r k hp hq hr hpq hk ⟨hφ, hσ⟩
  · intro h p q r k hp hq hr hpq hk hJ
    exact h p q r k hp hq hr hpq hk hJ.1 hJ.2

theorem theorem_prime_pow : paper_claim_prime_pow :=
  intended_correspondence_prime_pow.mp formal_claim_prime_pow_holds

/-! ### r^3 s t empty (`thm:A-r3st-empty`)

> Assume (eq:jumps). Then N is not of the form r^3st with pairwise distinct primes r,s,t.
> There is no bound on p.
-/

def paper_claim_r3st : Prop :=
  ∀ p q r s t : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → t.Prime →
    p ≠ q → r ≠ s → r ≠ t → s ≠ t →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    p ^ 2 * q + 12 ≠ r ^ 3 * s * t

def formal_claim_r3st : Prop :=
  ∀ p q r s t : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → t.Prime →
    p ≠ q → r ≠ s → r ≠ t → s ≠ t →
    Jumps (p ^ 2 * q) → p ^ 2 * q + 12 ≠ r ^ 3 * s * t

theorem formal_claim_r3st_holds : formal_claim_r3st :=
  fun _ _ _ _ _ hp hq hr hs ht hpq hrs hrt hst hJ =>
    r3st_empty hp hq hr hs ht hpq hrs hrt hst hJ

theorem intended_correspondence_r3st :
    formal_claim_r3st ↔ paper_claim_r3st := by
  constructor
  · intro h p q r s t hp hq hr hs ht hpq hrs hrt hst hφ hσ
    exact h p q r s t hp hq hr hs ht hpq hrs hrt hst ⟨hφ, hσ⟩
  · intro h p q r s t hp hq hr hs ht hpq hrs hrt hst hJ
    exact h p q r s t hp hq hr hs ht hpq hrs hrt hst hJ.1 hJ.2

theorem theorem_r3st : paper_claim_r3st :=
  intended_correspondence_r3st.mp formal_claim_r3st_holds

/-! ### Theorem B (`thm:A-B`)

> Assume (eq:jumps). Then N is not powerful with ω(N)≥2. Together with Lemma lem:A-omega2:
> N is not powerful.
-/


def paper_claim_theoremB : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    ¬ ((∀ ℓ ∈ (p ^ 2 * q + 12).primeFactors, ℓ ^ 2 ∣ p ^ 2 * q + 12) ∧
        2 ≤ (p ^ 2 * q + 12).primeFactors.card) ∧
      ¬ ∀ ℓ ∈ (p ^ 2 * q + 12).primeFactors, ℓ ^ 2 ∣ p ^ 2 * q + 12

/-- The paper's first clause is "not powerful with ω≥2"; the Lean theorem `theoremB`
is the equivalent implication `powerful → ω≥2 → False`. The second clause is
`N_not_powerful`. -/
def formal_claim_theoremB : Prop :=
  (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    (∀ ℓ ∈ (p ^ 2 * q + 12).primeFactors, ℓ ^ 2 ∣ p ^ 2 * q + 12) →
    2 ≤ (p ^ 2 * q + 12).primeFactors.card → False) ∧
  (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    ¬ ∀ ℓ ∈ (p ^ 2 * q + 12).primeFactors, ℓ ^ 2 ∣ p ^ 2 * q + 12)

theorem formal_claim_theoremB_holds : formal_claim_theoremB :=
  ⟨fun _ _ hp hq hpq hJ hpow hω => theoremB hp hq hpq hJ hpow hω,
    fun _ _ hp hq hpq hJ => N_not_powerful hp hq hpq hJ⟩

theorem intended_correspondence_theoremB :
    formal_claim_theoremB ↔ paper_claim_theoremB := by
  constructor
  · intro h p q hp hq hpq hφ hσ
    refine ⟨?_, h.2 p q hp hq hpq ⟨hφ, hσ⟩⟩
    intro ⟨hpow, hω⟩
    exact h.1 p q hp hq hpq ⟨hφ, hσ⟩ hpow hω
  · intro h
    constructor
    · intro p q hp hq hpq hJ hpow hω
      exact (h p q hp hq hpq hJ.1 hJ.2).1 ⟨hpow, hω⟩
    · intro p q hp hq hpq hJ
      exact (h p q hp hq hpq hJ.1 hJ.2).2

theorem theorem_theoremB : paper_claim_theoremB :=
  intended_correspondence_theoremB.mp formal_claim_theoremB_holds

/-! ### Theorem E (`thm:A-E`)

> Assume (eq:jumps) and write δ=q+2p+1. Let r,r1,r2,t and a,b,c denote primes.
> (i) r^4 ∤ N.
> (ii) If r1≠r2, r1^2,r2^2∣N, and t∣N with t≠r1,r2, then q>5p^2-4p-3.
> (iii) There are no pairwise distinct a,b,c with a^2,b^2,c^2∣N.
> (iv) Under the hypotheses of (ii): r1^3 ∤ N (and likewise r2^3 ∤ N);
> r1 r2 ∣ L(p); N≤r_i^2 δ; and N/δ > √L(p).
> (v) If r^3∣N, then r^2∣L(p).
-/

def paper_claim_theoremE : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    (∀ r : ℕ, r.Prime → ¬ r ^ 4 ∣ p ^ 2 * q + 12) ∧
    (∀ r₁ r₂ t : ℕ, r₁.Prime → r₂.Prime → t.Prime → r₁ ≠ r₂ → t ≠ r₁ → t ≠ r₂ →
      r₁ ^ 2 ∣ p ^ 2 * q + 12 → r₂ ^ 2 ∣ p ^ 2 * q + 12 → t ∣ p ^ 2 * q + 12 →
      5 * (p : ℤ) ^ 2 - 4 * p - 3 < q) ∧
    (∀ a b c : ℕ, a.Prime → b.Prime → c.Prime → a ≠ b → a ≠ c → b ≠ c →
      a ^ 2 ∣ p ^ 2 * q + 12 → b ^ 2 ∣ p ^ 2 * q + 12 → c ^ 2 ∣ p ^ 2 * q + 12 → False) ∧
    (∀ r₁ r₂ t : ℕ, r₁.Prime → r₂.Prime → t.Prime → r₁ ≠ r₂ → t ≠ r₁ → t ≠ r₂ →
      r₁ ^ 2 ∣ p ^ 2 * q + 12 → r₂ ^ 2 ∣ p ^ 2 * q + 12 → t ∣ p ^ 2 * q + 12 →
      ¬ r₁ ^ 3 ∣ p ^ 2 * q + 12 ∧ ¬ r₂ ^ 3 ∣ p ^ 2 * q + 12 ∧
        ((r₁ * r₂ : ℕ) : ℤ) ∣ (p : ℤ) ^ 3 - p ^ 2 - 12 ∧
        ((p ^ 2 * q + 12 : ℕ) : ℤ) ≤ (r₁ : ℤ) ^ 2 * (q + 2 * p + 1) ∧
        ((p ^ 2 * q + 12 : ℕ) : ℤ) ≤ (r₂ : ℤ) ^ 2 * (q + 2 * p + 1) ∧
        Real.sqrt ((p : ℝ) ^ 3 - p ^ 2 - 12) <
          ((p ^ 2 * q + 12 : ℕ) : ℝ) / ((q : ℝ) + 2 * p + 1)) ∧
    (∀ r : ℕ, r.Prime → r ^ 3 ∣ p ^ 2 * q + 12 →
      (r : ℤ) ^ 2 ∣ (p : ℤ) ^ 3 - p ^ 2 - 12)

def formal_claim_theoremE : Prop :=
  (∀ p q r : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) → r.Prime →
    ¬ r ^ 4 ∣ p ^ 2 * q + 12) ∧
  (∀ p q r₁ r₂ t : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    r₁.Prime → r₂.Prime → t.Prime → r₁ ≠ r₂ → t ≠ r₁ → t ≠ r₂ →
    r₁ ^ 2 ∣ p ^ 2 * q + 12 → r₂ ^ 2 ∣ p ^ 2 * q + 12 → t ∣ p ^ 2 * q + 12 →
    5 * (p : ℤ) ^ 2 - 4 * p - 3 < q) ∧
  (∀ p q a b c : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    a.Prime → b.Prime → c.Prime → a ≠ b → a ≠ c → b ≠ c →
    a ^ 2 ∣ p ^ 2 * q + 12 → b ^ 2 ∣ p ^ 2 * q + 12 → c ^ 2 ∣ p ^ 2 * q + 12 → False) ∧
  (∀ p q r₁ r₂ t : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    r₁.Prime → r₂.Prime → t.Prime → r₁ ≠ r₂ → t ≠ r₁ → t ≠ r₂ →
    r₁ ^ 2 ∣ p ^ 2 * q + 12 → r₂ ^ 2 ∣ p ^ 2 * q + 12 → t ∣ p ^ 2 * q + 12 →
    ¬ r₁ ^ 3 ∣ p ^ 2 * q + 12 ∧ ¬ r₂ ^ 3 ∣ p ^ 2 * q + 12 ∧
      ((r₁ * r₂ : ℕ) : ℤ) ∣ (p : ℤ) ^ 3 - p ^ 2 - 12 ∧
      ((p ^ 2 * q + 12 : ℕ) : ℤ) ≤ (r₁ : ℤ) ^ 2 * (q + 2 * p + 1) ∧
      ((p ^ 2 * q + 12 : ℕ) : ℤ) ≤ (r₂ : ℤ) ^ 2 * (q + 2 * p + 1) ∧
      Real.sqrt ((p : ℝ) ^ 3 - p ^ 2 - 12) <
        ((p ^ 2 * q + 12 : ℕ) : ℝ) / ((q : ℝ) + 2 * p + 1)) ∧
  (∀ p q r : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) → r.Prime →
    r ^ 3 ∣ p ^ 2 * q + 12 → (r : ℤ) ^ 2 ∣ (p : ℤ) ^ 3 - p ^ 2 - 12)

theorem formal_claim_theoremE_holds : formal_claim_theoremE := by
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · intro p q r hp hq hpq hJ hr
    exact theoremE_i hp hq hpq hJ hr
  · intro p q r₁ r₂ t hp hq hpq hJ h1 h2 ht h12 ht1 ht2 hd1 hd2 hdt
    exact theoremE_ii hp hq hpq hJ h1 h2 ht h12 ht1 ht2 hd1 hd2 hdt
  · intro p q a b c hp hq hpq hJ ha hb hc hab hac hbc hda hdb hdc
    exact theoremE_iii hp hq hpq hJ ha hb hc hab hac hbc hda hdb hdc
  · intro p q r₁ r₂ t hp hq hpq hJ h1 h2 ht h12 ht1 ht2 hd1 hd2 hdt
    have hq0 := theoremE_ii hp hq hpq hJ h1 h2 ht h12 ht1 ht2 hd1 hd2 hdt
    refine ⟨?_, ?_, theoremE_iv_dvd hp hq hpq hJ h1 h2 h12 hd1 hd2,
      theoremE_iv_size hp hq hpq hJ h1 hd1, theoremE_iv_size hp hq hpq hJ h2 hd2,
      theoremE_iv_sqrt hp hq hpq hJ hq0⟩
    · intro hd13
      exact theoremE_iv hp hq hpq hJ h1 h2 ht h12 ht1 ht2 hd13 hd2 hdt
    · intro hd23
      exact theoremE_iv hp hq hpq hJ h2 h1 ht h12.symm ht2 ht1 hd23 hd1 hdt
  · intro p q r hp hq hpq hJ hr h3
    exact theoremE_v hp hq hpq hJ hr h3

theorem intended_correspondence_theoremE :
    formal_claim_theoremE ↔ paper_claim_theoremE := by
  constructor
  · intro h p q hp hq hpq hφ hσ
    refine ⟨?_, ?_, ?_, ?_, ?_⟩
    · intro r hr; exact h.1 p q r hp hq hpq ⟨hφ, hσ⟩ hr
    · intro r₁ r₂ t h1 h2 ht h12 ht1 ht2 hd1 hd2 hdt
      exact h.2.1 p q r₁ r₂ t hp hq hpq ⟨hφ, hσ⟩ h1 h2 ht h12 ht1 ht2 hd1 hd2 hdt
    · intro a b c ha hb hc hab hac hbc hda hdb hdc
      exact h.2.2.1 p q a b c hp hq hpq ⟨hφ, hσ⟩ ha hb hc hab hac hbc hda hdb hdc
    · intro r₁ r₂ t h1 h2 ht h12 ht1 ht2 hd1 hd2 hdt
      exact h.2.2.2.1 p q r₁ r₂ t hp hq hpq ⟨hφ, hσ⟩ h1 h2 ht h12 ht1 ht2 hd1 hd2 hdt
    · intro r hr h3
      exact h.2.2.2.2 p q r hp hq hpq ⟨hφ, hσ⟩ hr h3
  · intro h
    refine ⟨?_, ?_, ?_, ?_, ?_⟩
    · intro p q r hp hq hpq hJ hr
      exact (h p q hp hq hpq hJ.1 hJ.2).1 r hr
    · intro p q r₁ r₂ t hp hq hpq hJ h1 h2 ht h12 ht1 ht2 hd1 hd2 hdt
      exact (h p q hp hq hpq hJ.1 hJ.2).2.1 r₁ r₂ t h1 h2 ht h12 ht1 ht2 hd1 hd2 hdt
    · intro p q a b c hp hq hpq hJ ha hb hc hab hac hbc hda hdb hdc
      exact (h p q hp hq hpq hJ.1 hJ.2).2.2.1 a b c ha hb hc hab hac hbc hda hdb hdc
    · intro p q r₁ r₂ t hp hq hpq hJ h1 h2 ht h12 ht1 ht2 hd1 hd2 hdt
      exact (h p q hp hq hpq hJ.1 hJ.2).2.2.2.1 r₁ r₂ t h1 h2 ht h12 ht1 ht2 hd1 hd2 hdt
    · intro p q r hp hq hpq hJ hr h3
      exact (h p q hp hq hpq hJ.1 hJ.2).2.2.2.2 r hr h3

theorem theorem_theoremE : paper_claim_theoremE :=
  intended_correspondence_theoremE.mp formal_claim_theoremE_holds

/-! ### Theorem E shapes (`thm:A-E-shapes`)

> Assume (eq:jumps) and that r^2∣N for some prime r. Then one of the following holds.
> (a) N=r^2V or N=r^3V for a prime r and a squarefree V with gcd(r,V)=1 and ω(V)≥2.
> (b) N=r1^2 r2^2 V for distinct primes r1,r2 and a squarefree V with gcd(r1 r2,V)=1
> and ω(V)≥1; moreover r1 r2∣L(p) and q>5p^2-4p-3.
-/

def paper_claim_E_shapes : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    (∃ r : ℕ, r.Prime ∧ r ^ 2 ∣ p ^ 2 * q + 12) →
    (∃ r V : ℕ, r.Prime ∧ Squarefree V ∧ Nat.Coprime r V ∧ 2 ≤ V.primeFactors.card ∧
        (p ^ 2 * q + 12 = r ^ 2 * V ∨ p ^ 2 * q + 12 = r ^ 3 * V)) ∨
      (∃ r₁ r₂ V : ℕ, r₁.Prime ∧ r₂.Prime ∧ r₁ ≠ r₂ ∧ Squarefree V ∧
        Nat.Coprime (r₁ * r₂) V ∧ 1 ≤ V.primeFactors.card ∧
        p ^ 2 * q + 12 = r₁ ^ 2 * r₂ ^ 2 * V ∧
        ((r₁ * r₂ : ℕ) : ℤ) ∣ (p : ℤ) ^ 3 - p ^ 2 - 12 ∧
        5 * (p : ℤ) ^ 2 - 4 * p - 3 < q)

def formal_claim_E_shapes : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    (∃ r : ℕ, r.Prime ∧ r ^ 2 ∣ p ^ 2 * q + 12) →
    (∃ r V : ℕ, r.Prime ∧ Squarefree V ∧ Nat.Coprime r V ∧ 2 ≤ V.primeFactors.card ∧
        (p ^ 2 * q + 12 = r ^ 2 * V ∨ p ^ 2 * q + 12 = r ^ 3 * V)) ∨
      (∃ r₁ r₂ V : ℕ, r₁.Prime ∧ r₂.Prime ∧ r₁ ≠ r₂ ∧ Squarefree V ∧
        Nat.Coprime (r₁ * r₂) V ∧ 1 ≤ V.primeFactors.card ∧
        p ^ 2 * q + 12 = r₁ ^ 2 * r₂ ^ 2 * V ∧
        ((r₁ * r₂ : ℕ) : ℤ) ∣ (p : ℤ) ^ 3 - p ^ 2 - 12 ∧
        5 * (p : ℤ) ^ 2 - 4 * p - 3 < q)

theorem formal_claim_E_shapes_holds : formal_claim_E_shapes :=
  fun _ _ hp hq hpq hJ hR => theoremE_shapes hp hq hpq hJ hR

theorem intended_correspondence_E_shapes :
    formal_claim_E_shapes ↔ paper_claim_E_shapes := by
  constructor
  · intro h p q hp hq hpq hφ hσ hR
    exact h p q hp hq hpq ⟨hφ, hσ⟩ hR
  · intro h p q hp hq hpq hJ hR
    exact h p q hp hq hpq hJ.1 hJ.2 hR

theorem theorem_E_shapes : paper_claim_E_shapes :=
  intended_correspondence_E_shapes.mp formal_claim_E_shapes_holds

/-! ### Theorem D (`thm:A-D`)

> Assume (eq:jumps), N squarefree and k=ω(N)≥4. Then q≥p^2(k^2-k-1)^2≥121p^2 and k≥p.
> In particular k=4 is impossible.
-/

def paper_claim_theoremD : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    Squarefree (p ^ 2 * q + 12) →
    4 ≤ (p ^ 2 * q + 12).primeFactors.card →
    p ^ 2 * ((p ^ 2 * q + 12).primeFactors.card ^ 2 -
        (p ^ 2 * q + 12).primeFactors.card - 1) ^ 2 ≤ q ∧
      121 * p ^ 2 ≤ p ^ 2 * ((p ^ 2 * q + 12).primeFactors.card ^ 2 -
        (p ^ 2 * q + 12).primeFactors.card - 1) ^ 2 ∧
      p ≤ (p ^ 2 * q + 12).primeFactors.card ∧
      (p ^ 2 * q + 12).primeFactors.card ≠ 4

def formal_claim_theoremD : Prop :=
  (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    Squarefree (p ^ 2 * q + 12) → 4 ≤ (p ^ 2 * q + 12).primeFactors.card →
    p ^ 2 * ((p ^ 2 * q + 12).primeFactors.card ^ 2 -
        (p ^ 2 * q + 12).primeFactors.card - 1) ^ 2 ≤ q ∧
      121 * p ^ 2 ≤ p ^ 2 * ((p ^ 2 * q + 12).primeFactors.card ^ 2 -
        (p ^ 2 * q + 12).primeFactors.card - 1) ^ 2 ∧
      p ≤ (p ^ 2 * q + 12).primeFactors.card) ∧
  (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    Squarefree (p ^ 2 * q + 12) → (p ^ 2 * q + 12).primeFactors.card = 4 → False)

theorem formal_claim_theoremD_holds : formal_claim_theoremD :=
  ⟨fun _ _ hp hq hpq hJ hsq hk => theoremD hp hq hpq hJ hsq hk,
    fun _ _ hp hq hpq hJ hsq hk => theoremD_four hp hq hpq hJ hsq hk⟩

theorem intended_correspondence_theoremD :
    formal_claim_theoremD ↔ paper_claim_theoremD := by
  constructor
  · intro h p q hp hq hpq hφ hσ hsq hk
    obtain ⟨hq0, h121, hkp⟩ := h.1 p q hp hq hpq ⟨hφ, hσ⟩ hsq hk
    refine ⟨hq0, h121, hkp, ?_⟩
    intro h4
    exact h.2 p q hp hq hpq ⟨hφ, hσ⟩ hsq h4
  · intro h
    constructor
    · intro p q hp hq hpq hJ hsq hk
      obtain ⟨hq0, h121, hkp, _⟩ := h p q hp hq hpq hJ.1 hJ.2 hsq hk
      exact ⟨hq0, h121, hkp⟩
    · intro p q hp hq hpq hJ hsq h4
      exact (h p q hp hq hpq hJ.1 hJ.2 hsq (by omega)).2.2.2 h4

theorem theorem_theoremD : paper_claim_theoremD :=
  intended_correspondence_theoremD.mp formal_claim_theoremD_holds

/-! ### Corollary F1

> If N is squarefree and ω(N)≥4, then p=7 and 7≤ω(N)≤9.
-/

def paper_claim_F1 : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    Squarefree (p ^ 2 * q + 12) →
    4 ≤ (p ^ 2 * q + 12).primeFactors.card →
    p = 7 ∧ 7 ≤ (p ^ 2 * q + 12).primeFactors.card ∧
      (p ^ 2 * q + 12).primeFactors.card ≤ 9

def formal_claim_F1 : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    Squarefree (p ^ 2 * q + 12) → 4 ≤ (p ^ 2 * q + 12).primeFactors.card →
    p = 7 ∧ 7 ≤ (p ^ 2 * q + 12).primeFactors.card ∧
      (p ^ 2 * q + 12).primeFactors.card ≤ 9

theorem formal_claim_F1_holds : formal_claim_F1 :=
  fun _ _ hp hq hpq hJ hsq hk => corollaryF1 hp hq hpq hJ hsq hk

theorem intended_correspondence_F1 :
    formal_claim_F1 ↔ paper_claim_F1 := by
  constructor
  · intro h p q hp hq hpq hφ hσ hsq hk
    exact h p q hp hq hpq ⟨hφ, hσ⟩ hsq hk
  · intro h p q hp hq hpq hJ hsq hk
    exact h p q hp hq hpq hJ.1 hJ.2 hsq hk

theorem theorem_F1 : paper_claim_F1 :=
  intended_correspondence_F1.mp formal_claim_F1_holds

/-! ### p=7 descent (`thm:A-p7-descent`)

> Let q≠7 be prime, n=49q, N=n+12, and suppose (eq:jumps). If N is squarefree,
> then ω(N)∉{7,8,9}.
-/

def paper_claim_p7 : Prop :=
  ∀ q : ℕ, q.Prime → q ≠ 7 →
    φ (7 ^ 2 * q + 12) = φ (7 ^ 2 * q) + 12 →
    σ 1 (7 ^ 2 * q + 12) = σ 1 (7 ^ 2 * q) + 12 →
    Squarefree (7 ^ 2 * q + 12) →
    (7 ^ 2 * q + 12).primeFactors.card ≠ 7 ∧
      (7 ^ 2 * q + 12).primeFactors.card ≠ 8 ∧
      (7 ^ 2 * q + 12).primeFactors.card ≠ 9

def formal_claim_p7 : Prop :=
  ∀ q : ℕ, q.Prime → q ≠ 7 → Jumps (7 ^ 2 * q) →
    Squarefree (7 ^ 2 * q + 12) →
    7 ≤ (7 ^ 2 * q + 12).primeFactors.card →
    (7 ^ 2 * q + 12).primeFactors.card ≤ 9 → False

theorem formal_claim_p7_holds : formal_claim_p7 :=
  fun _ hq hq7 hJ hsq hk7 hk9 => p7_squarefree_empty hq hq7 hJ hsq hk7 hk9

theorem intended_correspondence_p7 :
    formal_claim_p7 ↔ paper_claim_p7 := by
  constructor
  · intro h q hq hq7 hφ hσ hsq
    refine ⟨?_, ?_, ?_⟩
    · intro h7; exact h q hq hq7 ⟨hφ, hσ⟩ hsq (by omega) (by omega)
    · intro h8; exact h q hq hq7 ⟨hφ, hσ⟩ hsq (by omega) (by omega)
    · intro h9; exact h q hq hq7 ⟨hφ, hσ⟩ hsq (by omega) (by omega)
  · intro h q hq hq7 hJ hsq hk7 hk9
    have := h q hq hq7 hJ.1 hJ.2 hsq
    have hc : (7 ^ 2 * q + 12).primeFactors.card = 7 ∨
        (7 ^ 2 * q + 12).primeFactors.card = 8 ∨
        (7 ^ 2 * q + 12).primeFactors.card = 9 := by omega
    rcases hc with h7 | h8 | h9
    · exact this.1 h7
    · exact this.2.1 h8
    · exact this.2.2 h9

theorem theorem_p7 : paper_claim_p7 :=
  intended_correspondence_p7.mp formal_claim_p7_holds

/-! ### H1 (`thm:A-H1`, first two sentences)

> Under (eq:jumps) with n=p^2q, N=n+12 is not squarefree. In particular H1 holds.

The last sentence of `thm:A-H1` (Conjecture 3 iff H2 and H3) is locked as
`paper_claim_implies` below. H1 itself is the statement that there is no solution
with N squarefree and ω(N)≥4.
-/

def paper_claim_H1 : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    ¬ Squarefree (p ^ 2 * q + 12) ∧
      ¬ (Squarefree (p ^ 2 * q + 12) ∧ 4 ≤ (p ^ 2 * q + 12).primeFactors.card)

def formal_claim_H1 : Prop :=
  (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    ¬ Squarefree (p ^ 2 * q + 12)) ∧ H1

theorem formal_claim_H1_holds : formal_claim_H1 :=
  ⟨fun _ _ hp hq hpq hJ => no_squarefree hp hq hpq hJ, H1_holds⟩

theorem intended_correspondence_H1 :
    formal_claim_H1 ↔ paper_claim_H1 := by
  constructor
  · intro h p q hp hq hpq hφ hσ
    exact ⟨h.1 p q hp hq hpq ⟨hφ, hσ⟩, h.2 p q hp hq hpq ⟨hφ, hσ⟩⟩
  · intro h
    constructor
    · intro p q hp hq hpq hJ
      exact (h p q hp hq hpq hJ.1 hJ.2).1
    · intro p q hp hq hpq hJ
      exact (h p q hp hq hpq hJ.1 hJ.2).2

theorem theorem_H1 : paper_claim_H1 :=
  intended_correspondence_H1.mp formal_claim_H1_holds

/-! ### Conjecture 3 iff H1, H2 and H3 (`thm:A-implies`)

> Conjecture conj:vanish holds if and only if H1, H2 and H3 hold. Consequently, if
> H1 holds, Conjecture conj:vanish holds if and only if H2 and H3 hold.

H1 is proved, so the second sentence is `Conjecture3 ↔ H2 ∧ H3`. H2 and H3 remain
open as named hypotheses; this lock is the equivalence only.
-/

private lemma nonempty_repPrimes_iff {N : ℕ} (hN : N ≠ 0) :
    (repPrimes N).Nonempty ↔ ∃ r : ℕ, r.Prime ∧ r ^ 2 ∣ N := by
  constructor
  · intro ⟨r, hr⟩
    have hr' := Finset.mem_filter.1 hr
    exact ⟨r, Nat.prime_of_mem_primeFactors hr'.1,
      (Nat.prime_of_mem_primeFactors hr'.1).pow_dvd_iff_le_factorization hN |>.2 hr'.2⟩
  · intro ⟨r, hr, hr2⟩
    refine ⟨r, Finset.mem_filter.2 ⟨Nat.mem_primeFactors.2 ⟨hr, (dvd_pow_self r two_ne_zero).trans hr2,
      hN⟩, ?_⟩⟩
    exact (hr.pow_dvd_iff_le_factorization hN).1 hr2

private lemma simpleCount_eq (N : ℕ) :
    simpleCount N =
      (N.primeFactors.filter (fun r => N.factorization r = 1)).card := by
  unfold simpleCount
  exact Eq.refl _

def paper_claim_implies : Prop :=
  ((∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
      ¬ (φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 ∧
          σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12)) ↔
    ((∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
        φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
        σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
        ¬ (Squarefree (p ^ 2 * q + 12) ∧ 4 ≤ (p ^ 2 * q + 12).primeFactors.card)) ∧
      (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
        φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
        σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
        ¬ ((∃ r : ℕ, r.Prime ∧ r ^ 2 ∣ p ^ 2 * q + 12) ∧
            (((p ^ 2 * q + 12).primeFactors.filter (fun r => (p ^ 2 * q + 12).factorization r = 1)).card = 1 ∨ ((p ^ 2 * q + 12).primeFactors.filter (fun r => (p ^ 2 * q + 12).factorization r = 1)).card = 2) ∧
            ¬ ∃ r s a : ℕ, r.Prime ∧ s.Prime ∧ r ≠ s ∧ 2 ≤ a ∧
              p ^ 2 * q + 12 = r ^ a * s)) ∧
      (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
        φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
        σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
        ¬ ((∃ r : ℕ, r.Prime ∧ r ^ 2 ∣ p ^ 2 * q + 12) ∧
            3 ≤ ((p ^ 2 * q + 12).primeFactors.filter (fun r => (p ^ 2 * q + 12).factorization r = 1)).card)))) ∧
  ((∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
      ¬ (φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 ∧
          σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12)) ↔
    ((∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
        φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
        σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
        ¬ ((∃ r : ℕ, r.Prime ∧ r ^ 2 ∣ p ^ 2 * q + 12) ∧
            (((p ^ 2 * q + 12).primeFactors.filter (fun r => (p ^ 2 * q + 12).factorization r = 1)).card = 1 ∨ ((p ^ 2 * q + 12).primeFactors.filter (fun r => (p ^ 2 * q + 12).factorization r = 1)).card = 2) ∧
            ¬ ∃ r s a : ℕ, r.Prime ∧ s.Prime ∧ r ≠ s ∧ 2 ≤ a ∧
              p ^ 2 * q + 12 = r ^ a * s)) ∧
      (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
        φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
        σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
        ¬ ((∃ r : ℕ, r.Prime ∧ r ^ 2 ∣ p ^ 2 * q + 12) ∧
            3 ≤ ((p ^ 2 * q + 12).primeFactors.filter (fun r => (p ^ 2 * q + 12).factorization r = 1)).card))))

def formal_claim_implies : Prop :=
  (Conjecture3 ↔ H1 ∧ H2 ∧ H3) ∧ (Conjecture3 ↔ H2 ∧ H3)

theorem formal_claim_implies_holds : formal_claim_implies :=
  ⟨prop_implies_corrected, conjecture_iff_H2_H3⟩

private lemma conjecture3_paper :
    Conjecture3 ↔
      ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
        ¬ (φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 ∧
            σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12) := by
  constructor
  · intro h p q hp hq hpq hφσ
    exact h p q hp hq hpq hφσ
  · intro h p q hp hq hpq hJ
    exact h p q hp hq hpq ⟨hJ.1, hJ.2⟩

private lemma H1_paper :
    H1 ↔
      ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
        φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
        σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
        ¬ (Squarefree (p ^ 2 * q + 12) ∧ 4 ≤ (p ^ 2 * q + 12).primeFactors.card) := by
  constructor
  · intro h p q hp hq hpq hφ hσ
    exact h p q hp hq hpq ⟨hφ, hσ⟩
  · intro h p q hp hq hpq hJ
    exact h p q hp hq hpq hJ.1 hJ.2

private lemma H2_paper :
    H2 ↔
      ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
        φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
        σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
        ¬ ((∃ r : ℕ, r.Prime ∧ r ^ 2 ∣ p ^ 2 * q + 12) ∧
            (simpleCount (p ^ 2 * q + 12) = 1 ∨ simpleCount (p ^ 2 * q + 12) = 2) ∧
            ¬ ∃ r s a : ℕ, r.Prime ∧ s.Prime ∧ r ≠ s ∧ 2 ≤ a ∧
              p ^ 2 * q + 12 = r ^ a * s) := by
  constructor
  · intro h p q hp hq hpq hφ hσ ⟨hR, hj, hras⟩
    have hN0 : p ^ 2 * q + 12 ≠ 0 := by omega
    exact h p q hp hq hpq ⟨hφ, hσ⟩ ⟨(nonempty_repPrimes_iff hN0).2 hR, hj, hras⟩
  · intro h p q hp hq hpq hJ ⟨hR, hj, hras⟩
    have hN0 : p ^ 2 * q + 12 ≠ 0 := by omega
    exact h p q hp hq hpq hJ.1 hJ.2 ⟨(nonempty_repPrimes_iff hN0).1 hR, hj, hras⟩

private lemma H3_paper :
    H3 ↔
      ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
        φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
        σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
        ¬ ((∃ r : ℕ, r.Prime ∧ r ^ 2 ∣ p ^ 2 * q + 12) ∧
            3 ≤ simpleCount (p ^ 2 * q + 12)) := by
  constructor
  · intro h p q hp hq hpq hφ hσ ⟨hR, hj⟩
    have hN0 : p ^ 2 * q + 12 ≠ 0 := by omega
    exact h p q hp hq hpq ⟨hφ, hσ⟩ ⟨(nonempty_repPrimes_iff hN0).2 hR, hj⟩
  · intro h p q hp hq hpq hJ ⟨hR, hj⟩
    have hN0 : p ^ 2 * q + 12 ≠ 0 := by omega
    exact h p q hp hq hpq hJ.1 hJ.2 ⟨(nonempty_repPrimes_iff hN0).1 hR, hj⟩

theorem intended_correspondence_implies :
    formal_claim_implies ↔ paper_claim_implies := by
  constructor
  · intro h
    constructor
    · -- Conjecture3 ↔ H1 ∧ H2 ∧ H3
      constructor
      · intro hC
        have ⟨h1, h2, h3⟩ := h.1.mp (conjecture3_paper.mpr hC)
        exact ⟨H1_paper.mp h1, H2_paper.mp h2, H3_paper.mp h3⟩
      · intro ⟨h1, h2, h3⟩
        exact conjecture3_paper.mp (h.1.mpr ⟨H1_paper.mpr h1, H2_paper.mpr h2, H3_paper.mpr h3⟩)
    · constructor
      · intro hC
        have ⟨h2, h3⟩ := h.2.mp (conjecture3_paper.mpr hC)
        exact ⟨H2_paper.mp h2, H3_paper.mp h3⟩
      · intro ⟨h2, h3⟩
        exact conjecture3_paper.mp (h.2.mpr ⟨H2_paper.mpr h2, H3_paper.mpr h3⟩)
  · intro h
    constructor
    · constructor
      · intro hC
        have ⟨h1, h2, h3⟩ := h.1.mp (conjecture3_paper.mp hC)
        exact ⟨H1_paper.mpr h1, H2_paper.mpr h2, H3_paper.mpr h3⟩
      · intro ⟨h1, h2, h3⟩
        exact conjecture3_paper.mpr (h.1.mpr ⟨H1_paper.mp h1, H2_paper.mp h2, H3_paper.mp h3⟩)
    · constructor
      · intro hC
        have ⟨h2, h3⟩ := h.2.mp (conjecture3_paper.mp hC)
        exact ⟨H2_paper.mpr h2, H3_paper.mpr h3⟩
      · intro ⟨h2, h3⟩
        exact conjecture3_paper.mpr (h.2.mpr ⟨H2_paper.mp h2, H3_paper.mp h3⟩)

theorem theorem_implies : paper_claim_implies :=
  intended_correspondence_implies.mp formal_claim_implies_holds

/-! ### Classification (`thm:A-three`)

> (a) Assume (eq:jumps). Then ω(N)≥4, or N=r^2s^2t for pairwise distinct primes r,s,t.
> (b) The claim "every solution has N=r^3s, N=r^2st or ω(N)≥4" holds if and only if no
> solution has N=r^2s^2t with pairwise distinct primes r,s,t.
> Neither ThreeRegimes nor R2S2TEmpty is proved.
-/

def paper_claim_classification : Prop :=
  (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    4 ≤ (p ^ 2 * q + 12).primeFactors.card ∨
      ∃ r s t : ℕ, r.Prime ∧ s.Prime ∧ t.Prime ∧ r ≠ s ∧ r ≠ t ∧ s ≠ t ∧
        p ^ 2 * q + 12 = r ^ 2 * s ^ 2 * t) ∧
  ((∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
      φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
      σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
      (∃ r s : ℕ, r.Prime ∧ s.Prime ∧ r ≠ s ∧ p ^ 2 * q + 12 = r ^ 3 * s) ∨
        (∃ r s t : ℕ, r.Prime ∧ s.Prime ∧ t.Prime ∧ r ≠ s ∧ r ≠ t ∧ s ≠ t ∧
          p ^ 2 * q + 12 = r ^ 2 * s * t) ∨
        4 ≤ (p ^ 2 * q + 12).primeFactors.card) ↔
    (∀ p q r s t : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → t.Prime → p ≠ q →
      r ≠ s → r ≠ t → s ≠ t →
      φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
      σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
      p ^ 2 * q + 12 ≠ r ^ 2 * s ^ 2 * t))

def formal_claim_classification : Prop :=
  (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    4 ≤ (p ^ 2 * q + 12).primeFactors.card ∨
      ∃ r s t : ℕ, r.Prime ∧ s.Prime ∧ t.Prime ∧ r ≠ s ∧ r ≠ t ∧ s ≠ t ∧
        p ^ 2 * q + 12 = r ^ 2 * s ^ 2 * t) ∧
  (ThreeRegimes ↔ R2S2TEmpty)

theorem formal_claim_classification_holds : formal_claim_classification :=
  ⟨fun _ _ hp hq hpq hJ => omega4_or_r2s2t hp hq hpq hJ, threeRegimes_iff_r2s2t⟩

private lemma ThreeRegimes_paper :
    ThreeRegimes ↔
      ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
        φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
        σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
        (∃ r s : ℕ, r.Prime ∧ s.Prime ∧ r ≠ s ∧ p ^ 2 * q + 12 = r ^ 3 * s) ∨
          (∃ r s t : ℕ, r.Prime ∧ s.Prime ∧ t.Prime ∧ r ≠ s ∧ r ≠ t ∧ s ≠ t ∧
            p ^ 2 * q + 12 = r ^ 2 * s * t) ∨
          4 ≤ (p ^ 2 * q + 12).primeFactors.card := by
  constructor
  · intro h p q hp hq hpq hφ hσ
    exact h p q hp hq hpq ⟨hφ, hσ⟩
  · intro h p q hp hq hpq hJ
    exact h p q hp hq hpq hJ.1 hJ.2

private lemma R2S2TEmpty_paper :
    R2S2TEmpty ↔
      ∀ p q r s t : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → t.Prime → p ≠ q →
        r ≠ s → r ≠ t → s ≠ t →
        φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
        σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
        p ^ 2 * q + 12 ≠ r ^ 2 * s ^ 2 * t := by
  constructor
  · intro h p q r s t hp hq hr hs ht hpq hrs hrt hst hφ hσ
    exact h p q r s t hp hq hr hs ht hpq hrs hrt hst ⟨hφ, hσ⟩
  · intro h p q r s t hp hq hr hs ht hpq hrs hrt hst hJ
    exact h p q r s t hp hq hr hs ht hpq hrs hrt hst hJ.1 hJ.2

theorem intended_correspondence_classification :
    formal_claim_classification ↔ paper_claim_classification := by
  constructor
  · intro h
    constructor
    · intro p q hp hq hpq hφ hσ
      exact h.1 p q hp hq hpq ⟨hφ, hσ⟩
    · constructor
      · intro h3
        exact R2S2TEmpty_paper.mp (h.2.mp (ThreeRegimes_paper.mpr h3))
      · intro hempty
        exact ThreeRegimes_paper.mp (h.2.mpr (R2S2TEmpty_paper.mpr hempty))
  · intro h
    constructor
    · intro p q hp hq hpq hJ
      exact h.1 p q hp hq hpq hJ.1 hJ.2
    · constructor
      · intro h3
        exact R2S2TEmpty_paper.mpr (h.2.mp (ThreeRegimes_paper.mp h3))
      · intro hempty
        exact ThreeRegimes_paper.mpr (h.2.mpr (R2S2TEmpty_paper.mp hempty))

theorem theorem_classification : paper_claim_classification :=
  intended_correspondence_classification.mp formal_claim_classification_holds

/-! ### r^2 s^2 t forces r s | L(p) (`thm:A-r2s2t-dvd`)

> Assume (eq:jumps). If N=r^2s^2t with pairwise distinct primes r,s,t, then rs∣L(p)
> and rs≤L(p).
-/

def paper_claim_r2s2t_dvd : Prop :=
  ∀ p q r s t : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → t.Prime →
    p ≠ q → r ≠ s → r ≠ t → s ≠ t →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    p ^ 2 * q + 12 = r ^ 2 * s ^ 2 * t →
    ((r * s : ℕ) : ℤ) ∣ (p : ℤ) ^ 3 - p ^ 2 - 12 ∧
      r * s ≤ (p ^ 3 - p ^ 2 - 12 : ℕ)

def formal_claim_r2s2t_dvd : Prop :=
  ∀ p q r s t : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → t.Prime →
    p ≠ q → r ≠ s → r ≠ t → s ≠ t → Jumps (p ^ 2 * q) →
    p ^ 2 * q + 12 = r ^ 2 * s ^ 2 * t →
    ((r * s : ℕ) : ℤ) ∣ Lpoly p ∧ r * s ≤ (p ^ 3 - p ^ 2 - 12 : ℕ)

theorem formal_claim_r2s2t_dvd_holds : formal_claim_r2s2t_dvd :=
  fun _ _ _ _ _ hp hq hr hs ht hpq hrs hrt hst hJ hN =>
    r2s2t_rs_dvd_L hp hq hr hs ht hpq hrs hrt hst hJ hN

theorem intended_correspondence_r2s2t_dvd :
    formal_claim_r2s2t_dvd ↔ paper_claim_r2s2t_dvd := by
  constructor
  · intro h p q r s t hp hq hr hs ht hpq hrs hrt hst hφ hσ hN
    have := h p q r s t hp hq hr hs ht hpq hrs hrt hst ⟨hφ, hσ⟩ hN
    -- Lpoly p is the polynomial p^3-p^2-12
    unfold Lpoly at this
    exact this
  · intro h p q r s t hp hq hr hs ht hpq hrs hrt hst hJ hN
    have := h p q r s t hp hq hr hs ht hpq hrs hrt hst hJ.1 hJ.2 hN
    unfold Lpoly
    exact this

theorem theorem_r2s2t_dvd : paper_claim_r2s2t_dvd :=
  intended_correspondence_r2s2t_dvd.mp formal_claim_r2s2t_dvd_holds

/-! ### Reduction of H2 (`thm:A-H2-shapes`)

> If no solution of (eq:jumps) has N=r^2s^2t with pairwise distinct primes and no
> solution has N=r^2s^2tu with pairwise distinct primes, then H2 holds.

This is an implication. H2 itself remains open.
-/

def paper_claim_H2_shapes : Prop :=
  ((∀ p q r s t : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → t.Prime → p ≠ q →
      r ≠ s → r ≠ t → s ≠ t →
      φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
      σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
      p ^ 2 * q + 12 ≠ r ^ 2 * s ^ 2 * t) →
    (∀ p q r s t u : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → t.Prime → u.Prime →
      p ≠ q → r ≠ s → r ≠ t → r ≠ u → s ≠ t → s ≠ u → t ≠ u →
      φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
      σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
      p ^ 2 * q + 12 ≠ r ^ 2 * s ^ 2 * t * u) →
    ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
      φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
      σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
      ¬ ((∃ r : ℕ, r.Prime ∧ r ^ 2 ∣ p ^ 2 * q + 12) ∧
          (((p ^ 2 * q + 12).primeFactors.filter (fun r => (p ^ 2 * q + 12).factorization r = 1)).card = 1 ∨ ((p ^ 2 * q + 12).primeFactors.filter (fun r => (p ^ 2 * q + 12).factorization r = 1)).card = 2) ∧
          ¬ ∃ r s a : ℕ, r.Prime ∧ s.Prime ∧ r ≠ s ∧ 2 ≤ a ∧
            p ^ 2 * q + 12 = r ^ a * s))

def formal_claim_H2_shapes : Prop :=
  R2S2TEmpty → R2S2TUEmpty → H2

theorem formal_claim_H2_shapes_holds : formal_claim_H2_shapes :=
  H2_of_shapes

private lemma R2S2TUEmpty_paper :
    R2S2TUEmpty ↔
      ∀ p q r s t u : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → t.Prime → u.Prime →
        p ≠ q → r ≠ s → r ≠ t → r ≠ u → s ≠ t → s ≠ u → t ≠ u →
        φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
        σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
        p ^ 2 * q + 12 ≠ r ^ 2 * s ^ 2 * t * u := by
  constructor
  · intro h p q r s t u hp hq hr hs ht hu hpq hrs hrt hru hst hsu htu hφ hσ
    exact h p q r s t u hp hq hr hs ht hu hpq hrs hrt hru hst hsu htu ⟨hφ, hσ⟩
  · intro h p q r s t u hp hq hr hs ht hu hpq hrs hrt hru hst hsu htu hJ
    exact h p q r s t u hp hq hr hs ht hu hpq hrs hrt hru hst hsu htu hJ.1 hJ.2

theorem intended_correspondence_H2_shapes :
    formal_claim_H2_shapes ↔ paper_claim_H2_shapes := by
  constructor
  · intro h hempty2 hempty3
    exact H2_paper.mp (h (R2S2TEmpty_paper.mpr hempty2) (R2S2TUEmpty_paper.mpr hempty3))
  · intro h hempty2 hempty3
    exact H2_paper.mpr (h (R2S2TEmpty_paper.mp hempty2) (R2S2TUEmpty_paper.mp hempty3))

theorem theorem_H2_shapes : paper_claim_H2_shapes :=
  intended_correspondence_H2_shapes.mp formal_claim_H2_shapes_holds

/-! ### Two-adic condition for H3, and H3 for p ≡ 1 (mod 4) (`thm:A-H3`)

> Assume (eq:jumps). If j(N)≥3, then 2^{j(N)-1}∣T(p) and p≡3 (mod 4). Consequently
> H3 holds for every p≡1 (mod 4): there is no solution with p≡1 (mod 4), R(N)≠∅
> and j(N)≥3.
-/

def paper_claim_H3 : Prop :=
  (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    3 ≤ ((p ^ 2 * q + 12).primeFactors.filter (fun r => (p ^ 2 * q + 12).factorization r = 1)).card →
    (2 : ℤ) ^ (((p ^ 2 * q + 12).primeFactors.filter (fun r => (p ^ 2 * q + 12).factorization r = 1)).card - 1) ∣ ((p : ℤ) ^ 4 - 13 * p - 6) ∧
      p % 4 = 3) ∧
  (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    p % 4 = 1 →
    ¬ ((∃ r : ℕ, r.Prime ∧ r ^ 2 ∣ p ^ 2 * q + 12) ∧
        3 ≤ ((p ^ 2 * q + 12).primeFactors.filter (fun r => (p ^ 2 * q + 12).factorization r = 1)).card))

def formal_claim_H3 : Prop :=
  (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    3 ≤ simpleCount (p ^ 2 * q + 12) →
    (2 : ℤ) ^ (simpleCount (p ^ 2 * q + 12) - 1) ∣ T p ∧ p % 4 = 3) ∧
  (∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) → p % 4 = 1 →
    ¬ ((repPrimes (p ^ 2 * q + 12)).Nonempty ∧ 3 ≤ simpleCount (p ^ 2 * q + 12)))

theorem formal_claim_H3_holds : formal_claim_H3 :=
  ⟨fun _ _ hp hq hpq hJ hj => H3_twoAdic hp hq hpq hJ hj,
    fun _ _ hp hq hpq hJ h4 => H3_of_mod4 hp hq hpq hJ h4⟩

private lemma T_eq (p : ℕ) : T (p : ℤ) = (p : ℤ) ^ 4 - 13 * p - 6 := by
  unfold T
  exact Eq.refl _

theorem intended_correspondence_H3 :
    formal_claim_H3 ↔ paper_claim_H3 := by
  constructor
  · intro h
    constructor
    · intro p q hp hq hpq hφ hσ hj
      have := h.1 p q hp hq hpq ⟨hφ, hσ⟩ hj
      rw [T_eq] at this
      exact this
    · intro p q hp hq hpq hφ hσ h4 ⟨hR, hj⟩
      have hN0 : p ^ 2 * q + 12 ≠ 0 := by omega
      exact h.2 p q hp hq hpq ⟨hφ, hσ⟩ h4 ⟨(nonempty_repPrimes_iff hN0).2 hR, hj⟩
  · intro h
    constructor
    · intro p q hp hq hpq hJ hj
      have := h.1 p q hp hq hpq hJ.1 hJ.2 hj
      rw [T_eq]
      exact this
    · intro p q hp hq hpq hJ h4 ⟨hR, hj⟩
      have hN0 : p ^ 2 * q + 12 ≠ 0 := by omega
      exact h.2 p q hp hq hpq hJ.1 hJ.2 h4 ⟨(nonempty_repPrimes_iff hN0).1 hR, hj⟩

theorem theorem_H3 : paper_claim_H3 :=
  intended_correspondence_H3.mp formal_claim_H3_holds

/-! ### Hensel bound (`DATAHENSEL` in the v1.4.1 deviations block)

> There are no primes p,r with 5≤p<r≤10^6 and r^2∣L(p), hence under both jumps
> N≠r^3s for distinct primes r,s≥5 with r≤10^6.
-/

def paper_claim_hensel : Prop :=
  (∀ p r : ℕ, p.Prime → r.Prime → 5 ≤ p → p < r → r ≤ 10 ^ 6 →
    ¬ ((r : ℤ) ^ 2 ∣ (p : ℤ) ^ 3 - p ^ 2 - 12)) ∧
  (∀ p q r s : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → p ≠ q → r ≠ s →
    5 ≤ r → 5 ≤ s → r ≤ 10 ^ 6 →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    p ^ 2 * q + 12 ≠ r ^ 3 * s)

def formal_claim_hensel : Prop :=
  (∀ p r : ℕ, p.Prime → r.Prime → 5 ≤ p → p < r → r ≤ 10 ^ 6 →
    ¬ ((r : ℤ) ^ 2 ∣ Lpoly p)) ∧
  (∀ p q r s : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → p ≠ q → r ≠ s →
    5 ≤ r → 5 ≤ s → r ≤ 10 ^ 6 → Jumps (p ^ 2 * q) →
    p ^ 2 * q + 12 ≠ r ^ 3 * s)

theorem formal_claim_hensel_holds : formal_claim_hensel :=
  ⟨fun _ _ hp hr hp5 hpr hr6 => hensel_r_le_1e6 hp hr hp5 hpr hr6,
    fun _ _ _ _ hp hq hr hs hpq hrs hr5 hs5 hr6 hJ =>
      r3s_r_le_1e6 hp hq hr hs hpq hrs hr5 hs5 hr6 hJ⟩

theorem intended_correspondence_hensel :
    formal_claim_hensel ↔ paper_claim_hensel := by
  constructor
  · intro h
    constructor
    · intro p r hp hr hp5 hpr hr6
      have := h.1 p r hp hr hp5 hpr hr6
      unfold Lpoly at this
      exact this
    · intro p q r s hp hq hr hs hpq hrs hr5 hs5 hr6 hφ hσ
      exact h.2 p q r s hp hq hr hs hpq hrs hr5 hs5 hr6 ⟨hφ, hσ⟩
  · intro h
    constructor
    · intro p r hp hr hp5 hpr hr6
      have := h.1 p r hp hr hp5 hpr hr6
      unfold Lpoly
      exact this
    · intro p q r s hp hq hr hs hpq hrs hr5 hs5 hr6 hJ
      exact h.2 p q r s hp hq hr hs hpq hrs hr5 hs5 hr6 hJ.1 hJ.2

theorem theorem_hensel : paper_claim_hensel :=
  intended_correspondence_hensel.mp formal_claim_hensel_holds

/-! ### Proposition C, the divisor K (`prop:A-C-K`)

> Assume (eq:jumps) and r^2∣N for some prime r. Then K=N/rad(N) satisfies K>1,
> K∣L(p) and gcd(K,6p)=1.
-/

def paper_claim_propC_K : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q →
    φ (p ^ 2 * q + 12) = φ (p ^ 2 * q) + 12 →
    σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12 →
    (∃ r : ℕ, r.Prime ∧ r ^ 2 ∣ p ^ 2 * q + 12) →
    1 < (p ^ 2 * q + 12) / rad (p ^ 2 * q + 12) ∧
      (((p ^ 2 * q + 12) / rad (p ^ 2 * q + 12) : ℕ) : ℤ) ∣
        (p : ℤ) ^ 3 - p ^ 2 - 12 ∧
      Nat.Coprime ((p ^ 2 * q + 12) / rad (p ^ 2 * q + 12)) (6 * p)

def formal_claim_propC_K : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    (∃ r : ℕ, r.Prime ∧ r ^ 2 ∣ p ^ 2 * q + 12) →
    1 < (p ^ 2 * q + 12) / rad (p ^ 2 * q + 12) ∧
      (((p ^ 2 * q + 12) / rad (p ^ 2 * q + 12) : ℕ) : ℤ) ∣
        (p : ℤ) ^ 3 - p ^ 2 - 12 ∧
      Nat.Coprime ((p ^ 2 * q + 12) / rad (p ^ 2 * q + 12)) (6 * p)

theorem formal_claim_propC_K_holds : formal_claim_propC_K :=
  fun _ _ hp hq hpq hJ hR => propC_K hp hq hpq hJ hR

theorem intended_correspondence_propC_K :
    formal_claim_propC_K ↔ paper_claim_propC_K := by
  constructor
  · intro h p q hp hq hpq hφ hσ hR
    exact h p q hp hq hpq ⟨hφ, hσ⟩ hR
  · intro h p q hp hq hpq hJ hR
    exact h p q hp hq hpq hJ.1 hJ.2 hR

theorem theorem_propC_K : paper_claim_propC_K :=
  intended_correspondence_propC_K.mp formal_claim_propC_K_holds

end P2qJumps.SemanticsPartA
