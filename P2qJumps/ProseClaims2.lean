/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.TheoremsBE
import P2qJumps.R3SEmpty
import P2qJumps.Main
import P2qJumps.ClosedShapes

/-!
# Prose sweep, part 2: Part B statements in Lean

* pure statements of Part B (prime quadruplets, `D > 0`, `C`-identity, `Φ < 0`, `N(p,k) < 0`,
  the `T`-values and `2^(m-1) > m^4` of Corollary F1, arithmetic facts on the curve `E`);
* the Part B statements about shapes that do not occur (`rst`, `r^3 s`, `r^2 s t`, squarefree
  `rstu`). Each is stated with the paper's conclusion and proved from the emptiness theorem of the
  shape (Theorem 28, `r3s_empty`, `r2st_empty`, `theoremD_four`): the statements are vacuously true.
-/

namespace P2qJumps

open Nat ArithmeticFunction
open scoped ArithmeticFunction.sigma

/-! ## Pure statements -/


def Nfar (p k : ℤ) : ℤ :=
  -7*p^6-6*k*p^5-11*k^2*p^4-4*k^3*p^3-4*k^4*p^2+4*k^4*p+k^4+14*k^3*p^2-4*k^3*p-50*k^3
  +22*k^2*p^3-6*k^2*p^2-2*k^2*p+73*k^2+20*k*p^4-12*k*p^3-76*k*p^2+2*k*p-24*k+12*p^5-2*p^4
  +20*p^3+p^2-24*p+144

theorem Nfar_neg {p k : ℤ} (hp : 5 ≤ p) (hk1 : 5 - p ≤ k) (hk2 : k ≤ p - 1) (hk0 : k ≠ 0) :
    Nfar p k < 0 := by
  rcases lt_or_gt_of_ne hk0 with hk | hk
  · obtain ⟨j, hj⟩ : ∃ j : ℕ, k = -1 - j := ⟨(-1 - k).toNat, by omega⟩
    obtain ⟨b, hb⟩ : ∃ b : ℕ, p = 6 + j + b := ⟨(p - 6 - j).toNat, by omega⟩
    subst hj hb
    unfold Nfar
    have : 0 < -(Nfar (6 + j + b) (-1 - j)) := by
      unfold Nfar; ring_nf; positivity
    unfold Nfar at this; linarith
  · obtain ⟨a, ha⟩ : ∃ a : ℕ, k = 1 + a := ⟨(k - 1).toNat, by omega⟩
    obtain ⟨b, hb⟩ : ∃ b : ℕ, p = 2 + a + b := ⟨(p - 2 - a).toNat, by omega⟩
    subst ha hb
    have : 0 < -(Nfar (2 + a + b) (1 + a)) := by
      unfold Nfar; ring_nf; positivity
    linarith

theorem Phi_neg {p ρ : ℤ} (hp : 5 ≤ p) (hρ : 2 * p ≤ ρ) :
    -ρ^4 + (2*p+1)*ρ^3 - (2*p^3+p^2-12)*ρ + 2*p^4 - p^2 - 24*p - 12 < 0 := by
  obtain ⟨b, hb⟩ : ∃ b : ℕ, p = 5 + b := ⟨(p - 5).toNat, by omega⟩
  obtain ⟨a, ha⟩ : ∃ a : ℕ, ρ = 2 * p + a := ⟨(ρ - 2 * p).toNat, by omega⟩
  subst ha; subst hb
  have : 0 < -(-(2 * (5 + (b:ℤ)) + a)^4 + (2*(5+(b:ℤ))+1)*(2 * (5 + (b:ℤ)) + a)^3
      - (2*(5+(b:ℤ))^3+(5+(b:ℤ))^2-12)*(2 * (5 + (b:ℤ)) + a) + 2*(5+(b:ℤ))^4 - (5+(b:ℤ))^2
      - 24*(5+(b:ℤ)) - 12) := by ring_nf; positivity
  linarith

theorem pow_gt_T (m : ℕ) (hm : 23 ≤ m) : m ^ 4 < 2 ^ (m - 1) := by
  induction m, hm using Nat.le_induction with
  | base => norm_num
  | succ n hn ih =>
    have h : (n + 1) ^ 4 ≤ 2 * n ^ 4 := by
      obtain ⟨c, rfl⟩ : ∃ c, n = 23 + c := ⟨n - 23, by omega⟩
      have : (0 : ℤ) ≤ 2 * (23 + (c : ℤ)) ^ 4 - (23 + (c : ℤ) + 1) ^ 4 := by ring_nf; positivity
      have h2 : ((23 + c + 1) ^ 4 : ℤ) ≤ 2 * (23 + c) ^ 4 := by linarith
      exact_mod_cast h2
    have : 2 ^ (n + 1 - 1) = 2 * 2 ^ (n - 1) := by
      rw [show n + 1 - 1 = (n - 1) + 1 by omega, pow_succ]; ring
    rw [this]; omega

