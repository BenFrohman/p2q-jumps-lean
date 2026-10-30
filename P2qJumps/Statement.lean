/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/
/-
This file records the *statement* of Theorem 28 from
Frohman, Zenodo 10.5281/zenodo.22727814.
The paper proof is not transcribed here. `Theorem28` is a named hypothesis;
results that use it take it as an explicit argument.
-/
import Mathlib.Tactic
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.NumberTheory.ArithmeticFunction

namespace P2qJumps

open Nat ArithmeticFunction
open scoped ArithmeticFunction.sigma

/-- Simultaneous totient and divisor-sum jumps of length 12. -/
def Jumps (n : ℕ) : Prop :=
  φ (n + 12) = φ n + 12 ∧ σ 1 (n + 12) = σ 1 n + 12

/-- Paper Conjecture 3: no n = p^2 q satisfies the jumps. Open. -/
def Conjecture3 : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → ¬ Jumps (p ^ 2 * q)

/-- Theorem 28 / former Hypothesis R1:
if both jumps hold and n = p^2 q, then N = n + 12 is not a product of
three distinct primes. -/
def Theorem28 : Prop :=
  ∀ p q r s t : ℕ,
    p.Prime → q.Prime → r.Prime → s.Prime → t.Prime →
    p ≠ q →
    r ≠ s → r ≠ t → s ≠ t →
    Jumps (p ^ 2 * q) →
    p ^ 2 * q + 12 ≠ r * s * t

/-- Instance of Theorem 28, conditional on the hypothesis `Theorem28`.
The proof of `Theorem28` itself is the Zenodo PDF, not this repository. -/
theorem theorem28_from_paper (h : Theorem28) {p q r s t : ℕ}
    (hp : p.Prime) (hq : q.Prime) (hr : r.Prime) (hs : s.Prime) (ht : t.Prime)
    (hpq : p ≠ q) (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t) (hJ : Jumps (p ^ 2 * q)) :
    p ^ 2 * q + 12 ≠ r * s * t :=
  h p q r s t hp hq hr hs ht hpq hrs hrt hst hJ

end P2qJumps
