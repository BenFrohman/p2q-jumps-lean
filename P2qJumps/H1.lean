/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.P7Cert
import P2qJumps.P7Kernel
import P2qJumps.ImpliesCorrected

/-!
# P2qJumps.H1

H1 in Lean: no solution of both jumps at `n = p^2 q` has `N = n + 12` squarefree. For
`ω(N) ≥ 4`, Corollary F1 reduces to `p = 7`, `7 ≤ ω(N) ≤ 9`, and the kernel certificate
`P7Cert.cert7`–`cert9` with `P7Cert.desc_sound` excludes these. For `ω(N) ≤ 3` the closed
shapes apply. Consequently Conjecture `conj:vanish` is equivalent to H2 ∧ H3.
-/

namespace P2qJumps

open Nat ArithmeticFunction P7Cert
open scoped ArithmeticFunction.sigma

private lemma gcd210 {x : ℕ} (hx : x.Prime) (h11 : 11 ≤ x) : Nat.gcd x 210 = 1 := by
  apply (Nat.Prime.coprime_iff_not_dvd hx).2
  intro h
  have h' : x ∣ 2 * (3 * (5 * 7)) := by norm_num; exact h
  rcases (Nat.Prime.dvd_mul hx).1 h' with h2 | h'
  · have := Nat.le_of_dvd (by norm_num) h2; omega
  rcases (Nat.Prime.dvd_mul hx).1 h' with h3 | h'
  · have := Nat.le_of_dvd (by norm_num) h3; omega
  rcases (Nat.Prime.dvd_mul hx).1 h' with h5 | h7
  · have := Nat.le_of_dvd (by norm_num) h5; omega
  · have := Nat.le_of_dvd (by norm_num) h7; omega

