/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Omega4

/-!
# P2qJumps.P7

The equations of the squarefree `p = 7` residual (paper Appendix `app:p7`),
the exclusion of the prime `5` (and of every prime `≤ 7`) when `ω(N) ≥ 4`,
and the prefix bound used to prune the descent. The finite descent itself is
not formalized here.
-/

namespace P2qJumps

open Nat ArithmeticFunction
open scoped ArithmeticFunction.sigma

/-- The `p = 7` equations, in `ℤ`. -/
theorem p7_identities {q : ℕ} (hq : q.Prime) (hq7 : q ≠ 7) (hJ : Jumps (7 ^ 2 * q)) :
    (φ (7 ^ 2 * q + 12) : ℤ) = 42 * q - 30 ∧
    (σ 1 (7 ^ 2 * q + 12) : ℤ) = 57 * q + 69 ∧
    7 * (φ (7 ^ 2 * q + 12) : ℤ) = 6 * ((7 ^ 2 * q + 12 : ℕ) : ℤ) - 282 ∧
    49 * (σ 1 (7 ^ 2 * q + 12) : ℤ) = 57 * ((7 ^ 2 * q + 12 : ℕ) : ℤ) + 2697 ∧
    42 * (σ 1 (7 ^ 2 * q + 12) : ℤ) - 57 * (φ (7 ^ 2 * q + 12) : ℤ) = 4608 ∧
    343 * (φ (7 ^ 2 * q + 12) : ℤ) * (σ 1 (7 ^ 2 * q + 12) : ℤ)
      = 342 * ((7 ^ 2 * q + 12 : ℕ) : ℤ) ^ 2 + 108 * ((7 ^ 2 * q + 12 : ℕ) : ℤ) - 760554 := by
  obtain ⟨j1, j2⟩ := jumps_p2q_int (by norm_num : (7 : ℕ).Prime) hq (Ne.symm hq7) hJ
  push_cast at j1 j2 ⊢
  refine ⟨by rw [j1]; ring, by rw [j2]; ring, by rw [j1]; ring, by rw [j2]; ring,
    by rw [j1, j2]; ring, by rw [j1, j2]; ring⟩

/-- For `p = 7`: `N ≡ 5` and `φ(N) ≡ 5 (mod 7)`; in particular `7 ∤ φ(N)`. -/
theorem p7_mod {q : ℕ} (hq : q.Prime) (hq7 : q ≠ 7) (hJ : Jumps (7 ^ 2 * q)) :
    (7 ^ 2 * q + 12) % 7 = 5 ∧ φ (7 ^ 2 * q + 12) % 7 = 5 ∧ ¬ 7 ∣ φ (7 ^ 2 * q + 12) := by
  obtain ⟨h1, -⟩ := p7_identities hq hq7 hJ
  have hq5 : 5 ≤ q := (preamble (by norm_num : (7 : ℕ).Prime) hq (Ne.symm hq7) hJ).2.1
  have hφ : φ (7 ^ 2 * q + 12) = 42 * q - 30 := by omega
  refine ⟨by omega, by omega, by omega⟩

