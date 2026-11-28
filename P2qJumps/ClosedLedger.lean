/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Main
import P2qJumps.TheoremsBE
import P2qJumps.R3ST
import P2qJumps.R3SEmpty

/-!
# Paper statements assembled from existing Lean theorems (v1.4)

This file states Theorem~\ref{thm:closed}, Theorem~\ref{thm:A}, Theorem~\ref{thm:F},
Lemma~\ref{lem:L1}, Lemma~\ref{lem:G}, Corollary~\ref{cor:gcd}, Corollary~\ref{cor:F1}'s
explicit `T` values, Propositions~\ref{prop:23}--\ref{prop:r2s}, \ref{prop:balanced},
\ref{prop:pm2}, and the kernel-checked part of the classification ledger
Theorem~\ref{thm:main-p2q}, each with only the jump hypotheses.

External computations named in the ledger (the LMFDB rank of 3936.b1, the PARI survey,
the unfinished Python certificate) are not formalized here.
-/

namespace P2qJumps

open Nat ArithmeticFunction Finset
open scoped ArithmeticFunction.sigma ArithmeticFunction.Moebius

variable {p q : ℕ}

/-! ## Lemma L1, Lemma G, Theorem F -/

/-- **Lemma L1** (paper `lem:L1`): for `x > 1`,
`δ(x) = ∑_{e∣x, e>1} (1+μ(e)) (x/e)`, and every summand is nonnegative. -/
theorem lemmaL1 {x : ℕ} (hx : 1 < x) :
    P2qExtensions.delta x =
      ∑ e ∈ x.divisors.erase 1, (1 + (μ e : ℤ)) * (x / e : ℕ) ∧
    ∀ e ∈ x.divisors.erase 1, 0 ≤ (1 + (μ e : ℤ)) * (x / e : ℕ) := by
  have hx0 : 0 < x := by omega
  constructor
  · apply Eq.symm
    rw [P2qExtensions.lemmaL1 x hx0]
    refine Finset.sum_bij (fun e _ => (e, x / e)) ?_ ?_ ?_ ?_
    · intro e he
      obtain ⟨hne, hd⟩ := Finset.mem_erase.1 he
      refine Finset.mem_erase.2 ⟨?_, ?_⟩
      · intro h
        exact hne (congrArg Prod.fst h)
      · rw [Nat.mem_divisorsAntidiagonal]
        exact ⟨Nat.mul_div_cancel' (Nat.dvd_of_mem_divisors hd), by omega⟩
    · intro e₁ _ e₂ _ h
      exact congrArg Prod.fst h
    · intro pair hp
      obtain ⟨hne, hmem⟩ := Finset.mem_erase.1 hp
      have hmul : pair.1 * pair.2 = x := (Nat.mem_divisorsAntidiagonal.1 hmem).1
      have hx0' : x ≠ 0 := (Nat.mem_divisorsAntidiagonal.1 hmem).2
      have hd : pair.1 ∣ x := ⟨pair.2, hmul.symm⟩
      have hne1 : pair.1 ≠ 1 := by
        intro h1
        apply hne
        refine Prod.ext h1 ?_
        have : pair.2 = x := by
          simpa [h1] using hmul
        exact this
      refine ⟨pair.1, Finset.mem_erase.2 ⟨hne1, Nat.mem_divisors.2 ⟨hd, hx0'⟩⟩, ?_⟩
      apply Prod.ext
      · rfl
      · have hpos : 0 < pair.1 := Nat.pos_of_ne_zero fun h0 => by
          rw [h0, zero_mul] at hmul
          exact hx0' hmul.symm
        apply Nat.eq_of_mul_eq_mul_left hpos
        rw [Nat.mul_div_cancel' hd, hmul]
    · intro e _
      rfl
  · intro e _
    have := abs_moebius_le_one (n := e)
    have h1 : 0 ≤ 1 + (μ e : ℤ) := by have := neg_abs_le (μ e : ℤ); linarith
    positivity

/-- **Lemma G** (paper `lem:G`): `p(p-1)σ(N) - (p²+p+1)φ(N) = 2T(p)`, the gcd divides
`2T(p)`, and `T(p) > 0` for `p ≥ 5`. -/
theorem lemmaG (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q)) :
    (p : ℤ) * ((p : ℤ) - 1) * (σ 1 (p ^ 2 * q + 12) : ℤ)
        - ((p : ℤ) ^ 2 + p + 1) * (φ (p ^ 2 * q + 12) : ℤ)
      = 2 * P2qStructural.T p ∧
    ((Nat.gcd (φ (p ^ 2 * q + 12)) (σ 1 (p ^ 2 * q + 12)) : ℤ) ∣ 2 * P2qStructural.T p) ∧
    0 < P2qStructural.T p := by
  have hId := P2qStructural.lemmaG (jump_of_jumps hp hq hpq hJ)
  have hpos : 0 < P2qStructural.T p := by
    obtain ⟨hp5, -, -, -, -⟩ := preamble hp hq hpq hJ
    have hpZ : (5 : ℤ) ≤ p := by exact_mod_cast hp5
    unfold P2qStructural.T
    nlinarith [mul_nonneg (sub_nonneg.2 hpZ) (sub_nonneg.2 hpZ),
      mul_nonneg (mul_nonneg (sub_nonneg.2 hpZ) (sub_nonneg.2 hpZ)) (sub_nonneg.2 hpZ)]
  refine ⟨hId, ?_, hpos⟩
  have hφ : (Nat.gcd (φ (p ^ 2 * q + 12)) (σ 1 (p ^ 2 * q + 12)) : ℤ) ∣
      (φ (p ^ 2 * q + 12) : ℤ) := Int.natCast_dvd_natCast.2 (Nat.gcd_dvd_left _ _)
  have hσ : (Nat.gcd (φ (p ^ 2 * q + 12)) (σ 1 (p ^ 2 * q + 12)) : ℤ) ∣
      (σ 1 (p ^ 2 * q + 12) : ℤ) := Int.natCast_dvd_natCast.2 (Nat.gcd_dvd_right _ _)
  rw [← hId]
  exact dvd_sub (dvd_mul_of_dvd_right hσ _) (dvd_mul_of_dvd_right hφ _)

