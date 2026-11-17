/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Ext.Structural

/-!
# Lemma L1 (Möbius expansion of δ) and the Q invariant

`δ(N) = σ(N) + φ(N) - 2N` and `Q(N) = N^2 - σ(N) φ(N)`, both over `ℤ`, using Mathlib's
`σ 1`, `Nat.totient` and `μ`.
-/

namespace P2qExtensions

open ArithmeticFunction P2qStructural
open scoped ArithmeticFunction.sigma ArithmeticFunction.Moebius

/-- `δ(N) = σ(N) + φ(N) - 2N`. -/
def delta (N : ℕ) : ℤ := (σ 1 N : ℤ) + (Nat.totient N : ℤ) - 2 * N

/-- `Q(N) = N^2 - σ(N) φ(N)`. -/
def Qinv (N : ℕ) : ℤ := (N : ℤ) ^ 2 - (σ 1 N : ℤ) * (Nat.totient N : ℤ)

/-- Möbius form of the totient: `φ(n) = ∑_{ab=n} μ(a) b`. -/
theorem totient_moebius (n : ℕ) (hn : 0 < n) :
    (Nat.totient n : ℤ) = ∑ x ∈ n.divisorsAntidiagonal, (μ x.1 : ℤ) * (x.2 : ℤ) := by
  have h := (sum_eq_iff_sum_mul_moebius_eq (R := ℤ) (f := fun m => (Nat.totient m : ℤ))
    (g := fun m => (m : ℤ))).1 (fun m _ => by exact_mod_cast Nat.sum_totient m) n hn
  exact h.symm

theorem sigma_antidiag (n : ℕ) :
    (σ 1 n : ℤ) = ∑ x ∈ n.divisorsAntidiagonal, (x.2 : ℤ) := by
  rw [sigma_one_apply]
  have := Nat.sum_divisorsAntidiagonal' (f := fun _ b => (b : ℤ)) (n := n)
  simp only at this; rw [this]; push_cast; rfl

/-- **Lemma L1.** `δ(N) = ∑_{ab=N, a ≠ 1} (1 + μ(a)) b`. -/
theorem lemmaL1 (N : ℕ) (hN : 0 < N) :
    delta N = ∑ x ∈ N.divisorsAntidiagonal.erase (1, N), (1 + (μ x.1 : ℤ)) * (x.2 : ℤ) := by
  have hmem : (1, N) ∈ N.divisorsAntidiagonal := by
    rw [Nat.mem_divisorsAntidiagonal]; omega
  have hsum : (σ 1 N : ℤ) + (Nat.totient N : ℤ)
      = ∑ x ∈ N.divisorsAntidiagonal, (1 + (μ x.1 : ℤ)) * (x.2 : ℤ) := by
    rw [sigma_antidiag, totient_moebius N hN, ← Finset.sum_add_distrib]
    exact Finset.sum_congr rfl (fun x _ => by ring)
  unfold delta
  rw [hsum, ← Finset.add_sum_erase _ _ hmem]
  simp

/-- **L1 nonnegativity.** Every term is `≥ 0`, so `δ(N) ≥ 0`, i.e. `σ(N) + φ(N) ≥ 2N`. -/
theorem delta_nonneg (N : ℕ) (hN : 0 < N) : 0 ≤ delta N := by
  rw [lemmaL1 N hN]
  apply Finset.sum_nonneg
  intro x _
  have := abs_moebius_le_one (n := x.1)
  have h1 : 0 ≤ 1 + (μ x.1 : ℤ) := by have := neg_abs_le (μ x.1 : ℤ); linarith
  positivity

/-! ## Q invariant -/

lemma sigma_mul_totient_prime_pow {ℓ e : ℕ} (hℓ : ℓ.Prime) (he : 0 < e) :
    ((σ 1 (ℓ ^ e) * Nat.totient (ℓ ^ e) : ℕ) : ℤ) = (ℓ : ℤ) ^ (e - 1) * ((ℓ : ℤ) ^ (e + 1) - 1) := by
  rw [sigma_one_apply_prime_pow hℓ, Nat.totient_prime_pow hℓ he]
  have h1 := hℓ.one_le
  push_cast [h1]
  rw [← geom_sum_mul (ℓ : ℤ) (e + 1)]; ring

/-- **Q multiplicative form.** `σ(N) φ(N) = ∏_{ℓ^e ∥ N} ℓ^{e-1} (ℓ^{e+1} - 1)`. -/
theorem sigma_mul_totient_prod (N : ℕ) (hN : N ≠ 0) :
    ((σ 1 N * Nat.totient N : ℕ) : ℤ)
      = ∏ ℓ ∈ N.primeFactors, (ℓ : ℤ) ^ (N.factorization ℓ - 1)
          * ((ℓ : ℤ) ^ (N.factorization ℓ + 1) - 1) := by
  have hσ := isMultiplicative_sigma.multiplicative_factorization (σ 1) hN
  have hφ := Nat.totient_eq_prod_factorization hN
  rw [Finsupp.prod, Nat.support_factorization] at hσ hφ
  rw [hσ, hφ, ← Finset.prod_mul_distrib]
  push_cast
  apply Finset.prod_congr rfl
  intro ℓ hℓ
  have hp := Nat.prime_of_mem_primeFactors hℓ
  have he : 0 < N.factorization ℓ := Nat.pos_of_ne_zero
    (Finsupp.mem_support_iff.1 (by rw [Nat.support_factorization]; exact hℓ))
  have := sigma_mul_totient_prime_pow hp he
  rw [Nat.totient_prime_pow hp he] at this
  push_cast at this; exact this

/-- `δ(p^2 q) = q + 2p + 1` and `Q(p^2 q) = p^4 + p q^2 - p`. -/
theorem delta_Q_p2q {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) :
    delta (p ^ 2 * q) = q + 2 * p + 1 ∧
    Qinv (p ^ 2 * q) = (p : ℤ) ^ 4 + p * (q : ℤ) ^ 2 - p := by
  unfold delta Qinv
  rw [sigma_p2q hp hq hpq, totient_p2q hp hq hpq]
  have h1 := hp.one_le; have h2 := hq.one_le
  push_cast [h1, h2]; constructor <;> ring

/-- **Lemma Q.** Under the jumps, `Q(N) = Q(n) - 12 δ(n)` and `δ(N) = δ(n)`. -/
theorem lemmaQ {p q : ℕ} (h : Jump p q) :
    Qinv (p ^ 2 * q + 12) = Qinv (p ^ 2 * q) - 12 * delta (p ^ 2 * q) ∧
    delta (p ^ 2 * q + 12) = delta (p ^ 2 * q) := by
  unfold Qinv delta
  rw [h.hφ, h.hσ]; push_cast; constructor <;> ring

end P2qExtensions