theorem quadruplet_jumps {p : ℕ} (h0 : p.Prime) (h2 : (p + 2).Prime) (h6 : (p + 6).Prime)
    (h8 : (p + 8).Prime) : Jumps (p * (p + 8)) := by
  have hN : p * (p + 8) + 12 = (p + 2) * (p + 6) := by ring
  have c1 : p.Coprime (p + 8) := (Nat.coprime_primes h0 h8).2 (by omega)
  have c2 : (p + 2).Coprime (p + 6) := (Nat.coprime_primes h2 h6).2 (by omega)
  have hp1 := h0.one_le
  unfold Jumps
  rw [hN, Nat.totient_mul c1, Nat.totient_mul c2, Nat.totient_prime h0, Nat.totient_prime h8,
    Nat.totient_prime h2, Nat.totient_prime h6,
    isMultiplicative_sigma.map_mul_of_coprime c1, isMultiplicative_sigma.map_mul_of_coprime c2,
    sigma_one_prime' h0, sigma_one_prime' h8, sigma_one_prime' h2, sigma_one_prime' h6]
  constructor
  · obtain ⟨a, rfl⟩ : ∃ a, p = a + 1 := ⟨p - 1, by omega⟩
    rw [show a + 1 + 2 - 1 = a + 2 by omega, show a + 1 + 6 - 1 = a + 6 by omega,
      show a + 1 - 1 = a by omega, show a + 1 + 8 - 1 = a + 8 by omega]
    ring
  · ring
theorem curve_disc : (WeierstrassCurve.mk (0:ℚ) (-1) 0 0 (-12)).Δ = -62976 := by
  simp [WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
    WeierstrassCurve.b₈]; norm_num
theorem curve_j : (WeierstrassCurve.mk (0:ℚ) (-1) 0 0 (-12)).c₄ ^ 3 / (WeierstrassCurve.mk (0:ℚ) (-1) 0 0 (-12)).Δ = -8/123 := by
  simp [WeierstrassCurve.Δ, WeierstrassCurve.c₄, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
    WeierstrassCurve.b₈]; norm_num
theorem curve_points : (6:ℤ)^2 = 4^3 - 4^2 - 12 ∧ (1378746:ℤ)^2 = 12388^3 - 12388^2 - 12 := by norm_num
theorem curve_factorizations : (62976 : ℕ) = 2^9*3*41 ∧ (3936:ℕ) = 2^5*3*41 := by norm_num

/-! ## Shapes that do not occur: the Part B statements about them -/

theorem rst_false {p q r s t : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime) (hs : s.Prime)
    (ht : t.Prime) (hpq : p ≠ q) (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t)
    (hJ : Jumps (p ^ 2 * q)) (hN : p ^ 2 * q + 12 = r * s * t) : False :=
  theorem28_holds p q r s t hp hq hr hs ht hpq hrs hrt hst hJ hN

/-- Part B `lem:e123`. -/
theorem lem_e123 {p q r s t : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime) (hs : s.Prime)
    (ht : t.Prime) (hpq : p ≠ q) (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t)
    (hJ : Jumps (p ^ 2 * q)) (hN : p ^ 2 * q + 12 = r * s * t) :
    ((r : ℚ) + s + t = p + (q + 1) / 2) ∧
      ((r : ℚ) * s + r * t + s * t = p ^ 2 + p * q + (q - 1) / 2) ∧ Odd q :=
  (rst_false hp hq hr hs ht hpq hrs hrt hst hJ hN).elim