private lemma oddExpCount_le_omegaOdd (N : ℕ) :
    P2qStructural.oddExpCount N ≤ P2qStructural.omegaOdd N := by
  unfold P2qStructural.oddExpCount P2qStructural.omegaOdd
  refine Finset.card_le_card ?_
  intro ℓ hℓ
  have h := Finset.mem_filter.1 hℓ
  exact Finset.mem_filter.2 ⟨h.1, h.2.1⟩

/-- **Theorem F** (paper `thm:F`): writing `o` for the number of odd primes of odd
exponent in `N` (equal to the number of odd exponents, since `N` is odd), one has
`2^o ∣ 2T(p)`, and `2^{o-1} ∣ T(p)` when `o ≥ 1`. If `N` is squarefree then `o = ω(N)`. -/
theorem theoremF (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q)) :
    let N := p ^ 2 * q + 12
    let o := P2qStructural.oddExpCount N
    ((2 : ℤ) ^ o ∣ 2 * P2qStructural.T p) ∧
      (1 ≤ o → (2 : ℤ) ^ (o - 1) ∣ P2qStructural.T p) ∧
      (Squarefree N → o = N.primeFactors.card) := by
  intro N o
  obtain ⟨hp5, hq5, hodd, -, -⟩ := preamble hp hq hpq hJ
  have hJ' := jump_of_jumps hp hq hpq hJ
  have hmin : min (P2qStructural.omegaOdd N) o = o :=
    min_eq_right (oddExpCount_le_omegaOdd N)
  have hF := P2qStructural.theoremF hJ'
  have hF' := P2qStructural.theoremF' hJ'
  rw [hmin] at hF hF'
  refine ⟨hF, fun _ => hF', ?_⟩
  intro hsq
  have hoddN : ¬ 2 ∣ N := by
    intro hdv
    have : Even N := (even_iff_two_dvd).2 hdv
    exact Nat.not_even_iff_odd.2 hodd this
  rw [← P2qExtensions.oddExpCount_eq hoddN hsq]