/-- For `p = 7` and four distinct prime factors of `N`, every prime factor of `N`
is at least `11`; in particular `5 ∤ N`. -/
theorem p7_omega4_ge11 {q a b c d : ℕ} (hq : q.Prime) (hq7 : q ≠ 7) (hJ : Jumps (7 ^ 2 * q))
    (ha : a.Prime) (hb : b.Prime) (hc : c.Prime) (hd : d.Prime)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d) (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (haN : a ∣ 7 ^ 2 * q + 12) (hbN : b ∣ 7 ^ 2 * q + 12) (hcN : c ∣ 7 ^ 2 * q + 12)
    (hdN : d ∣ 7 ^ 2 * q + 12) :
    (∀ r : ℕ, r.Prime → r ∣ 7 ^ 2 * q + 12 → 11 ≤ r) ∧ ¬ 5 ∣ 7 ^ 2 * q + 12 := by
  have h := (omega4_constraints (by norm_num : (7 : ℕ).Prime) hq (Ne.symm hq7) hJ
    ha hb hc hd hab hac had hbc hbd hcd haN hbN hcN hdN).2
  have key : ∀ r : ℕ, r.Prime → r ∣ 7 ^ 2 * q + 12 → 11 ≤ r := by
    intro r hr hrN
    have h7 := h r hr hrN
    by_contra hlt; push_neg at hlt
    interval_cases r <;> norm_num at hr
  exact ⟨key, fun h5 => by have := key 5 (by norm_num) h5; omega⟩

/-- Prefix bound (prune of the `p = 7` descent). Write `N = b M`, `φ(N) = h F₋`,
`σ(N) = s F₊` with `F₋ F₊ ≤ M ^ 2`. If `343 φ σ = 342 N² + 108 N − 760554` and
`342 b² − 343 h s ≥ 1`, then `M ≤ 872`. -/
theorem p7_prefix_bound (b h s M Fm Fp : ℤ) (hb : 0 ≤ b) (hh : 0 ≤ h) (hs : 0 ≤ s)
    (hM : 0 ≤ M) (hF : Fm * Fp ≤ M ^ 2)
    (hid : 343 * (h * Fm) * (s * Fp) = 342 * (b * M) ^ 2 + 108 * (b * M) - 760554)
    (hd : 1 ≤ 342 * b ^ 2 - 343 * h * s) : M ≤ 872 := by
  have hhs : 0 ≤ h * s := mul_nonneg hh hs
  have h1 : 343 * (h * s) * (Fm * Fp) ≤ 343 * (h * s) * M ^ 2 :=
    mul_le_mul_of_nonneg_left hF (by positivity)
  have h2 : M ^ 2 ≤ 760554 := by
    have hbM : 0 ≤ b * M := mul_nonneg hb hM
    nlinarith [sq_nonneg M]
  nlinarith [sq_nonneg (M - 873)]

/-- The prune applies whenever at least three prime factors `≥ 11` remain:
their product is at least `11 · 13 · 17 = 2431 > 872`. -/
theorem p7_prune_threshold : (872 : ℕ) < 11 * 13 * 17 := by norm_num

/-- For a product `M` of distinct primes, `φ(M) σ(M) = ∏ (r^2 - 1) ≤ M^2`. -/
lemma totient_mul_sigma_prod_primes_le (S : Finset ℕ) (hS : ∀ r ∈ S, r.Prime) :
    φ (∏ r ∈ S, r) * σ 1 (∏ r ∈ S, r) ≤ (∏ r ∈ S, r) ^ 2 := by
  revert hS
  induction S using Finset.induction_on with
  | empty => intro _; simp [sigma_one_apply]
  | @insert a S ha ih =>
    intro hS
    have haP : a.Prime := hS a (Finset.mem_insert_self a S)
    have hS' : ∀ r ∈ S, r.Prime := fun r hr => hS r (Finset.mem_insert_of_mem hr)
    have hcop : Nat.Coprime a (∏ r ∈ S, r) :=
      Nat.Coprime.prod_right fun r hr =>
        (Nat.coprime_primes haP (hS' r hr)).2 (fun h => ha (h ▸ hr))
    rw [Finset.prod_insert ha, Nat.totient_mul hcop,
      isMultiplicative_sigma.map_mul_of_coprime hcop, Nat.totient_prime haP,
      sigma_one_prime' haP]
    have h1 : (a - 1) * (a + 1) ≤ a * a := by
      obtain ⟨k, rfl⟩ : ∃ k, a = k + 1 := ⟨a - 1, by have := haP.one_lt; omega⟩
      rw [Nat.add_sub_cancel]
      nlinarith
    calc (a - 1) * φ (∏ r ∈ S, r) * ((a + 1) * σ 1 (∏ r ∈ S, r))
        = ((a - 1) * (a + 1)) * (φ (∏ r ∈ S, r) * σ 1 (∏ r ∈ S, r)) := by ring
      _ ≤ (a * a) * (∏ r ∈ S, r) ^ 2 := Nat.mul_le_mul h1 (ih hS')
      _ = (a * ∏ r ∈ S, r) ^ 2 := by ring

/-- Paper Proposition `prop:A-p7-prefix`, last sentence: for `p = 7`, a prefix `b` with
`342 b^2 - 343 φ(b) σ(b) ≥ 1` cannot be completed by three or more further distinct primes
`≥ 11`. Precisely: if `N = 7^2 q + 12 = b · ∏_{r ∈ S} r` where `S` is a set of at least three
primes `r ≥ 11` with `r ∤ b`, then `342 b^2 - 343 φ(b) σ(b) < 1`. -/
theorem p7_prefix_no_completion {q b : ℕ} (S : Finset ℕ) (hq : q.Prime) (hq7 : q ≠ 7)
    (hJ : Jumps (7 ^ 2 * q))
    (hS : ∀ r ∈ S, r.Prime ∧ 11 ≤ r ∧ ¬ r ∣ b) (hcard : 3 ≤ S.card)
    (hN : 7 ^ 2 * q + 12 = b * ∏ r ∈ S, r) :
    342 * (b : ℤ) ^ 2 - 343 * (φ b : ℤ) * (σ 1 b : ℤ) < 1 := by
  have hcop : Nat.Coprime b (∏ r ∈ S, r) :=
    Nat.Coprime.prod_right fun r hr =>
      ((Nat.Prime.coprime_iff_not_dvd (hS r hr).1).2 (hS r hr).2.2).symm
  have hF : φ (∏ r ∈ S, r) * σ 1 (∏ r ∈ S, r) ≤ (∏ r ∈ S, r) ^ 2 :=
    totient_mul_sigma_prod_primes_le S (fun r hr => (hS r hr).1)
  have hM11 : 11 ^ S.card ≤ ∏ r ∈ S, r :=
    Finset.pow_card_le_prod S (fun r => r) 11 (fun r hr => (hS r hr).2.1)
  have h3 : 11 ^ 3 ≤ 11 ^ S.card := Nat.pow_le_pow_right (by norm_num) hcard
  have hM : 1331 ≤ ∏ r ∈ S, r := by
    calc (1331 : ℕ) = 11 ^ 3 := by norm_num
      _ ≤ 11 ^ S.card := h3
      _ ≤ ∏ r ∈ S, r := hM11
  have h6 := (p7_identities hq hq7 hJ).2.2.2.2.2
  rw [hN, Nat.totient_mul hcop, isMultiplicative_sigma.map_mul_of_coprime hcop] at h6
  push_cast at h6
  by_contra hcon
  push_neg at hcon
  have hle := p7_prefix_bound (b : ℤ) (φ b : ℤ) (σ 1 b : ℤ) ((∏ r ∈ S, r : ℕ) : ℤ)
    (φ (∏ r ∈ S, r) : ℤ) (σ 1 (∏ r ∈ S, r) : ℤ)
    (by positivity) (by positivity) (by positivity) (by positivity)
    (by exact_mod_cast hF) (by push_cast; linear_combination h6) hcon
  have hM' : (1331 : ℤ) ≤ ((∏ r ∈ S, r : ℕ) : ℤ) := by exact_mod_cast hM
  linarith

end P2qJumps
