/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Hensel.Defs
import Mathlib.FieldTheory.Finite.Basic

/-!
# P2qJumps.Hensel.Sound

Soundness of the Hensel checker `scan` (`P2qJumps.Hensel.Defs`): if
`scan hi f m l = true`, then for every prime `r` with `5 ≤ r`, `m ≤ r ≤ hi`, there is no prime
`p` with `5 ≤ p < r` and `r^2 ∣ p^3 - p^2 - 12`.
-/

namespace P2qJumps

namespace Hensel

/-- The property certified for `r`. -/
def Good (r : ℕ) : Prop :=
  ∀ p : ℕ, p.Prime → 5 ≤ p → p < r → ¬ ((r : ℤ) ^ 2 ∣ (p : ℤ) ^ 3 - (p : ℤ) ^ 2 - 12)

lemma pm_eq (m : ℕ) : ∀ (f b e : ℕ), e < 2 ^ f → pm m f b e = b ^ e % m := by
  intro f
  induction f with
  | zero =>
    intro b e he
    have : e = 0 := by simpa using he
    subst this; simp [pm]
  | succ f ih =>
    intro b e he
    have he2 : e / 2 < 2 ^ f := by
      rw [pow_succ] at he; omega
    have hsplit : b ^ e = (b * b) ^ (e / 2) * b ^ (e % 2) := by
      rw [← pow_two, ← pow_mul, ← pow_add]; congr 1; omega
    simp only [pm]
    rw [ih _ _ he2, ← Nat.pow_mod]
    split_ifs with h
    · rw [hsplit, h, pow_zero, mul_one]
    · have h1 : e % 2 = 1 := by omega
      rw [hsplit, h1, pow_one, Nat.mul_mod, Nat.mod_mod, ← Nat.mul_mod]

section eval

variable {r : ℕ} (a : ZMod r)

/-- Evaluation of a residue `t0 + t1 x + t2 x^2` at `a`. -/
def ev (t : T) : ZMod r := (t.t0 : ZMod r) + (t.t1 : ZMod r) * a + (t.t2 : ZMod r) * a ^ 2

variable {a}

lemma ev_mulT (ha : a ^ 3 = a ^ 2 + 12) (u v : T) : ev a (mulT r u v) = ev a u * ev a v := by
  simp only [ev, mulT, ZMod.natCast_mod]
  push_cast
  linear_combination (-((u.t1 : ZMod r) * v.t2 + (u.t2 : ZMod r) * v.t1 +
    (u.t2 : ZMod r) * v.t2 * a + (u.t2 : ZMod r) * v.t2)) * ha

lemma ev_powT (ha : a ^ 3 = a ^ 2 + 12) : ∀ (f : ℕ) (t : T) (e : ℕ), e < 2 ^ f →
    ev a (powT r f t e) = ev a t ^ e := by
  intro f
  induction f with
  | zero =>
    intro t e he
    have : e = 0 := by simpa using he
    subst this; simp [powT, ev, ZMod.natCast_mod]
  | succ f ih =>
    intro t e he
    have he2 : e / 2 < 2 ^ f := by
      rw [pow_succ] at he; omega
    have hsplit : ev a t ^ e = (ev a t * ev a t) ^ (e / 2) * ev a t ^ (e % 2) := by
      rw [← pow_two, ← pow_mul, ← pow_add]; congr 1; omega
    simp only [powT]
    split_ifs with h
    · rw [ih _ _ he2, ev_mulT ha, hsplit, h, pow_zero, mul_one]
    · have h1 : e % 2 = 1 := by omega
      rw [ev_mulT ha, ih _ _ he2, ev_mulT ha, hsplit, h1, pow_one]

end eval