/-- `v₂(2^k m) = k` when `m` is odd. -/
private lemma padicValNat_two_pow_mul_odd {k m : ℕ} (hm : Odd m) :
    padicValNat 2 (2 ^ k * m) = k := by
  have hm0 : m ≠ 0 := by
    intro h; subst h; exact Nat.not_odd_zero hm
  have h2 : (2 : ℕ) ≠ 0 := by norm_num
  have hk : 2 ^ k ≠ 0 := pow_ne_zero k h2
  have hnd : ¬ 2 ∣ m := by
    rw [Nat.dvd_iff_mod_eq_zero, Nat.odd_iff.1 hm]
    norm_num
  rw [padicValNat.mul hk hm0, padicValNat.prime_pow k,
    padicValNat.eq_zero_of_not_dvd hnd, add_zero]

/-- Explicit `T` values and 2-adic valuations listed in Corollary~\ref{cor:F1}, together
with the inductive comparison `2^{m-1} > m^4` for `m ≥ 23`. -/
theorem T_explicit :
    P2qStructural.T 5 = 554 ∧ padicValNat 2 554 = 1 ∧
    P2qStructural.T 7 = 2304 ∧ padicValNat 2 2304 = 8 ∧
    P2qStructural.T 11 = 14492 ∧ padicValNat 2 14492 = 2 ∧
    P2qStructural.T 13 = 28386 ∧ padicValNat 2 28386 = 1 ∧
    P2qStructural.T 17 = 83294 ∧ padicValNat 2 83294 = 1 ∧
    P2qStructural.T 19 = 130068 ∧ padicValNat 2 130068 = 2 ∧
    (23 : ℕ) ^ 4 < 2 ^ 22 := by
  have hT : P2qStructural.T 5 = 554 ∧ P2qStructural.T 7 = 2304 ∧
      P2qStructural.T 11 = 14492 ∧ P2qStructural.T 13 = 28386 ∧
      P2qStructural.T 17 = 83294 ∧ P2qStructural.T 19 = 130068 ∧
      (23 : ℕ) ^ 4 < 2 ^ 22 := by
    unfold P2qStructural.T; norm_num
  refine ⟨hT.1, ?_, hT.2.1, ?_, hT.2.2.1, ?_, hT.2.2.2.1, ?_, hT.2.2.2.2.1, ?_,
    hT.2.2.2.2.2.1, ?_, hT.2.2.2.2.2.2⟩
  · have : (554 : ℕ) = 2 ^ 1 * 277 := by norm_num
    rw [this]; exact padicValNat_two_pow_mul_odd (by decide)
  · have : (2304 : ℕ) = 2 ^ 8 * 9 := by norm_num
    rw [this]; exact padicValNat_two_pow_mul_odd (by decide)
  · have : (14492 : ℕ) = 2 ^ 2 * 3623 := by norm_num
    rw [this]; exact padicValNat_two_pow_mul_odd (by decide)
  · have : (28386 : ℕ) = 2 ^ 1 * 14193 := by norm_num
    rw [this]; exact padicValNat_two_pow_mul_odd (by decide)
  · have : (83294 : ℕ) = 2 ^ 1 * 41647 := by norm_num
    rw [this]; exact padicValNat_two_pow_mul_odd (by decide)
  · have : (130068 : ℕ) = 2 ^ 2 * 32517 := by norm_num
    rw [this]; exact padicValNat_two_pow_mul_odd (by decide)

theorem two_pow_gt_fourth {m : ℕ} (hm : 23 ≤ m) : (m : ℕ) ^ 4 < 2 ^ (m - 1) :=
  P2qExtensions.pow_four_lt_two_pow m (le_trans (by norm_num) hm)

/-! ## Closed shapes, Theorem A, and the elementary propositions -/

