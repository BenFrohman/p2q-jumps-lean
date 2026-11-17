/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Ext.TheoremD.FourAnalytic

/-!
# P2qJumps.Ext.TheoremD.FiniteProduct

Machine-checked Lean 4 module.
-/

open scoped BigOperators
namespace P2qTheoremD

lemma four_delta_bound (a b c d : ℝ)
    (ha : 1 ≤ a) (hb : 1 ≤ b) (hc : 1 ≤ c) (hd : 1 ≤ d) :
    12*Real.sqrt (a*b*c*d) ≤
      (a+1)*(b+1)*(c+1)*(d+1)+(a-1)*(b-1)*(c-1)*(d-1)-2*(a*b*c*d) := by
  let z := Real.sqrt (a*b*c*d)
  have hz : 0 ≤ z := Real.sqrt_nonneg _
  have ha0 : 0 ≤ a := by linarith
  have hb0 : 0 ≤ b := by linarith
  have hc0 : 0 ≤ c := by linarith
  have hd0 : 0 ≤ d := by linarith
  have hz2 : z^2 = a*b*c*d := Real.sq_sqrt (by positivity)
  have h1 : 2*z ≤ a*b+c*d := by
    have hn : 0 ≤ a*b+c*d := by positivity
    nlinarith [sq_nonneg (a*b-c*d)]
  have h2 : 2*z ≤ a*c+b*d := by
    have hn : 0 ≤ a*c+b*d := by positivity
    nlinarith [sq_nonneg (a*c-b*d)]
  have h3 : 2*z ≤ a*d+b*c := by
    have hn : 0 ≤ a*d+b*c := by positivity
    nlinarith [sq_nonneg (a*d-b*c)]
  change 12*z ≤ _
  nlinarith only [h1,h2,h3]

