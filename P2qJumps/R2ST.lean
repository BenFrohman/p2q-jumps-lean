/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Tactic
import P2qJumps.Arith
import P2qJumps.Q_neg_positivity

/-!
# The shape `N = r^2 s t`: reduction to the line `r = p + 4`

Paper, Theorem 2(c): if `N = r^2 s t` then `σ = s + t`, `π = s t` and `q` are rational functions
of `(p, r)` with denominator `Q(p, r) = p r + 2 p - r^2 + r`. Here the three jump identities are
used directly as integer linear relations:

* `r Q σ = -A(p, r)` and `r (p - r) Q π = B(p, r)` (Cramer's rule, cleared);
* `(p - r) A^2 - 4 r Q B = H(p, r)` (polynomial identity), so
  `r^2 (p - r) Q^2 (s - t)^2 = H(p, r)`.

Consequences (all unconditional):
* `p > r`: `Q > 0` and `A > 0`, so `σ < 0`; impossible.
* `r = p + 2`: `Q = p - 2 > 0` and `A > 0`; impossible.
* `r ≥ p + 6`: `H > 0` (positive-coefficient certificate `H_positive_on_region`) while the left side
  is `≤ 0`; impossible.
* `r = p + 4` is the only surviving line, and there `(p+4)^2 (p+12)^2 (s-t)^2 = 2 F(p)`.
-/

namespace P2qJumps

open Nat ArithmeticFunction
open scoped ArithmeticFunction.sigma

/-- `Q(p, r) = p r + 2 p - r^2 + r`, the common denominator in Theorem 2(c). -/
def Qpoly (p r : ℤ) : ℤ := p * r + 2 * p - r ^ 2 + r

/-- Minus the numerator of `σ = s + t` in Theorem 2(c), equation (5). -/
def Apoly (p r : ℤ) : ℤ :=
  p ^ 3 - p ^ 2 * r - p ^ 2 + 2 * p * r ^ 3 + p * r ^ 2 - 2 * p * r + r ^ 3 - r ^ 2 - 12

/-- Numerator of `π = s t` in Theorem 2(c), equation (6). -/
def Bpoly (p r : ℤ) : ℤ :=
  2 * p ^ 4 * r + p ^ 4 - 2 * p ^ 3 * r ^ 2 - p ^ 3 + 2 * p ^ 2 * r ^ 4 - p ^ 2 * r ^ 2 - p ^ 2 * r
    - 24 * p * r - 12 * p + 12 * r ^ 2 - 12 * r

/-- The octic `F(p)` of the paper's Theorem "The line r = p + 4". -/
def F8 (p : ℤ) : ℤ :=
  p ^ 8 + 20 * p ^ 7 + 158 * p ^ 6 + 685 * p ^ 5 + 2064 * p ^ 4 + 4836 * p ^ 3 + 7976 * p ^ 2
    + 5760 * p - 2808

lemma discriminant_identity (p r : ℤ) :
    (p - r) * Apoly p r ^ 2 - 4 * r * Qpoly p r * Bpoly p r = H p r := by
  unfold Apoly Qpoly Bpoly H; ring

lemma H_line_p4 (p : ℤ) : H p (p + 4) = -8 * F8 p := by
  unfold H F8; ring

lemma A_pos_of_gt (a u : ℕ) : Apoly (6 + a + u) (5 + a) > 0 := by
  unfold Apoly; ring_nf; positivity

lemma Q_pos_of_gt (a u : ℕ) : Qpoly (6 + a + u) (5 + a) > 0 := by
  unfold Qpoly; ring_nf; positivity

lemma A_pos_line_p2 (u : ℕ) : Apoly (5 + u) (7 + u) > 0 := by
  unfold Apoly; ring_nf; positivity

/-- Integer linear consequences of the jumps on the shape `r^2 s t` (Cramer's rule, cleared). -/
lemma r2st_linear {p q r s t : ℤ}
    (E0 : r ^ 2 * (s * t) = p ^ 2 * q + 12)
    (E1 : r * (r - 1) * (s - 1) * (t - 1) = p * (p - 1) * (q - 1) + 12)
    (E2 : (r ^ 2 + r + 1) * (s + 1) * (t + 1) = (p ^ 2 + p + 1) * (q + 1) + 12) :
    r * Qpoly p r * (s + t) = -Apoly p r ∧ r * (p - r) * Qpoly p r * (s * t) = Bpoly p r := by
  unfold Qpoly Apoly Bpoly
  constructor
  · linear_combination (-2 * p * r - p - r + 1) * E0 + (p * r + p + r) * E1 + (p * r) * E2
  · linear_combination (2 * p ^ 2 * r ^ 2 + p ^ 2 - 2 * p * r - p + r ^ 2 - r) * E0
      + (-p ^ 2 * (r ^ 2 + r + 1)) * E1 + (-p ^ 2 * r * (r - 1)) * E2

/-- Paper Theorem 2(c) plus the discriminant identity, as one integer identity. -/
lemma r2st_disc {p q r s t : ℤ}
    (E0 : r ^ 2 * (s * t) = p ^ 2 * q + 12)
    (E1 : r * (r - 1) * (s - 1) * (t - 1) = p * (p - 1) * (q - 1) + 12)
    (E2 : (r ^ 2 + r + 1) * (s + 1) * (t + 1) = (p ^ 2 + p + 1) * (q + 1) + 12) :
    r ^ 2 * (p - r) * Qpoly p r ^ 2 * (s - t) ^ 2 = H p r := by
  obtain ⟨hS, hP⟩ := r2st_linear E0 E1 E2
  rw [← discriminant_identity]
  have : r ^ 2 * (p - r) * Qpoly p r ^ 2 * (s - t) ^ 2
      = (p - r) * (r * Qpoly p r * (s + t)) ^ 2 - 4 * r * Qpoly p r *
          (r * (p - r) * Qpoly p r * (s * t)) := by ring
  rw [this, hS, hP]; ring

/-- **Shape `r^2 s t`.** If both jumps hold at `n = p^2 q` (distinct primes) and
`n + 12 = r^2 s t` with pairwise distinct primes `r, s, t ≥ 5`, then `r = p + 4` and
`(p+4)^2 (p+12)^2 (s-t)^2 = 2 F(p)`; in particular `2 F(p)` is a perfect square. -/
theorem r2st_reduction {p q r s t : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime)
    (hs : s.Prime) (ht : t.Prime) (hpq : p ≠ q) (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t)
    (hr5 : 5 ≤ r) (hs5 : 5 ≤ s) (ht5 : 5 ≤ t) (hJ : Jumps (p ^ 2 * q))
    (hN : p ^ 2 * q + 12 = r ^ 2 * s * t) :
    r = p + 4 ∧
      ((p : ℤ) + 4) ^ 2 * ((p : ℤ) + 12) ^ 2 * ((s : ℤ) - t) ^ 2 = 2 * F8 p := by
  -- `N` is coprime to `6`, hence `p ≥ 5` and `p ∤ N`.
  have hndvd : ∀ d, (d = 2 ∨ d = 3) → ¬ d ∣ r ^ 2 * s * t := by
    intro d hd hdvd
    have hdp : d.Prime := by rcases hd with rfl | rfl <;> norm_num
    rcases (Nat.Prime.dvd_mul hdp).1 hdvd with h | h
    · rcases (Nat.Prime.dvd_mul hdp).1 h with h | h
      · exact prime_ge_five_not_dvd hr hr5 d hd (hdp.dvd_of_dvd_pow h)
      · exact prime_ge_five_not_dvd hs hs5 d hd h
    · exact prime_ge_five_not_dvd ht ht5 d hd h
  obtain ⟨hp5, hpN⟩ := p_ge_five_of_dvd hp hN (hndvd 2 (Or.inl rfl)) (hndvd 3 (Or.inr rfl))
  have hpr : p ≠ r := by
    rintro rfl
    exact hpN ⟨p * s * t, by ring⟩
  -- Integer form of the three identities.
  obtain ⟨j1, j2⟩ := jumps_p2q_int hp hq hpq hJ
  obtain ⟨f1, f2⟩ := totient_sigma_r2st hr hs ht hrs hrt hst
  rw [hN] at j1 j2
  have E0 : (r : ℤ) ^ 2 * ((s : ℤ) * t) = (p : ℤ) ^ 2 * q + 12 := by
    have := congrArg (fun x : ℕ => (x : ℤ)) hN; push_cast at this; linarith
  have E1 : (r : ℤ) * (r - 1) * (s - 1) * (t - 1) = (p : ℤ) * (p - 1) * (q - 1) + 12 := by
    rw [← f1, j1]
  have E2 : ((r : ℤ) ^ 2 + r + 1) * (s + 1) * (t + 1) = ((p : ℤ) ^ 2 + p + 1) * (q + 1) + 12 := by
    rw [← f2, j2]
  obtain ⟨hS, _⟩ := r2st_linear E0 E1 E2
  have hD := r2st_disc E0 E1 E2
  have hsZ : (0 : ℤ) < (s : ℤ) + t := by positivity
  have hrZ : (0 : ℤ) < r := by exact_mod_cast hr.pos
  -- Parity: `p` and `r` are odd.
  have hpodd : p % 2 = 1 := Nat.odd_iff.1 (hp.odd_of_ne_two (by omega))
  have hrodd : r % 2 = 1 := Nat.odd_iff.1 (hr.odd_of_ne_two (by omega))
  rcases lt_or_gt_of_ne hpr with hlt | hgt
  · -- `p < r`: `r = p + 2`, `r = p + 4`, or `r ≥ p + 6`.
    have hcases : r = p + 2 ∨ r = p + 4 ∨ p + 6 ≤ r := by omega
    rcases hcases with h2 | h4 | h6
    · exfalso
      obtain ⟨u, rfl⟩ : ∃ u, p = 5 + u := ⟨p - 5, by omega⟩
      subst h2
      have hA := A_pos_line_p2 u
      have hQ : Qpoly ((5 + u : ℕ) : ℤ) ((5 + u + 2 : ℕ) : ℤ) > 0 := by
        unfold Qpoly; push_cast; ring_nf; positivity
      push_cast at hS hQ
      have e : ((5 : ℤ) + u + 2) = 7 + u := by ring
      rw [e] at hS hQ
      have : (0 : ℤ) < (7 + u) * Qpoly (5 + u) (7 + u) * ((s : ℤ) + t) := by positivity
      linarith
    · refine ⟨h4, ?_⟩
      subst h4
      push_cast at hD
      rw [H_line_p4] at hD
      unfold Qpoly at hD
      have hQ : (p : ℤ) * (p + 4) + 2 * p - (p + 4) ^ 2 + (p + 4) = -((p : ℤ) + 12) := by ring
      rw [hQ] at hD
      linarith
    · exfalso
      obtain ⟨u, rfl⟩ : ∃ u, p = 5 + u := ⟨p - 5, by omega⟩
      obtain ⟨v, rfl⟩ : ∃ v, r = 11 + u + v := ⟨r - 11 - u, by omega⟩
      have hH := H_positive_on_region u v
      push_cast at hD
      have hneg : ((5 : ℤ) + u - (11 + u + v)) < 0 := by linarith
      have h1 : (0 : ℤ) ≤ ((11 : ℤ) + u + v) ^ 2 * Qpoly (5 + u) (11 + u + v) ^ 2 *
          ((s : ℤ) - t) ^ 2 := by positivity
      have h2 : ((11 : ℤ) + u + v) ^ 2 * ((5 : ℤ) + u - (11 + u + v)) *
          Qpoly (5 + u) (11 + u + v) ^ 2 * ((s : ℤ) - t) ^ 2 ≤ 0 := by
        have := mul_nonpos_of_nonneg_of_nonpos h1 hneg.le
        linarith [this]
      linarith
  · -- `p > r`: `σ = s + t < 0`.
    exfalso
    obtain ⟨a, rfl⟩ : ∃ a, r = 5 + a := ⟨r - 5, by omega⟩
    obtain ⟨u, rfl⟩ : ∃ u, p = 6 + a + u := ⟨p - 6 - a, by omega⟩
    have hA := A_pos_of_gt a u
    have hQ := Q_pos_of_gt a u
    push_cast at hS hrZ
    have : (0 : ℤ) < (5 + a) * Qpoly (6 + a + u) (5 + a) * ((s : ℤ) + t) := by positivity
    linarith

end P2qJumps