/-- **Corollary** `cor:gcd`: if the jumps hold then `p,q ≥ 5`, `N` is odd, and
`gcd(N, 6pq) = 1`. -/
theorem cor_gcd (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q)) :
    5 ≤ p ∧ 5 ≤ q ∧ Odd (p ^ 2 * q + 12) ∧
      Nat.Coprime (p ^ 2 * q + 12) (6 * p * q) := by
  obtain ⟨hp5, hq5, hodd, -, hcop⟩ := preamble hp hq hpq hJ
  exact ⟨hp5, hq5, hodd, hcop⟩

/-- **Proposition** `prop:23`: no solution exists if `2 ∣ n` or `3 ∣ n`. -/
theorem prop_23 (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q)) :
    ¬ 2 ∣ p ^ 2 * q ∧ ¬ 3 ∣ p ^ 2 * q := by
  obtain ⟨hp5, hq5, -, -, -⟩ := preamble hp hq hpq hJ
  have not_div_p : ∀ {d : ℕ}, d.Prime → d < 5 → ¬ d ∣ p := by
    intro d hd hdlt hdp
    have : d = p := (hp.eq_one_or_self_of_dvd d hdp).resolve_left hd.ne_one
    omega
  have not_div_q : ∀ {d : ℕ}, d.Prime → d < 5 → ¬ d ∣ q := by
    intro d hd hdlt hdq
    have : d = q := (hq.eq_one_or_self_of_dvd d hdq).resolve_left hd.ne_one
    omega
  constructor
  · intro h
    cases Nat.prime_two.dvd_mul.1 h with
    | inl h2 => exact not_div_p Nat.prime_two (by norm_num) (Nat.Prime.dvd_of_dvd_pow Nat.prime_two h2)
    | inr h2 => exact not_div_q Nat.prime_two (by norm_num) h2
  · intro h
    cases Nat.prime_three.dvd_mul.1 h with
    | inl h3 => exact not_div_p Nat.prime_three (by norm_num) (Nat.Prime.dvd_of_dvd_pow Nat.prime_three h3)
    | inr h3 => exact not_div_q Nat.prime_three (by norm_num) h3

/-- **Proposition** `prop:square`: `N` is not a square. -/
theorem prop_square (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q)) :
    ¬ IsSquare (p ^ 2 * q + 12) :=
  (preamble hp hq hpq hJ).2.2.2.1

/-- **Proposition** `prop:primepower`: `N` is neither prime nor a prime power `r^k` with
`k ≥ 2`. -/
theorem prop_primepower (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q)) :
    ¬ (p ^ 2 * q + 12).Prime ∧
      ∀ r k : ℕ, r.Prime → 2 ≤ k → p ^ 2 * q + 12 ≠ r ^ k :=
  ⟨N_not_prime hp hq hpq hJ, fun r k hr hk => N_ne_prime_pow hp hq hr hpq (le_trans (by norm_num) hk) hJ⟩

/-- **Proposition** `prop:rs`: `N` is not a product of two distinct primes. -/
theorem prop_rs (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q))
    {r s : ℕ} (hr : r.Prime) (hs : s.Prime) (hrs : r ≠ s) :
    p ^ 2 * q + 12 ≠ r * s :=
  N_ne_rs hp hq hr hs hpq hrs hJ

/-- **Proposition** `prop:r2s`: `N` is neither `r^2 s` nor `r s^2`. -/
theorem prop_r2s (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q))
    {r s : ℕ} (hr : r.Prime) (hs : s.Prime) (hrs : r ≠ s) :
    p ^ 2 * q + 12 ≠ r ^ 2 * s ∧ p ^ 2 * q + 12 ≠ r * s ^ 2 :=
  ⟨N_ne_ras hp hq hr hs hpq hrs (Nat.le_refl 2) hJ,
    by
      rw [mul_comm r]
      exact N_ne_ras hp hq hs hr hpq hrs.symm (Nat.le_refl 2) hJ⟩

