/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Ext.Exclusions.Pairs

/-!
# Theorem B: `N = p^2 q + 12` is not powerful with at least two prime factors

Extra hypothesis beyond the jumps: `5 ≤ p` (the source's Proposition 8 handles `p ∈ {2,3}`;
that proposition is **not** formalized here). `p ∤ N` is derived internally.
-/

namespace P2qExclusions

open ArithmeticFunction P2qStructural P2qExtensions
open scoped ArithmeticFunction.sigma ArithmeticFunction.Moebius

lemma rad_sq_dvd {N : ℕ} (hpow : ∀ ℓ ∈ N.primeFactors, ℓ ^ 2 ∣ N) : rad N * rad N ∣ N := by
  have key : ∀ t ⊆ N.primeFactors, (∏ ℓ ∈ t, ℓ ^ 2) ∣ N := by
    intro t
    induction t using Finset.induction_on with
    | empty => intro _; simp
    | @insert a t ha ih =>
      intro hsub
      rw [Finset.prod_insert ha]
      have hat : a ∈ N.primeFactors := hsub (Finset.mem_insert_self a t)
      have hpa := Nat.prime_of_mem_primeFactors hat
      apply Nat.Coprime.mul_dvd_of_dvd_of_dvd _ (hpow a hat)
        (ih (fun x hx => hsub (Finset.mem_insert_of_mem hx)))
      apply Nat.Coprime.prod_right
      intro b hb
      have hpb := Nat.prime_of_mem_primeFactors (hsub (Finset.mem_insert_of_mem hb))
      exact Nat.Coprime.pow 2 2 ((Nat.coprime_primes hpa hpb).2 (fun e => ha (e ▸ hb)))
  have := key N.primeFactors subset_rfl
  have e : rad N * rad N = ∏ ℓ ∈ N.primeFactors, ℓ ^ 2 := by
    unfold rad; rw [Finset.prod_pow, sq]
  rw [e]; exact this

lemma s_cast (N : ℕ) :
    ((∑ ℓ ∈ N.primeFactors, rad N / ℓ : ℕ) : ℚ) = (rad N : ℚ) * ∑ ℓ ∈ N.primeFactors, (1 : ℚ) / ℓ := by
  push_cast
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl; intro ℓ hℓ
  have hd : ℓ ∣ rad N := Finset.dvd_prod_of_mem _ hℓ
  have h0 : (ℓ : ℚ) ≠ 0 := by exact_mod_cast (Nat.prime_of_mem_primeFactors hℓ).ne_zero
  rw [Nat.cast_div hd h0]; field_simp

lemma P_cast (N : ℕ) :
    (Pm1 N : ℚ) = (rad N : ℚ) * ∏ ℓ ∈ N.primeFactors, (1 - (1 : ℚ) / ℓ) := by
  unfold Pm1 rad
  push_cast
  rw [← Finset.prod_mul_distrib]
  apply Finset.prod_congr rfl; intro ℓ hℓ
  have hp := Nat.prime_of_mem_primeFactors hℓ
  have h0 : (ℓ : ℚ) ≠ 0 := by exact_mod_cast hp.ne_zero
  rw [Nat.cast_sub hp.one_le]; push_cast; field_simp

/-- **L3.** For `ω(N) ≥ 2`: `∑_{ℓ ∣ N} U/ℓ ≥ U - P + 1`. -/
lemma lemmaL3 (N : ℕ) (hω : 2 ≤ N.primeFactors.card) :
    rad N + 1 ≤ (∑ ℓ ∈ N.primeFactors, rad N / ℓ) + Pm1 N := by
  have hsb := strict_union_bound N.primeFactors (fun ℓ => (1 : ℚ) / ℓ) (by
    intro ℓ hℓ
    have := (Nat.prime_of_mem_primeFactors hℓ).two_le
    have h2 : (2 : ℚ) ≤ ℓ := by exact_mod_cast this
    constructor
    · positivity
    · rw [div_lt_one (by linarith)]; linarith) hω
  have hU : (0 : ℚ) < rad N := by exact_mod_cast rad_pos N
  have h := mul_lt_mul_of_pos_left hsb hU
  rw [mul_sub, mul_one, ← P_cast, ← s_cast] at h
  have : (rad N : ℚ) < ((∑ ℓ ∈ N.primeFactors, rad N / ℓ : ℕ) : ℚ) + (Pm1 N : ℚ) := by linarith
  exact_mod_cast this

