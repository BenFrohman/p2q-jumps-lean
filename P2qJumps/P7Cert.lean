/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.P7Defs
import P2qJumps.P7
import P2qJumps.TheoremsBE

/-!
# P2qJumps.P7Cert

A kernel certificate for the squarefree `p = 7` descent (paper Appendix `app:p7`) with a Lean
soundness proof. `desc` is a branch-and-bound checker over prefixes `b` of `N` (with
`h = φ(b)`, `s = σ(b)` computed as products of `x - 1` and `x + 1`). `desc_sound` proves that
whenever the checker returns `true`, no increasing list of integers `≥ 11`, prime to `210`,
satisfies the two `p = 7` identities `7 φ = 6 N - 282` and `49 σ = 57 N + 2697`. The checker is
evaluated by the kernel (`decide +kernel`, no `native_decide`) for `ω(N) = 7, 8, 9` in
`P2qJumps.P7Kernel`. With
Corollary F1 this proves H1: no solution with `N` squarefree and `ω(N) ≥ 4`.
-/

namespace P2qJumps

namespace P7Cert

open Nat ArithmeticFunction
open scoped ArithmeticFunction.sigma

/-! The checker `desc` (with `okR`, `terminal`, `loopR`) is defined in `P2qJumps.P7Defs`;
the kernel certificates `cert7`, `cert8`, `cert9` are in `P2qJumps.P7Kernel`. -/

/-! ## Products over a list -/

/-- `∏ x`, `∏ (x - 1)`, `∏ (x + 1)` over a list, in `ℤ`. -/
def PZ (l : List ℕ) : ℤ := (l.map (fun x : ℕ => (x : ℤ))).prod
/-- `∏ (x - 1)`. -/
def FmZ (l : List ℕ) : ℤ := (l.map (fun x : ℕ => (x : ℤ) - 1)).prod
/-- `∏ (x + 1)`. -/
def FpZ (l : List ℕ) : ℤ := (l.map (fun x : ℕ => (x : ℤ) + 1)).prod

@[simp] lemma PZ_cons (x : ℕ) (l : List ℕ) : PZ (x :: l) = x * PZ l := by simp [PZ]
@[simp] lemma FmZ_cons (x : ℕ) (l : List ℕ) : FmZ (x :: l) = ((x : ℤ) - 1) * FmZ l := by
  simp [FmZ]
@[simp] lemma FpZ_cons (x : ℕ) (l : List ℕ) : FpZ (x :: l) = ((x : ℤ) + 1) * FpZ l := by
  simp [FpZ]
@[simp] lemma PZ_nil : PZ [] = 1 := rfl
@[simp] lemma FmZ_nil : FmZ [] = 1 := rfl
@[simp] lemma FpZ_nil : FpZ [] = 1 := rfl

lemma bounds (l : List ℕ) (hl : ∀ x ∈ l, 1 ≤ x) :
    0 ≤ FmZ l ∧ FmZ l ≤ PZ l ∧ PZ l ≤ FpZ l ∧ FmZ l * FpZ l ≤ PZ l ^ 2 := by
  induction l with
  | nil => simp
  | cons x t ih =>
    have hx : (1 : ℤ) ≤ x := by exact_mod_cast hl x (by simp)
    obtain ⟨a1, a2, a3, a4⟩ := ih (fun y hy => hl y (by simp [hy]))
    simp only [FmZ_cons, PZ_cons, FpZ_cons]
    refine ⟨by nlinarith, by nlinarith, by nlinarith, ?_⟩
    have e : ((x : ℤ) - 1) * FmZ t * (((x : ℤ) + 1) * FpZ t) =
        ((x : ℤ) ^ 2 - 1) * (FmZ t * FpZ t) := by ring
    rw [e]
    have h0 : 0 ≤ FmZ t * FpZ t := mul_nonneg a1 (by linarith)
    calc ((x : ℤ) ^ 2 - 1) * (FmZ t * FpZ t) ≤ (x : ℤ) ^ 2 * (FmZ t * FpZ t) := by nlinarith
      _ ≤ (x : ℤ) ^ 2 * PZ t ^ 2 := mul_le_mul_of_nonneg_left a4 (by positivity)
      _ = ((x : ℤ) * PZ t) ^ 2 := by ring