/-- **Theorem A** (paper `thm:A`): `N` is not of the form `r^a s` (nor `r s^a`) for
distinct primes `r,s` and an integer `a ≥ 2`. -/
theorem theoremA (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q))
    {r s a : ℕ} (hr : r.Prime) (hs : s.Prime) (hrs : r ≠ s) (ha : 2 ≤ a) :
    p ^ 2 * q + 12 ≠ r ^ a * s ∧ p ^ 2 * q + 12 ≠ r * s ^ a :=
  ⟨N_ne_ras hp hq hr hs hpq hrs ha hJ,
    by
      rw [mul_comm r]
      exact N_ne_ras hp hq hs hr hpq hrs.symm ha hJ⟩

/-- **Theorem** `thm:closed` (Closed shapes). -/
theorem theorem_closed (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q)) :
    5 ≤ p ∧ 5 ≤ q ∧ Odd (p ^ 2 * q + 12) ∧
      Nat.Coprime (p ^ 2 * q + 12) (6 * p * q) ∧
      ¬ IsSquare (p ^ 2 * q + 12) ∧
      ¬ (p ^ 2 * q + 12).Prime ∧
      (∀ r k : ℕ, r.Prime → 2 ≤ k → p ^ 2 * q + 12 ≠ r ^ k) ∧
      (∀ r s : ℕ, r.Prime → s.Prime → r ≠ s → p ^ 2 * q + 12 ≠ r * s) ∧
      (∀ r s : ℕ, r.Prime → s.Prime → r ≠ s →
        p ^ 2 * q + 12 ≠ r ^ 2 * s ∧ p ^ 2 * q + 12 ≠ r * s ^ 2) ∧
      (∀ r s t : ℕ, r.Prime → s.Prime → t.Prime → r ≠ s → r ≠ t → s ≠ t →
        2 * p ≤ r → 2 * p ≤ s → 2 * p ≤ t → p ^ 2 * q + 12 ≠ r * s * t) ∧
      (∀ r s t : ℕ, r.Prime → s.Prime → t.Prime → r ≠ s → r ≠ t → s ≠ t →
        p - 2 ∈ ({r, s, t} : Finset ℕ) → p ^ 2 * q + 12 ≠ r * s * t) ∧
      p ≠ 2 ∧ p ≠ 3 ∧ q ≠ 2 ∧ q ≠ 3 := by
  obtain ⟨hp5, hq5, hodd, hsq, hcop⟩ := preamble hp hq hpq hJ
  refine ⟨hp5, hq5, hodd, hcop, hsq, N_not_prime hp hq hpq hJ,
    fun r k hr hk => N_ne_prime_pow hp hq hr hpq (le_trans (by norm_num) hk) hJ,
    fun r s hr hs hrs => N_ne_rs hp hq hr hs hpq hrs hJ,
    fun r s hr hs hrs => prop_r2s hp hq hpq hJ hr hs hrs,
    fun r s t hr hs ht hrs hrt hst _ _ _ =>
      theorem28_holds p q r s t hp hq hr hs ht hpq hrs hrt hst hJ,
    fun r s t hr hs ht hrs hrt hst _ =>
      theorem28_holds p q r s t hp hq hr hs ht hpq hrs hrt hst hJ,
    ?_, ?_, ?_, ?_⟩
  · intro h; subst h; exact (Nat.not_le.2 (by norm_num : (5 : ℕ) > 2)) hp5
  · intro h; subst h; exact (Nat.not_le.2 (by norm_num : (5 : ℕ) > 3)) hp5
  · intro h; subst h; exact (Nat.not_le.2 (by norm_num : (5 : ℕ) > 2)) hq5
  · intro h; subst h; exact (Nat.not_le.2 (by norm_num : (5 : ℕ) > 3)) hq5

/-- **Proposition** `prop:balanced`: if `N = rst` then `min(r,s,t) < 2p`. (Immediate from
Theorem 28, which excludes the shape entirely.) -/
theorem prop_balanced (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q))
    {r s t : ℕ} (hr : r.Prime) (hs : s.Prime) (ht : t.Prime)
    (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t)
    (hN : p ^ 2 * q + 12 = r * s * t) :
    min r (min s t) < 2 * p :=
  (theorem28_holds p q r s t hp hq hr hs ht hpq hrs hrt hst hJ hN).elim