/-- Part B `lem:qform`, `lem:C`, `thm:rigid`(a), `lem:Phi` (first two clauses). -/
theorem lem_qform_C_Phi {p q r s t ρ : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime)
    (hs : s.Prime) (ht : t.Prime) (hpq : p ≠ q) (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t)
    (hJ : Jumps (p ^ 2 * q)) (hN : p ^ 2 * q + 12 = r * s * t) (hρ : ρ = r ∨ ρ = s ∨ ρ = t) :
    let D : ℤ := 2 * p ^ 2 - 2 * p * ρ + ρ ^ 2 - ρ
    let C : ℤ := (ρ - 3) * (ρ ^ 2 + 3 * ρ + 8)
    let Φ : ℤ := -ρ ^ 4 + (2 * p + 1) * ρ ^ 3 - (2 * p ^ 3 + p ^ 2 - 12) * ρ + 2 * p ^ 4 - p ^ 2
      - 24 * p - 12
    (q : ℚ) = (2 * ρ ^ 3 - 2 * p * ρ ^ 2 + 2 * p ^ 2 * ρ - ρ ^ 2 - ρ - 24 : ℤ) / D ∧
      (q : ℚ) - ρ = C / D ∧ D ∣ C ∧
      ((p ^ 2 * q + 12 : ℕ) : ℚ) - ρ ^ 3 = ρ * Φ / D ∧ (ρ ^ 3 ≤ p ^ 2 * q + 12 ↔ 0 ≤ Φ) :=
  (rst_false hp hq hr hs ht hpq hrs hrt hst hJ hN).elim

/-- Part B `prop:balanced` and `thm:closed`(5). -/
theorem rst_balanced {p q r s t : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime)
    (hs : s.Prime) (ht : t.Prime) (hpq : p ≠ q) (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t)
    (hJ : Jumps (p ^ 2 * q)) (hN : p ^ 2 * q + 12 = r * s * t) :
    r < 2 * p ∨ s < 2 * p ∨ t < 2 * p :=
  (rst_false hp hq hr hs ht hpq hrs hrt hst hJ hN).elim

/-- Part B `prop:pm2`, `thm:closed`(6) and `thm:rst-off`: no factor of `N = rst` equals
`p ± 2, p ± 4, p ± 6, p ± 8`. -/
theorem rst_off {p q r s t ρ : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime)
    (hs : s.Prime) (ht : t.Prime) (hpq : p ≠ q) (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t)
    (hJ : Jumps (p ^ 2 * q)) (hN : p ^ 2 * q + 12 = r * s * t) (hρ : ρ = r ∨ ρ = s ∨ ρ = t)
    (d : ℤ) (hd : d = 2 ∨ d = 4 ∨ d = 6 ∨ d = 8) : (ρ : ℤ) ≠ p + d ∧ (ρ : ℤ) ≠ p - d :=
  (rst_false hp hq hr hs ht hpq hrs hrt hst hJ hN).elim

/-- Part B `thm:rst-far` (the vacuous clauses; the polynomial clause is `Nfar_neg`). Here `r` is
the least prime factor and `k = r - p`. -/
theorem rst_far {p q r s t : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime)
    (hs : s.Prime) (ht : t.Prime) (hpq : p ≠ q) (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t)
    (hJ : Jumps (p ^ 2 * q)) (hN : p ^ 2 * q + 12 = r * s * t) (hmin : r < s ∧ r < t) :
    let k : ℤ := r - p
    5 - (p : ℤ) ≤ k ∧ k < p ∧ k ≠ 0 ∧
      ((s : ℚ) - t) ^ 2 = (Nfar p k : ℚ) / ((p : ℚ) ^ 2 - p + k * (k - 1)) ^ 2 ∧ False :=
  (rst_false hp hq hr hs ht hpq hrs hrt hst hJ hN).elim

/-- Part B `thm:rigid`(b), `thm:r3sint`, `thm:r3s-plarge`, `thm:r3s-strip`. -/
theorem r3s_statements {p q r s : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime) (hs : s.Prime)
    (hpq : p ≠ q) (hrs : r ≠ s) (hJ : Jumps (p ^ 2 * q)) (hN : p ^ 2 * q + 12 = r ^ 3 * s) :
    r ^ 2 ∣ p + q - 1 ∧
      (∀ m : ℕ, p + q - 1 = r ^ 2 * m → 1 ≤ m ∧ (s : ℤ) = p * m - r + 1 ∧
        (q : ℤ) = r ^ 2 * m - p + 1 ∧
        (p : ℤ) * m * r ^ 2 * (r - p) = r ^ 3 * (r - 1) - p ^ 2 * (p - 1) + 12) ∧
      (p : ℤ) ∣ r ^ 4 - r ^ 3 + 12 ∧ (r : ℤ) ∣ p ^ 3 - p ^ 2 - 12 ∧
      (r : ℤ) ^ 2 ∣ p ^ 3 - p ^ 2 - 12 ∧ p < r ∧ r ^ 2 < p ^ 3 ∧
      (r : ℤ) ≠ p - 4 ∧ (r : ℤ) ≠ p - 2 ∧ (r : ℤ) ≠ p + 2 ∧ (r : ℤ) ≠ p + 4 :=
  (r3s_empty hp hq hr hs hpq hrs hJ hN).elim


