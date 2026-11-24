/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Omega4Q.Defs
import Mathlib.Data.Nat.Totient
import Mathlib.Data.Nat.Prime.Factorial
import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.Tactic

/-!
# P2qJumps.Omega4Q.Sound

Soundness of the checker `chkP` (`P2qJumps.Omega4Q.Defs`): if `chkP p lo hi = true`, then no
prime `q ∈ [lo, hi]` gives an `N = p^2 q + 12` with `φ(N) = p (p - 1) (q - 1) + 12`, every prime
factor of `N` above `p`, `N` odd and `ω(N) ≥ 4`.
-/

namespace P2qJumps

namespace Omega4Q

open Nat

lemma fct_eq (n : ℕ) : fct n = n ! := by
  induction n with
  | zero => rfl
  | succ n ih => simp [fct, Nat.factorial, ih]

lemma isPow_sound (d : ℕ) : ∀ f D, isPow d f D = true → ∃ e, D = d ^ e := by
  intro f
  induction f with
  | zero => intro D h; simp [isPow] at h
  | succ f ih =>
    intro D h
    simp only [isPow, Bool.or_eq_true, beq_iff_eq, Bool.and_eq_true] at h
    rcases h with h | ⟨h0, h1⟩
    · exact ⟨0, by simp [h]⟩
    · obtain ⟨e, he⟩ := ih _ h1
      refine ⟨e + 1, ?_⟩
      rw [pow_succ, ← he]
      exact (Nat.div_mul_cancel (Nat.dvd_of_mod_eq_zero h0)).symm

/-- `2^ω(N) ∣ φ(N)` for odd `N`. -/
lemma two_pow_card_dvd_totient {N : ℕ} (hN0 : N ≠ 0) (hodd : N % 2 = 1) :
    2 ^ N.primeFactors.card ∣ φ N := by
  rw [Nat.totient_eq_prod_factorization hN0, Finsupp.prod, Nat.support_factorization,
    ← Finset.prod_const]
  apply Finset.prod_dvd_prod_of_dvd
  intro r hr
  have hrp := Nat.prime_of_mem_primeFactors hr
  have hrN := Nat.dvd_of_mem_primeFactors hr
  have hr2 : r ≠ 2 := by
    rintro rfl; omega
  have hodd' : r % 2 = 1 := Nat.odd_iff.1 (hrp.odd_of_ne_two hr2)
  exact Dvd.dvd.mul_left (by omega) _

/-- `C ≥ d^j` when `C` has at least `j` prime factors, all `≥ d`. -/
lemma pow_le_of_factors {C d j : ℕ} (hC0 : C ≠ 0) (hd : 1 ≤ d)
    (hall : ∀ r, r.Prime → r ∣ C → d ≤ r) (hj : j ≤ C.primeFactors.card) : d ^ j ≤ C := by
  calc d ^ j ≤ d ^ C.primeFactors.card := Nat.pow_le_pow_right hd hj
    _ ≤ ∏ r ∈ C.primeFactors, r := Finset.pow_card_le_prod _ _ _ fun r hr =>
        hall r (Nat.prime_of_mem_primeFactors hr) (Nat.dvd_of_mem_primeFactors hr)
    _ ≤ C := Nat.le_of_dvd (Nat.pos_of_ne_zero hC0) (Nat.prod_primeFactors_dvd C)