/-- **Proposition** `prop:pm2`: if `N = rst` then none of `r,s,t` equals `p-2`.
(Immediate from Theorem 28.) -/
theorem prop_pm2 (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q))
    {r s t : ℕ} (hr : r.Prime) (hs : s.Prime) (ht : t.Prime)
    (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t)
    (hN : p ^ 2 * q + 12 = r * s * t) :
    r ≠ p - 2 ∧ s ≠ p - 2 ∧ t ≠ p - 2 :=
  (theorem28_holds p q r s t hp hq hr hs ht hpq hrs hrt hst hJ hN).elim

/-! ## Classification ledger (kernel-checked clauses only) -/

private lemma five_of_coprime_six {x N : ℕ} (hx : x.Prime) (hxN : x ∣ N)
    (h6 : Nat.Coprime N 6) : 5 ≤ x := by
  have hx6 : Nat.Coprime x 6 := Nat.Coprime.coprime_dvd_left hxN h6
  have hx2 : x ≠ 2 := by
    intro h; subst h
    have : ¬ Nat.Coprime 2 6 := by norm_num
    exact this hx6
  have hx3 : x ≠ 3 := by
    intro h; subst h
    have : ¬ Nat.Coprime 3 6 := by norm_num
    exact this hx6
  have := hx.two_le
  by_contra h; push_neg at h
  interval_cases x <;> first | omega | exact absurd hx (by norm_num)

/-- `N ≠ r² s t` with no lower bound on the primes: `gcd(N,6)=1` forces them to be at
least 5, after which `r2st_empty` applies. -/
theorem N_ne_r2st (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q))
    {r s t : ℕ} (hr : r.Prime) (hs : s.Prime) (ht : t.Prime)
    (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t) :
    p ^ 2 * q + 12 ≠ r ^ 2 * s * t := by
  intro hN
  obtain ⟨-, -, -, -, hcop⟩ := preamble hp hq hpq hJ
  have h6 : Nat.Coprime (r ^ 2 * s * t) 6 := by
    rw [← hN]; exact Nat.Coprime.coprime_dvd_right ⟨p * q, by ring⟩ hcop
  have hrN : r ∣ r ^ 2 * s * t := ⟨r * s * t, by ring⟩
  have hsN : s ∣ r ^ 2 * s * t := ⟨r ^ 2 * t, by ring⟩
  have htN : t ∣ r ^ 2 * s * t := ⟨r ^ 2 * s, by ring⟩
  exact r2st_empty hp hq hr hs ht hpq hrs hrt hst
    (five_of_coprime_six hr hrN h6) (five_of_coprime_six hs hsN h6)
    (five_of_coprime_six ht htN h6) hJ hN

