/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.TheoremsBE

/-!
# Lemmas stated in the paper's prose and in Part B (v1.3 identities)

Formalizations for the prose sweep (`paper/PROSE-CLAIMS.md`). Notation: `A(x) = x - φ(x)`,
`B(x) = σ(x) - x`, `δ(x) = σ(x) + φ(x) - 2x`, all in `ℤ`.
-/

namespace P2qJumps

open Nat ArithmeticFunction Finset
open scoped ArithmeticFunction.sigma

/-- Part B `lem:equiv`: the jumps are equivalent to `A(N) = A(n)` and `B(N) = B(n)`, and imply
`δ(N) = δ(n)`. -/
theorem jumps_iff_AB (n : ℕ) :
    Jumps n ↔
      (((n + 12 : ℕ) : ℤ) - φ (n + 12) = (n : ℤ) - φ n ∧
        (σ 1 (n + 12) : ℤ) - (n + 12 : ℕ) = (σ 1 n : ℤ) - n) := by
  unfold Jumps
  constructor
  · rintro ⟨h1, h2⟩
    refine ⟨?_, ?_⟩
    · rw [h1]; push_cast; ring
    · rw [h2]; push_cast; ring
  · rintro ⟨h1, h2⟩
    refine ⟨?_, ?_⟩
    · have : (φ (n + 12) : ℤ) = φ n + 12 := by push_cast at h1; linarith
      exact_mod_cast this
    · have : (σ 1 (n + 12) : ℤ) = σ 1 n + 12 := by push_cast at h2; linarith
      exact_mod_cast this

/-- Part B `lem:equiv`, last clause: the jumps imply `δ(N) = δ(n)`. -/
theorem jumps_delta (n : ℕ) (hJ : Jumps n) :
    (σ 1 (n + 12) : ℤ) + φ (n + 12) - 2 * (n + 12 : ℕ) = (σ 1 n : ℤ) + φ n - 2 * n := by
  obtain ⟨h1, h2⟩ := hJ
  rw [h1, h2]; push_cast; ring

/-- Part B `lem:AB`: `A(p^2 q) = p(p+q-1)`, `B(p^2 q) = (1+p)(1+q) + p^2`,
`δ(p^2 q) = 2p + q + 1`. -/
theorem AB_p2q {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q) :
    ((p ^ 2 * q : ℕ) : ℤ) - φ (p ^ 2 * q) = p * (p + q - 1) ∧
      (σ 1 (p ^ 2 * q) : ℤ) - (p ^ 2 * q : ℕ) = (1 + p) * (1 + q) + p ^ 2 ∧
      (σ 1 (p ^ 2 * q) : ℤ) + φ (p ^ 2 * q) - 2 * (p ^ 2 * q : ℕ) = 2 * p + q + 1 := by
  obtain ⟨hφ, hσ⟩ := totient_sigma_p2q hp hq hpq
  refine ⟨?_, ?_, ?_⟩
  · rw [hφ]; push_cast; ring
  · rw [hσ]; push_cast; ring
  · rw [hσ, hφ]; push_cast; ring

/-- Part B `lem:Ark`: `A(r^k) = r^(k-1)` for a prime `r` and `k ≥ 1`. -/
theorem A_prime_pow {r k : ℕ} (hr : r.Prime) (hk : 1 ≤ k) :
    ((r ^ k : ℕ) : ℤ) - φ (r ^ k) = (r : ℤ) ^ (k - 1) := by
  obtain ⟨j, rfl⟩ : ∃ j, k = j + 1 := ⟨k - 1, by omega⟩
  rw [Nat.totient_prime_pow_succ hr]
  push_cast [hr.one_le]
  ring

/-- Part B `lem:cot`, inequality: for `m > 1` and its least prime factor `r`,
`m / r ≤ A(m) = m - φ(m)`. -/
theorem cot_le {m : ℕ} (hm : 1 < m) : m / m.minFac ≤ m - φ m := by
  have hr := Nat.minFac_prime (by omega : m ≠ 1)
  have := totient_add_div_le hr (Nat.minFac_dvd m)
  omega

