/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.ThmEShapes

/-!
# P2qJumps.ThreeRegimes

Every solution has `ω(N) ≥ 4` or `N = r^2 s^2 t` (distinct primes). Hence the claim that every
counterexample lies in one of the three regimes `r^3 s`, `r^2 s t`, `ω(N) ≥ 4` is equivalent to
the emptiness of the shape `r^2 s^2 t`. Neither is proved here.
-/

namespace P2qJumps

open Nat

/-- Card of the prime factors of a coprime product. -/
private lemma card_pf_mul {a b : ℕ} (ha : a ≠ 0) (hb : b ≠ 0) (h : Nat.Coprime a b) :
    (a * b).primeFactors.card = a.primeFactors.card + b.primeFactors.card := by
  rw [Nat.primeFactors_mul ha hb]
  exact Finset.card_union_of_disjoint (Nat.Coprime.disjoint_primeFactors h)

private lemma card_pf_pow {r e : ℕ} (hr : r.Prime) (he : e ≠ 0) :
    (r ^ e).primeFactors.card = 1 := by
  rw [Nat.primeFactors_prime_pow he hr]; rfl

/-- A squarefree number with exactly two prime factors is their product. -/
private lemma eq_of_sqfree_card_two {V : ℕ} (hV : Squarefree V) (h2 : V.primeFactors.card = 2) :
    ∃ s t, s.Prime ∧ t.Prime ∧ s ≠ t ∧ V = s * t := by
  obtain ⟨s, t, hst, he⟩ := Finset.card_eq_two.1 h2
  have hs : s ∈ V.primeFactors := by rw [he]; simp
  have ht : t ∈ V.primeFactors := by rw [he]; simp
  refine ⟨s, t, Nat.prime_of_mem_primeFactors hs, Nat.prime_of_mem_primeFactors ht, hst, ?_⟩
  rw [← Nat.prod_primeFactors_of_squarefree hV, he, Finset.prod_pair hst]