/-- If `ω(N) ≥ 4` then `q ≥ 3p²`, every prime factor of `N` exceeds `p`, and `N > p⁴`. -/
theorem omega4_size (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hJ : Jumps (p ^ 2 * q))
    (hω : 4 ≤ (p ^ 2 * q + 12).primeFactors.card) :
    3 * p ^ 2 ≤ q ∧ (∀ r : ℕ, r.Prime → r ∣ p ^ 2 * q + 12 → p < r) ∧
      p ^ 4 < p ^ 2 * q + 12 := by
  set N := p ^ 2 * q + 12
  obtain ⟨t, ht, htc⟩ := Finset.exists_subset_card_eq hω
  rw [Finset.card_eq_succ] at htc
  obtain ⟨a, t3, hat, rfl, h3⟩ := htc
  rw [Finset.card_eq_three] at h3
  obtain ⟨b, c, d, hbc, hbd, hcd, rfl⟩ := h3
  simp only [Finset.mem_insert, Finset.mem_singleton, not_or] at hat
  obtain ⟨hab, hac, had⟩ := hat
  have m : ∀ x ∈ ({a, b, c, d} : Finset ℕ), x.Prime ∧ x ∣ N := fun x hx => by
    have := ht hx; rw [Nat.mem_primeFactors] at this; exact ⟨this.1, this.2.1⟩
  simp only [Finset.mem_insert, Finset.mem_singleton, forall_eq_or_imp, forall_eq] at m
  obtain ⟨ha, hb, hc, hd⟩ := And.intro m.1 (And.intro m.2.1 (And.intro m.2.2.1 m.2.2.2))
  obtain ⟨hq3, hpr⟩ := omega4_constraints hp hq hpq hJ ha.1 hb.1 hc.1 hd.1
    hab hac had hbc hbd hcd ha.2 hb.2 hc.2 hd.2
  refine ⟨hq3, hpr, ?_⟩
  have hle : p ^ 2 * (3 * p ^ 2) + 12 ≤ N :=
    Nat.add_le_add_right (Nat.mul_le_mul_left (p ^ 2) hq3) 12
  have hlt : p ^ 4 < p ^ 2 * (3 * p ^ 2) + 12 := by
    have hpos : 0 < p ^ 2 * (2 * p ^ 2) + 12 := by
      have : 0 < p := hp.pos
      positivity
    calc
      p ^ 4 = p ^ 2 * p ^ 2 := by ring
      _ < p ^ 2 * p ^ 2 + (p ^ 2 * (2 * p ^ 2) + 12) := Nat.lt_add_of_pos_right hpos
      _ = p ^ 2 * (3 * p ^ 2) + 12 := by ring
  exact lt_of_lt_of_le hlt hle

/-- **Theorem** `thm:main-p2q`, kernel-checked clauses only. The PARI survey, the
unfinished Python certificate, and the computer-assisted H1 descent are not included. -/
theorem classification_ledger (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) :
    5 ≤ p ∧ 5 ≤ q ∧ Odd (p ^ 2 * q + 12) ∧ ¬ IsSquare (p ^ 2 * q + 12) ∧
      Nat.Coprime (p ^ 2 * q + 12) (6 * p * q) ∧
      ¬ (p ^ 2 * q + 12).Prime ∧
      (∀ r k : ℕ, r.Prime → 1 ≤ k → p ^ 2 * q + 12 ≠ r ^ k) ∧
      (∀ r s : ℕ, r.Prime → s.Prime → r ≠ s → p ^ 2 * q + 12 ≠ r * s) ∧
      (∀ r s : ℕ, r.Prime → s.Prime → r ≠ s →
        p ^ 2 * q + 12 ≠ r ^ 2 * s ∧ p ^ 2 * q + 12 ≠ r * s ^ 2) ∧
      (∀ r s t : ℕ, r.Prime → s.Prime → t.Prime → r ≠ s → r ≠ t → s ≠ t →
        p ^ 2 * q + 12 ≠ r * s * t) ∧
      (∀ r s t : ℕ, r.Prime → s.Prime → t.Prime → r ≠ s → r ≠ t → s ≠ t →
        p ^ 2 * q + 12 ≠ r ^ 2 * s * t) ∧
      (∀ r s : ℕ, r.Prime → s.Prime → r ≠ s → p ^ 2 * q + 12 ≠ r ^ 3 * s) ∧
      (∀ r s t : ℕ, r.Prime → s.Prime → t.Prime → r ≠ s → r ≠ t → s ≠ t →
        p ^ 2 * q + 12 ≠ r ^ 3 * s * t) ∧
      (4 ≤ (p ^ 2 * q + 12).primeFactors.card →
        3 * p ^ 2 ≤ q ∧ (∀ r : ℕ, r.Prime → r ∣ p ^ 2 * q + 12 → p < r) ∧
          p ^ 4 < p ^ 2 * q + 12) ∧
      (p ^ 2 * q ≤ 10000 → False) := by
  obtain ⟨hp5, hq5, hodd, hsq, hcop⟩ := preamble hp hq hpq hJ
  refine ⟨hp5, hq5, hodd, hsq, hcop, N_not_prime hp hq hpq hJ,
    fun r k hr hk => N_ne_prime_pow hp hq hr hpq hk hJ,
    fun r s hr hs hrs => N_ne_rs hp hq hr hs hpq hrs hJ,
    fun r s hr hs hrs => prop_r2s hp hq hpq hJ hr hs hrs,
    fun r s t hr hs ht hrs hrt hst =>
      theorem28_holds p q r s t hp hq hr hs ht hpq hrs hrt hst hJ,
    fun r s t hr hs ht hrs hrt hst => N_ne_r2st hp hq hpq hJ hr hs ht hrs hrt hst,
    fun r s hr hs hrs => r3s_empty hp hq hr hs hpq hrs hJ,
    fun r s t hr hs ht hrs hrt hst => r3st_empty hp hq hr hs ht hpq hrs hrt hst hJ,
    fun hω => omega4_size hp hq hpq hJ hω,
    fun hn => Cert.no_jumps_p2q_le_10000 hp hq hpq hn hJ⟩