lemma natCast_eq_of_mod {r x y : ℕ} (h : x % r = y % r) : (x : ZMod r) = y :=
  (ZMod.natCast_eq_natCast_iff' x y r).2 h

lemma mod_eq_of_natCast {r x y : ℕ} (h : (x : ZMod r) = y) : x % r = y % r :=
  (ZMod.natCast_eq_natCast_iff' x y r).1 h

lemma det_zero {r : ℕ} {a : ZMod r} (u v w : T) (hu : ev a u = 0) (hv : ev a v = 0)
    (hw : ev a w = 0) : ((detP u v w : ℕ) : ZMod r) = ((detQ u v w : ℕ) : ZMod r) := by
  simp only [ev] at hu hv hw
  simp only [detP, detQ]
  push_cast
  linear_combination
    ((v.t1 : ZMod r) * w.t2 - (v.t2 : ZMod r) * w.t1) * hu
    - ((u.t1 : ZMod r) * w.t2 - (u.t2 : ZMod r) * w.t1) * hv
    + ((u.t1 : ZMod r) * v.t2 - (u.t2 : ZMod r) * v.t1) * hw

/-- `noRoot r = true` rules out every root of `L` modulo the prime `r`. -/
lemma noRoot_sound {r : ℕ} [hr : Fact r.Prime] (h : noRoot r = true) (a : ZMod r)
    (ha : a ^ 3 = a ^ 2 + 12) : False := by
  unfold noRoot at h
  rw [Bool.and_eq_true, decide_eq_true_eq, bne_iff_ne] at h
  obtain ⟨hlt, hPQ⟩ := h
  apply hPQ
  apply mod_eq_of_natCast
  have hX : ev a X = a := by simp [ev, X]
  have hr1 : 1 ≤ r := hr.out.one_lt.le
  have hhev : ev a (hOf r) = 0 := by
    have hgev : ev a (powT r 21 X r) = a := by
      rw [ev_powT ha 21 _ r (by omega), hX, ZMod.pow_card]
    have : ((((powT r 21 X r).t1 + r - 1 : ℕ)) : ZMod r) = ((powT r 21 X r).t1 : ZMod r) - 1 := by
      rw [Nat.cast_sub (by omega)]; push_cast; simp
    simp only [ev] at hgev ⊢
    simp only [hOf, ZMod.natCast_mod]; rw [this]
    linear_combination hgev
  have h1ev : ev a (mulT r (hOf r) X) = 0 := by rw [ev_mulT ha, hhev, zero_mul]
  have h2ev : ev a (mulT r (mulT r (hOf r) X) X) = 0 := by rw [ev_mulT ha, h1ev, zero_mul]
  exact det_zero _ _ _ hhev h1ev h2ev

/-- `comp m = true` implies `m` is not prime. -/
lemma comp_sound {m : ℕ} (h : comp m = true) : ¬ m.Prime := by
  intro hm
  have small : ∀ d, d < m → 1 < d → m % d = 0 → False := fun d hd h1 h0 => by
    rcases hm.eq_one_or_self_of_dvd d (Nat.dvd_of_mod_eq_zero h0) with h | h <;> omega
  simp only [comp, Bool.or_eq_true, Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq,
    bne_iff_ne, ne_eq] at h
  rcases h with ((((⟨h0, h1⟩ | ⟨h0, h1⟩) | ⟨h0, h1⟩) | ⟨h0, h1⟩) | ⟨⟨h2, hb⟩, hf⟩)
  · exact small 2 h1 (by norm_num) h0
  · exact small 3 h1 (by norm_num) h0
  · exact small 5 h1 (by norm_num) h0
  · exact small 7 h1 (by norm_num) h0
  · apply hf
    haveI := Fact.mk hm
    rw [pm_eq m 21 2 (m - 1) (by norm_num; omega)]
    have h2ne : (2 : ZMod m) ≠ 0 := by
      intro h0
      have : ((2 : ℕ) : ZMod m) = 0 := by exact_mod_cast h0
      rw [ZMod.natCast_eq_zero_iff] at this
      have := Nat.le_of_dvd (by norm_num) this
      omega
    have := ZMod.pow_card_sub_one_eq_one h2ne
    have h' : ((2 ^ (m - 1) : ℕ) : ZMod m) = ((1 : ℕ) : ZMod m) := by push_cast; exact this
    rw [mod_eq_of_natCast h', Nat.one_mod_eq_one.2 hm.one_lt.ne']

/-- A root of `L` modulo `r` that is a prime `p ≥ 5` below `r` with `r^2 ∣ L(p)` fails
`okRoot`. -/
lemma okRoot_sound {r s p : ℕ} (h : okRoot r s = true) (hp : p.Prime) (hp5 : 5 ≤ p)
    (hps : p = s) (hdvd : ((r : ℤ) ^ 2 ∣ (p : ℤ) ^ 3 - (p : ℤ) ^ 2 - 12)) : False := by
  subst hps
  simp only [okRoot, Bool.or_eq_true, decide_eq_true_eq, bne_iff_ne, ne_eq] at h
  rcases h with ((h | h) | h)
  · omega
  · apply h
    have hp2 : p ^ 2 ≤ p ^ 3 := Nat.pow_le_pow_right (by omega) (by omega)
    have h12 : 12 ≤ p * p * p - p * p := by
      have : 5 * 5 * 5 ≤ p * p * p := Nat.mul_le_mul (Nat.mul_le_mul hp5 hp5) hp5
      have : p * p ≤ p * p * p / 5 := by
        rw [Nat.le_div_iff_mul_le (by norm_num)]
        exact Nat.mul_le_mul_left _ hp5
      omega
    have hcast : (((p * p * p - p * p - 12 : ℕ)) : ℤ) = (p : ℤ) ^ 3 - (p : ℤ) ^ 2 - 12 := by
      have hpp : p * p ≤ p * p * p := Nat.le_mul_of_pos_right _ (by omega)
      rw [Nat.cast_sub h12, Nat.cast_sub hpp]; push_cast; ring
    rw [← hcast] at hdvd
    have : (r * r : ℕ) ∣ p * p * p - p * p - 12 := by
      have := hdvd; rw [show (r : ℤ) ^ 2 = ((r * r : ℕ) : ℤ) by push_cast; ring] at this
      exact_mod_cast this
    exact Nat.mod_eq_zero_of_dvd this
  · exact comp_sound h hp

/-- A prime `p < r` with `r ∣ L(p)` gives a root of `L` modulo `r`. -/
lemma root_of_dvd {r p : ℕ} (hdvd : ((r : ℤ) ^ 2 ∣ (p : ℤ) ^ 3 - (p : ℤ) ^ 2 - 12)) :
    (p : ZMod r) ^ 3 = (p : ZMod r) ^ 2 + 12 := by
  have h1 : (r : ℤ) ∣ (p : ℤ) ^ 3 - (p : ℤ) ^ 2 - 12 := (Dvd.intro_left _ (by ring)).trans hdvd
  have := (ZMod.intCast_zmod_eq_zero_iff_dvd _ r).2 h1
  push_cast at this
  linear_combination this

lemma eq_of_cast_eq {r p s : ℕ} (hp : p < r) (hs : s < r) (h : (p : ZMod r) = s) : p = s := by
  have := mod_eq_of_natCast h
  rwa [Nat.mod_eq_of_lt hp, Nat.mod_eq_of_lt hs] at this

/-- Soundness of one item. -/
lemma okEnt_sound (e : Ent) (h : okEnt e = true) (hr : e.r.Prime) (hr5 : 5 ≤ e.r) : Good e.r := by
  intro p hp hp5 hpr hdvd
  cases e with
  | none r =>
    simp only [Ent.r] at hr hdvd
    haveI := Fact.mk hr
    exact noRoot_sound h _ (root_of_dvd hdvd)
  | comp r d =>
    simp only [okEnt, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at h
    obtain ⟨⟨h1, h2⟩, h3⟩ := h
    simp only [Ent.r] at hr
    rcases hr.eq_one_or_self_of_dvd d (Nat.dvd_of_mod_eq_zero h3) with h | h <;> omega
  | one r s =>
    simp only [Ent.r] at hr hr5 hpr hdvd
    haveI := Fact.mk hr
    simp only [okEnt, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at h
    obtain ⟨⟨⟨⟨hlt, hsr⟩, hroot⟩, hpm⟩, hok⟩ := h
    have ha := root_of_dvd hdvd
    set a : ZMod r := (p : ZMod r)
    have hs : (s : ZMod r) ^ 3 = (s : ZMod r) ^ 2 + 12 := by
      have := natCast_eq_of_mod hroot; push_cast at this; linear_combination this
    have hfac : (a - s) * (a ^ 2 + ((s : ZMod r) - 1) * a + (s : ZMod r) * ((s : ZMod r) - 1)) = 0 := by
      linear_combination ha - hs
    rcases mul_eq_zero.1 hfac with h0 | h0
    · exact okRoot_sound hok hp hp5 (eq_of_cast_eq hpr hsr (sub_eq_zero.1 h0)) hdvd
    · -- the quadratic factor has no root: its discriminant is a non-residue
      have hr1 : 1 ≤ r := hr.one_lt.le
      have hodd : r % 2 = 1 := Nat.odd_iff.1 (hr.odd_of_ne_two (by omega))
      have hb : (((s + r - 1) % r : ℕ) : ZMod r) = (s : ZMod r) - 1 := by
        rw [ZMod.natCast_mod, Nat.cast_sub (by omega)]; push_cast; simp
      have hc : (((s * ((s + r - 1) % r)) % r : ℕ) : ZMod r) = (s : ZMod r) * ((s : ZMod r) - 1) := by
        rw [ZMod.natCast_mod]; push_cast; rw [hb]
      have h4c : 4 * ((s * ((s + r - 1) % r)) % r) ≤ (s + r - 1) % r * ((s + r - 1) % r) + 4 * r * r := by
        have := Nat.mod_lt (s * ((s + r - 1) % r)) (by omega : r > 0)
        nlinarith
      set Dn := ((s + r - 1) % r * ((s + r - 1) % r) + 4 * r * r - 4 * ((s * ((s + r - 1) % r)) % r)) % r
        with hDn
      have hD : (Dn : ZMod r) = (2 * a + ((s : ZMod r) - 1)) ^ 2 := by
        rw [hDn, ZMod.natCast_mod, Nat.cast_sub h4c]; push_cast; rw [hb, hc]; simp
        linear_combination (-4) * h0
      rw [pm_eq r 21 _ _ (by omega)] at hpm
      have hpmZ : ((Dn ^ ((r - 1) / 2) : ℕ) : ZMod r) = ((r - 1 : ℕ) : ZMod r) :=
        natCast_eq_of_mod (by rw [hpm, Nat.mod_eq_of_lt (by omega)])
      rw [Nat.cast_pow, hD, ← pow_mul, show 2 * ((r - 1) / 2) = r - 1 by omega,
        Nat.cast_sub hr1] at hpmZ
      simp only [ZMod.natCast_self, Nat.cast_one, zero_sub] at hpmZ
      by_cases hz : 2 * a + ((s : ZMod r) - 1) = 0
      · rw [hz, zero_pow (by omega)] at hpmZ
        exact one_ne_zero (neg_eq_zero.1 hpmZ.symm)
      · rw [ZMod.pow_card_sub_one_eq_one hz] at hpmZ
        haveI : Fact (2 < r) := ⟨by omega⟩
        exact ZMod.neg_one_ne_one hpmZ.symm
  | three r s1 s2 s3 =>
    simp only [Ent.r] at hr hr5 hpr hdvd
    haveI := Fact.mk hr
    simp only [okEnt, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at h
    obtain ⟨⟨⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, he1⟩, he2⟩, he3⟩, ok1⟩, ok2⟩, ok3⟩ := h
    have ha := root_of_dvd hdvd
    set a : ZMod r := (p : ZMod r)
    have e1 := natCast_eq_of_mod he1
    have e2 := natCast_eq_of_mod (y := 0) (by rw [he2, Nat.zero_mod])
    have e3 := natCast_eq_of_mod he3
    push_cast at e1 e2 e3
    have hfac : (a - s1) * (a - s2) * (a - s3) = 0 := by
      linear_combination ha - a ^ 2 * e1 + a * e2 - e3
    rcases mul_eq_zero.1 hfac with h0 | h0
    · rcases mul_eq_zero.1 h0 with h0 | h0
      · exact okRoot_sound ok1 hp hp5 (eq_of_cast_eq hpr h1 (sub_eq_zero.1 h0)) hdvd
      · exact okRoot_sound ok2 hp hp5 (eq_of_cast_eq hpr h2 (sub_eq_zero.1 h0)) hdvd
    · exact okRoot_sound ok3 hp hp5 (eq_of_cast_eq hpr h3 (sub_eq_zero.1 h0)) hdvd

/-- **Soundness of `scan`.** -/
theorem scan_sound (hi : ℕ) : ∀ (f m : ℕ) (l : List Ent), scan hi f m l = true →
    ∀ r, m ≤ r → r ≤ hi → r.Prime → 5 ≤ r → Good r := by
  intro f
  induction f with
  | zero =>
    intro m l h r hm hr
    simp only [scan, decide_eq_true_eq] at h
    omega
  | succ f ih =>
    intro m l h r hm hrhi hr hr5
    unfold scan at h
    split_ifs at h with hlt
    · omega
    · rcases Nat.eq_or_lt_of_le hm with hmr | hm'
      · rw [← hmr] at hr hr5 ⊢
        cases l with
        | nil =>
          rw [Bool.and_eq_true] at h
          exact absurd hr (comp_sound h.1)
        | cons e rest =>
          simp only at h
          split_ifs at h with he
          · rw [Bool.and_eq_true] at h
            have he' : e.r = m := by simpa using he
            rw [← he']
            exact okEnt_sound e h.1 (he' ▸ hr) (he' ▸ hr5)
          · rw [Bool.and_eq_true] at h
            exact absurd hr (comp_sound h.1)
      · cases l with
        | nil =>
          rw [Bool.and_eq_true] at h
          exact ih _ _ h.2 r hm' hrhi hr hr5
        | cons e rest =>
          simp only at h
          split_ifs at h with he
          · rw [Bool.and_eq_true] at h
            exact ih _ _ h.2 r hm' hrhi hr hr5
          · rw [Bool.and_eq_true] at h
            exact ih _ _ h.2 r hm' hrhi hr hr5

end Hensel

end P2qJumps
