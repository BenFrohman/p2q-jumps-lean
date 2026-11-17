/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Ext.Extensions.DeltaQ

/-!
# Size of repeated primes (ingredient of Theorem E)

From L1: the term `a = ℓ^2` (with `μ(ℓ^2) = 0`) gives `δ(N) ≥ N / ℓ^2`.
-/

namespace P2qExtensions

open ArithmeticFunction P2qStructural
open scoped ArithmeticFunction.sigma ArithmeticFunction.Moebius

/-- If `ℓ` is prime and `ℓ^2 ∣ N`, then `N ≤ ℓ^2 δ(N)`. -/
theorem sq_mul_delta_ge {N ℓ : ℕ} (hN : 0 < N) (hℓ : ℓ.Prime) (h : ℓ ^ 2 ∣ N) :
    (N : ℤ) ≤ (ℓ : ℤ) ^ 2 * delta N := by
  obtain ⟨b, hb⟩ := h
  have hmem : (ℓ ^ 2, b) ∈ N.divisorsAntidiagonal.erase (1, N) := by
    refine Finset.mem_erase.2 ⟨?_, Nat.mem_divisorsAntidiagonal.2 ⟨hb.symm, by omega⟩⟩
    intro he; simp only [Prod.mk.injEq] at he
    have := hℓ.two_le; nlinarith [he.1]
  have hμ : μ (ℓ ^ 2) = 0 := by
    rw [moebius_apply_prime_pow hℓ (by norm_num)]; simp
  have hle : (1 + (μ (ℓ ^ 2) : ℤ)) * (b : ℤ)
      ≤ ∑ x ∈ N.divisorsAntidiagonal.erase (1, N), (1 + (μ x.1 : ℤ)) * (x.2 : ℤ) := by
    apply Finset.single_le_sum (f := fun x : ℕ × ℕ => (1 + (μ x.1 : ℤ)) * (x.2 : ℤ)) _ hmem
    intro x _
    have := abs_moebius_le_one (n := x.1)
    have h1 : 0 ≤ 1 + (μ x.1 : ℤ) := by have := neg_abs_le (μ x.1 : ℤ); linarith
    positivity
  rw [← lemmaL1 N hN, hμ] at hle
  simp at hle
  have hNb : (N : ℤ) = (ℓ : ℤ) ^ 2 * b := by rw [hb]; push_cast; ring
  rw [hNb]; exact mul_le_mul_of_nonneg_left hle (sq_nonneg _)

/-- **Repeated-prime bound.** Under the jumps, a prime `r` with `r^2 ∣ N` satisfies
`p^2 q + 12 ≤ r^2 (q + 2p + 1)`. -/
theorem repeated_prime_bound {p q r : ℕ} (h : Jump p q) (hr : r.Prime)
    (hrN : r ^ 2 ∣ p ^ 2 * q + 12) :
    ((p ^ 2 * q + 12 : ℕ) : ℤ) ≤ (r : ℤ) ^ 2 * ((q : ℤ) + 2 * p + 1) := by
  have h1 := sq_mul_delta_ge (by omega) hr hrN
  rw [(lemmaQ h).2, (delta_Q_p2q h.hp h.hq h.hpq).1] at h1
  exact h1

end P2qExtensions