/-- Part B `lem:cot`, equality case: `A(m) = m / r` (with `r` the least prime factor of
`m > 1`) if and only if `m` is a power of `r`. -/
theorem cot_eq_iff {m : ℕ} (hm : 1 < m) :
    m - φ m = m / m.minFac ↔ ∃ k, m = m.minFac ^ k := by
  set r := m.minFac with hrdef
  have hr : r.Prime := Nat.minFac_prime (by omega : m ≠ 1)
  have hrm : r ∣ m := Nat.minFac_dvd m
  constructor
  · intro heq
    by_contra hno
    push_neg at hno
    -- another prime `s ≠ r` divides `m`
    have hpf : m.primeFactors ≠ {r} := by
      intro h
      have hpp : IsPrimePow m := by
        rw [isPrimePow_iff_card_primeFactors_eq_one, h, Finset.card_singleton]
      obtain ⟨s, k, hs, hk, hsk⟩ := (isPrimePow_nat_iff m).1 hpp
      have hsm : s ∈ m.primeFactors :=
        Nat.mem_primeFactors.2 ⟨hs, hsk ▸ dvd_pow_self s hk.ne', by omega⟩
      rw [h, Finset.mem_singleton] at hsm
      exact hno k (by rw [← hsk, hsm])
    have hrmem : r ∈ m.primeFactors := Nat.mem_primeFactors.2 ⟨hr, hrm, by omega⟩
    obtain ⟨s, hs, hsr⟩ : ∃ s ∈ m.primeFactors, s ≠ r := by
      by_contra hc; push_neg at hc
      apply hpf
      ext x; simp only [Finset.mem_singleton]
      exact ⟨fun hx => hc x hx, fun hx => hx ▸ hrmem⟩
    have hsp : s.Prime := Nat.prime_of_mem_primeFactors hs
    -- `φ(m) ∏ ℓ = m ∏ (ℓ - 1)`; split off `r` and `s`
    have key := Nat.totient_mul_prod_primeFactors m
    have hs' : s ∈ m.primeFactors.erase r := Finset.mem_erase.2 ⟨hsr, hs⟩
    rw [← Finset.mul_prod_erase _ _ hrmem, ← Finset.mul_prod_erase _ _ hrmem,
      ← Finset.mul_prod_erase _ _ hs', ← Finset.mul_prod_erase _ _ hs'] at key
    set T := (m.primeFactors.erase r).erase s
    have hX : 0 < ∏ ℓ ∈ T, ℓ := Finset.prod_pos (fun ℓ hℓ =>
      (Nat.prime_of_mem_primeFactors (Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hℓ))).pos)
    have hY : ∏ ℓ ∈ T, (ℓ - 1) ≤ ∏ ℓ ∈ T, ℓ := Finset.prod_le_prod' (fun ℓ _ => Nat.sub_le ℓ 1)
    have hr2 := hr.two_le
    have hs2 := hsp.two_le
    -- from `heq`: `φ m * r = m * (r - 1)`
    obtain ⟨c, hc⟩ := hrm
    have hdiv : m / r = c := by rw [hc, Nat.mul_div_cancel_left c hr.pos]
    have hφle : φ m ≤ m := Nat.totient_le m
    have h1 : φ m * r = m * (r - 1) := by
      rw [hdiv] at heq
      have : φ m = m - c := by omega
      rw [this, hc]
      rw [Nat.sub_mul, Nat.mul_sub, mul_one, mul_comm (r * c) r]
      ring_nf
    -- contradiction: `φ m * r * s * X = m (r-1)(s-1) Y ≤ m (r-1)(s-1) X < φ m r s X`
    have hmpos : 0 < m := by omega
    have e1 : φ m * r * s * ∏ ℓ ∈ T, ℓ = m * (r - 1) * (s - 1) * ∏ ℓ ∈ T, (ℓ - 1) := by
      calc φ m * r * s * ∏ ℓ ∈ T, ℓ = φ m * (r * (s * ∏ ℓ ∈ T, ℓ)) := by ring
        _ = m * ((r - 1) * ((s - 1) * ∏ ℓ ∈ T, (ℓ - 1))) := key
        _ = _ := by ring
    have e2 : m * (r - 1) * (s - 1) * ∏ ℓ ∈ T, (ℓ - 1) ≤ m * (r - 1) * (s - 1) * ∏ ℓ ∈ T, ℓ :=
      Nat.mul_le_mul_left _ hY
    have e3 : φ m * r * s * ∏ ℓ ∈ T, ℓ = m * (r - 1) * s * ∏ ℓ ∈ T, ℓ := by
      rw [h1]
    have e4 : m * (r - 1) * (s - 1) * ∏ ℓ ∈ T, ℓ < m * (r - 1) * s * ∏ ℓ ∈ T, ℓ := by
      apply Nat.mul_lt_mul_of_pos_right _ hX
      apply Nat.mul_lt_mul_of_pos_left (by omega)
      exact Nat.mul_pos hmpos (by omega)
    omega
  · rintro ⟨k, hk⟩
    have hk1 : 1 ≤ k := by
      rcases Nat.eq_zero_or_pos k with h | h
      · rw [h, pow_zero] at hk; omega
      · exact h
    obtain ⟨j, rfl⟩ : ∃ j, k = j + 1 := ⟨k - 1, by omega⟩
    rw [hk, Nat.totient_prime_pow_succ hr, pow_succ, Nat.mul_div_cancel _ hr.pos]
    have : r ^ j * (r - 1) + r ^ j = r ^ j * r := by
      rw [Nat.mul_sub, mul_one, Nat.sub_add_cancel (Nat.le_mul_of_pos_right _ hr.pos)]
    omega

