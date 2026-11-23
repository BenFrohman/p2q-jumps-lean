/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Ext.Exclusions
import P2qJumps.Preamble
import P2qJumps.TheoremA
import P2qJumps.Omega4

/-!
# Theorems B, D, E and the structural lemmas, stated with the jumps only

The library `P2qJumps.Ext` (ported from the audited packages `P2qStructural`, `P2qExtensions`,
`P2qTheoremD`, `P2qExclusions`) proves its results under the extra hypotheses `5 ≤ p`, `5 ≤ q`
and (for E(i)) `2 ≤ ω(N)`. Here these are discharged by `preamble` and `N_ne_prime_pow`, so every
statement below assumes only that `p ≠ q` are primes and that both jumps hold at `n = p^2 q`.
-/

namespace P2qJumps

open Nat ArithmeticFunction Finset
open scoped ArithmeticFunction.sigma

/-- The jump hypothesis of this repository gives the structure `P2qStructural.Jump`. -/
theorem jump_of_jumps {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) : P2qStructural.Jump p q :=
  ⟨hp, hq, hpq, hJ.1, hJ.2⟩

/-- `ω(N) ≥ 2`: `N` has at least two distinct prime factors. -/
theorem two_le_omega {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) : 2 ≤ (p ^ 2 * q + 12).primeFactors.card := by
  by_contra h
  push_neg at h
  have hN1 : 1 < p ^ 2 * q + 12 := by omega
  have hne : (p ^ 2 * q + 12).primeFactors.Nonempty :=
    Nat.nonempty_primeFactors.2 hN1
  have h1 : (p ^ 2 * q + 12).primeFactors.card = 1 := by
    have := hne.card_pos; omega
  obtain ⟨r, k, hr, hk, hrk⟩ :=
    (isPrimePow_nat_iff _).1 (isPrimePow_iff_card_primeFactors_eq_one.2 h1)
  exact N_ne_prime_pow hp hq hr hpq hk hJ hrk.symm

/-- **Theorem B** (paper statement): `N` is not powerful with `ω(N) ≥ 2`. -/
theorem theoremB {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q))
    (hpow : ∀ ℓ ∈ (p ^ 2 * q + 12).primeFactors, ℓ ^ 2 ∣ p ^ 2 * q + 12)
    (hω : 2 ≤ (p ^ 2 * q + 12).primeFactors.card) : False := by
  obtain ⟨hp5, -, -, -, -⟩ := preamble hp hq hpq hJ
  exact P2qExclusions.theoremB p q hp hq hpq hp5 hJ.1 hJ.2 hpow hω

/-- `N` is not powerful (Theorem B together with `two_le_omega`). -/
theorem N_not_powerful {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) :
    ¬ ∀ ℓ ∈ (p ^ 2 * q + 12).primeFactors, ℓ ^ 2 ∣ p ^ 2 * q + 12 :=
  fun hpow => theoremB hp hq hpq hJ hpow (two_le_omega hp hq hpq hJ)

/-- **Theorem E(i)**: every prime of `N` has exponent at most `3`. -/
theorem theoremE_i {p q r : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hr : r.Prime) : ¬ r ^ 4 ∣ p ^ 2 * q + 12 := by
  obtain ⟨hp5, hq5, -, -, -⟩ := preamble hp hq hpq hJ
  exact P2qExclusions.theoremE_i p q r (jump_of_jumps hp hq hpq hJ) hp5 hq5
    (two_le_omega hp hq hpq hJ) hr