/-- For an increasing list of primes: `∏ x`, `φ(∏ x) = ∏ (x - 1)`, `σ(∏ x) = ∏ (x + 1)`. -/
private lemma list_prime_prod (l : List ℕ) (hs : l.Pairwise (· < ·)) (hp : ∀ x ∈ l, x.Prime) :
    PZ l = ((l.prod : ℕ) : ℤ) ∧ FmZ l = ((φ l.prod : ℕ) : ℤ) ∧
      FpZ l = ((σ 1 l.prod : ℕ) : ℤ) := by
  induction l with
  | nil => simp
  | cons x t ih =>
    have hx := hp x (by simp)
    have hxt : ∀ y ∈ t, x < y := fun y hy => List.rel_of_pairwise_cons hs hy
    have hcop : Nat.Coprime x t.prod := by
      apply Nat.coprime_list_prod_right_iff.2
      intro y hy
      exact (Nat.coprime_primes hx (hp y (by simp [hy]))).2 (hxt y hy).ne
    obtain ⟨i1, i2, i3⟩ := ih (List.Pairwise.of_cons hs) (fun y hy => hp y (by simp [hy]))
    simp only [PZ_cons, FmZ_cons, FpZ_cons, List.prod_cons]
    refine ⟨by rw [i1]; push_cast; ring, ?_, ?_⟩
    · rw [Nat.totient_mul hcop, Nat.totient_prime hx, i2]
      have : 1 ≤ x := hx.one_lt.le
      push_cast [this]; ring
    · rw [isMultiplicative_sigma.map_mul_of_coprime hcop, sigma_one_prime' hx, i3]
      push_cast; ring

/-- **The `p = 7` residual is empty**: no squarefree `N` with `7 ≤ ω(N) ≤ 9`. -/
theorem p7_squarefree_empty {q : ℕ} (hq : q.Prime) (hq7 : q ≠ 7) (hJ : Jumps (7 ^ 2 * q))
    (hsq : Squarefree (7 ^ 2 * q + 12)) (hk7 : 7 ≤ (7 ^ 2 * q + 12).primeFactors.card)
    (hk9 : (7 ^ 2 * q + 12).primeFactors.card ≤ 9) : False := by
  set N := 7 ^ 2 * q + 12 with hNdef
  set l := N.primeFactors.sort (· ≤ ·) with hldef
  have hsort : l.Pairwise (· < ·) :=
    ((Finset.pairwise_sort _ _).and (Finset.sort_nodup _ _)).imp (fun h => lt_of_le_of_ne h.1 h.2)
  have hlen : l.length = N.primeFactors.card := Finset.length_sort _
  have hmem : ∀ x, x ∈ l ↔ x ∈ N.primeFactors := fun x => Finset.mem_sort _
  have hprime : ∀ x ∈ l, x.Prime := fun x hx => Nat.prime_of_mem_primeFactors ((hmem x).1 hx)
  -- every prime factor is at least 11
  have hge : ∀ r : ℕ, r.Prime → r ∣ N → 11 ≤ r := by
    obtain ⟨t, ht, htc⟩ := Finset.exists_subset_card_eq (show 4 ≤ N.primeFactors.card by omega)
    rw [Finset.card_eq_succ] at htc
    obtain ⟨a, t3, hat, rfl, h3⟩ := htc
    rw [Finset.card_eq_three] at h3
    obtain ⟨b, c, d, hbc, hbd, hcd, rfl⟩ := h3
    simp only [Finset.mem_insert, Finset.mem_singleton, not_or] at hat
    obtain ⟨hab, hac, had⟩ := hat
    have m : ∀ x ∈ ({a, b, c, d} : Finset ℕ), x.Prime ∧ x ∣ N := fun x hx => by
      have := ht hx; rw [Nat.mem_primeFactors] at this; exact ⟨this.1, this.2.1⟩
    simp only [Finset.mem_insert, Finset.mem_singleton, forall_eq_or_imp, forall_eq] at m
    exact (p7_omega4_ge11 hq hq7 hJ m.1.1 m.2.1.1 m.2.2.1.1 m.2.2.2.1 hab hac had hbc hbd hcd
      m.1.2 m.2.1.2 m.2.2.1.2 m.2.2.2.2).1
  have hl : ∀ x ∈ l, 10 < x ∧ 11 ≤ x ∧ Nat.gcd x 210 = 1 := by
    intro x hx
    have hxN := (hmem x).1 hx
    have h11 := hge x (Nat.prime_of_mem_primeFactors hxN) (Nat.dvd_of_mem_primeFactors hxN)
    exact ⟨by omega, h11, gcd210 (Nat.prime_of_mem_primeFactors hxN) h11⟩
  have hNl : l.prod = N := by
    have h1 := Nat.prod_primeFactors_of_squarefree hsq
    rw [← Finset.sort_toFinset N.primeFactors (· ≤ ·), List.prod_toFinset _ (Finset.sort_nodup _ _)] at h1
    rw [← hldef] at h1; simpa using h1
  obtain ⟨i1, i2, i3⟩ := list_prime_prod l hsort hprime
  rw [hNl] at i1 i2 i3
  obtain ⟨-, -, j3, j4, -, -⟩ := p7_identities hq hq7 hJ
  have E1 : 7 * 1 * FmZ l = 6 * 1 * PZ l - 282 := by rw [i1, i2]; linarith
  have E2 : 49 * 1 * FpZ l = 57 * 1 * PZ l + 2697 := by rw [i1, i3]; linarith
  have hd : desc 10 1 1 1 10 l.length = true := by
    rw [hlen]
    interval_cases hc : N.primeFactors.card
    · exact cert7
    · exact cert8
    · exact cert9
  exact desc_sound 10 1 1 1 10 l hsort hl le_rfl (by norm_num) (by norm_num) (by norm_num)
    E1 E2 hd

/-- **The `p = 7` descent** (paper Appendix `app:p7`), in the statement form of the earlier audited
package `P7Descent.p7_squarefree_7_8_9` (Lean v4.22), ported to this repository: for a prime
`q ≠ 7`, `q ≥ 5`, with `N = 49 q + 12` squarefree and both jumps, `ω(N) ∉ {7, 8, 9}`. Proved here from
the kernel certificate `P7Cert.cert7`–`cert9` (new checker, toolchain v4.26.0). -/
theorem p7_squarefree_7_8_9 (q : ℕ) (hq : q.Prime) (hq7 : q ≠ 7) (_hq5 : 5 ≤ q)
    (hphi : φ (49 * q + 12) = φ (49 * q) + 12)
    (hsigma : σ 1 (49 * q + 12) = σ 1 (49 * q) + 12)
    (hsq : Squarefree (49 * q + 12))
    (hk : (49 * q + 12).primeFactors.card = 7 ∨ (49 * q + 12).primeFactors.card = 8 ∨
      (49 * q + 12).primeFactors.card = 9) : False := by
  have hJ : Jumps (7 ^ 2 * q) := by
    refine ⟨?_, ?_⟩
    · simpa [show 7 ^ 2 * q = 49 * q by ring] using hphi
    · simpa [show 7 ^ 2 * q = 49 * q by ring] using hsigma
  have h49 : 7 ^ 2 * q + 12 = 49 * q + 12 := by ring
  rw [← h49] at hsq hk
  exact p7_squarefree_empty hq hq7 hJ hsq (by omega) (by omega)

/-- Non-vacuity of the hypotheses' setting: `q = 11` is a prime `≠ 7`, `≥ 5`, and
`N = 49 · 11 + 12 = 551 = 19 · 29` is squarefree (the jumps fail there, as they must). -/
example : Nat.Prime 11 ∧ 11 ≠ 7 ∧ 5 ≤ 11 ∧ Squarefree (49 * 11 + 12) := by
  refine ⟨by norm_num, by norm_num, by norm_num, ?_⟩
  rw [show 49 * 11 + 12 = 19 * 29 by norm_num]
  exact Nat.squarefree_mul_iff.2
    ⟨by norm_num, (by norm_num : Nat.Prime 19).squarefree, (by norm_num : Nat.Prime 29).squarefree⟩

/-- **H1 holds** (kernel-checked): no solution has `N` squarefree with `ω(N) ≥ 4`. -/
theorem H1_holds : H1 := by
  rintro p q hp hq hpq hJ ⟨hsq, hk⟩
  obtain ⟨rfl, hk7, hk9⟩ := corollaryF1 hp hq hpq hJ hsq hk
  exact p7_squarefree_empty hq (Ne.symm hpq) hJ hsq hk7 hk9

/-- **Theorem `thm:H1-comp`, kernel-checked**: no solution has `N` squarefree. -/
theorem no_squarefree {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) : ¬ Squarefree (p ^ 2 * q + 12) := by
  intro hsq
  set N := p ^ 2 * q + 12 with hNdef
  have hprod := Nat.prod_primeFactors_of_squarefree hsq
  by_cases h4 : 4 ≤ N.primeFactors.card
  · exact H1_holds p q hp hq hpq hJ ⟨hsq, h4⟩
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

/-- With H1 proved: Conjecture `conj:vanish` holds if and only if H2 and H3 hold. -/
theorem conjecture_iff_H2_H3 : Conjecture3 ↔ H2 ∧ H3 := implies_corrected_of_H1 H1_holds

end P2qJumps
