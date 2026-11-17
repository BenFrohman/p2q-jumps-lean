/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Ext.Exclusions.Setup

/-!
# Pair terms of L1 and the strict union bound (L3)

For powerful `N` (every prime factor squared divides `N`):
`δ(N) ≥ N (∑_{ℓ ∣ N} 1/ℓ)^2` (terms `e = ℓ^2` and `e = ℓℓ'` of L1).
-/

namespace P2qExclusions

open ArithmeticFunction P2qStructural P2qExtensions
open scoped ArithmeticFunction.sigma ArithmeticFunction.Moebius

/-- Symmetric double sum folded onto `a ≤ b`. -/
lemma sym_sum (S : Finset ℕ) (g : ℕ → ℕ → ℚ) (hg : ∀ a b, g a b = g b a) :
    ∑ x ∈ S ×ˢ S, g x.1 x.2
      = ∑ x ∈ (S ×ˢ S).filter (fun x => x.1 ≤ x.2), (if x.1 < x.2 then 2 else 1) * g x.1 x.2 := by
  rw [← Finset.sum_filter_add_sum_filter_not (S ×ˢ S) (fun x => x.1 ≤ x.2)]
  have hswap : ∑ x ∈ (S ×ˢ S).filter (fun x => ¬ x.1 ≤ x.2), g x.1 x.2
      = ∑ x ∈ (S ×ˢ S).filter (fun x => x.1 < x.2), g x.1 x.2 := by
    apply Finset.sum_nbij' Prod.swap Prod.swap
    · intro x hx; simp only [Finset.mem_filter, Finset.mem_product] at hx ⊢
      exact ⟨⟨hx.1.2, hx.1.1⟩, by simp; omega⟩
    · intro x hx; simp only [Finset.mem_filter, Finset.mem_product] at hx ⊢
      exact ⟨⟨hx.1.2, hx.1.1⟩, by simp; omega⟩
    · intro x _; simp
    · intro x _; simp
    · intro x _; simp [hg]
  have hlt : ∑ x ∈ (S ×ˢ S).filter (fun x => x.1 < x.2), g x.1 x.2
      = ∑ x ∈ (S ×ˢ S).filter (fun x => x.1 ≤ x.2), (if x.1 < x.2 then g x.1 x.2 else 0) := by
    rw [Finset.sum_filter, Finset.sum_filter]
    apply Finset.sum_congr rfl; intro x _
    split_ifs <;> first | rfl | omega
  rw [hswap, hlt, ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl; intro x _
  split_ifs <;> ring

lemma prime_pair_inj {a b c d : ℕ} (ha : a.Prime) (_hb : b.Prime) (hc : c.Prime) (hd : d.Prime)
    (hab : a ≤ b) (hcd : c ≤ d) (h : a * b = c * d) : a = c ∧ b = d := by
  have hdv : a ∣ c * d := ⟨b, h.symm⟩
  rcases (Nat.Prime.dvd_mul ha).1 hdv with h1 | h1
  · have e := (Nat.prime_dvd_prime_iff_eq ha hc).1 h1
    subst e
    exact ⟨rfl, Nat.eq_of_mul_eq_mul_left ha.pos h⟩
  · have e := (Nat.prime_dvd_prime_iff_eq ha hd).1 h1
    subst e
    have : b = c := by
      have := Nat.eq_of_mul_eq_mul_left ha.pos (h.trans (mul_comm c a))
      exact this
    subst this
    omega

lemma moebius_pair {a b : ℕ} (ha : a.Prime) (hb : b.Prime) (hab : a ≤ b) :
    (1 + (μ (a * b) : ℤ)) = if a < b then 2 else 1 := by
  split_ifs with h
  · have hc : Nat.Coprime a b := (Nat.coprime_primes ha hb).2 (by omega)
    rw [isMultiplicative_moebius.map_mul_of_coprime hc, moebius_apply_prime ha,
      moebius_apply_prime hb]; norm_num
  · have : b = a := by omega
    subst this
    rw [← pow_two, moebius_apply_prime_pow ha (by norm_num)]; norm_num

/-- **Pair bound.** For powerful `N > 1`: `δ(N) ≥ N (∑ 1/ℓ)^2` in `ℚ`. -/
theorem delta_ge_pairs (N : ℕ) (hN : 0 < N) (hpow : ∀ ℓ ∈ N.primeFactors, ℓ ^ 2 ∣ N) :
    (N : ℚ) * (∑ ℓ ∈ N.primeFactors, (1 : ℚ) / ℓ) ^ 2 ≤ (delta N : ℚ) := by
  set S := N.primeFactors
  set I := (S ×ˢ S).filter (fun x => x.1 ≤ x.2)
  let F : ℕ × ℕ → ℕ × ℕ := fun x => (x.1 * x.2, N / (x.1 * x.2))
  let w : ℕ × ℕ → ℤ := fun y => (1 + (μ y.1 : ℤ)) * (y.2 : ℤ)
  have hprime : ∀ x ∈ I, x.1.Prime ∧ x.2.Prime ∧ x.1 ≤ x.2 := by
    intro x hx
    simp only [I, S, Finset.mem_filter, Finset.mem_product] at hx
    exact ⟨Nat.prime_of_mem_primeFactors hx.1.1, Nat.prime_of_mem_primeFactors hx.1.2, hx.2⟩
  have hdvd : ∀ x ∈ I, x.1 * x.2 ∣ N := by
    intro x hx
    simp only [I, S, Finset.mem_filter, Finset.mem_product] at hx
    obtain ⟨ha, hb, hab⟩ := hprime x (by simp [I, S, hx])
    rcases eq_or_ne x.1 x.2 with he | he
    · rw [he, ← pow_two]; exact hpow _ hx.1.2
    · exact Nat.Coprime.mul_dvd_of_dvd_of_dvd ((Nat.coprime_primes ha hb).2 he)
        (Nat.dvd_of_mem_primeFactors hx.1.1) (Nat.dvd_of_mem_primeFactors hx.1.2)
  have hinj : Set.InjOn F I := by
    intro x hx y hy hxy
    simp only [F, Prod.mk.injEq] at hxy
    obtain ⟨ha, hb, hab⟩ := hprime x hx
    obtain ⟨hc, hd, hcd⟩ := hprime y hy
    obtain ⟨e1, e2⟩ := prime_pair_inj ha hb hc hd hab hcd hxy.1
    exact Prod.ext e1 e2
  have hsub : I.image F ⊆ N.divisorsAntidiagonal.erase (1, N) := by
    intro y hy
    obtain ⟨x, hx, rfl⟩ := Finset.mem_image.1 hy
    obtain ⟨ha, hb, -⟩ := hprime x hx
    refine Finset.mem_erase.2 ⟨?_, Nat.mem_divisorsAntidiagonal.2 ⟨Nat.mul_div_cancel' (hdvd x hx), by omega⟩⟩
    intro he; simp only [F, Prod.mk.injEq] at he
    have := Nat.mul_le_mul ha.two_le hb.two_le; omega
  have hnn : ∀ y ∈ N.divisorsAntidiagonal.erase (1, N), y ∉ I.image F → 0 ≤ w y := by
    intro y _ _
    have := abs_moebius_le_one (n := y.1)
    have h1 : 0 ≤ 1 + (μ y.1 : ℤ) := by have := neg_abs_le (μ y.1 : ℤ); linarith
    exact mul_nonneg h1 (by positivity)
  have hle : ∑ y ∈ I.image F, w y ≤ delta N := by
    rw [lemmaL1 N hN]; exact Finset.sum_le_sum_of_subset_of_nonneg hsub hnn
  rw [Finset.sum_image hinj] at hle
  have hq : (∑ x ∈ I, w (F x) : ℚ) ≤ (delta N : ℚ) := by exact_mod_cast hle
  refine le_trans (le_of_eq ?_) hq
  rw [sq, Finset.sum_mul_sum, ← Finset.sum_product', Finset.mul_sum]
  rw [sym_sum S (fun a b => (N : ℚ) * (1 / a * (1 / b))) (fun a b => by ring)]
  push_cast
  apply Finset.sum_congr rfl
  intro x hx
  obtain ⟨ha, hb, hab⟩ := hprime x hx
  simp only [w, F]
  have hm := moebius_pair ha hb hab
  have hc : ((1 + (μ (x.1 * x.2) : ℤ) : ℤ) : ℚ) = if x.1 < x.2 then 2 else 1 := by
    rw [hm]; split_ifs <;> norm_num
  rw [Int.cast_mul, hc, Int.cast_natCast,
    Nat.cast_div (hdvd x hx) (by have := Nat.mul_le_mul ha.two_le hb.two_le; positivity),
    Nat.cast_mul]
  have h1 : (x.1 : ℚ) ≠ 0 := by exact_mod_cast ha.ne_zero
  have h2 : (x.2 : ℚ) ≠ 0 := by exact_mod_cast hb.ne_zero
  field_simp

/-- Strict union bound for at least two elements of `(0,1)`. -/
lemma strict_union_bound (s : Finset ℕ) (x : ℕ → ℚ) (hx : ∀ i ∈ s, 0 < x i ∧ x i < 1)
    (hs : 2 ≤ s.card) : 1 - ∏ i ∈ s, (1 - x i) < ∑ i ∈ s, x i := by
  have weak : ∀ t : Finset ℕ, (∀ i ∈ t, 0 < x i ∧ x i < 1) →
      1 - ∏ i ∈ t, (1 - x i) ≤ ∑ i ∈ t, x i ∧ 0 ≤ ∏ i ∈ t, (1 - x i) ∧
        ∏ i ∈ t, (1 - x i) ≤ 1 := by
    intro t
    induction t using Finset.induction_on with
    | empty => intro _; simp
    | @insert a t ha ih =>
      intro hxt
      obtain ⟨h1, h2, h3⟩ := ih (fun i hi => hxt i (Finset.mem_insert_of_mem hi))
      have hxa := hxt a (Finset.mem_insert_self a t)
      rw [Finset.prod_insert ha, Finset.sum_insert ha]
      refine ⟨?_, mul_nonneg (by linarith) h2, ?_⟩
      · nlinarith
      · nlinarith
  obtain ⟨a, ha, t, hat, rfl⟩ : ∃ a ∈ s, ∃ t, a ∉ t ∧ s = insert a t := by
    obtain ⟨a, ha⟩ := Finset.card_pos.1 (by omega : 0 < s.card)
    exact ⟨a, ha, s.erase a, Finset.notMem_erase a s, (Finset.insert_erase ha).symm⟩
  have htne : t.Nonempty := by
    rw [Finset.card_insert_of_notMem hat] at hs
    exact Finset.card_pos.1 (by omega : 0 < t.card)
  have hxt : ∀ i ∈ t, 0 < x i ∧ x i < 1 := fun i hi => hx i (Finset.mem_insert_of_mem hi)
  obtain ⟨h1, h2, -⟩ := weak t hxt
  have hlt : ∏ i ∈ t, (1 - x i) < 1 := by
    obtain ⟨b, hb⟩ := htne
    rw [← Finset.mul_prod_erase t _ hb]
    obtain ⟨-, -, h3⟩ := weak (t.erase b) (fun i hi => hxt i (Finset.mem_of_mem_erase hi))
    have hb' := hxt b hb
    have h4 : 0 ≤ ∏ i ∈ t.erase b, (1 - x i) :=
      Finset.prod_nonneg (fun i hi => by have := hxt i (Finset.mem_of_mem_erase hi); linarith)
    nlinarith
  have hxa := hx a ha
  rw [Finset.prod_insert hat, Finset.sum_insert hat]
  nlinarith

end P2qExclusions
