/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Ext.TheoremD.FourAnalytic
import P2qJumps.Ext.TheoremD.Arithmetic

/-!
# P2qJumps.Ext.TheoremD.FourPrime

Machine-checked Lean 4 module.
-/

namespace P2qTheoremD
open ArithmeticFunction
open scoped ArithmeticFunction.sigma ArithmeticFunction.Moebius

/-- Both actual jump equations exclude a product of four distinct primes. -/
theorem not_four_distinct_primes (p q a b c d : ℕ)
    (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hp5 : 5 ≤ p) (hq5 : 5 ≤ q)
    (ha : a.Prime) (hb : b.Prime) (hc : c.Prime) (hd : d.Prime)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (hphi : Nat.totient (p^2*q+12) = Nat.totient (p^2*q)+12)
    (hsigma : σ 1 (p^2*q+12) = σ 1 (p^2*q)+12) :
    p^2*q+12 ≠ a*b*c*d := by
  intro hN
  rw [hN,totient_four ha hb hc hd hab hac had hbc hbd hcd,totient_p2q hp hq hpq] at hphi
  rw [hN,sigma_four ha hb hc hd hab hac had hbc hbd hcd,sigma_p2q hp hq hpq] at hsigma
  have hp1 := hp.one_le
  have hq1 := hq.one_le
  have ha1 := ha.one_le
  have hb1 := hb.one_le
  have hc1 := hc.one_le
  have hd1 := hd.one_le
  have hphiR : ((a:ℝ)-1)*(b-1)*(c-1)*(d-1) = (p:ℝ)*(p-1)*(q-1)+12 := by
    exact_mod_cast hphi
  have hsigmaR : ((a:ℝ)+1)*(b+1)*(c+1)*(d+1) = (1+(p:ℝ)+p^2)*(q+1)+12 := by
    exact_mod_cast hsigma
  apply no_symmetric_four (p:ℝ) q a b c d
  · exact_mod_cast hp5
  · exact_mod_cast hq5
  · exact_mod_cast ha.one_lt
  · exact_mod_cast hb.one_lt
  · exact_mod_cast hc.one_lt
  · exact_mod_cast hd.one_lt
  · exact_mod_cast hN.symm
  · exact hphiR
  · exact hsigmaR

/-- Intrinsic formulation: the count is the actual `Nat.primeFactors` cardinal,
    and squarefreeness is Mathlib's standard predicate. -/
theorem squarefree_primeFactors_card_ne_four (p q : ℕ)
    (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hp5 : 5 ≤ p) (hq5 : 5 ≤ q)
    (hphi : Nat.totient (p^2*q+12) = Nat.totient (p^2*q)+12)
    (hsigma : σ 1 (p^2*q+12) = σ 1 (p^2*q)+12)
    (hsq : Squarefree (p^2*q+12)) :
    (p^2*q+12).primeFactors.card ≠ 4 := by
  intro hk
  obtain ⟨a,b,c,d,hab,hac,had,hbc,hbd,hcd,hset⟩ := Finset.card_eq_four.mp hk
  have ha : a.Prime := Nat.prime_of_mem_primeFactors (by rw [hset]; simp)
  have hb : b.Prime := Nat.prime_of_mem_primeFactors (by rw [hset]; simp)
  have hc : c.Prime := Nat.prime_of_mem_primeFactors (by rw [hset]; simp)
  have hd : d.Prime := Nat.prime_of_mem_primeFactors (by rw [hset]; simp)
  have hprod := Nat.prod_primeFactors_of_squarefree hsq
  rw [hset] at hprod
  have hN : p^2*q+12 = a*b*c*d := by
    simpa [hab,hac,had,hbc,hbd,hcd,mul_assoc] using hprod.symm
  exact not_four_distinct_primes p q a b c d hp hq hpq hp5 hq5
    ha hb hc hd hab hac had hbc hbd hcd hphi hsigma hN

end P2qTheoremD
