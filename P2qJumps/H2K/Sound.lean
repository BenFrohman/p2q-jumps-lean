/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.H2K.Defs
import P2qJumps.Hensel.Sound
import P2qJumps.PropC
import Mathlib.NumberTheory.LucasPrimality
import Mathlib.Tactic

/-!
# P2qJumps.H2K.Sound

Soundness of the H2 checker `scan` (`P2qJumps.H2K.Defs`): the primality stack program only
pushes primes (`run_sound`), `okP` covers every pair of distinct primes `r₁, r₂ ≥ 5` dividing
`L(p)` (`okP_sound`), and `ref` refutes the shapes `N = r₁² r₂² t` and `N = r₁² r₂² t u`
through the linear systems of Proposition C (`ref_sound`).
-/

namespace P2qJumps

namespace H2K

open Nat ArithmeticFunction
open scoped ArithmeticFunction.sigma

lemma td_sound (n : ℕ) : ∀ f d, td n f d = true → ∀ m, d ≤ m → m * m ≤ n → n % m ≠ 0 := by
  intro f
  induction f with
  | zero => intro d h; simp [td] at h
  | succ f ih =>
    intro d h m hdm hmn
    unfold td at h
    split_ifs at h with hlt
    · have : d * d ≤ m * m := Nat.mul_le_mul hdm hdm
      omega
    · simp only [Bool.and_eq_true, bne_iff_ne, ne_eq] at h
      rcases Nat.eq_or_lt_of_le hdm with rfl | hlt'
      · exact h.1
      · exact ih (d + 1) h.2 m hlt' hmn

lemma prime_of_td {n : ℕ} (h2 : 2 ≤ n) (h : td n n 2 = true) : n.Prime := by
  by_contra hn
  have hmf := Nat.minFac_sq_le_self (by omega) hn
  have hm2 : 2 ≤ n.minFac := (Nat.minFac_prime (by omega)).two_le
  exact td_sound n n 2 h n.minFac hm2 (by rw [← pow_two]; exact hmf)
    (Nat.mod_eq_zero_of_dvd (Nat.minFac_dvd n))

lemma mem_of_dvd_prodS {q : ℕ} (hq : q.Prime) : ∀ (qs ms : List ℕ), (∀ x ∈ qs, x.Prime) →
    q ∣ prodS qs ms → q ∈ qs := by
  intro qs
  induction qs with
  | nil => intro ms _ h; simp [prodS] at h; exact absurd h hq.ne_one
  | cons x qs ih =>
    intro ms hall h
    cases ms with
    | nil => simp [prodS] at h; exact absurd h hq.ne_one
    | cons m ms =>
      simp only [prodS] at h
      rcases (Nat.Prime.dvd_mul hq).1 h with h | h
      · have := (Nat.prime_dvd_prime_iff_eq hq (hall x (by simp))).1 (hq.dvd_of_dvd_pow h)
        simp [this]
      · exact List.mem_cons_of_mem _ (ih ms (fun y hy => hall y (List.mem_cons_of_mem _ hy)) h)

