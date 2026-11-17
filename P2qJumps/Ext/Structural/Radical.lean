/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Ext.Structural.Basic

/-!
# Radical identity (Lemma S)

Writing `U = rad N` and `A(U) = U - φ(U)`, the paper's identity is
`A(U)/U = 1/p + L/(pN)`. Since `φ(N)/N = ∏(1 - 1/ℓ)`, it is the product of the two
exact statements below.
-/

namespace P2qStructural

/-- `p (N - φ(N)) = N + L(p)`. -/
theorem radical_q_elim {p q : ℕ} (h : Jump p q) :
    (p : ℤ) * (((p ^ 2 * q + 12 : ℕ) : ℤ) - (Nat.totient (p ^ 2 * q + 12) : ℤ))
      = ((p ^ 2 * q + 12 : ℕ) : ℤ) + L p := by
  have := phi_elim h; linear_combination this

/-- `φ(N) · rad N = N · ∏_{ℓ ∣ N} (ℓ - 1)` (Mathlib bridge). -/
theorem totient_rad (N : ℕ) :
    Nat.totient N * rad N = N * ∏ ℓ ∈ N.primeFactors, (ℓ - 1) :=
  Nat.totient_mul_prod_primeFactors N

/-- **Lemma S (radical identity), cleared of denominators.** With `U = rad N`,
`P = ∏_{ℓ ∣ N}(ℓ - 1) = φ(U)`: `p (U - P) N = U (N + L(p))`. -/
theorem lemmaS {p q : ℕ} (h : Jump p q) :
    (p : ℤ) * ((rad (p ^ 2 * q + 12) : ℤ)
        - ((∏ ℓ ∈ (p ^ 2 * q + 12).primeFactors, (ℓ - 1) : ℕ) : ℤ))
        * ((p ^ 2 * q + 12 : ℕ) : ℤ)
      = (rad (p ^ 2 * q + 12) : ℤ) * (((p ^ 2 * q + 12 : ℕ) : ℤ) + L p) := by
  have h1 := radical_q_elim h
  have h2 : ((Nat.totient (p ^ 2 * q + 12) * rad (p ^ 2 * q + 12) : ℕ) : ℤ)
      = ((p ^ 2 * q + 12) * ∏ ℓ ∈ (p ^ 2 * q + 12).primeFactors, (ℓ - 1) : ℕ) := by
    rw [totient_rad]
  push_cast at h2 h1 ⊢
  linear_combination (rad (p ^ 2 * q + 12) : ℤ) * h1 + (p : ℤ) * h2

end P2qStructural