/-- Squarefree `N` with four prime factors does not occur (Theorem D, `k = 4`). -/
theorem four_false {p q r s t u : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime) (hs : s.Prime)
    (ht : t.Prime) (hu : u.Prime) (hpq : p ≠ q) (hrs : r ≠ s) (hrt : r ≠ t) (hru : r ≠ u)
    (hst : s ≠ t) (hsu : s ≠ u) (htu : t ≠ u) (hJ : Jumps (p ^ 2 * q))
    (hN : p ^ 2 * q + 12 = r * s * t * u) : False := by
  have cp : ∀ {a b : ℕ}, a.Prime → b.Prime → a ≠ b → a.Coprime b :=
    fun ha hb hab => (Nat.coprime_primes ha hb).2 hab
  have hsq : Squarefree (r * s * t * u) := by
    rw [Nat.squarefree_mul_iff, Nat.squarefree_mul_iff, Nat.squarefree_mul_iff]
    exact ⟨Nat.Coprime.mul_left (Nat.Coprime.mul_left (cp hr hu hru) (cp hs hu hsu)) (cp ht hu htu),
      ⟨Nat.Coprime.mul_left (cp hr ht hrt) (cp hs ht hst), ⟨cp hr hs hrs, hr.squarefree, hs.squarefree⟩,
        ht.squarefree⟩, hu.squarefree⟩
  have hcard : (r * s * t * u).primeFactors.card = 4 := by
    rw [Nat.primeFactors_mul (Nat.mul_ne_zero (Nat.mul_ne_zero hr.ne_zero hs.ne_zero) ht.ne_zero) hu.ne_zero,
      Nat.primeFactors_mul (Nat.mul_ne_zero hr.ne_zero hs.ne_zero) ht.ne_zero,
      Nat.primeFactors_mul hr.ne_zero hs.ne_zero, hr.primeFactors, hs.primeFactors, ht.primeFactors,
      hu.primeFactors]
    rw [Finset.card_eq_four]
    exact ⟨r, s, t, u, hrs, hrt, hru, hst, hsu, htu, by ext x; simp; tauto⟩
  rw [← hN] at hsq hcard
  exact theoremD_four hp hq hpq hJ hsq hcard

/-- `r^2 s t` does not occur (any primes; `r, s, t ≥ 5` is derived). -/
theorem r2st_false {p q r s t : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime) (hs : s.Prime)
    (ht : t.Prime) (hpq : p ≠ q) (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t)
    (hJ : Jumps (p ^ 2 * q)) (hN : p ^ 2 * q + 12 = r ^ 2 * s * t) : False := by
  obtain ⟨hp5, hq5, -, -, -⟩ := preamble hp hq hpq hJ
  have f5 : ∀ {ℓ : ℕ}, ℓ.Prime → ℓ ∣ p ^ 2 * q + 12 → 5 ≤ ℓ :=
    fun hℓ hd => P2qExclusions.prime_factor_ge_five hp hq hp5 hq5 hℓ hd
  exact r2st_empty hp hq hr hs ht hpq hrs hrt hst
    (f5 hr (hN ▸ ⟨r * s * t, by ring⟩)) (f5 hs (hN ▸ ⟨r ^ 2 * t, by ring⟩))
    (f5 ht (hN ▸ ⟨r ^ 2 * s, by ring⟩)) hJ hN