/-- Pure integer core of Theorem B (Steps 1 and 2 of the source proof). -/
lemma B_arith (p m K U s : ℤ) (hp5z : 5 ≤ p) (hm1 : 1 ≤ m) (hK0 : 0 ≤ K) (hUKz : U ≤ K)
    (hUlow : p * m + 1 ≤ U) (hs : p * m + 1 ≤ s)
    (hδU' : K * s ^ 2 ≤ (K * m + p + 2) * U)
    (hKL : K * (p ^ 2 * m - U) = p ^ 3 - p ^ 2 - 12) : False := by
  have hLpos : 0 < (p ^ 3 - p ^ 2 - 12) := by nlinarith
  have hKpos : (0 : ℤ) < K := by
    have hne : K ≠ 0 := by intro h0; rw [h0, zero_mul] at hKL; linarith
    exact lt_of_le_of_ne hK0 (Ne.symm hne)
  have hgap : (0 : ℤ) < p ^ 2 * m - U := by
    by_contra hc; push_neg at hc
    have : K * (p ^ 2 * m - U) ≤ 0 := mul_nonpos_of_nonneg_of_nonpos hKpos.le hc
    linarith
  -- Step 1: 2K < p(p+2)
  have hpm : (0 : ℤ) < p * m := mul_pos (by linarith) (by linarith)
  have hs2 : (p * m + 1) ^ 2 ≤ s ^ 2 := pow_le_pow_left₀ (by linarith) hs 2
  have hstep : K * (p * m + 1) ^ 2 < (K * m + p + 2) * (p ^ 2 * m) := by
    have e1 : K * (p * m + 1) ^ 2 ≤ K * s ^ 2 :=
      mul_le_mul_of_nonneg_left hs2 hKpos.le
    have e2 : (K * m + p + 2) * U < (K * m + p + 2) * (p ^ 2 * m) :=
      mul_lt_mul_of_pos_left (by linarith) (by
        have : (0 : ℤ) ≤ K * m := mul_nonneg hKpos.le (by linarith)
        linarith)
    linarith
  have hK2 : 2 * K < p * (p + 2) := by
    have eA : K * (p * m + 1) ^ 2 = K * m * (p ^ 2 * m) + K * (2 * p * m + 1) := by ring
    have eB : (K * m + p + 2) * (p ^ 2 * m) = K * m * (p ^ 2 * m) + (p + 2) * p ^ 2 * m := by
      ring
    have h1 : K * (2 * p * m + 1) < (p + 2) * p ^ 2 * m := by linarith
    by_contra hc; push_neg at hc
    have h2 := mul_le_mul_of_nonneg_left hc hpm.le
    have e1 : p * m * (p * (p + 2)) = (p + 2) * p ^ 2 * m := by ring
    have e2 : p * m * (2 * K) = K * (2 * p * m) := by ring
    have e3 : K * (2 * p * m + 1) = K * (2 * p * m) + K := by ring
    linarith
  -- Step 2: contradiction with L = K (p^2 m - U) ≥ U (p^2 m - U)
  have hg : U * (p ^ 2 * m - U) ≤ (p ^ 3 - p ^ 2 - 12) := by
    rw [← hKL]; exact mul_le_mul_of_nonneg_right hUKz hgap.le
  have hm1' : (1 : ℤ) ≤ m := hm1
  rcases le_or_gt (U + p * m + 1) (p ^ 2 * m) with hc | hc
  · -- increasing side: g(U) ≥ g(pm+1) ≥ (p+1)(p^2-p-1) > L
    have h1 : (p * m + 1) * (p ^ 2 * m - (p * m + 1)) ≤ U * (p ^ 2 * m - U) := by
      have e : U * (p ^ 2 * m - U) - (p * m + 1) * (p ^ 2 * m - (p * m + 1))
          = (U - (p * m + 1)) * (p ^ 2 * m - U - (p * m + 1)) := by ring
      have := mul_nonneg (sub_nonneg.2 hUlow) (show (0:ℤ) ≤ p ^ 2 * m - U - (p * m + 1) by linarith)
      linarith
    have h2 : (p + 1) * (p ^ 2 - p - 1) ≤ (p * m + 1) * (p ^ 2 * m - (p * m + 1)) := by
      have : (p * m + 1) * (p ^ 2 * m - (p * m + 1)) - (p + 1) * (p ^ 2 - p - 1)
          = p * (m - 1) * (m * p ^ 2 - m * p + p ^ 2 - 2) := by ring
      have h3 : (0 : ℤ) ≤ m * p ^ 2 - m * p + p ^ 2 - 2 := by
        have : (0 : ℤ) ≤ m * (p ^ 2 - p) := mul_nonneg (by linarith) (by nlinarith)
        nlinarith
      have := mul_nonneg (mul_nonneg (by linarith : (0:ℤ) ≤ p) (sub_nonneg.2 hm1')) h3
      linarith
    have e : (p + 1) * (p ^ 2 - p - 1) - (p ^ 3 - p ^ 2 - 12) = p ^ 2 - 2 * p + 11 := by ring
    nlinarith
  · -- other side: 4 g(U) ≥ c (2 p^2 m - c) with c = p(p+2)
    have hcU : 2 * U < p * (p + 2) := by linarith
    have hsum : p ^ 2 * m ≤ 2 * U + p * (p + 2) - p ^ 2 * m := by
      have : (2 : ℤ) * p * m + 2 ≤ p ^ 2 * m := by
        have h4 : (0 : ℤ) ≤ (p * m) * (p - 5) := mul_nonneg hpm.le (by linarith)
        nlinarith
      linarith
    have hid : 4 * (U * (p ^ 2 * m - U))
        - (p * (p + 2)) * (2 * p ^ 2 * m - p * (p + 2))
        = (p * (p + 2) - 2 * U) * (2 * U + p * (p + 2) - 2 * p ^ 2 * m) := by ring
    have hnn : 0 ≤ (p * (p + 2) - 2 * U) * (2 * U + p * (p + 2) - 2 * p ^ 2 * m) :=
      mul_nonneg (by linarith) (by linarith)
    have hc2 : (p * (p + 2)) * (2 * p ^ 2 - p * (p + 2))
        ≤ (p * (p + 2)) * (2 * p ^ 2 * m - p * (p + 2)) :=
      mul_le_mul_of_nonneg_left (by
        have := mul_le_mul_of_nonneg_left hm1' (show (0:ℤ) ≤ 2 * p ^ 2 by positivity)
        linarith) (by positivity)
    have hfin : 4 * (p ^ 3 - p ^ 2 - 12) < (p * (p + 2)) * (2 * p ^ 2 - p * (p + 2)) := by
      have e : (p * (p + 2)) * (2 * p ^ 2 - p * (p + 2)) - 4 * (p ^ 3 - p ^ 2 - 12)
          = p ^ 3 * (p - 4) + 48 := by ring
      have : 0 ≤ p ^ 3 * (p - 4) := mul_nonneg (by positivity) (by linarith)
      linarith
    linarith


/-- **Theorem B.** Let `p ≠ q` be primes with `p ≥ 5`, and assume the two actual jumps.
Then `N = p^2 q + 12` is not powerful with at least two distinct prime factors. -/
theorem theoremB (p q : ℕ) (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) (hp5 : 5 ≤ p)
    (hphi : Nat.totient (p ^ 2 * q + 12) = Nat.totient (p ^ 2 * q) + 12)
    (hsigma : σ 1 (p ^ 2 * q + 12) = σ 1 (p ^ 2 * q) + 12)
    (hpow : ∀ ℓ ∈ (p ^ 2 * q + 12).primeFactors, ℓ ^ 2 ∣ p ^ 2 * q + 12)
    (hω : 2 ≤ (p ^ 2 * q + 12).primeFactors.card) : False := by
  have hJ : Jump p q := ⟨hp, hq, hpq, hphi, hsigma⟩
  obtain ⟨m, hm1, hUP, hKm, hKL⟩ := setupK hJ hp5
  set N := p ^ 2 * q + 12 with hNdef
  set U := rad N
  set K := N / U
  set P := Pm1 N
  set s := ∑ ℓ ∈ N.primeFactors, U / ℓ
  have hNpos : 0 < N := by omega
  -- pair bound in integers: δ U ≥ K s^2
  have hpair := delta_ge_pairs N hNpos hpow
  have hNUK : (N : ℚ) = U * K := by exact_mod_cast N_eq_UK N
  have hUq : (0 : ℚ) < U := by exact_mod_cast rad_pos N
  have hsq : (s : ℚ) = U * ∑ ℓ ∈ N.primeFactors, (1 : ℚ) / ℓ := s_cast N
  have hδU : (K : ℚ) * (s : ℚ) ^ 2 ≤ (delta N : ℚ) * U := by
    have h1 := mul_le_mul_of_nonneg_left hpair hUq.le
    have e : (K : ℚ) * (s : ℚ) ^ 2
        = (U : ℚ) * ((N : ℚ) * (∑ ℓ ∈ N.primeFactors, (1 : ℚ) / ℓ) ^ 2) := by
      rw [hsq, hNUK]; ring
    rw [e, mul_comm (delta N : ℚ)]; exact h1
  have hδ : delta N = (K : ℤ) * m + p + 2 := by
    rw [(lemmaQ hJ).2, (delta_Q_p2q hp hq hpq).1]; linarith
  have hδU' : (K : ℤ) * (s : ℤ) ^ 2 ≤ ((K : ℤ) * m + p + 2) * U := by
    rw [← hδ]; exact_mod_cast hδU
  -- L3
  have hL3 : (U : ℤ) + 1 ≤ s + P := by exact_mod_cast lemmaL3 N hω
  have hs : (p : ℤ) * m + 1 ≤ s := by linarith
  -- U ≤ K
  have hUK : U ≤ K := by
    have h2 := rad_sq_dvd hpow
    have : U ∣ K := by
      have h3 : U * U ∣ U * K := by rw [← N_eq_UK N]; exact h2
      exact Nat.dvd_of_mul_dvd_mul_left (rad_pos N) h3
    have hK : 0 < K := Nat.div_pos (Nat.le_of_dvd hNpos (Nat.prod_primeFactors_dvd N)) (rad_pos N)
    exact Nat.le_of_dvd hK this
  have hUKz : (U : ℤ) ≤ K := by exact_mod_cast hUK
  have hP1 : (1 : ℤ) ≤ P := by
    have : 0 < P := Finset.prod_pos (fun ℓ h => by
      have := (Nat.prime_of_mem_primeFactors h).two_le; omega)
    exact_mod_cast this
  have hUlow : (p : ℤ) * m + 1 ≤ U := by linarith
  exact B_arith p m K U s (by exact_mod_cast hp5) hm1 (Int.natCast_nonneg K) hUKz hUlow hs hδU'
    (by rw [hKL]; unfold L; ring)

end P2qExclusions
