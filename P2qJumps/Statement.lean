/-
Copyright (c) 2026 Benjamin Stanley Frohman. Apache-2.0.

This file records the *statement* of Theorem 28 from
Frohman, Zenodo 10.5281/zenodo.22727814.
The paper proof is not transcribed here. Goals marked `sorry` are not certificates.
-/
import Mathlib.Tactic
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.NumberTheory.ArithmeticFunction

namespace P2qJumps

open Nat ArithmeticFunction

/-- Simultaneous totient and divisor-sum jumps of length 12. -/
def Jumps (n : ℕ) : Prop :=
  φ (n + 12) = φ n + 12 ∧ σ (n + 12) = σ n + 12

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

/-- Not proved in this repository. The human proof is the Zenodo PDF. -/
theorem theorem28_from_paper : Theorem28 := by
  sorry

end P2qJumps