/-- Part B `thm:rigid`(c), `thm:r2st-off`, `thm:rp4`. -/
theorem r2st_statements {p q r s t : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime)
    (hs : s.Prime) (ht : t.Prime) (hpq : p ≠ q) (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t)
    (hJ : Jumps (p ^ 2 * q)) (hN : p ^ 2 * q + 12 = r ^ 2 * s * t) :
    ((s : ℚ) + t = -((p : ℚ) ^ 3 - p ^ 2 * r - p ^ 2 + 2 * p * r ^ 3 + p * r ^ 2 - 2 * p * r + r ^ 3
        - r ^ 2 - 12) / (r * (p * r + 2 * p - r ^ 2 + r))) ∧
      ((s : ℚ) * t = (2 * (p : ℚ) ^ 4 * r + p ^ 4 - 2 * p ^ 3 * r ^ 2 - p ^ 3 + 2 * p ^ 2 * r ^ 4
        - p ^ 2 * r ^ 2 - p ^ 2 * r - 24 * p * r - 12 * p + 12 * r ^ 2 - 12 * r)
        / (r * (p - r) * (p * r + 2 * p - r ^ 2 + r))) ∧
      ((q : ℚ) = (2 * (p : ℚ) ^ 2 * r ^ 2 + p ^ 2 * r - 2 * p * r ^ 3 - p * r + 2 * r ^ 5 - r ^ 3
        - r ^ 2 - 12 * r - 24) / ((p - r) * (p * r + 2 * p - r ^ 2 + r))) ∧
      (r : ℤ) ≠ p + 2 ∧ (r : ℤ) ≠ p - 2 ∧ (r : ℤ) ≠ p - 6 ∧ (r : ℤ) ≠ p - 4 ∧
      (r : ℤ) ≠ p + 6 ∧ (r : ℤ) ≠ p + 8 ∧
      (r = p + 4 → p % 16 ≠ 1 ∧ p % 16 ≠ 3 ∧ p % 16 ≠ 9 ∧ p % 16 ≠ 11) :=
  (r2st_false hp hq hr hs ht hpq hrs hrt hst hJ hN).elim

/-- Part B `thm:four`, clauses (1) and (4) (the remaining clauses are about the same empty shape
and follow from `four_false` in the same way). -/
theorem four_statements {p q r s t u : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime)
    (hs : s.Prime) (ht : t.Prime) (hu : u.Prime) (hpq : p ≠ q) (hrs : r ≠ s) (hrt : r ≠ t)
    (hru : r ≠ u) (hst : s ≠ t) (hsu : s ≠ u) (htu : t ≠ u) (hJ : Jumps (p ^ 2 * q))
    (hN : p ^ 2 * q + 12 = r * s * t * u) :
    ((r * s + r * t + r * u + s * t + s * u + t * u : ℕ) : ℚ) = p + (q - 1) / 2 ∧
      6 * Real.sqrt (p ^ 2 * q + 12 : ℕ) ≤ (r * s + r * t + r * u + s * t + s * u + t * u : ℕ) ∧
      ¬ (r = 5 ∧ s = 7) :=
  (four_false hp hq hr hs ht hu hpq hrs hrt hru hst hsu htu hJ hN).elim

/-- Generic form of the vacuous statements: any proposition holds for a shape that does not
occur. Used in `paper/PROSE-CLAIMS.md` for Part B clauses with long displayed formulas. -/
theorem four_vacuous {p q r s t u : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime)
    (hs : s.Prime) (ht : t.Prime) (hu : u.Prime) (hpq : p ≠ q) (hrs : r ≠ s) (hrt : r ≠ t)
    (hru : r ≠ u) (hst : s ≠ t) (hsu : s ≠ u) (htu : t ≠ u) (hJ : Jumps (p ^ 2 * q))
    (hN : p ^ 2 * q + 12 = r * s * t * u) (P : Prop) : P :=
  (four_false hp hq hr hs ht hu hpq hrs hrt hru hst hsu htu hJ hN).elim

/-- Part B Corollary F1, explicit values. -/
theorem T_values :
    (5 : ℤ) ^ 4 - 13 * 5 - 6 = 554 ∧ (7 : ℤ) ^ 4 - 13 * 7 - 6 = 2304 ∧
      (11 : ℤ) ^ 4 - 13 * 11 - 6 = 14492 ∧ (13 : ℤ) ^ 4 - 13 * 13 - 6 = 28386 ∧
      (17 : ℤ) ^ 4 - 13 * 17 - 6 = 83294 ∧ (19 : ℤ) ^ 4 - 13 * 19 - 6 = 130068 ∧
      padicValNat 2 554 = 1 ∧ padicValNat 2 2304 = 8 ∧ padicValNat 2 14492 = 2 ∧
      padicValNat 2 28386 = 1 ∧ padicValNat 2 83294 = 1 ∧ padicValNat 2 130068 = 2 := by
  refine ⟨by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, by norm_num, ?_, ?_, ?_,
    ?_, ?_, ?_⟩
  all_goals
    first
    | (rw [show (554 : ℕ) = 2 ^ 1 * 277 by norm_num, padicValNat.mul (by norm_num) (by norm_num),
        padicValNat.prime_pow, padicValNat.eq_zero_of_not_dvd (by norm_num)])
    | (rw [show (2304 : ℕ) = 2 ^ 8 * 9 by norm_num, padicValNat.mul (by norm_num) (by norm_num),
        padicValNat.prime_pow, padicValNat.eq_zero_of_not_dvd (by norm_num)])
    | (rw [show (14492 : ℕ) = 2 ^ 2 * 3623 by norm_num, padicValNat.mul (by norm_num) (by norm_num),
        padicValNat.prime_pow, padicValNat.eq_zero_of_not_dvd (by norm_num)])
    | (rw [show (28386 : ℕ) = 2 ^ 1 * 14193 by norm_num, padicValNat.mul (by norm_num) (by norm_num),
        padicValNat.prime_pow, padicValNat.eq_zero_of_not_dvd (by norm_num)])
    | (rw [show (83294 : ℕ) = 2 ^ 1 * 41647 by norm_num, padicValNat.mul (by norm_num) (by norm_num),
        padicValNat.prime_pow, padicValNat.eq_zero_of_not_dvd (by norm_num)])
    | (rw [show (130068 : ℕ) = 2 ^ 2 * 32517 by norm_num, padicValNat.mul (by norm_num) (by norm_num),
        padicValNat.prime_pow, padicValNat.eq_zero_of_not_dvd (by norm_num)])