lemma natCast_pow_eq_one {n a k : ℕ} (hn : 2 ≤ n) :
    ((a : ZMod n) ^ k = 1) ↔ a ^ k % n = 1 := by
  have h1 : 1 % n = 1 := Nat.mod_eq_of_lt (by omega)
  rw [← Nat.cast_pow, ← Nat.cast_one, ZMod.natCast_eq_natCast_iff', h1]

lemma lucas_sound {n a : ℕ} {qs : List ℕ} (hn : 2 ≤ n) (h : lucas n a qs = true)
    (hqs : ∀ q, q.Prime → q ∣ n - 1 → q ∈ qs) : n.Prime := by
  simp only [lucas, Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq, List.all_eq_true,
    bne_iff_ne, ne_eq] at h
  obtain ⟨⟨hlt, h1⟩, h2⟩ := h
  refine lucas_primality n (a : ZMod n) ?_ ?_
  · rw [natCast_pow_eq_one hn, ← Hensel.pm_eq n 64 a (n - 1) (by omega)]
    exact h1
  · intro q hq hqd
    rw [Ne, natCast_pow_eq_one hn,
      ← Hensel.pm_eq n 64 a ((n - 1) / q) (lt_of_le_of_lt (Nat.div_le_self _ _) (by omega))]
    exact h2 q (hqs q hq hqd)

theorem run_sound : ∀ (is : List I) (st S : List ℕ), run is st = some S →
    (∀ x ∈ st, x.Prime) → ∀ x ∈ S, x.Prime := by
  intro is
  induction is with
  | nil => intro st S h hst; simp only [run, Option.some.injEq] at h; subst h; exact hst
  | cons i is ih =>
    intro st S h hst
    cases i with
    | s n =>
      simp only [run] at h
      split_ifs at h with hc
      · simp only [Bool.and_eq_true, decide_eq_true_eq] at hc
        refine ih _ S h ?_
        intro x hx
        rcases List.mem_cons.1 hx with rfl | hx
        · exact prime_of_td hc.1 hc.2
        · exact hst x hx
    | b n a ms =>
      simp only [run] at h
      split_ifs at h with hc
      · simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hc
        obtain ⟨⟨⟨hn2, -⟩, hprod⟩, hl⟩ := hc
        have htake : ∀ x ∈ st.take ms.length, x.Prime := fun x hx => hst x (List.mem_of_mem_take hx)
        refine ih _ S h ?_
        intro x hx
        rcases List.mem_cons.1 hx with rfl | hx
        · refine lucas_sound hn2 hl fun q hq hqd => ?_
          rw [← hprod] at hqd
          exact mem_of_dvd_prodS hq _ _ htake hqd
        · exact hst x (List.mem_of_mem_drop hx)

lemma j1_false {pp M sg b D1 Nt t q : ℤ} (hpp : pp ≠ 0) (hD : D1 * t = Nt)
    (h0 : M * t - 12 = pp * q) (h2 : sg * t - b * q = b + 12 - sg) : j1 pp M sg b D1 Nt = false := by
  by_cases hD1 : D1 = 0
  · simp [j1, hD1]
  have ht : Nt / D1 = t := Int.ediv_eq_of_eq_mul_right hD1 hD.symm
  have hm : Nt % D1 = 0 := Int.emod_eq_zero_of_dvd ⟨t, hD.symm⟩
  have hq : (M * t - 12) / pp = q := Int.ediv_eq_of_eq_mul_right hpp h0
  have hm2 : (M * t - 12) % pp = 0 := Int.emod_eq_zero_of_dvd ⟨q, h0⟩
  simp [j1, ht, hm, hq, hm2, h2]

lemma j2_false {pp M ph a D2 Nq q P S : ℤ} (hM : M ≠ 0) (hD : D2 * q = Nq)
    (h0 : M * P = 12 + pp * q) (h1 : ph * S = ph * P - a * q - 12 + a + ph) :
    j2 pp M ph a D2 Nq = false := by
  by_cases hD2 : D2 = 0
  · simp [j2, hD2]
  have hq : Nq / D2 = q := Int.ediv_eq_of_eq_mul_right hD2 hD.symm
  have hm : Nq % D2 = 0 := Int.emod_eq_zero_of_dvd ⟨q, hD.symm⟩
  have hP : (12 + pp * q) / M = P := Int.ediv_eq_of_eq_mul_right hM h0.symm
  have hm2 : (12 + pp * q) % M = 0 := Int.emod_eq_zero_of_dvd ⟨P, h0.symm⟩
  have hm3 : (ph * P - a * q - 12 + a + ph) % ph = 0 := Int.emod_eq_zero_of_dvd ⟨S, h1.symm⟩
  simp [j2, hq, hm, hP, hm2, hm3]

lemma phiM {r1 r2 : ℕ} (hr1 : r1.Prime) (hr2 : r2.Prime) (h12 : r1 ≠ r2) :
    (φ (r1 ^ 2 * r2 ^ 2) : ℤ) = r1 * r2 * (r1 - 1) * (r2 - 1) := by
  have hc : Nat.Coprime (r1 ^ 2) (r2 ^ 2) := Nat.Coprime.pow 2 2 ((Nat.coprime_primes hr1 hr2).2 h12)
  rw [Nat.totient_mul hc, Nat.totient_prime_pow hr1 (by norm_num),
    Nat.totient_prime_pow hr2 (by norm_num)]
  have h1 := hr1.one_le
  have h2 := hr2.one_le
  push_cast [h1, h2]
  ring

lemma sigM {r1 r2 : ℕ} (hr1 : r1.Prime) (hr2 : r2.Prime) (h12 : r1 ≠ r2) :
    (σ 1 (r1 ^ 2 * r2 ^ 2) : ℤ) = (r1 * r1 + r1 + 1) * (r2 * r2 + r2 + 1) := by
  have hc : Nat.Coprime (r1 ^ 2) (r2 ^ 2) := Nat.Coprime.pow 2 2 ((Nat.coprime_primes hr1 hr2).2 h12)
  rw [isMultiplicative_sigma.map_mul_of_coprime hc, sigma_one_apply_prime_pow hr1,
    sigma_one_apply_prime_pow hr2]
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  push_cast
  ring

/-- **`ref` refutes `N = r₁² r₂² t`.** -/
theorem ref_sound_j1 {p q r1 r2 t : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hr1 : r1.Prime) (hr2 : r2.Prime) (h12 : r1 ≠ r2) (ht : t.Prime)
    (hMt : Nat.Coprime (r1 ^ 2 * r2 ^ 2) t) (hN : p ^ 2 * q + 12 = r1 ^ 2 * r2 ^ 2 * t)
    (h : ref p r1 r2 = true) : False := by
  obtain ⟨⟨e0, e1, e2⟩, -, -⟩ := propC_j1 hp hq hpq hJ ht hMt hN
  rw [phiM hr1 hr2 h12] at e1
  rw [sigM hr1 hr2 h12] at e2
  push_cast at e0 e1 e2
  unfold ref at h
  simp only [Bool.and_eq_true] at h
  have hpp : (p : ℤ) * p ≠ 0 := by have := hp.ne_zero; positivity
  refine absurd h.1 ?_
  rw [Bool.not_eq_true]
  apply j1_false (t := t) (q := q) hpp
  · linear_combination (p : ℤ) ^ 2 * e1 - (p * (p - 1) : ℤ) * e0
  · linear_combination e0
  · linear_combination e2

/-- **`ref` refutes `N = r₁² r₂² s t`.** -/
theorem ref_sound_j2 {p q r1 r2 s t : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hr1 : r1.Prime) (hr2 : r2.Prime) (h12 : r1 ≠ r2) (hs : s.Prime)
    (ht : t.Prime) (hst : s ≠ t) (hMst : Nat.Coprime (r1 ^ 2 * r2 ^ 2) (s * t))
    (hN : p ^ 2 * q + 12 = r1 ^ 2 * r2 ^ 2 * s * t) (h : ref p r1 r2 = true) : False := by
  obtain ⟨⟨e0, e1, e2⟩, -, -⟩ := propC_j2 hp hq hpq hJ hs ht hst hMst hN
  rw [phiM hr1 hr2 h12] at e1
  rw [sigM hr1 hr2 h12] at e2
  push_cast at e0 e1 e2
  unfold ref at h
  simp only [Bool.and_eq_true] at h
  have hM : (r1 : ℤ) * r1 * r2 * r2 ≠ 0 := by
    have := hr1.ne_zero; have := hr2.ne_zero; positivity
  refine absurd h.2 ?_
  rw [Bool.not_eq_true]
  apply j2_false (q := q) (P := s * t) (S := s + t) hM
  · linear_combination ((r1 : ℤ) * r1 * r2 * r2) *
      (((r1 : ℤ) * r1 + r1 + 1) * (r2 * r2 + r2 + 1) * e1 +
        ((r1 : ℤ) * r2 * (r1 - 1) * (r2 - 1)) * e2) -
      2 * ((r1 : ℤ) * r2 * (r1 - 1) * (r2 - 1)) * (((r1 : ℤ) * r1 + r1 + 1) * (r2 * r2 + r2 + 1)) * e0
  · linear_combination e0
  · linear_combination -e1

/-- **`okP` covers every pair of primes `r₁ ≠ r₂ ≥ 5` dividing `L(p)`.** -/
theorem okP_sound {p a2 a3 : ℕ} {is : List I} {es : List ℕ} (h : okP p a2 a3 is es = true)
    {r1 r2 : ℕ} (hr1 : r1.Prime) (hr2 : r2.Prime) (h12 : r1 ≠ r2) (h51 : 5 ≤ r1) (h52 : 5 ≤ r2)
    (hd1 : r1 ∣ p * p * p - p * p - 12) (hd2 : r2 ∣ p * p * p - p * p - 12) :
    ref p r1 r2 = true := by
  unfold okP at h
  split at h
  · exact absurd h Bool.false_ne_true
  rename_i S hS
  simp only [Bool.and_eq_true, beq_iff_eq, List.all_eq_true, Bool.or_eq_true] at h
  obtain ⟨hL, hall⟩ := h
  have hSp := run_sound is [] S hS (by simp)
  have mem : ∀ r, r.Prime → 5 ≤ r → r ∣ p * p * p - p * p - 12 → r ∈ S := by
    intro r hr h5 hd
    rw [hL] at hd
    rcases (Nat.Prime.dvd_mul hr).1 hd with hd | hd
    · rcases (Nat.Prime.dvd_mul hr).1 hd with hd | hd
      · have := (Nat.prime_dvd_prime_iff_eq hr Nat.prime_two).1 (hr.dvd_of_dvd_pow hd); omega
      · have := (Nat.prime_dvd_prime_iff_eq hr Nat.prime_three).1 (hr.dvd_of_dvd_pow hd); omega
    · exact mem_of_dvd_prodS hr S es hSp hd
  rcases hall r1 (mem r1 hr1 h51 hd1) r2 (mem r2 hr2 h52 hd2) with h | h
  · exact absurd h h12
  · exact h

/-- The conclusion of the checker for the prime `p`: every pair of distinct primes `r₁, r₂ ≥ 5`
dividing `L(p)` is refuted by `ref`. -/
def GoodP (p : ℕ) : Prop :=
  ∀ r1 r2 : ℕ, r1.Prime → r2.Prime → r1 ≠ r2 → 5 ≤ r1 → 5 ≤ r2 →
    r1 ∣ p * p * p - p * p - 12 → r2 ∣ p * p * p - p * p - 12 → ref p r1 r2 = true

lemma okE_sound (e : E) (h : okE e = true) (hp : e.m.Prime) : GoodP e.m := by
  cases e with
  | pr p a2 a3 is es =>
    intro r1 r2 hr1 hr2 h12 h51 h52 hd1 hd2
    exact okP_sound h hr1 hr2 h12 h51 h52 hd1 hd2
  | c m d =>
    exfalso
    simp only [okE, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at h
    simp only [E.m] at hp
    obtain ⟨⟨h1, h2⟩, h3⟩ := h
    rcases hp.eq_one_or_self_of_dvd d (Nat.dvd_of_mod_eq_zero h3) with h | h <;> omega

/-- **Soundness of `scan`.** -/
theorem scan_sound (hi : ℕ) : ∀ (f m : ℕ) (l : List E), scan hi f m l = true →
    ∀ p, m ≤ p → p ≤ hi → p.Prime → GoodP p := by
  intro f
  induction f with
  | zero =>
    intro m l h p hm hp
    simp only [scan, decide_eq_true_eq] at h
    omega
  | succ f ih =>
    intro m l h p hm hphi hp
    unfold scan at h
    split_ifs at h with hlt
    · omega
    · rcases Nat.eq_or_lt_of_le hm with hmp | hm'
      · rw [← hmp] at hp ⊢
        cases l with
        | nil =>
          rw [Bool.and_eq_true] at h
          exact absurd hp (Hensel.comp_sound h.1)
        | cons e rest =>
          simp only at h
          split_ifs at h with he
          · rw [Bool.and_eq_true] at h
            have he' : e.m = m := by simpa using he
            rw [← he']
            exact okE_sound e h.1 (he' ▸ hp)
          · rw [Bool.and_eq_true] at h
            exact absurd hp (Hensel.comp_sound h.1)
      · cases l with
        | nil =>
          rw [Bool.and_eq_true] at h
          exact ih _ _ h.2 p hm' hphi hp
        | cons e rest =>
          simp only at h
          split_ifs at h with he
          · rw [Bool.and_eq_true] at h
            exact ih _ _ h.2 p hm' hphi hp
          · rw [Bool.and_eq_true] at h
            exact ih _ _ h.2 p hm' hphi hp

end H2K

end P2qJumps