/-- Part B `lem:L2` (radical scaling): with `U = rad N` and `K = N / U`, `φ(N) = K φ(U)` and
`A(N) = K A(U)`. -/
theorem radical_scaling (N : ℕ) :
    φ N = N / P2qStructural.rad N * φ (P2qStructural.rad N) ∧
      N - φ N = N / P2qStructural.rad N * (P2qStructural.rad N - φ (P2qStructural.rad N)) := by
  have hU : φ (P2qStructural.rad N) = P2qExclusions.Pm1 N := by
    have h := Nat.totient_mul_prod_primeFactors (P2qStructural.rad N)
    have hpf : (P2qStructural.rad N).primeFactors = N.primeFactors := by
      unfold P2qStructural.rad
      exact Nat.primeFactors_prod (fun ℓ hℓ => Nat.prime_of_mem_primeFactors hℓ)
    rw [hpf] at h
    unfold P2qExclusions.Pm1
    have hpos : 0 < ∏ ℓ ∈ N.primeFactors, ℓ :=
      Finset.prod_pos (fun ℓ hℓ => (Nat.prime_of_mem_primeFactors hℓ).pos)
    have h' : φ (P2qStructural.rad N) * P2qStructural.rad N =
        (∏ ℓ ∈ N.primeFactors, (ℓ - 1)) * P2qStructural.rad N := by
      unfold P2qStructural.rad at h ⊢; rw [h, mul_comm]
    exact Nat.eq_of_mul_eq_mul_right (by unfold P2qStructural.rad; exact hpos) h'
  have h1 : φ N = N / P2qStructural.rad N * φ (P2qStructural.rad N) := by
    rw [hU]; exact P2qExclusions.totient_eq_KP N
  refine ⟨h1, ?_⟩
  rw [Nat.mul_sub, ← h1, Nat.mul_comm, ← P2qExclusions.N_eq_UK]

