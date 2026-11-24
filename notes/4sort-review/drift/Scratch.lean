import P2qJumps.P7
import P2qJumps.TheoremsBE

namespace P2qJumps
open Nat ArithmeticFunction Finset
open scoped ArithmeticFunction.sigma

/-- A prime `r ≥ 5` is coprime to `2` and to `3`. -/
lemma coprime_of_prime_ge_five {d r : ℕ} (hd : d = 2 ∨ d = 3) (hr : r.Prime) (h5 : 5 ≤ r) :
    Nat.Coprime d r := by
  have hdp : d.Prime := by rcases hd with rfl | rfl <;> norm_num
  exact (Nat.Prime.coprime_iff_not_dvd hdp).2 (prime_ge_five_not_dvd hr h5 d hd)

/-- Paper Lemma `lem:A-coprime6`, second sentence, shape `r^2 s t`: if `N = p^2 q + 12 = r^2 s t`
with primes `r, s, t ≥ 5`, then `2 ∤ N`, `3 ∤ N`, `p ≥ 5` and `p ∤ N`. -/
theorem coprime6_r2st {p q r s t : ℕ} (hp : p.Prime) (hr : r.Prime) (hs : s.Prime)
    (ht : t.Prime) (hr5 : 5 ≤ r) (hs5 : 5 ≤ s) (ht5 : 5 ≤ t)
    (hN : p ^ 2 * q + 12 = r ^ 2 * s * t) :
    ¬ 2 ∣ p ^ 2 * q + 12 ∧ ¬ 3 ∣ p ^ 2 * q + 12 ∧ 5 ≤ p ∧ ¬ p ∣ p ^ 2 * q + 12 := by
  have hnd : ∀ d, (d = 2 ∨ d = 3) → ¬ d ∣ p ^ 2 * q + 12 := by
    intro d hd
    have hdp : d.Prime := by rcases hd with rfl | rfl <;> norm_num
    rw [hN]
    exact (Nat.Prime.coprime_iff_not_dvd hdp).1
      ((((coprime_of_prime_ge_five hd hr hr5).pow_right 2).mul_right
        (coprime_of_prime_ge_five hd hs hs5)).mul_right (coprime_of_prime_ge_five hd ht ht5))
  have h2 := hnd 2 (Or.inl rfl)
  have h3 := hnd 3 (Or.inr rfl)
  exact ⟨h2, h3, p_ge_five_of_dvd hp rfl h2 h3⟩

/-- Paper Lemma `lem:A-coprime6`, second sentence, shape `r^3 s`: if `N = p^2 q + 12 = r^3 s`
with primes `r, s ≥ 5`, then `2 ∤ N`, `3 ∤ N`, `p ≥ 5` and `p ∤ N`. -/
theorem coprime6_r3s {p q r s : ℕ} (hp : p.Prime) (hr : r.Prime) (hs : s.Prime)
    (hr5 : 5 ≤ r) (hs5 : 5 ≤ s) (hN : p ^ 2 * q + 12 = r ^ 3 * s) :
    ¬ 2 ∣ p ^ 2 * q + 12 ∧ ¬ 3 ∣ p ^ 2 * q + 12 ∧ 5 ≤ p ∧ ¬ p ∣ p ^ 2 * q + 12 := by
  have hnd : ∀ d, (d = 2 ∨ d = 3) → ¬ d ∣ p ^ 2 * q + 12 := by
    intro d hd
    have hdp : d.Prime := by rcases hd with rfl | rfl <;> norm_num
    rw [hN]
    exact (Nat.Prime.coprime_iff_not_dvd hdp).1
      (((coprime_of_prime_ge_five hd hr hr5).pow_right 3).mul_right
        (coprime_of_prime_ge_five hd hs hs5))
  have h2 := hnd 2 (Or.inl rfl)
  have h3 := hnd 3 (Or.inr rfl)
  exact ⟨h2, h3, p_ge_five_of_dvd hp rfl h2 h3⟩

/-- Paper Theorem `thm:A-omega4`, last sentence: under the same hypotheses, `N > p^4`
(from `q ≥ 3 p^2`). -/
theorem omega4_N_gt_p4 {p q a b c d : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q))
    (ha : a.Prime) (hb : b.Prime) (hc : c.Prime) (hd : d.Prime)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d) (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (haN : a ∣ p ^ 2 * q + 12) (hbN : b ∣ p ^ 2 * q + 12) (hcN : c ∣ p ^ 2 * q + 12)
    (hdN : d ∣ p ^ 2 * q + 12) :
    p ^ 4 < p ^ 2 * q + 12 := by
  have hq3 := (omega4_constraints hp hq hpq hJ ha hb hc hd hab hac had hbc hbd hcd
    haN hbN hcN hdN).1
  have h1 : p ^ 2 ≤ q := by
    have h0 := Nat.zero_le (p ^ 2)
    linarith
  calc p ^ 4 = p ^ 2 * p ^ 2 := by ring
    _ ≤ p ^ 2 * q := Nat.mul_le_mul_left _ h1
    _ < p ^ 2 * q + 12 := lt_add_of_pos_right _ (by norm_num)

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

#print axioms P2qJumps.coprime6_r2st
#print axioms P2qJumps.coprime6_r3s
#print axioms P2qJumps.omega4_N_gt_p4
#print axioms P2qJumps.lemmaK_param
#print axioms P2qJumps.p7_prefix_no_completion