lemma PZ_ge (l : List ℕ) (c : ℕ) (hl : ∀ x ∈ l, c ≤ x) : (c : ℤ) ^ l.length ≤ PZ l := by
  induction l with
  | nil => simp
  | cons x t ih =>
    have hx : (c : ℤ) ≤ x := by exact_mod_cast hl x (by simp)
    have := ih (fun y hy => hl y (by simp [hy]))
    simp only [PZ_cons, List.length_cons, pow_succ]
    have hc : (0 : ℤ) ≤ c := by positivity
    calc (c : ℤ) ^ t.length * c ≤ PZ t * c := mul_le_mul_of_nonneg_right this hc
      _ ≤ PZ t * x := mul_le_mul_of_nonneg_left hx (le_trans (pow_nonneg hc _) this)
      _ = x * PZ t := by ring

lemma phi_aux (l : List ℕ) (r : ℕ) (hr : 1 ≤ r) (hl : ∀ x ∈ l, r ≤ x) :
    ((r : ℤ) - 1) ^ l.length * PZ l ≤ (r : ℤ) ^ l.length * FmZ l := by
  induction l with
  | nil => simp
  | cons x t ih =>
    have hx : (r : ℤ) ≤ x := by exact_mod_cast hl x (by simp)
    have hr' : (1 : ℤ) ≤ r := by exact_mod_cast hr
    have := ih (fun y hy => hl y (by simp [hy]))
    have hb := bounds t (fun y hy => le_trans hr (hl y (by simp [hy])))
    have hP : 0 ≤ PZ t := le_trans hb.1 hb.2.1
    simp only [PZ_cons, FmZ_cons, List.length_cons, pow_succ]
    have e1 : ((r : ℤ) - 1) ^ t.length * ((r : ℤ) - 1) * ((x : ℤ) * PZ t) =
        (((r : ℤ) - 1) * x) * (((r : ℤ) - 1) ^ t.length * PZ t) := by ring
    have e2 : (r : ℤ) ^ t.length * r * (((x : ℤ) - 1) * FmZ t) =
        ((r : ℤ) * ((x : ℤ) - 1)) * ((r : ℤ) ^ t.length * FmZ t) := by ring
    rw [e1, e2]
    apply mul_le_mul (by nlinarith) this (mul_nonneg (pow_nonneg (by linarith) _) hP)
      (by nlinarith)

lemma sig_aux (l : List ℕ) (r : ℕ) (hr : 1 ≤ r) (hl : ∀ x ∈ l, r ≤ x) :
    (r : ℤ) ^ l.length * FpZ l ≤ ((r : ℤ) + 1) ^ l.length * PZ l := by
  induction l with
  | nil => simp
  | cons x t ih =>
    have hx : (r : ℤ) ≤ x := by exact_mod_cast hl x (by simp)
    have hr0 : (0 : ℤ) ≤ r := by positivity
    have := ih (fun y hy => hl y (by simp [hy]))
    have hb := bounds t (fun y hy => le_trans hr (hl y (by simp [hy])))
    simp only [PZ_cons, FpZ_cons, List.length_cons, pow_succ]
    have e1 : (r : ℤ) ^ t.length * r * (((x : ℤ) + 1) * FpZ t) =
        ((r : ℤ) * ((x : ℤ) + 1)) * ((r : ℤ) ^ t.length * FpZ t) := by ring
    have e2 : ((r : ℤ) + 1) ^ t.length * ((r : ℤ) + 1) * ((x : ℤ) * PZ t) =
        (((r : ℤ) + 1) * x) * (((r : ℤ) + 1) ^ t.length * PZ t) := by ring
    rw [e1, e2]
    have hFp : 0 ≤ FpZ t := le_trans (le_trans hb.1 hb.2.1) hb.2.2.1
    apply mul_le_mul (by nlinarith) this (mul_nonneg (pow_nonneg hr0 _) hFp) (by nlinarith)

/-! ## Soundness -/