/-- Part B `lem:G`, extra clauses: `gcd(φ(N), σ(N)) ∣ 2T(p)` and `T(p) > 0` for `p ≥ 5`. -/
theorem lemmaG_gcd {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) :
    (Nat.gcd (φ (p ^ 2 * q + 12)) (σ 1 (p ^ 2 * q + 12)) : ℤ) ∣ 2 * ((p : ℤ) ^ 4 - 13 * p - 6) := by
  have hG := P2qStructural.lemmaG (jump_of_jumps hp hq hpq hJ)
  unfold P2qStructural.T at hG
  rw [← hG]
  apply _root_.dvd_sub
  · exact Dvd.dvd.mul_left (Int.natCast_dvd_natCast.2 (Nat.gcd_dvd_right _ _)) _
  · exact Dvd.dvd.mul_left (Int.natCast_dvd_natCast.2 (Nat.gcd_dvd_left _ _)) _

theorem T_pos {p : ℤ} (hp : 5 ≤ p) : 0 < p ^ 4 - 13 * p - 6 := by
  nlinarith [mul_nonneg (sub_nonneg.2 hp) (sub_nonneg.2 hp),
    mul_nonneg (mul_nonneg (sub_nonneg.2 hp) (sub_nonneg.2 hp)) (sub_nonneg.2 hp)]

/-- Twist-link congruences (Part B, the paragraph "Link with the shape `r^3 s`"): if `p` is prime,
`p ∤ r` and `p ∣ r^2 (r + s - 1)`, then `p ∣ r + s - 1`; and if moreover `p ∣ r^3 s - 12`, then
`p ∣ r^4 - r^3 + 12`. -/
theorem twist_link_congr {p r s : ℤ} (hp : Prime p) (hpr : ¬ p ∣ r)
    (h1 : p ∣ r ^ 2 * (r + s - 1)) (h2 : p ∣ r ^ 3 * s - 12) :
    p ∣ r + s - 1 ∧ p ∣ r ^ 4 - r ^ 3 + 12 := by
  have hA : p ∣ r + s - 1 := by
    rcases hp.dvd_or_dvd h1 with h | h
    · exact absurd (hp.dvd_of_dvd_pow h) hpr
    · exact h
  refine ⟨hA, ?_⟩
  have : r ^ 4 - r ^ 3 + 12 = r ^ 3 * (r + s - 1) - (r ^ 3 * s - 12) := by ring
  rw [this]
  exact _root_.dvd_sub (Dvd.dvd.mul_left hA _) h2

/-- Soundness note on `rad`: for `N ≠ 0`, `N / gcd(N, φ(N))` divides `rad N`. -/
theorem div_gcd_totient_dvd_rad {N : ℕ} (hN : N ≠ 0) :
    N / Nat.gcd N (φ N) ∣ P2qStructural.rad N := by
  set U := P2qStructural.rad N
  set K := N / U
  set g := Nat.gcd N (φ N)
  have hNUK : N = U * K := P2qExclusions.N_eq_UK N
  have hKφ : K ∣ φ N := ⟨P2qExclusions.Pm1 N, P2qExclusions.totient_eq_KP N⟩
  have hKN : K ∣ N := ⟨U, by rw [mul_comm]; exact hNUK⟩
  have hKg : K ∣ g := Nat.dvd_gcd hKN hKφ
  have hgN : g ∣ N := Nat.gcd_dvd_left _ _
  obtain ⟨c, hc⟩ := hKg
  obtain ⟨d, hd⟩ := hgN
  have hgpos : 0 < g := Nat.gcd_pos_of_pos_left _ (Nat.pos_of_ne_zero hN)
  have hKpos : 0 < K := by
    rcases Nat.eq_zero_or_pos K with h | h
    · rw [h, mul_zero] at hNUK; exact absurd hNUK hN
    · exact h
  have hNd : N / g = d := by rw [hd, Nat.mul_div_cancel_left d hgpos]
  rw [hNd]
  refine ⟨c, ?_⟩
  have : U * K = d * c * K := by rw [← hNUK, hd, hc]; ring
  have := Nat.eq_of_mul_eq_mul_right hKpos this
  rw [this]