/-- A four-factor core gives a square-root delta bound for arbitrarily many factors. -/
lemma finite_delta_bound {ι : Type*} (s : Finset ι) (x : ι → ℝ)
    (hx : ∀ i ∈ s, 1 ≤ x i) (hk : 4 ≤ s.card) :
    12*Real.sqrt (∏ i ∈ s, x i) ≤
      (∏ i ∈ s, (x i+1))+(∏ i ∈ s, (x i-1))-2*(∏ i ∈ s, x i) := by
  classical
  induction s using Finset.induction_on with
  | empty => simp at hk
  | @insert a s ha ih =>
    have hxa := hx a (Finset.mem_insert_self a s)
    have hxs : ∀ i ∈ s, 1 ≤ x i := fun i hi => hx i (Finset.mem_insert_of_mem hi)
    by_cases hs : 4 ≤ s.card
    · have h := ih hxs hs
      have hn : 0 ≤ ∏ i ∈ s, x i := Finset.prod_nonneg (fun i hi => by linarith [hxs i hi])
      have hF : 0 ≤ ∏ i ∈ s, (x i-1) := Finset.prod_nonneg (fun i hi => by linarith [hxs i hi])
      have hSF : (∏ i ∈ s, (x i-1)) ≤ ∏ i ∈ s, (x i+1) :=
        Finset.prod_le_prod (fun i hi => by linarith [hxs i hi]) (fun i hi => by linarith)
      have hr : 0 ≤ Real.sqrt (∏ i ∈ s, x i) := Real.sqrt_nonneg _
      have hr2 := Real.sq_sqrt hn
      have hr' : 0 ≤ Real.sqrt (x a*(∏ i ∈ s, x i)) := Real.sqrt_nonneg _
      have hr2' := Real.sq_sqrt (show 0 ≤ x a*(∏ i ∈ s, x i) by positivity)
      have hroot : Real.sqrt (x a*(∏ i ∈ s, x i)) ≤ x a*Real.sqrt (∏ i ∈ s, x i) := by
        have hxa0 : 0 ≤ x a := by linarith
        have hxa1 : 0 ≤ x a-1 := by linarith
        have hh := mul_nonneg (mul_nonneg hxa0 hxa1) hn
        have hpos : 0 ≤ x a*Real.sqrt (∏ i ∈ s, x i) := by positivity
        have he : (x a*Real.sqrt (∏ i ∈ s, x i))^2 = (x a)^2*(∏ i ∈ s, x i) := by rw [mul_pow,hr2]
        nlinarith only [he,hr2',hh,hr',hpos]
      simp only [Finset.prod_insert ha]
      nlinarith [mul_le_mul_of_nonneg_left h (show 0 ≤ x a by linarith)]
    · have hk4 : (insert a s).card = 4 := by rw [Finset.card_insert_of_notMem ha] at hk ⊢; omega
      obtain ⟨a',b,c,d,hab,hac,had,hbc,hbd,hcd,hset⟩ := Finset.card_eq_four.mp hk4
      have hx' : ∀ i ∈ ({a',b,c,d} : Finset ι), 1 ≤ x i := by simpa only [hset] using hx
      have h := four_delta_bound (x a') (x b) (x c) (x d)
        (hx' a' (by simp)) (hx' b (by simp)) (hx' c (by simp)) (hx' d (by simp))
      simpa [hset,hab,hac,had,hbc,hbd,hcd,mul_assoc] using h

lemma root_step (a n k : ℝ) (ha : 3 ≤ a) (hn : 0 ≤ n) (hk : 4 ≤ k) :
    (k+1)*Real.sqrt (a*n) ≤ a*(k-1)*Real.sqrt n := by
  have ha0 : 0 ≤ a := by linarith
  have hk0 : 0 ≤ k-1 := by linarith
  have hcoeff : (k+1)^2 ≤ a*(k-1)^2 := by
    nlinarith [sq_nonneg (k-4), mul_nonneg (show 0 ≤ a-3 by linarith) (sq_nonneg (k-1))]
  have hm := mul_nonneg (mul_nonneg ha0 hn) (sub_nonneg.mpr hcoeff)
  have he1 : ((k+1)*Real.sqrt (a*n))^2 = (k+1)^2*a*n := by
    rw [mul_pow, Real.sq_sqrt (mul_nonneg ha0 hn)]
    ring
  have he2 : (a*(k-1)*Real.sqrt n)^2 = a^2*(k-1)^2*n := by
    rw [mul_pow,Real.sq_sqrt hn]
    ring
  have hL : 0 ≤ (k+1)*Real.sqrt (a*n) := by positivity
  have hR : 0 ≤ a*(k-1)*Real.sqrt n := by positivity
  nlinarith only [hm,he1,he2,hL,hR]

/-- For factors at least three, elementary induction proves the full k(k−1) bound.
No real-exponent AM–GM estimate is taken as a hypothesis. -/
lemma finite_delta_bound_sharp {ι : Type*} (s : Finset ι) (x : ι → ℝ)
    (hx : ∀ i ∈ s, 3 ≤ x i) (hk : 4 ≤ s.card) :
    (s.card : ℝ)*((s.card : ℝ)-1)*Real.sqrt (∏ i ∈ s, x i) ≤
      (∏ i ∈ s, (x i+1))+(∏ i ∈ s, (x i-1))-2*(∏ i ∈ s, x i) := by
  classical
  induction s using Finset.induction_on with
  | empty => simp at hk
  | @insert a s ha ih =>
    have hxa := hx a (Finset.mem_insert_self a s)
    have hxs : ∀ i ∈ s, 3 ≤ x i := fun i hi => hx i (Finset.mem_insert_of_mem hi)
    by_cases hs : 4 ≤ s.card
    · have h := ih hxs hs
      have hn : 0 ≤ ∏ i ∈ s, x i := Finset.prod_nonneg (fun i hi => by linarith [hxs i hi])
      have hSF : (∏ i ∈ s, (x i-1)) ≤ ∏ i ∈ s, (x i+1) :=
        Finset.prod_le_prod (fun i hi => by linarith [hxs i hi]) (fun i hi => by linarith)
      have hkR : (4:ℝ) ≤ s.card := by exact_mod_cast hs
      have hroot := root_step (x a) (∏ i ∈ s, x i) s.card hxa hn hkR
      have hmult := mul_le_mul_of_nonneg_left hroot (show (0:ℝ) ≤ s.card by positivity)
      have hmult2 := mul_le_mul_of_nonneg_left h (show 0 ≤ x a by linarith)
      simp only [Finset.prod_insert ha,Finset.card_insert_of_notMem ha,Nat.cast_add,Nat.cast_one]
      nlinarith only [hmult,hmult2,hSF]
    · have hk4 : (insert a s).card = 4 := by rw [Finset.card_insert_of_notMem ha] at hk ⊢; omega
      have h := finite_delta_bound (insert a s) x (fun i hi => by linarith [hx i hi]) hk
      simpa only [hk4,Nat.cast_ofNat,show (4:ℝ)*(4-1)=12 by norm_num] using h

end P2qTheoremD
