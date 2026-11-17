/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Ext.TheoremD.Arithmetic

/-!
# P2qJumps.Ext.TheoremD.SquarefreeArithmetic

Machine-checked Lean 4 module.
-/

open scoped BigOperators
namespace P2qTheoremD
open ArithmeticFunction
open scoped ArithmeticFunction.sigma ArithmeticFunction.Moebius

lemma squarefree_products (n : ℕ) (hsq : Squarefree n) :
    (∏ r ∈ n.primeFactors, (r:ℝ)) = n ∧
    (∏ r ∈ n.primeFactors, ((r:ℝ)-1)) = Nat.totient n ∧
    (∏ r ∈ n.primeFactors, ((r:ℝ)+1)) = σ 1 n := by
  have hn : n ≠ 0 := hsq.ne_zero
  have hprod := Nat.prod_primeFactors_of_squarefree hsq
  have hphiNat : Nat.totient n = ∏ r ∈ n.primeFactors, (r-1) := by
    rw [Nat.totient_eq_div_primeFactors_mul, hprod, Nat.div_self (Nat.pos_of_ne_zero hn),one_mul]
  have hsigmaNat : σ 1 n = ∏ r ∈ n.primeFactors, (r+1) := by
    calc
      σ 1 n = σ 1 (∏ r ∈ n.primeFactors, r) := congrArg (σ 1) hprod.symm
      _ = ∏ r ∈ n.primeFactors, σ 1 r :=
        isMultiplicative_sigma.map_prod_of_prime n.primeFactors
          (fun r hr => Nat.prime_of_mem_primeFactors hr)
      _ = _ := Finset.prod_congr rfl (fun r hr => sigma_prime (Nat.prime_of_mem_primeFactors hr))
  constructor
  · simpa only [Nat.cast_prod] using congrArg (Nat.cast : ℕ → ℝ) hprod
  constructor
  · rw [hphiNat,Nat.cast_prod]
    apply Finset.prod_congr rfl
    intro r hr
    rw [Nat.cast_sub (Nat.prime_of_mem_primeFactors hr).one_le,Nat.cast_one]
  · rw [hsigmaNat,Nat.cast_prod]
    simp only [Nat.cast_add,Nat.cast_one]

/-- The shifted number is odd, so all of its prime factors are at least three. -/
lemma shifted_primeFactors_three (p q r : ℕ) (hp : p.Prime) (hq : q.Prime)
    (hp5 : 5 ≤ p) (hq5 : 5 ≤ q) (hr : r ∈ (p^2*q+12).primeFactors) : 3 ≤ r := by
  have hpodd := hp.eq_two_or_odd
  have hqodd := hq.eq_two_or_odd
  have hp2 : p ≠ 2 := by omega
  have hq2 : q ≠ 2 := by omega
  have hpO : Odd p := (Nat.odd_iff.mpr (hpodd.resolve_left hp2))
  have hqO : Odd q := (Nat.odd_iff.mpr (hqodd.resolve_left hq2))
  have hNO : Odd (p^2*q+12) := (hpO.pow.mul hqO).add_even ⟨6, by norm_num⟩
  have hrp := Nat.prime_of_mem_primeFactors hr
  have hrd := Nat.dvd_of_mem_primeFactors hr
  have hrO : Odd r := hNO.of_dvd_nat hrd
  have hr2 : r ≠ 2 := by intro he; subst r; norm_num [Nat.odd_iff] at hrO
  have := hrp.two_le
  omega

end P2qTheoremD