lemma loopR_sound (child ok : ℕ → Bool) :
    ∀ (F r0 r : ℕ), loopR child ok F r0 = true → r0 ≤ r →
      (∀ r', r0 ≤ r' → r' ≤ r → ok r' = true) → Nat.gcd r 210 = 1 → child r = true := by
  intro F
  induction F with
  | zero => intro r0 r h; simp [loopR] at h
  | succ F ih =>
    intro r0 r h hr hok hg
    have h0 := hok r0 le_rfl hr
    simp only [loopR, h0, if_true, Bool.and_eq_true] at h
    rcases Nat.eq_or_lt_of_le hr with heq | hlt
    · subst heq; simpa [hg] using h.1
    · exact ih (r0 + 1) r h.2 hlt (fun r' h1 h2 => hok r' (by omega) h2) hg

lemma terminal_sound (b h s : ℤ) (x y : ℕ)
    (E1 : 7 * h * (((x : ℤ) - 1) * ((y : ℤ) - 1)) = 6 * b * ((x : ℤ) * y) - 282)
    (E2 : 49 * s * (((x : ℤ) + 1) * ((y : ℤ) + 1)) = 57 * b * ((x : ℤ) * y) + 2697) :
    terminal b h s = false := by
  set det := 2 * (7 * h) * (49 * s) - 6 * b * (49 * s) - 57 * b * (7 * h) with hdet
  set Pn := (-282 - 7 * h) * (49 * s) + 7 * h * (2697 - 49 * s) with hPn
  have key : det * ((x : ℤ) * y) = Pn := by
    rw [hdet, hPn]; linear_combination (49 * s) * E1 + (7 * h) * E2
  unfold terminal
  rw [← hdet, ← hPn]
  by_cases h0 : det = 0
  · simp [h0]
  · have h1 : Pn % det = 0 := by rw [← key]; exact Int.mul_emod_right _ _
    have h2 : Pn / det = (x : ℤ) * y := by rw [← key]; exact Int.mul_ediv_cancel_left _ h0
    have h3 : (6 * b * (Pn / det) - 282) % (7 * h) = 0 := by
      rw [h2, ← E1]; exact Int.mul_emod_right _ _
    simp [h1, h3]