/-- The identity `rad N = N / gcd(N, φ(N))` is false: at `N = 12`, `rad 12 = 6` while
`12 / gcd(12, φ 12) = 3`. -/
theorem rad_ne_div_gcd_totient :
    P2qStructural.rad 12 = 6 ∧ 12 / Nat.gcd 12 (φ 12) = 3 := by
  have h12 : Nat.primeFactors 12 = {2, 3} := by
    have : (12 : ℕ) = 2 ^ 2 * 3 := by norm_num
    rw [this, Nat.primeFactors_mul (by norm_num) (by norm_num),
      Nat.primeFactors_pow _ (by norm_num), Nat.Prime.primeFactors Nat.prime_two,
      Nat.Prime.primeFactors Nat.prime_three]
    rfl
  have hφ : φ 12 = 4 := by
    have : (12 : ℕ) = 2 ^ 2 * 3 := by norm_num
    rw [this, Nat.totient_mul (by norm_num), Nat.totient_prime_pow Nat.prime_two (by norm_num),
      Nat.totient_prime Nat.prime_three]
    norm_num
  refine ⟨?_, ?_⟩
  · unfold P2qStructural.rad; rw [h12]; rfl
  · rw [hφ]; norm_num

/-- Twist link (Part B, "Link with the shape `r^3 s`"): if `L(p) = k r^2` then
`(X, Y) = (k p, k^2 r)` satisfies `Y^2 = X^3 - k X^2 - 12 k^3`. -/
theorem twist_point {p k r : ℤ} (h : p ^ 3 - p ^ 2 - 12 = k * r ^ 2) :
    (k ^ 2 * r) ^ 2 = (k * p) ^ 3 - k * (k * p) ^ 2 - 12 * k ^ 3 := by
  have : (k * p) ^ 3 - k * (k * p) ^ 2 - 12 * k ^ 3 = k ^ 3 * (p ^ 3 - p ^ 2 - 12) := by ring
  rw [this, h]; ring

/-- Twist link: if `r^2 ∣ L(p)` with `p ≥ 5`, then `r^2 < p^3` (the paper's `r < p^{3/2}`). -/
theorem twist_r_bound {p r : ℤ} (hp : 5 ≤ p) (h : r ^ 2 ∣ p ^ 3 - p ^ 2 - 12) :
    r ^ 2 < p ^ 3 := by
  have hL : 0 < p ^ 3 - p ^ 2 - 12 := by nlinarith
  have := Int.le_of_dvd hL h
  nlinarith

/-- `lem:equiv`, remark: `δ(N) = δ(n)` does not imply the jumps. For `n = 63 = 3^2 * 7`,
`δ(75) = δ(63) = 14`, but `A(75) = 35 ≠ 27 = A(63)`, so the jumps fail at `n = 63`. -/
theorem delta_eq_not_jumps_63 :
    (σ 1 75 : ℤ) + φ 75 - 2 * 75 = (σ 1 63 : ℤ) + φ 63 - 2 * 63 ∧
      ((75 : ℕ) : ℤ) - φ 75 ≠ ((63 : ℕ) : ℤ) - φ 63 ∧ ¬ Jumps 63 := by
  have h1 : φ 75 = 40 := by decide +kernel
  have h2 : φ 63 = 36 := by decide +kernel
  have h3 : σ 1 75 = 124 := by decide +kernel
  have h4 : σ 1 63 = 104 := by decide +kernel
  refine ⟨?_, ?_, ?_⟩
  · rw [h1, h2, h3, h4]; norm_num
  · rw [h1, h2]; norm_num
  · rintro ⟨hφ, -⟩
    rw [show (63 : ℕ) + 12 = 75 from rfl, h1, h2] at hφ
    omega

end P2qJumps