/-- **Reduction**: every solution has `ω(N) ≥ 4`, or `N = r^2 s^2 t` with distinct primes. -/
theorem omega4_or_r2s2t {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) :
    4 ≤ (p ^ 2 * q + 12).primeFactors.card ∨
      ∃ r s t : ℕ, r.Prime ∧ s.Prime ∧ t.Prime ∧ r ≠ s ∧ r ≠ t ∧ s ≠ t ∧
        p ^ 2 * q + 12 = r ^ 2 * s ^ 2 * t := by
  set N := p ^ 2 * q + 12 with hNdef
  have hN0 : N ≠ 0 := by omega
  by_cases hR : ∃ r, r.Prime ∧ r ^ 2 ∣ N
  · rcases theoremE_shapes hp hq hpq hJ hR with
      ⟨r, V, hr, hV, hrV, hV2, hNV⟩ | ⟨r, s, V, hr, hs, hrs, hV, hrsV, hV1, hNV, -, -⟩
    · have hV0 : V ≠ 0 := by rintro rfl; simp at hNV
      by_cases hc : V.primeFactors.card = 2
      · exfalso
        obtain ⟨s, t, hs, ht, hst, rfl⟩ := eq_of_sqfree_card_two hV hc
        have hrs : r ≠ s := fun h => by
          rw [h] at hrV; exact (Nat.Prime.coprime_iff_not_dvd hs).1 hrV (dvd_mul_right s t)
        have hrt : r ≠ t := fun h => by
          rw [h] at hrV; exact (Nat.Prime.coprime_iff_not_dvd ht).1 hrV (dvd_mul_left t s)
        rcases hNV with h | h
        · exact N_ne_r2st hp hq hpq hJ hr hs ht hrs hrt hst (by rw [h, mul_assoc])
        · exact r3st_empty hp hq hr hs ht hpq hrs hrt hst hJ (by rw [h, mul_assoc])
      · left
        have he : ∀ e, e ≠ 0 → (r ^ e * V).primeFactors.card = 1 + V.primeFactors.card :=
          fun e he => by
            rw [card_pf_mul (pow_ne_zero _ hr.ne_zero) hV0 (Nat.Coprime.pow_left e hrV),
              card_pf_pow hr he]
        rcases hNV with h | h
        · rw [show N = r ^ 2 * V from h, he 2 (by norm_num)]; omega
        · rw [show N = r ^ 3 * V from h, he 3 (by norm_num)]; omega
    · replace hNV : N = r ^ 2 * s ^ 2 * V := hNV
      have hV0 : V ≠ 0 := by rintro rfl; simp at hNV; omega
      have hcop : Nat.Coprime (r ^ 2 * s ^ 2) V := by
        rw [← mul_pow]; exact Nat.Coprime.pow_left 2 hrsV
      have hrs2 : Nat.Coprime (r ^ 2) (s ^ 2) :=
        Nat.Coprime.pow 2 2 ((Nat.coprime_primes hr hs).2 hrs)
      have hcard : N.primeFactors.card = 2 + V.primeFactors.card := by
        rw [hNV, card_pf_mul (mul_ne_zero (pow_ne_zero _ hr.ne_zero) (pow_ne_zero _ hs.ne_zero)) hV0 hcop,
          card_pf_mul (pow_ne_zero _ hr.ne_zero) (pow_ne_zero _ hs.ne_zero) hrs2,
          card_pf_pow hr (by norm_num), card_pf_pow hs (by norm_num)]
      by_cases hc : V.primeFactors.card = 1
      · right
        obtain ⟨t, htV⟩ := Finset.card_eq_one.1 hc
        have htm : t ∈ V.primeFactors := by rw [htV]; simp
        have ht := Nat.prime_of_mem_primeFactors htm
        have hVt : V = t := by
          rw [← Nat.prod_primeFactors_of_squarefree hV, htV, Finset.prod_singleton]
        have htd : t ∣ V := Nat.dvd_of_mem_primeFactors htm
        have hrt : r ≠ t := fun h => by
          rw [h] at hrsV
          exact (Nat.Prime.coprime_iff_not_dvd ht).1 (Nat.Coprime.coprime_mul_right hrsV) htd
        have hst : s ≠ t := fun h => by
          rw [h] at hrsV
          exact (Nat.Prime.coprime_iff_not_dvd ht).1 (Nat.Coprime.coprime_mul_left hrsV) htd
        exact ⟨r, s, t, hr, hs, ht, hrs, hrt, hst, by rw [hNV, hVt]⟩
      · left; omega
  · -- `N` squarefree
    left
    push_neg at hR
    have hsq : Squarefree N := by
      rw [Nat.squarefree_iff_prime_squarefree]
      intro x hx hxx; exact hR x hx (by rw [pow_two]; exact hxx)
    have hprod := Nat.prod_primeFactors_of_squarefree hsq
    by_contra h4
    push_neg at h4
    interval_cases hc : N.primeFactors.card
    · rcases Nat.primeFactors_eq_empty.1 (Finset.card_eq_zero.1 hc) with h | h <;> omega
    · obtain ⟨a, ha⟩ := Finset.card_eq_one.1 hc
      rw [ha, Finset.prod_singleton] at hprod
      have hap : a.Prime := Nat.prime_of_mem_primeFactors (by rw [ha]; simp)
      exact N_not_prime hp hq hpq hJ (show N.Prime by rw [← hprod]; exact hap)
    · obtain ⟨a, b, hab, hab'⟩ := Finset.card_eq_two.1 hc
      have hap : a.Prime := Nat.prime_of_mem_primeFactors (by rw [hab']; simp)
      have hbp : b.Prime := Nat.prime_of_mem_primeFactors (by rw [hab']; simp)
      rw [hab', Finset.prod_pair hab] at hprod
      exact N_ne_rs hp hq hap hbp hpq hab hJ hprod.symm
    · obtain ⟨a, b, c, hab, hac, hbc, habc⟩ := Finset.card_eq_three.1 hc
      have hap : a.Prime := Nat.prime_of_mem_primeFactors (by rw [habc]; simp)
      have hbp : b.Prime := Nat.prime_of_mem_primeFactors (by rw [habc]; simp)
      have hcp : c.Prime := Nat.prime_of_mem_primeFactors (by rw [habc]; simp)
      rw [habc, Finset.prod_insert (by simp [hab, hac]), Finset.prod_pair hbc] at hprod
      exact theorem28_holds p q a b c hp hq hap hbp hcp hpq hab hac hbc hJ
        (show N = a * b * c by rw [← hprod]; ring)

/-- The "three regimes" claim: every solution has `N = r^3 s`, `N = r^2 s t`, or `ω(N) ≥ 4`. -/
def ThreeRegimes : Prop :=
  ∀ p q : ℕ, p.Prime → q.Prime → p ≠ q → Jumps (p ^ 2 * q) →
    (∃ r s : ℕ, r.Prime ∧ s.Prime ∧ r ≠ s ∧ p ^ 2 * q + 12 = r ^ 3 * s) ∨
    (∃ r s t : ℕ, r.Prime ∧ s.Prime ∧ t.Prime ∧ r ≠ s ∧ r ≠ t ∧ s ≠ t ∧
      p ^ 2 * q + 12 = r ^ 2 * s * t) ∨
    4 ≤ (p ^ 2 * q + 12).primeFactors.card

/-- The shape `r^2 s^2 t` has no solution. Open. -/
def R2S2TEmpty : Prop :=
  ∀ p q r s t : ℕ, p.Prime → q.Prime → r.Prime → s.Prime → t.Prime → p ≠ q →
    r ≠ s → r ≠ t → s ≠ t → Jumps (p ^ 2 * q) → p ^ 2 * q + 12 ≠ r ^ 2 * s ^ 2 * t

/-- `ω(r^2 s^2 t) = 3` for distinct primes. -/
lemma card_pf_r2s2t {r s t : ℕ} (hr : r.Prime) (hs : s.Prime) (ht : t.Prime) (hrs : r ≠ s)
    (hrt : r ≠ t) (hst : s ≠ t) : (r ^ 2 * s ^ 2 * t).primeFactors.card = 3 := by
  have c1 : Nat.Coprime (r ^ 2) (s ^ 2) := Nat.Coprime.pow 2 2 ((Nat.coprime_primes hr hs).2 hrs)
  have c2 : Nat.Coprime (r ^ 2 * s ^ 2) t :=
    Nat.Coprime.mul_left (Nat.Coprime.pow_left 2 ((Nat.coprime_primes hr ht).2 hrt))
      (Nat.Coprime.pow_left 2 ((Nat.coprime_primes hs ht).2 hst))
  rw [card_pf_mul (mul_ne_zero (pow_ne_zero _ hr.ne_zero) (pow_ne_zero _ hs.ne_zero)) ht.ne_zero c2,
    card_pf_mul (pow_ne_zero _ hr.ne_zero) (pow_ne_zero _ hs.ne_zero) c1,
    card_pf_pow hr (by norm_num), card_pf_pow hs (by norm_num), Nat.Prime.primeFactors ht]
  rfl

/-- **The three-regimes claim is equivalent to the emptiness of `r^2 s^2 t`.** -/
theorem threeRegimes_iff_r2s2t : ThreeRegimes ↔ R2S2TEmpty := by
  constructor
  · intro h3 p q r s t hp hq hr hs ht hpq hrs hrt hst hJ hN
    have hω : (p ^ 2 * q + 12).primeFactors.card = 3 := by
      rw [hN]; exact card_pf_r2s2t hr hs ht hrs hrt hst
    rcases h3 p q hp hq hpq hJ with ⟨a, b, ha, hb, hab, h⟩ | ⟨a, b, c, ha, hb, hc, hab, hac, hbc, h⟩ | h
    · exact r3s_empty hp hq ha hb hpq hab hJ h
    · exact N_ne_r2st hp hq hpq hJ ha hb hc hab hac hbc h
    · omega
  · intro h p q hp hq hpq hJ
    rcases omega4_or_r2s2t hp hq hpq hJ with h4 | ⟨r, s, t, hr, hs, ht, hrs, hrt, hst, hN⟩
    · exact Or.inr (Or.inr h4)
    · exact absurd hN (h p q r s t hp hq hr hs ht hpq hrs hrt hst hJ)

end P2qJumps