set_option maxHeartbeats 1000000 in
/-- **Soundness of the descent.** -/
theorem desc_sound : ∀ (fuel : ℕ) (b h s : ℤ) (last : ℕ) (l : List ℕ),
    l.Pairwise (· < ·) → (∀ x ∈ l, last < x ∧ 11 ≤ x ∧ Nat.gcd x 210 = 1) → 10 ≤ last →
    0 ≤ b → 0 ≤ h → 0 ≤ s →
    7 * h * FmZ l = 6 * b * PZ l - 282 → 49 * s * FpZ l = 57 * b * PZ l + 2697 →
    desc fuel b h s last l.length = true → False := by
  intro fuel
  induction fuel with
  | zero => intro b h s last l _ _ _ _ _ _ _ _ hd; simp [desc] at hd
  | succ fuel ih =>
    intro b h s last l hsort hl hlast hb hh hs E1 E2 hd
    have hl1 : ∀ x ∈ l, 1 ≤ x := fun x hx => by have := (hl x hx).2.1; omega
    obtain ⟨B1, B2, B3, B4⟩ := bounds l hl1
    have hM11 := PZ_ge l 11 (fun x hx => (hl x hx).2.1)
    have hMpos : 0 < PZ l := lt_of_lt_of_le (by positivity) hM11
    simp only [desc] at hd
    by_cases hm2 : l.length = 2
    · rw [if_pos hm2] at hd
      match l, hm2 with
      | [x, y], _ =>
        simp only [FmZ_cons, PZ_cons, FpZ_cons, FmZ_nil, PZ_nil, FpZ_nil, mul_one] at E1 E2
        have := terminal_sound b h s x y (by linear_combination E1) (by linear_combination E2)
        rw [this] at hd; exact Bool.false_ne_true hd
    rw [if_neg hm2] at hd
    by_cases hm1 : l.length < 2
    · rw [if_pos hm1] at hd; exact Bool.false_ne_true hd
    rw [if_neg hm1] at hd
    have hm3 : 3 ≤ l.length := by omega
    have hM1331 : (1331 : ℤ) ≤ PZ l := by
      have : (11 : ℤ) ^ 3 ≤ (11 : ℤ) ^ l.length := pow_le_pow_right₀ (by norm_num) hm3
      push_cast at hM11; linarith
    by_cases hd1 : 1 ≤ 6 * b - 7 * h
    · -- `d M ≤ 282`
      have : (6 * b - 7 * h) * PZ l ≤ 282 := by nlinarith
      nlinarith
    rw [if_neg hd1] at hd
    by_cases he1 : 1 ≤ 49 * s - 57 * b
    · rw [if_pos he1] at hd
      have h12 : 12 ≤ last := by simpa using hd
      match l, hsort, hl, hm3 with
      | x1 :: x2 :: x3 :: t, hsort, hl, _ =>
        have h1 := (hl x1 (by simp)).1
        have p12 : x1 < x2 := List.rel_of_pairwise_cons hsort (by simp)
        have p23 : x2 < x3 := List.rel_of_pairwise_cons (List.Pairwise.of_cons hsort) (by simp)
        have ht : (1 : ℤ) ≤ PZ t := by
          have := PZ_ge t 1 (fun y hy => hl1 y (by simp [hy])); simpa using this
        have hbig : (2730 : ℤ) ≤ PZ (x1 :: x2 :: x3 :: t) := by
          simp only [PZ_cons]
          have a1 : (13 : ℤ) ≤ x1 := by exact_mod_cast (by omega : 13 ≤ x1)
          have a2 : (14 : ℤ) ≤ x2 := by exact_mod_cast (by omega : 14 ≤ x2)
          have a3 : (15 : ℤ) ≤ x3 := by exact_mod_cast (by omega : 15 ≤ x3)
          have : (13 * 14 * 15 : ℤ) * 1 ≤ x1 * x2 * x3 * PZ t := by
            apply mul_le_mul _ ht (by norm_num) (by positivity)
            apply mul_le_mul _ a3 (by norm_num) (by positivity)
            exact mul_le_mul a1 a2 (by norm_num) (by positivity)
          nlinarith
        have : (49 * s - 57 * b) * PZ (x1 :: x2 :: x3 :: t) ≤ 2697 := by nlinarith
        nlinarith
    rw [if_neg he1] at hd
    by_cases h00 : 6 * b - 7 * h = 0 ∨ 49 * s - 57 * b = 0
    · rcases h00 with h0 | h0
      · have : 7 * (h * (PZ l - FmZ l)) = 282 := by linear_combination -E1 - PZ l * h0
        omega
      · have : 49 * (s * (FpZ l - PZ l)) = 2697 := by linear_combination E2 - PZ l * h0
        omega
    rw [if_neg h00] at hd
    by_cases hpr : 1 ≤ 342 * b * b - 343 * h * s
    · have hid : 343 * (h * FmZ l) * (s * FpZ l) =
          342 * (b * PZ l) ^ 2 + 108 * (b * PZ l) - 760554 := by
        linear_combination (49 * s * FpZ l) * E1 + (6 * b * PZ l - 282) * E2
      have := p7_prefix_bound b h s (PZ l) (FmZ l) (FpZ l) hb hh hs hMpos.le B4 hid
        (by nlinarith)
      linarith
    rw [if_neg hpr] at hd
    -- branching on the smallest remaining element
    match l, hsort, hl, hm3, E1, E2, hd with
    | r :: t, hsort, hl, _, E1, E2, hd =>
      have hr := hl r (by simp)
      have hrt : ∀ x ∈ t, r < x := fun x hx => List.rel_of_pairwise_cons hsort hx
      have hall : ∀ x ∈ r :: t, r ≤ x := by
        intro x hx; rcases List.mem_cons.1 hx with rfl | hx; exact le_rfl; exact (hrt x hx).le
      have hok : ∀ r', max (last + 1) 11 ≤ r' → r' ≤ r → okR b h s (r :: t).length r' = true := by
        intro r' h1 h2
        have hr'1 : 1 ≤ r' := by omega
        have hall' : ∀ x ∈ r :: t, r' ≤ x := fun x hx => le_trans h2 (hall x hx)
        have A := phi_aux (r :: t) r' hr'1 hall'
        have S := sig_aux (r :: t) r' hr'1 hall'
        have hrpos : (0 : ℤ) < (r' : ℤ) ^ (r :: t).length := by
          have : (0 : ℤ) < r' := by exact_mod_cast hr'1
          positivity
        simp only [okR, Bool.and_eq_true, decide_eq_true_eq]
        constructor
        · have h7 := mul_le_mul_of_nonneg_left A (by linarith : (0 : ℤ) ≤ 7 * h)
          have : 7 * h * ((r' : ℤ) - 1) ^ (r :: t).length * PZ (r :: t) <
              6 * b * (r' : ℤ) ^ (r :: t).length * PZ (r :: t) :=
            calc 7 * h * ((r' : ℤ) - 1) ^ (r :: t).length * PZ (r :: t)
                = 7 * h * (((r' : ℤ) - 1) ^ (r :: t).length * PZ (r :: t)) := by ring
              _ ≤ 7 * h * ((r' : ℤ) ^ (r :: t).length * FmZ (r :: t)) := h7
              _ = (r' : ℤ) ^ (r :: t).length * (7 * h * FmZ (r :: t)) := by ring
              _ = (r' : ℤ) ^ (r :: t).length * (6 * b * PZ (r :: t) - 282) := by rw [E1]
              _ = 6 * b * (r' : ℤ) ^ (r :: t).length * PZ (r :: t)
                  - 282 * (r' : ℤ) ^ (r :: t).length := by ring
              _ < 6 * b * (r' : ℤ) ^ (r :: t).length * PZ (r :: t) := by linarith
          exact lt_of_mul_lt_mul_right this hMpos.le
        · have h49 := mul_le_mul_of_nonneg_left S (by linarith : (0 : ℤ) ≤ 49 * s)
          have : 57 * b * (r' : ℤ) ^ (r :: t).length * PZ (r :: t) <
              49 * s * ((r' : ℤ) + 1) ^ (r :: t).length * PZ (r :: t) :=
            calc 57 * b * (r' : ℤ) ^ (r :: t).length * PZ (r :: t)
                < 57 * b * (r' : ℤ) ^ (r :: t).length * PZ (r :: t)
                  + 2697 * (r' : ℤ) ^ (r :: t).length := by linarith
              _ = (r' : ℤ) ^ (r :: t).length * (57 * b * PZ (r :: t) + 2697) := by ring
              _ = (r' : ℤ) ^ (r :: t).length * (49 * s * FpZ (r :: t)) := by rw [E2]
              _ = 49 * s * ((r' : ℤ) ^ (r :: t).length * FpZ (r :: t)) := by ring
              _ ≤ 49 * s * (((r' : ℤ) + 1) ^ (r :: t).length * PZ (r :: t)) := h49
              _ = 49 * s * ((r' : ℤ) + 1) ^ (r :: t).length * PZ (r :: t) := by ring
          exact lt_of_mul_lt_mul_right this hMpos.le
      have hchild := loopR_sound _ _ 300 (max (last + 1) 11) r hd
        (by have := hr.1; have := hr.2.1; omega) hok hr.2.2
      simp only [List.length_cons, Nat.add_sub_cancel] at hchild
      simp only [FmZ_cons, PZ_cons, FpZ_cons] at E1 E2
      have hr1 : (1 : ℤ) ≤ r := by exact_mod_cast (by have := hr.2.1; omega : 1 ≤ r)
      exact ih (b * r) (h * ((r : ℤ) - 1)) (s * ((r : ℤ) + 1)) r t
        (List.Pairwise.of_cons hsort)
        (fun x hx => ⟨hrt x hx, (hl x (by simp [hx])).2⟩) (by have := hr.2.1; omega)
        (mul_nonneg hb (by positivity)) (mul_nonneg hh (by linarith)) (mul_nonneg hs (by linarith))
        (by linear_combination E1) (by linear_combination E2) hchild

end P7Cert

end P2qJumps