/-- Part B Corollary F1: for every integer `m ≥ 23`, `2^(m-1) > m^4 > T(m)`. -/
theorem F1_tail (m : ℕ) (hm : 23 ≤ m) :
    (m : ℤ) ^ 4 - 13 * m - 6 < (m : ℤ) ^ 4 ∧ m ^ 4 < 2 ^ (m - 1) :=
  ⟨by have : (0 : ℤ) < 13 * m + 6 := by positivity
      linarith, pow_gt_T m hm⟩

/-- Part B `lem:qform`: `D(p, ρ) = 2p^2 - 2pρ + ρ^2 - ρ > 0` for `p, ρ ≥ 5` (any integers). -/
theorem D_pos {p ρ : ℤ} (hp : 5 ≤ p) (hρ : 5 ≤ ρ) : 0 < 2 * p ^ 2 - 2 * p * ρ + ρ ^ 2 - ρ := by
  nlinarith [sq_nonneg (p - ρ), sq_nonneg p]

/-- Part B `lem:C`, the identity behind it: numerator of `q` minus `ρ D` is `C(ρ)`. -/
theorem C_identity (p ρ : ℤ) :
    (2 * ρ ^ 3 - 2 * p * ρ ^ 2 + 2 * p ^ 2 * ρ - ρ ^ 2 - ρ - 24)
      - ρ * (2 * p ^ 2 - 2 * p * ρ + ρ ^ 2 - ρ) = (ρ - 3) * (ρ ^ 2 + 3 * ρ + 8) := by ring

/-- Part B square-discriminant section: `2F(p)` modulo `16` by the class of `p`, squares modulo
`16`, and `F(p)` even for odd `p` (in `ZMod`). -/
theorem F_mod16 : ∀ x : ZMod 16,
    ((x = 1 ∨ x = 9) → 2 * (x^8+20*x^7+158*x^6+685*x^5+2064*x^4+4836*x^3+7976*x^2+5760*x-2808) = 8) ∧
    ((x = 3 ∨ x = 11) → 2 * (x^8+20*x^7+158*x^6+685*x^5+2064*x^4+4836*x^3+7976*x^2+5760*x-2808) = 12) ∧
    ((x = 5 ∨ x = 13) → 2 * (x^8+20*x^7+158*x^6+685*x^5+2064*x^4+4836*x^3+7976*x^2+5760*x-2808) = 0) ∧
    ((x = 7 ∨ x = 15) → 2 * (x^8+20*x^7+158*x^6+685*x^5+2064*x^4+4836*x^3+7976*x^2+5760*x-2808) = 4) := by
  decide
theorem sq_mod16 : ∀ y : ZMod 16, y ^ 2 = 0 ∨ y ^ 2 = 1 ∨ y ^ 2 = 4 ∨ y ^ 2 = 9 := by decide
theorem F_even : ∀ x : ZMod 2, x = 1 →
    x^8+20*x^7+158*x^6+685*x^5+2064*x^4+4836*x^3+7976*x^2+5760*x-2808 = 0 := by decide
/-- Part B square-discriminant section: `4t^4+4t^3+11t^2+6t+7 > 6` for every real `t`. -/
theorem quartic_gt_six (t : ℝ) : 6 < 4*t^4+4*t^3+11*t^2+6*t+7 := by
  nlinarith [sq_nonneg (t*(2*t+1)), sq_nonneg (t + 3/10)]

end P2qJumps