/-- **Soundness of the trial division `tl`.** -/
theorem tl_sound {F N : ℕ} (hF : φ N = F) (hodd : N % 2 = 1) :
    ∀ (f d C k : ℕ), tl F f d C k = true → C ∣ N → C ≠ 0 → d % 2 = 1 → 3 ≤ d →
      (∀ r, r.Prime → r ∣ C → d ≤ r) → 4 ≤ k + C.primeFactors.card → False := by
  intro f
  induction f with
  | zero => intro d C k h; simp [tl] at h
  | succ f ih =>
    intro d C k h hCN hC0 hdodd hd3 hall hω
    -- prime factors of `C` are odd
    have hoddr : ∀ r, r.Prime → r ∣ C → r % 2 = 1 := fun r hr hrC => by
      have : r ≠ 2 := by
        rintro rfl
        have := hrC.trans hCN; omega
      exact Nat.odd_iff.1 (hr.odd_of_ne_two this)
    unfold tl at h
    by_cases hlt : C < d ^ (4 - k)
    · -- size bound
      have := pow_le_of_factors hC0 (by omega) hall (j := 4 - k) (by omega)
      omega
    rw [if_neg hlt] at h
    by_cases hdiv : C % d = 0
    · rw [if_pos hdiv] at h
      -- `d ∣ C`: `d` is prime
      have hdC : d ∣ C := Nat.dvd_of_mod_eq_zero hdiv
      have hdp : d.Prime := by
        have hmf := Nat.minFac_prime (show d ≠ 1 by omega)
        have h1 := hall _ hmf ((Nat.minFac_dvd d).trans hdC)
        have h2 := Nat.minFac_le (show 0 < d by omega)
        have : d.minFac = d := by omega
        rw [← this]; exact hmf
      set C' := stripC d 64 C with hC'
      set D := C / C' with hD
      simp only at h
      by_cases hchk : (C' * D == C && C' % d != 0 && isPow d 64 D) = true
      · rw [if_pos hchk] at h
        simp only [Bool.and_eq_true, beq_iff_eq, bne_iff_ne, ne_eq] at hchk
        obtain ⟨⟨hmul, hnd⟩, hpow⟩ := hchk
        obtain ⟨e, he⟩ := isPow_sound d 64 _ hpow
        have he0 : e ≠ 0 := by
          rintro rfl
          simp only [pow_zero] at he
          rw [he, mul_one] at hmul
          exact hnd (by rw [hmul]; exact hdiv)
        by_cases ht : (F % (D / d * (d - 1)) != 0) = true
        · -- the totient test refutes
          simp only [bne_iff_ne, ne_eq] at ht
          have hDN : D ∣ N := (Dvd.intro_left _ hmul).trans hCN
          have htot : φ D ∣ F := hF ▸ Nat.totient_dvd_of_dvd hDN
          rw [he, Nat.totient_prime_pow hdp (Nat.pos_of_ne_zero he0)] at htot
          apply ht
          have hdiv' : d ^ e / d = d ^ (e - 1) := by
            conv_lhs => rw [show e = (e - 1) + 1 by omega, pow_succ]
            exact Nat.mul_div_cancel _ hdp.pos
          rw [he, hdiv']
          exact Nat.mod_eq_zero_of_dvd htot
        rw [if_neg ht] at h
        by_cases hk : 3 ≤ k
        · rw [if_pos hk] at h; exact absurd h (by simp)
        rw [if_neg hk] at h
        have hC'0 : C' ≠ 0 := by rintro h0; rw [h0, zero_mul] at hmul; exact hC0 hmul.symm
        have hndvd : ¬ d ∣ C' := fun hh => hnd (Nat.mod_eq_zero_of_dvd hh)
        refine ih (d + 2) C' (k + 1) h ((Dvd.intro _ hmul).trans hCN) hC'0 (by omega) (by omega)
          (fun r hr hrC' => ?_) ?_
        · have hrC : r ∣ C := hrC'.trans (Dvd.intro _ hmul)
          have h1 := hall r hr hrC
          have h2 := hoddr r hr hrC
          have h3 : r ≠ d := by rintro rfl; exact hndvd hrC'
          omega
        · have hpf : C.primeFactors = C'.primeFactors ∪ {d} := by
            rw [← hmul, he, Nat.primeFactors_mul hC'0 (pow_ne_zero _ hdp.ne_zero),
              Nat.primeFactors_prime_pow he0 hdp]
          have hdis : Disjoint C'.primeFactors {d} := by
            rw [Finset.disjoint_singleton_right]
            intro hm; exact hndvd (Nat.dvd_of_mem_primeFactors hm)
          rw [hpf, Finset.card_union_of_disjoint hdis, Finset.card_singleton] at hω
          omega
      · rw [if_neg hchk] at h; exact absurd h (by simp)
    rw [if_neg hdiv] at h
    -- `d ∤ C`
    refine ih (d + 2) C k h hCN hC0 (by omega) (by omega) (fun r hr hrC => ?_) hω
    have h1 := hall r hr hrC
    have h2 := hoddr r hr hrC
    have h3 : r ≠ d := by rintro rfl; exact hdiv (Nat.mod_eq_zero_of_dvd hrC)
    omega

/-- **Soundness of one `q`.** -/
theorem chkQ_sound {p q N : ℕ} (h : chkQ p (fct p) (fct 1000) q = true) (hp : p.Prime)
    (hp5 : 5 ≤ p) (hq : q.Prime) (hN : N = p * p * q + 12)
    (hF : φ N = p * (p - 1) * (q - 1) + 12) (hodd : N % 2 = 1)
    (hbig : ∀ r, r.Prime → r ∣ N → p < r) (hω : 4 ≤ N.primeFactors.card) : False := by
  simp only [chkQ, Bool.or_eq_true, Bool.and_eq_true, bne_iff_ne, ne_eq, decide_eq_true_eq] at h
  rcases h with (⟨h1, h2⟩ | h) | h
  · -- `q` is composite: impossible
    have hg : Nat.gcd q (fct 1000) = q := by
      rcases (Nat.dvd_prime hq).1 (Nat.gcd_dvd_left q (fct 1000)) with h | h
      · exact absurd h h1
      · exact h
    rcases h2 with h2 | h2
    · exact h2 hg
    · have : q ∣ 1000 ! := by rw [← fct_eq, ← hg]; exact Nat.gcd_dvd_right _ _
      have := (Nat.Prime.dvd_factorial hq).1 this
      omega
  · -- a prime factor `≤ p`
    rw [← hN] at h
    have hN0 : N ≠ 0 := by omega
    have hg0 : Nat.gcd N (fct p) ≠ 0 := Nat.gcd_ne_zero_left hN0
    have hmf := Nat.minFac_prime h
    have hdvd := Nat.minFac_dvd (Nat.gcd N (fct p))
    have h1 := hbig _ hmf (hdvd.trans (Nat.gcd_dvd_left _ _))
    have h2 : (Nat.gcd N (fct p)).minFac ∣ p ! := by
      rw [← fct_eq]; exact hdvd.trans (Nat.gcd_dvd_right _ _)
    have := (Nat.Prime.dvd_factorial hmf).1 h2
    omega
  · rw [← hN, ← hF] at h
    have hpodd : p % 2 = 1 := Nat.odd_iff.1 (hp.odd_of_ne_two (by omega))
    refine tl_sound rfl hodd _ _ _ _ h dvd_rfl (by omega) (by omega) (by omega)
      (fun r hr hrN => ?_) (by omega)
    have h1 := hbig r hr hrN
    have h2 : r ≠ 2 := by rintro rfl; omega
    have h3 := Nat.odd_iff.1 (hr.odd_of_ne_two h2)
    omega

/-- **Soundness of the `q` loop.** -/
theorem loopQ_sound {p P1 F1000 hi : ℕ} : ∀ (f s : ℕ), loopQ p P1 F1000 hi f s = true →
    ∀ q, s ≤ q → q ≤ hi → q % 16 = s % 16 → chkQ p P1 F1000 q = true := by
  intro f
  induction f with
  | zero =>
    intro s h q hs hq _
    simp only [loopQ, decide_eq_true_eq] at h
    omega
  | succ f ih =>
    intro s h q hs hq hmod
    unfold loopQ at h
    split_ifs at h with hlt
    · omega
    · rw [Bool.and_eq_true] at h
      rcases Nat.eq_or_lt_of_le hs with rfl | hlt'
      · exact h.1
      · exact ih (s + 16) h.2 q (by omega) hq (by omega)

/-- **Soundness of `chkP`.** Every odd `q ∈ [lo, hi]` with `16 ∣ p (p - 1) (q - 1) + 12` passes
`chkQ`. -/
theorem chkP_sound {p lo hi : ℕ} (h : chkP p lo hi = true) (q : ℕ) (hlo : lo ≤ q) (hhi : q ≤ hi)
    (hqodd : q % 2 = 1) (h16 : (p * (p - 1) * (q - 1) + 12) % 16 = 0) :
    chkQ p (fct p) (fct 1000) q = true := by
  unfold chkP at h
  rw [List.all_eq_true] at h
  have hc : q % 16 ∈ [1, 3, 5, 7, 9, 11, 13, 15] := by
    have : q % 16 < 16 := Nat.mod_lt _ (by norm_num)
    simp only [List.mem_cons, List.mem_nil_iff, or_false]
    omega
  have hcq := h _ hc
  simp only [Bool.or_eq_true, bne_iff_ne, ne_eq] at hcq
  rcases hcq with hcq | hcq
  · exfalso; apply hcq
    have e : q - 1 = 16 * (q / 16) + (q % 16 - 1) := by omega
    rw [← h16, e, Nat.mul_add, Nat.add_assoc, Nat.add_comm, ← Nat.add_assoc,
      show p * (p - 1) * (16 * (q / 16)) = 16 * (p * (p - 1) * (q / 16)) by ring]
    omega
  · exact loopQ_sound _ _ hcq q (by unfold start; omega) hhi (by unfold start; omega)

end Omega4Q

end P2qJumps