/-- Paper `lem:A-L1Q`(a), nonnegativity for every `x` (including `x = 1`, where the sum is
empty): each term `(1 + μ(a)) b`, `ab = x`, `a ≠ 1`, is `≥ 0`. -/
theorem lemmaL1_terms_nonneg (x : ℕ) :
    ∀ e ∈ x.divisorsAntidiagonal.erase (1, x), 0 ≤ (1 + (μ e.1 : ℤ)) * (e.2 : ℤ) := by
  intro e _
  have h1 : -1 ≤ (μ e.1 : ℤ) := (abs_le.1 (abs_moebius_le_one (n := e.1))).1
  exact mul_nonneg (by linarith) (by positivity)

/-- `2^o ∣ 2t ↔ o ≤ 1 + v₂(t)` for `t ≠ 0`. -/
lemma two_pow_dvd_two_mul_iff (o t : ℕ) (ht : t ≠ 0) :
    2 ^ o ∣ 2 * t ↔ o ≤ 1 + padicValNat 2 t := by
  rw [padicValNat_dvd_iff_le (by omega), padicValNat.mul (by norm_num) ht, padicValNat_self]

/-- Paper `thm:F`, the clause "equivalently `o ≤ 1 + v₂(T(p))`": under the jumps,
`o ≤ 1 + v₂(T(p))`, and `2^o ∣ 2T(p)` is equivalent to it (`T(p) > 0`). -/
theorem theoremF_v2 {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) :
    P2qStructural.oddExpCount (p ^ 2 * q + 12) ≤ 1 + padicValNat 2 (P2qStructural.T p).toNat ∧
      ((2 : ℤ) ^ P2qStructural.oddExpCount (p ^ 2 * q + 12) ∣ 2 * P2qStructural.T p ↔
        P2qStructural.oddExpCount (p ^ 2 * q + 12) ≤
          1 + padicValNat 2 (P2qStructural.T p).toNat) := by
  have hT : 0 < P2qStructural.T p := (lemmaG hp hq hpq hJ).2.2
  have ht : ((P2qStructural.T p).toNat : ℤ) = P2qStructural.T p := Int.toNat_of_nonneg hT.le
  have ht0 : (P2qStructural.T p).toNat ≠ 0 := by omega
  have e : (2 : ℤ) ^ P2qStructural.oddExpCount (p ^ 2 * q + 12) ∣ 2 * P2qStructural.T p ↔
      2 ^ P2qStructural.oddExpCount (p ^ 2 * q + 12) ∣ 2 * (P2qStructural.T p).toNat := by
    rw [← Int.natCast_dvd_natCast, Nat.cast_mul, Nat.cast_pow, Nat.cast_ofNat, ht]
  have key := e.trans (two_pow_dvd_two_mul_iff _ _ ht0)
  obtain ⟨hF, -, -⟩ := theoremF hp hq hpq hJ
  exact ⟨key.1 hF, key⟩

end P2qJumps
