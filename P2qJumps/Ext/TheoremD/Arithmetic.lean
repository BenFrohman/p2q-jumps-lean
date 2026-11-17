/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib

/-!
# P2qJumps.Ext.TheoremD.Arithmetic

Machine-checked Lean 4 module.
-/

namespace P2qTheoremD
open ArithmeticFunction
open scoped ArithmeticFunction.sigma ArithmeticFunction.Moebius
lemma sigma_prime {p : ℕ} (hp : p.Prime) : σ 1 p = p + 1 := by
  have h := sigma_one_apply_prime_pow (i := 1) hp
  rw [pow_one] at h
  rw [h]; simp [Finset.sum_range_succ]; ring

lemma sigma_prime_sq {p : ℕ} (hp : p.Prime) : σ 1 (p ^ 2) = 1 + p + p ^ 2 := by
  rw [sigma_one_apply_prime_pow hp]; simp [Finset.sum_range_succ]

lemma totient_p2q {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) :
    Nat.totient (p ^ 2 * q) = p * (p - 1) * (q - 1) := by
  have hc : Nat.Coprime (p ^ 2) q :=
    Nat.Coprime.pow_left 2 ((Nat.coprime_primes hp hq).2 hpq)
  rw [Nat.totient_mul hc, Nat.totient_prime_pow hp (by norm_num), Nat.totient_prime hq]
  ring

lemma sigma_p2q {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) :
    σ 1 (p ^ 2 * q) = (1 + p + p ^ 2) * (q + 1) := by
  have hc : Nat.Coprime (p ^ 2) q :=
    Nat.Coprime.pow_left 2 ((Nat.coprime_primes hp hq).2 hpq)
  rw [isMultiplicative_sigma.map_mul_of_coprime hc, sigma_prime_sq hp, sigma_prime hq]


lemma totient_four {a b c d : ℕ} (ha : a.Prime) (hb : b.Prime)
    (hc : c.Prime) (hd : d.Prime)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d) :
    Nat.totient (a*b*c*d) = (a-1)*(b-1)*(c-1)*(d-1) := by
  have h1 := (Nat.coprime_primes ha hb).2 hab
  have h2 := Nat.Coprime.mul_left ((Nat.coprime_primes ha hc).2 hac) ((Nat.coprime_primes hb hc).2 hbc)
  have h3 := Nat.Coprime.mul_left
    (Nat.Coprime.mul_left ((Nat.coprime_primes ha hd).2 had) ((Nat.coprime_primes hb hd).2 hbd))
    ((Nat.coprime_primes hc hd).2 hcd)
  rw [Nat.totient_mul h3,Nat.totient_mul h2,Nat.totient_mul h1,
    Nat.totient_prime ha,Nat.totient_prime hb,Nat.totient_prime hc,Nat.totient_prime hd]

lemma sigma_four {a b c d : ℕ} (ha : a.Prime) (hb : b.Prime)
    (hc : c.Prime) (hd : d.Prime)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d) :
    σ 1 (a*b*c*d) = (a+1)*(b+1)*(c+1)*(d+1) := by
  have h1 := (Nat.coprime_primes ha hb).2 hab
  have h2 := Nat.Coprime.mul_left ((Nat.coprime_primes ha hc).2 hac) ((Nat.coprime_primes hb hc).2 hbc)
  have h3 := Nat.Coprime.mul_left
    (Nat.Coprime.mul_left ((Nat.coprime_primes ha hd).2 had) ((Nat.coprime_primes hb hd).2 hbd))
    ((Nat.coprime_primes hc hd).2 hcd)
  rw [isMultiplicative_sigma.map_mul_of_coprime h3,isMultiplicative_sigma.map_mul_of_coprime h2,
    isMultiplicative_sigma.map_mul_of_coprime h1,sigma_prime ha,sigma_prime hb,sigma_prime hc,sigma_prime hd]
end P2qTheoremD