/-- **Theorem E(ii)**: two distinct primes with squares dividing `N` and a third prime factor
force `q > 5p^2 - 4p - 3`. -/
theorem theoremE_ii {p q r₁ r₂ t : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (h1 : r₁.Prime) (h2 : r₂.Prime) (ht : t.Prime) (h12 : r₁ ≠ r₂)
    (ht1 : t ≠ r₁) (ht2 : t ≠ r₂) (hd1 : r₁ ^ 2 ∣ p ^ 2 * q + 12) (hd2 : r₂ ^ 2 ∣ p ^ 2 * q + 12)
    (hdt : t ∣ p ^ 2 * q + 12) : 5 * (p : ℤ) ^ 2 - 4 * p - 3 < q := by
  obtain ⟨hp5, hq5, -, -, -⟩ := preamble hp hq hpq hJ
  exact P2qExclusions.theoremE_ii p q r₁ r₂ t (jump_of_jumps hp hq hpq hJ) hp5 hq5 h1 h2 ht h12
    ht1 ht2 hd1 hd2 hdt

/-- **Theorem E(iii)** (stronger than the paper: no `j ≥ 1` needed): no three distinct primes
have squares dividing `N`. -/
theorem theoremE_iii {p q a b c : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (ha : a.Prime) (hb : b.Prime) (hc : c.Prime) (hab : a ≠ b)
    (hac : a ≠ c) (hbc : b ≠ c) (hda : a ^ 2 ∣ p ^ 2 * q + 12) (hdb : b ^ 2 ∣ p ^ 2 * q + 12)
    (hdc : c ^ 2 ∣ p ^ 2 * q + 12) : False := by
  obtain ⟨hp5, hq5, -, -, -⟩ := preamble hp hq hpq hJ
  exact P2qExclusions.theoremE_iii p q a b c (jump_of_jumps hp hq hpq hJ) hp5 hq5 ha hb hc hab
    hac hbc hda hdb hdc

/-- **Theorem E(iv), exponents**: with two repeated primes and a third prime factor, no exponent
is `3` or more. -/
theorem theoremE_iv {p q r₁ r₂ t : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (h1 : r₁.Prime) (h2 : r₂.Prime) (ht : t.Prime) (h12 : r₁ ≠ r₂)
    (ht1 : t ≠ r₁) (ht2 : t ≠ r₂) (hd1 : r₁ ^ 3 ∣ p ^ 2 * q + 12) (hd2 : r₂ ^ 2 ∣ p ^ 2 * q + 12)
    (hdt : t ∣ p ^ 2 * q + 12) : False := by
  obtain ⟨hp5, hq5, -, -, -⟩ := preamble hp hq hpq hJ
  exact P2qExclusions.theoremE_iv p q r₁ r₂ t (jump_of_jumps hp hq hpq hJ) hp5 hq5 h1 h2 ht h12
    ht1 ht2 hd1 hd2 hdt

/-- If `r^(e+1) ∣ N` for a prime `r`, then `r^e` divides `K = N / rad N`. -/
theorem pow_dvd_K {N r e : ℕ} (hN : N ≠ 0) (hr : r.Prime) (h : r ^ (e + 1) ∣ N) :
    r ^ e ∣ N / P2qStructural.rad N := by
  have hrN : r ∈ N.primeFactors :=
    Nat.mem_primeFactors.2 ⟨hr, (dvd_pow_self r (Nat.succ_ne_zero e)).trans h, hN⟩
  set M := ∏ ℓ ∈ N.primeFactors.erase r, ℓ with hM
  have hrad : P2qStructural.rad N = r * M := by
    unfold P2qStructural.rad; rw [hM]; exact (Finset.mul_prod_erase _ (fun ℓ => ℓ) hrN).symm
  have hcop : Nat.Coprime r M := by
    rw [hM]; apply Nat.Coprime.prod_right
    intro ℓ hℓ
    have hℓp : ℓ.Prime := Nat.prime_of_mem_primeFactors (Finset.mem_of_mem_erase hℓ)
    exact (Nat.coprime_primes hr hℓp).2 (Finset.ne_of_mem_erase hℓ).symm
  have hradN : P2qStructural.rad N ∣ N := by
    unfold P2qStructural.rad; exact Nat.prod_primeFactors_dvd N
  obtain ⟨K, hK⟩ := hradN
  have hrad0 : 0 < P2qStructural.rad N := by
    unfold P2qStructural.rad
    exact Finset.prod_pos (fun ℓ hℓ => (Nat.prime_of_mem_primeFactors hℓ).pos)
  have hKeq : N / P2qStructural.rad N = K :=
    Nat.div_eq_of_eq_mul_left hrad0 (by rw [mul_comm]; exact hK)
  rw [hKeq]
  rw [hK, hrad, pow_succ, mul_assoc, mul_comm (r ^ e) r] at h
  have h' : r ^ e ∣ M * K := Nat.dvd_of_mul_dvd_mul_left hr.pos h
  exact (Nat.Coprime.pow_left e hcop).dvd_of_dvd_mul_left h'

/-- **Lemma K**: `K = N / rad N` divides `L(p) = p^3 - p^2 - 12`. -/
theorem lemmaK {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) :
    (((p ^ 2 * q + 12) / P2qStructural.rad (p ^ 2 * q + 12) : ℕ) : ℤ) ∣ (p : ℤ) ^ 3 - p ^ 2 - 12 :=
  P2qStructural.lemmaK (jump_of_jumps hp hq hpq hJ)

/-- **Theorem E(v)**: a prime of exponent at least `3` satisfies `r^2 ∣ L(p)`. -/
theorem theoremE_v {p q r : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hr : r.Prime) (h3 : r ^ 3 ∣ p ^ 2 * q + 12) :
    (r : ℤ) ^ 2 ∣ (p : ℤ) ^ 3 - p ^ 2 - 12 := by
  have hK := pow_dvd_K (by omega) hr h3
  exact (by exact_mod_cast Int.natCast_dvd_natCast.2 hK : ((r : ℤ) ^ 2) ∣ _).trans
    (lemmaK hp hq hpq hJ)

/-- **Theorem E(iv), divisibility**: two distinct primes with squares dividing `N` give
`r₁ r₂ ∣ L(p)`. -/
theorem theoremE_iv_dvd {p q r₁ r₂ : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (h1 : r₁.Prime) (h2 : r₂.Prime) (h12 : r₁ ≠ r₂)
    (hd1 : r₁ ^ 2 ∣ p ^ 2 * q + 12) (hd2 : r₂ ^ 2 ∣ p ^ 2 * q + 12) :
    ((r₁ * r₂ : ℕ) : ℤ) ∣ (p : ℤ) ^ 3 - p ^ 2 - 12 := by
  have k1 := pow_dvd_K (e := 1) (by omega) h1 hd1
  have k2 := pow_dvd_K (e := 1) (by omega) h2 hd2
  rw [pow_one] at k1 k2
  have hK : r₁ * r₂ ∣ (p ^ 2 * q + 12) / P2qStructural.rad (p ^ 2 * q + 12) :=
    Nat.Coprime.mul_dvd_of_dvd_of_dvd ((Nat.coprime_primes h1 h2).2 h12) k1 k2
  exact (Int.natCast_dvd_natCast.2 hK).trans (lemmaK hp hq hpq hJ)

/-- **Theorem E(iv), size**: each repeated prime `r` satisfies `N ≤ r^2 δ` with
`δ = q + 2p + 1`. -/
theorem theoremE_iv_size {p q r : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hr : r.Prime) (hd : r ^ 2 ∣ p ^ 2 * q + 12) :
    ((p ^ 2 * q + 12 : ℕ) : ℤ) ≤ (r : ℤ) ^ 2 * (q + 2 * p + 1) :=
  P2qExtensions.repeated_prime_bound (jump_of_jumps hp hq hpq hJ) hr hd

/-- Companion inequality of E(iv): `L(p) δ^2 < N^2` when `p ≥ 5` and `q ≥ 5p^2 - 4p - 3`. -/
theorem E_iv_companion (p q : ℤ) (hp : 5 ≤ p) (hq : 5 * p ^ 2 - 4 * p - 3 ≤ q) :
    (p ^ 3 - p ^ 2 - 12) * (q + 2 * p + 1) ^ 2 < (p ^ 2 * q + 12) ^ 2 := by
  obtain ⟨a, rfl⟩ : ∃ a : ℤ, p = 5 + a := ⟨p - 5, by ring⟩
  obtain ⟨b, rfl⟩ : ∃ b : ℤ, q = 5 * (5 + a) ^ 2 - 4 * (5 + a) - 3 + b := ⟨q - (5 * (5 + a) ^ 2 - 4 * (5 + a) - 3), by ring⟩
  have ha : 0 ≤ a := by linarith
  have hb : 0 ≤ b := by linarith
  nlinarith [mul_nonneg ha hb, mul_nonneg (mul_nonneg ha ha) hb, mul_nonneg (mul_nonneg ha ha) ha,
    mul_nonneg (mul_nonneg ha hb) hb, mul_nonneg hb hb,
    mul_nonneg (mul_nonneg (mul_nonneg ha ha) ha) ha,
    mul_nonneg (mul_nonneg (mul_nonneg ha ha) ha) hb,
    mul_nonneg (mul_nonneg (mul_nonneg ha ha) hb) hb,
    mul_nonneg (mul_nonneg (mul_nonneg ha ha) ha) (mul_nonneg ha ha),
    mul_nonneg (mul_nonneg (mul_nonneg ha ha) ha) (mul_nonneg ha hb)]

/-- **Theorem D**: `N` squarefree with `k = ω(N) ≥ 4` forces `q ≥ p^2 (k^2-k-1)^2 ≥ 121 p^2`
and `k ≥ p`. -/
theorem theoremD {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hsq : Squarefree (p ^ 2 * q + 12))
    (hk : 4 ≤ (p ^ 2 * q + 12).primeFactors.card) :
    p ^ 2 * ((p ^ 2 * q + 12).primeFactors.card ^ 2 - (p ^ 2 * q + 12).primeFactors.card - 1) ^ 2
        ≤ q ∧
      121 * p ^ 2 ≤ p ^ 2 *
        ((p ^ 2 * q + 12).primeFactors.card ^ 2 - (p ^ 2 * q + 12).primeFactors.card - 1) ^ 2 ∧
      p ≤ (p ^ 2 * q + 12).primeFactors.card := by
  obtain ⟨hp5, hq5, -, -, -⟩ := preamble hp hq hpq hJ
  exact P2qTheoremD.theoremD p q hp hq hpq hp5 hq5 hJ.1 hJ.2 hsq hk

/-- Theorem D, last clause: `N` squarefree with exactly four prime factors is impossible. -/
theorem theoremD_four {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hsq : Squarefree (p ^ 2 * q + 12))
    (hk : (p ^ 2 * q + 12).primeFactors.card = 4) : False := by
  obtain ⟨hp5, -, -, -, -⟩ := preamble hp hq hpq hJ
  have := (theoremD hp hq hpq hJ hsq (by omega)).2.2
  omega

/-- **Corollary F1**: `N` squarefree with `ω(N) ≥ 4` forces `p = 7` and `7 ≤ ω(N) ≤ 9`. -/
theorem corollaryF1 {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hsq : Squarefree (p ^ 2 * q + 12))
    (hk : 4 ≤ (p ^ 2 * q + 12).primeFactors.card) :
    p = 7 ∧ 7 ≤ (p ^ 2 * q + 12).primeFactors.card ∧ (p ^ 2 * q + 12).primeFactors.card ≤ 9 := by
  obtain ⟨hp5, hq5, -, -, -⟩ := preamble hp hq hpq hJ
  exact P2qExtensions.corollaryF1 p q hp hq hpq hp5 hq5 hJ.1 hJ.2 hsq hk

/-- When `ω(N) ≥ 4`, the prime `5` does not divide `N`. -/
theorem omega4_five_not_dvd {p q a b c d : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q))
    (ha : a.Prime) (hb : b.Prime) (hc : c.Prime) (hd : d.Prime)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d) (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (haN : a ∣ p ^ 2 * q + 12) (hbN : b ∣ p ^ 2 * q + 12) (hcN : c ∣ p ^ 2 * q + 12)
    (hdN : d ∣ p ^ 2 * q + 12) : ¬ 5 ∣ p ^ 2 * q + 12 := by
  intro h5
  obtain ⟨hp5, -, -, -, -⟩ := preamble hp hq hpq hJ
  have := (omega4_constraints hp hq hpq hJ ha hb hc hd hab hac had hbc hbd hcd haN hbN hcN hdN).2
    5 (by norm_num) h5
  omega

/-- **Lemma Q**: `Q(N) = N^2 - φ(N) σ(N) = p^4 + p q^2 - p - 12 (2p + q + 1) > 0`. -/
theorem lemmaQ_formula {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) :
    P2qExtensions.Qinv (p ^ 2 * q + 12) =
        (p : ℤ) ^ 4 + p * (q : ℤ) ^ 2 - p - 12 * (2 * p + q + 1) ∧
      0 < P2qExtensions.Qinv (p ^ 2 * q + 12) := by
  obtain ⟨hp5, hq5, -, -, -⟩ := preamble hp hq hpq hJ
  have hQ := (P2qExtensions.lemmaQ (jump_of_jumps hp hq hpq hJ)).1
  obtain ⟨hd, hQn⟩ := P2qExtensions.delta_Q_p2q hp hq hpq
  rw [hd, hQn] at hQ
  have e : P2qExtensions.Qinv (p ^ 2 * q + 12) =
      (p : ℤ) ^ 4 + p * (q : ℤ) ^ 2 - p - 12 * (2 * p + q + 1) := by rw [hQ]; ring
  refine ⟨e, ?_⟩
  rw [e]
  have h5p : (5 : ℤ) ≤ p := by exact_mod_cast hp5
  have h5q : (5 : ℤ) ≤ q := by exact_mod_cast hq5
  nlinarith [mul_nonneg (sub_nonneg.2 h5p) (sub_nonneg.2 h5q), mul_nonneg (sub_nonneg.2 h5q) (sub_nonneg.2 h5q),
    mul_nonneg (mul_nonneg (sub_nonneg.2 h5p) (sub_nonneg.2 h5q)) (sub_nonneg.2 h5q),
    mul_nonneg (mul_nonneg (sub_nonneg.2 h5p) (sub_nonneg.2 h5p)) (sub_nonneg.2 h5p),
    mul_nonneg (mul_nonneg (mul_nonneg (sub_nonneg.2 h5p) (sub_nonneg.2 h5p)) (sub_nonneg.2 h5p)) (sub_nonneg.2 h5p)]

/-- **Theorem E(iv), size bound** `N/δ > √L(p)`, in the reals, under the hypothesis of E(ii). -/
theorem theoremE_iv_sqrt {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hq0 : 5 * (p : ℤ) ^ 2 - 4 * p - 3 < q) :
    Real.sqrt ((p : ℝ) ^ 3 - p ^ 2 - 12) < ((p ^ 2 * q + 12 : ℕ) : ℝ) / ((q : ℝ) + 2 * p + 1) := by
  obtain ⟨hp5, -, -, -, -⟩ := preamble hp hq hpq hJ
  have h5 : (5 : ℤ) ≤ p := by exact_mod_cast hp5
  have hc := E_iv_companion (p : ℤ) (q : ℤ) h5 hq0.le
  have hcR : ((p : ℝ) ^ 3 - p ^ 2 - 12) * ((q : ℝ) + 2 * p + 1) ^ 2 < ((p : ℝ) ^ 2 * q + 12) ^ 2 := by
    exact_mod_cast hc
  have hδ : (0 : ℝ) < (q : ℝ) + 2 * p + 1 := by positivity
  have hpos : (0 : ℝ) < ((p ^ 2 * q + 12 : ℕ) : ℝ) / ((q : ℝ) + 2 * p + 1) := by positivity
  rw [Real.sqrt_lt' hpos, div_pow, lt_div_iff₀ (by positivity)]
  push_cast
  linarith

/-- Theorem E(iv) with Theorem B: if `r^3 ∣ N`, no other prime `s` has `s^2 ∣ N`. -/
theorem cube_excludes_second_square {p q r s : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hr : r.Prime) (hs : s.Prime) (hrs : r ≠ s)
    (h3 : r ^ 3 ∣ p ^ 2 * q + 12) (h2 : s ^ 2 ∣ p ^ 2 * q + 12) : False := by
  by_cases ht : ∃ t ∈ (p ^ 2 * q + 12).primeFactors, t ≠ r ∧ t ≠ s
  · obtain ⟨t, htN, htr, hts⟩ := ht
    exact theoremE_iv hp hq hpq hJ hr hs (Nat.prime_of_mem_primeFactors htN) hrs htr hts h3 h2
      (Nat.dvd_of_mem_primeFactors htN)
  · push_neg at ht
    apply N_not_powerful hp hq hpq hJ
    intro ℓ hℓ
    by_cases hℓr : ℓ = r
    · subst hℓr; exact (pow_dvd_pow ℓ (by norm_num)).trans h3
    · rw [ht ℓ hℓ hℓr]; exact h2

/-- Paper Lemma `lem:A-K` (Lemma K) under the jumps alone: there is an integer `m ≥ 1` with
`U - P = p m`, `K m = p + q - 1` and `K (p^2 m - U) = L(p)`, where `U = rad N`, `K = N / U`,
`P = ∏_{ℓ ∣ N} (ℓ - 1)`. The hypothesis `5 ≤ p` of `P2qExclusions.setupK` is discharged by
`preamble`. -/
theorem lemmaK_param {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) :
    ∃ m : ℤ, 1 ≤ m ∧
      (P2qStructural.rad (p ^ 2 * q + 12) : ℤ) - P2qExclusions.Pm1 (p ^ 2 * q + 12) = p * m ∧
      (((p ^ 2 * q + 12) / P2qStructural.rad (p ^ 2 * q + 12) : ℕ) : ℤ) * m = p + q - 1 ∧
      (((p ^ 2 * q + 12) / P2qStructural.rad (p ^ 2 * q + 12) : ℕ) : ℤ) *
          ((p : ℤ) ^ 2 * m - P2qStructural.rad (p ^ 2 * q + 12)) = P2qStructural.L p :=
  P2qExclusions.setupK (jump_of_jumps hp hq hpq hJ) (preamble hp hq hpq hJ).1

end P2qJumps
