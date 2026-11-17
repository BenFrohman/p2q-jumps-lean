/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Ext.Exclusions.TheoremB

/-!
# Theorem E, items (i)–(iv)

Extra hypotheses beyond the two actual jumps: `5 ≤ p`, `5 ≤ q` (source Proposition 8, not
formalized here). Coprimality of `N` with `6` is derived internally. Item (i) additionally
assumes `N` is not a prime power (`2 ≤ ω(N)`; source Theorem 1(2), not formalized here).
-/

namespace P2qExclusions

open ArithmeticFunction P2qStructural P2qExtensions
open scoped ArithmeticFunction.sigma ArithmeticFunction.Moebius

/-! ## Pure integer cores -/

lemma E_ii_arith (p q : ℤ) (hp : 5 ≤ p) (hq : 5 ≤ q)
    (h : 5 * (p ^ 2 * q + 12) ≤ (q + 2 * p + 1) ^ 2) : 5 * p ^ 2 - 4 * p - 3 < q := by
  by_contra hc; push_neg at hc
  nlinarith [mul_nonneg (sub_nonneg.2 hq) (sub_nonneg.2 hc),
    mul_nonneg (sub_nonneg.2 hp) (sub_nonneg.2 hq)]

lemma amgm3 (x y z : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
    27 * (x * y * z) ≤ (x + y + z) ^ 3 := by
  nlinarith [mul_nonneg (add_nonneg (add_nonneg hx hy) hz) (sq_nonneg (x - y)),
    mul_nonneg (add_nonneg (add_nonneg hx hy) hz) (sq_nonneg (y - z)),
    mul_nonneg (add_nonneg (add_nonneg hx hy) hz) (sq_nonneg (x - z)),
    mul_nonneg hx (sq_nonneg (y - z)), mul_nonneg hy (sq_nonneg (x - z)),
    mul_nonneg hz (sq_nonneg (x - y))]

lemma E_i_arith (p q : ℤ) (hp : 5 ≤ p) (hq : 5 ≤ q)
    (h1 : p ^ 2 * q + 12 ≤ (p - 2) ^ 2 * (q + 2 * p + 1))
    (h2 : 5 * (p ^ 2 * q + 12) ≤ (q + 2 * p + 1) ^ 2) : False := by
  nlinarith [mul_nonneg (sub_nonneg.2 hq) (sub_nonneg.2 hp), mul_nonneg (sub_nonneg.2 hp) (sub_nonneg.2 hp),
    mul_nonneg (mul_nonneg (sub_nonneg.2 hq) (sub_nonneg.2 hp)) (sub_nonneg.2 hp)]

lemma cert_vu (v u : ℕ) :
    let p : ℤ := v + 5
    let q : ℤ := 5 * p ^ 2 - 4 * p - 3 + u
    (p ^ 3 - p ^ 2 - 12) ^ 2 * (q + 2 * p + 1) ^ 3 < (p ^ 2 * q + 12) ^ 3 := by
  intro p q
  have : 0 < (p ^ 2 * q + 12) ^ 3 - (p ^ 3 - p ^ 2 - 12) ^ 2 * (q + 2 * p + 1) ^ 3 := by
    simp only [p, q]; ring_nf; positivity
  linarith

/-- Positive-coefficient certificate `N^3 > L^2 δ^3` for `p ≥ 5`, `q ≥ 5p^2 - 4p - 3`. -/
lemma E_iv_cert (p q : ℤ) (hp : 5 ≤ p) (hq : 5 * p ^ 2 - 4 * p - 3 ≤ q) :
    (p ^ 3 - p ^ 2 - 12) ^ 2 * (q + 2 * p + 1) ^ 3 < (p ^ 2 * q + 12) ^ 3 := by
  have key := cert_vu (p - 5).toNat (q - (5 * p ^ 2 - 4 * p - 3)).toNat
  simp only at key
  have hv : (((p - 5).toNat : ℕ) : ℤ) + 5 = p := by omega
  have hu : 5 * p ^ 2 - 4 * p - 3 + (((q - (5 * p ^ 2 - 4 * p - 3)).toNat : ℕ) : ℤ) = q := by omega
  rw [hv, hu] at key
  exact key

/-! ## Arithmetic helpers -/

lemma prime_factor_ge_five {p q ℓ : ℕ} (hp : p.Prime) (hq : q.Prime) (hp5 : 5 ≤ p) (hq5 : 5 ≤ q)
    (hℓ : ℓ.Prime) (hd : ℓ ∣ p ^ 2 * q + 12) : 5 ≤ ℓ := by
  have h2 : ℓ ≠ 2 := by
    rintro rfl; exact P2qExtensions.odd_N hp hq hp5 hq5 hd
  have h3 : ℓ ≠ 3 := by
    rintro rfl
    have h12 : 3 ∣ p ^ 2 * q := (Nat.dvd_add_left (by norm_num : 3 ∣ 12)).1 hd
    rcases (Nat.Prime.dvd_mul Nat.prime_three).1 h12 with h | h
    · have := (Nat.prime_dvd_prime_iff_eq Nat.prime_three hp).1 (Nat.prime_three.dvd_of_dvd_pow h)
      omega
    · have := (Nat.prime_dvd_prime_iff_eq Nat.prime_three hq).1 h; omega
  have := hℓ.two_le
  have h4 : ℓ ≠ 4 := by rintro rfl; norm_num at hℓ
  omega

/-- If `a ∣ N` and `a ∣ φ(N)` then `a ∣ L(p)`. -/
lemma dvd_L {p q a : ℕ} (h : Jump p q) (h1 : a ∣ p ^ 2 * q + 12)
    (h2 : a ∣ Nat.totient (p ^ 2 * q + 12)) : (a : ℤ) ∣ L p := by
  rw [← phi_elim h]
  exact dvd_sub (dvd_mul_of_dvd_right (Int.natCast_dvd_natCast.2 h1) _)
    (dvd_mul_of_dvd_right (Int.natCast_dvd_natCast.2 h2) _)

lemma L_pos {p : ℕ} (hp5 : 5 ≤ p) : 0 < L p := by
  have : (5 : ℤ) ≤ p := by exact_mod_cast hp5
  unfold L; nlinarith

lemma le_L {p q a : ℕ} (h : Jump p q) (hp5 : 5 ≤ p) (ha : 0 < a) (h1 : a ∣ p ^ 2 * q + 12)
    (h2 : a ∣ Nat.totient (p ^ 2 * q + 12)) : (a : ℤ) ≤ L p :=
  Int.le_of_dvd (L_pos hp5) (dvd_L h h1 h2)

lemma cop_pow {a b : ℕ} (ha : a.Prime) (hb : b.Prime) (hab : a ≠ b) (i j : ℕ) :
    Nat.Coprime (a ^ i) (b ^ j) := Nat.Coprime.pow i j ((Nat.coprime_primes ha hb).2 hab)

lemma delta_eq {p q : ℕ} (h : Jump p q) : delta (p ^ 2 * q + 12) = (q : ℤ) + 2 * p + 1 := by
  rw [(lemmaQ h).2, (delta_Q_p2q h.hp h.hq h.hpq).1]

/-! ## E(ii) -/

/-- **Theorem E(ii).** Two distinct primes with squares dividing `N` and a third prime factor
force `q > 5p^2 - 4p - 3`. -/
theorem theoremE_ii (p q r₁ r₂ t : ℕ) (h : Jump p q) (hp5 : 5 ≤ p) (hq5 : 5 ≤ q)
    (hr₁ : r₁.Prime) (hr₂ : r₂.Prime) (ht : t.Prime) (h12 : r₁ ≠ r₂) (ht1 : t ≠ r₁) (ht2 : t ≠ r₂)
    (hd₁ : r₁ ^ 2 ∣ p ^ 2 * q + 12) (hd₂ : r₂ ^ 2 ∣ p ^ 2 * q + 12) (hdt : t ∣ p ^ 2 * q + 12) :
    5 * (p : ℤ) ^ 2 - 4 * p - 3 < q := by
  set N := p ^ 2 * q + 12 with hN
  have hM : r₁ ^ 2 * r₂ ^ 2 * t ∣ N := by
    apply Nat.Coprime.mul_dvd_of_dvd_of_dvd _ (Nat.Coprime.mul_dvd_of_dvd_of_dvd
      (cop_pow hr₁ hr₂ h12 2 2) hd₁ hd₂) hdt
    apply Nat.Coprime.mul
    · simpa using cop_pow hr₁ ht (Ne.symm ht1) 2 1
    · simpa using cop_pow hr₂ ht (Ne.symm ht2) 2 1
  have hle : r₁ ^ 2 * r₂ ^ 2 * t ≤ N := Nat.le_of_dvd (by omega) hM
  have ht5 := prime_factor_ge_five h.hp h.hq hp5 hq5 ht hdt
  have hb1 := repeated_prime_bound h hr₁ hd₁
  have hb2 := repeated_prime_bound h hr₂ hd₂
  have h5 : 5 * ((r₁ : ℤ) ^ 2 * (r₂ : ℤ) ^ 2) ≤ (N : ℤ) := by
    have h' : r₁ ^ 2 * r₂ ^ 2 * 5 ≤ r₁ ^ 2 * r₂ ^ 2 * t := Nat.mul_le_mul_left _ ht5
    have : 5 * (r₁ ^ 2 * r₂ ^ 2) ≤ N := by linarith
    exact_mod_cast this
  set δ : ℤ := (q : ℤ) + 2 * p + 1
  have hNpos : (0 : ℤ) < N := by positivity
  have hsq : (N : ℤ) * N ≤ ((r₁ : ℤ) ^ 2 * δ) * ((r₂ : ℤ) ^ 2 * δ) :=
    mul_le_mul hb1 hb2 hNpos.le (by positivity)
  have h5N : 5 * (N : ℤ) ≤ δ ^ 2 := by
    by_contra hc; push_neg at hc
    have : (N : ℤ) * δ ^ 2 < (N : ℤ) * (5 * N) := mul_lt_mul_of_pos_left hc hNpos
    nlinarith
  have hp5' : (5 : ℤ) ≤ p := by exact_mod_cast hp5
  have hq5' : (5 : ℤ) ≤ q := by exact_mod_cast hq5
  exact E_ii_arith p q hp5' hq5' (by simpa [hN, δ] using h5N)

/-! ## E(iii) -/

lemma terms_le_delta (N : ℕ) (hN : 0 < N) (D : Finset ℕ) (hD : ∀ d ∈ D, d ∣ N ∧ d ≠ 1) :
    ∑ d ∈ D, (1 + (μ d : ℤ)) * ((N / d : ℕ) : ℤ) ≤ delta N := by
  rw [lemmaL1 N hN]
  have hinj : Set.InjOn (fun d : ℕ => (d, N / d)) D := by
    intro a _ b _ hab; simp only [Prod.mk.injEq] at hab; exact hab.1
  rw [← Finset.sum_image (f := fun y : ℕ × ℕ => (1 + (μ y.1 : ℤ)) * (y.2 : ℤ)) hinj]
  apply Finset.sum_le_sum_of_subset_of_nonneg
  · intro y hy
    obtain ⟨d, hd, rfl⟩ := Finset.mem_image.1 hy
    obtain ⟨h1, h2⟩ := hD d hd
    refine Finset.mem_erase.2 ⟨?_, Nat.mem_divisorsAntidiagonal.2 ⟨Nat.mul_div_cancel' h1, by omega⟩⟩
    intro he; simp only [Prod.mk.injEq] at he; exact h2 he.1
  · intro y _ _
    have := abs_moebius_le_one (n := y.1)
    have h1 : 0 ≤ 1 + (μ y.1 : ℤ) := by have := neg_abs_le (μ y.1 : ℤ); linarith
    exact mul_nonneg h1 (by positivity)

lemma moebius_sq {r : ℕ} (hr : r.Prime) : μ (r ^ 2) = 0 := by
  rw [moebius_apply_prime_pow hr (by norm_num)]; simp

/-- Integer tail of E(iii): AM–GM plus `ABC < p^3` force `δ p^2 > 3N`, i.e. `q ≤ p`. -/
lemma E_iii_tail (p q P S N δ : ℤ) (hp : 5 ≤ p) (hq0 : 5 * p ^ 2 - 4 * p - 3 < q)
    (hδ : δ = q + 2 * p + 1) (hN : N = p ^ 2 * q + 12) (hP : 0 < P) (hPp : P < p ^ 3)
    (hS : N * S ≤ δ * P ^ 2) (hAM : 27 * P ^ 4 ≤ S ^ 3) (hS0 : 0 ≤ S) : False := by
  have hq5 : 5 ≤ q := by nlinarith
  have hNpos : 0 < N := by rw [hN]; positivity
  have hδpos : 0 < δ := by rw [hδ]; linarith
  have hcube : (N * S) ^ 3 ≤ (δ * P ^ 2) ^ 3 := pow_le_pow_left₀ (by positivity) hS 3
  have hk : 27 * N ^ 3 * P ^ 4 ≤ δ ^ 3 * P ^ 2 * P ^ 4 := by
    calc 27 * N ^ 3 * P ^ 4 = N ^ 3 * (27 * P ^ 4) := by ring
      _ ≤ N ^ 3 * S ^ 3 := mul_le_mul_of_nonneg_left hAM (by positivity)
      _ = (N * S) ^ 3 := by ring
      _ ≤ (δ * P ^ 2) ^ 3 := hcube
      _ = δ ^ 3 * P ^ 2 * P ^ 4 := by ring
  have h3 : 27 * N ^ 3 ≤ δ ^ 3 * P ^ 2 := le_of_mul_le_mul_right hk (by positivity)
  have h6 : δ ^ 3 * P ^ 2 < δ ^ 3 * (p ^ 3) ^ 2 :=
    mul_lt_mul_of_pos_left (pow_lt_pow_left₀ hPp hP.le (by norm_num)) (by positivity)
  have h7 : (3 * N) ^ 3 < (δ * p ^ 2) ^ 3 := by
    calc (3 * N) ^ 3 = 27 * N ^ 3 := by ring
      _ < δ ^ 3 * (p ^ 3) ^ 2 := lt_of_le_of_lt h3 h6
      _ = (δ * p ^ 2) ^ 3 := by ring
  have h8 : 3 * N < δ * p ^ 2 := lt_of_pow_lt_pow_left₀ 3 (by positivity) h7
  rw [hN, hδ] at h8
  have h9 : p ^ 2 * (2 * q) < p ^ 2 * (2 * p + 1) := by nlinarith
  have h10 : 2 * q < 2 * p + 1 := lt_of_mul_lt_mul_left h9 (by positivity)
  nlinarith

/-- **Theorem E(iii) (strengthened form).** No three distinct primes have squares dividing `N`.
(The source states this for `j ≥ 1`; the proof here needs no simple prime.) -/
theorem theoremE_iii (p q a b c : ℕ) (h : Jump p q) (hp5 : 5 ≤ p) (hq5 : 5 ≤ q)
    (ha : a.Prime) (hb : b.Prime) (hc : c.Prime) (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c)
    (hda : a ^ 2 ∣ p ^ 2 * q + 12) (hdb : b ^ 2 ∣ p ^ 2 * q + 12) (hdc : c ^ 2 ∣ p ^ 2 * q + 12) :
    False := by
  have hq0 := theoremE_ii p q a b c h hp5 hq5 ha hb hc hab (Ne.symm hac) (Ne.symm hbc) hda hdb
    ((dvd_pow_self c two_ne_zero).trans hdc)
  set N := p ^ 2 * q + 12 with hN
  have hNpos : 0 < N := by omega
  -- abc ∣ L
  have hM : a ^ 2 * b ^ 2 * c ^ 2 ∣ N :=
    Nat.Coprime.mul_dvd_of_dvd_of_dvd (Nat.Coprime.mul_left (cop_pow ha hc hac 2 2) (cop_pow hb hc hbc 2 2))
      (Nat.Coprime.mul_dvd_of_dvd_of_dvd (cop_pow ha hb hab 2 2) hda hdb) hdc
  have hφM : a * b * c ∣ Nat.totient (a ^ 2 * b ^ 2 * c ^ 2) := by
    rw [Nat.totient_mul (Nat.Coprime.mul_left (cop_pow ha hc hac 2 2) (cop_pow hb hc hbc 2 2)),
      Nat.totient_mul (cop_pow ha hb hab 2 2), Nat.totient_prime_pow ha (by norm_num),
      Nat.totient_prime_pow hb (by norm_num), Nat.totient_prime_pow hc (by norm_num)]
    exact ⟨(a - 1) * (b - 1) * (c - 1), by ring⟩
  have habcN : a * b * c ∣ N := (Dvd.intro (a * b * c) (by ring)).trans hM
  have habcL := le_L h hp5 (Nat.mul_pos (Nat.mul_pos ha.pos hb.pos) hc.pos) habcN
    (hφM.trans (Nat.totient_dvd_of_dvd hM))
  -- three L1 terms
  have hD := terms_le_delta N hNpos {a ^ 2, b ^ 2, c ^ 2} (by
    intro d hd
    simp only [Finset.mem_insert, Finset.mem_singleton] at hd
    rcases hd with rfl | rfl | rfl
    · exact ⟨hda, by have := ha.two_le; nlinarith⟩
    · exact ⟨hdb, by have := hb.two_le; nlinarith⟩
    · exact ⟨hdc, by have := hc.two_le; nlinarith⟩)
  have hinj : ∀ x y : ℕ, x ≠ y → x ^ 2 ≠ y ^ 2 := fun x y hxy e =>
    hxy (Nat.pow_left_injective (by norm_num) e)
  rw [Finset.sum_insert (by simp [hinj a b hab, hinj a c hac]),
    Finset.sum_insert (by simp [hinj b c hbc]), Finset.sum_singleton,
    moebius_sq ha, moebius_sq hb, moebius_sq hc] at hD
  simp only [add_zero, one_mul] at hD
  rw [delta_eq h] at hD
  obtain ⟨X, hX⟩ := hda; obtain ⟨Y, hY⟩ := hdb; obtain ⟨Z, hZ⟩ := hdc
  have eX : N / a ^ 2 = X := by rw [hX]; exact Nat.mul_div_cancel_left X (pow_pos ha.pos 2)
  have eY : N / b ^ 2 = Y := by rw [hY]; exact Nat.mul_div_cancel_left Y (pow_pos hb.pos 2)
  have eZ : N / c ^ 2 = Z := by rw [hZ]; exact Nat.mul_div_cancel_left Z (pow_pos hc.pos 2)
  rw [eX, eY, eZ] at hD
  have hXz : (N : ℤ) = (a : ℤ) ^ 2 * X := by exact_mod_cast hX
  have hYz : (N : ℤ) = (b : ℤ) ^ 2 * Y := by exact_mod_cast hY
  have hZz : (N : ℤ) = (c : ℤ) ^ 2 * Z := by exact_mod_cast hZ
  set δ : ℤ := (q : ℤ) + 2 * p + 1
  set A : ℤ := (a : ℤ) with hAd
  set B : ℤ := (b : ℤ) with hBd
  set C : ℤ := (c : ℤ) with hCd
  have hAn : 5 ≤ a :=
    prime_factor_ge_five h.hp h.hq hp5 hq5 ha ((dvd_pow_self a two_ne_zero).trans ⟨X, hX⟩)
  have hA : (5 : ℤ) ≤ A := by rw [hAd]; exact_mod_cast hAn
  have hBn : 5 ≤ b :=
    prime_factor_ge_five h.hp h.hq hp5 hq5 hb ((dvd_pow_self b two_ne_zero).trans ⟨Y, hY⟩)
  have hB : (5 : ℤ) ≤ B := by rw [hBd]; exact_mod_cast hBn
  have hCn : 5 ≤ c :=
    prime_factor_ge_five h.hp h.hq hp5 hq5 hc ((dvd_pow_self c two_ne_zero).trans ⟨Z, hZ⟩)
  have hC : (5 : ℤ) ≤ C := by rw [hCd]; exact_mod_cast hCn
  -- δ (ABC)^2 ≥ N (B²C² + A²C² + A²B²)
  have hS : (N : ℤ) * (B ^ 2 * C ^ 2 + A ^ 2 * C ^ 2 + A ^ 2 * B ^ 2) ≤ δ * (A * B * C) ^ 2 := by
    have e : (N : ℤ) * (B ^ 2 * C ^ 2 + A ^ 2 * C ^ 2 + A ^ 2 * B ^ 2)
        = ((X : ℤ) + Y + Z) * (A * B * C) ^ 2 := by
      have e1 : (N : ℤ) * (B ^ 2 * C ^ 2) = X * (A * B * C) ^ 2 := by rw [hXz]; ring
      have e2 : (N : ℤ) * (A ^ 2 * C ^ 2) = Y * (A * B * C) ^ 2 := by rw [hYz]; ring
      have e3 : (N : ℤ) * (A ^ 2 * B ^ 2) = Z * (A * B * C) ^ 2 := by rw [hZz]; ring
      linear_combination e1 + e2 + e3
    rw [e]; exact mul_le_mul_of_nonneg_right (by linarith) (sq_nonneg _)
  have hAM := amgm3 (B ^ 2 * C ^ 2) (A ^ 2 * C ^ 2) (A ^ 2 * B ^ 2) (by positivity) (by positivity)
    (by positivity)
  have e : (B ^ 2 * C ^ 2) * (A ^ 2 * C ^ 2) * (A ^ 2 * B ^ 2) = (A * B * C) ^ 4 := by ring
  rw [e] at hAM
  have hLp : L p < (p : ℤ) ^ 3 := by unfold L; nlinarith
  have hABC : A * B * C < (p : ℤ) ^ 3 := by
    have : ((a * b * c : ℕ) : ℤ) = A * B * C := by push_cast; ring
    linarith
  have hp5' : (5 : ℤ) ≤ p := by exact_mod_cast hp5
  have hNe : (N : ℤ) = (p : ℤ) ^ 2 * q + 12 := by simp [hN]
  exact E_iii_tail p q (A * B * C) _ N δ hp5' hq0 rfl hNe (by positivity) hABC hS hAM (by positivity)

/-! ## E(iv) -/

/-- **Theorem E(iv).** With two repeated primes and a third prime factor, no exponent is `≥ 3`. -/
theorem theoremE_iv (p q r₁ r₂ t : ℕ) (h : Jump p q) (hp5 : 5 ≤ p) (hq5 : 5 ≤ q)
    (hr₁ : r₁.Prime) (hr₂ : r₂.Prime) (ht : t.Prime) (h12 : r₁ ≠ r₂) (ht1 : t ≠ r₁) (ht2 : t ≠ r₂)
    (hd₁ : r₁ ^ 3 ∣ p ^ 2 * q + 12) (hd₂ : r₂ ^ 2 ∣ p ^ 2 * q + 12) (hdt : t ∣ p ^ 2 * q + 12) :
    False := by
  have hd₁' : r₁ ^ 2 ∣ p ^ 2 * q + 12 := (pow_dvd_pow r₁ (by norm_num)).trans hd₁
  have hq0 := theoremE_ii p q r₁ r₂ t h hp5 hq5 hr₁ hr₂ ht h12 ht1 ht2 hd₁' hd₂ hdt
  set N := p ^ 2 * q + 12 with hN
  have hM : r₁ ^ 3 * r₂ ^ 2 ∣ N := Nat.Coprime.mul_dvd_of_dvd_of_dvd (cop_pow hr₁ hr₂ h12 3 2) hd₁ hd₂
  have hφM : r₁ ^ 2 * r₂ ∣ Nat.totient (r₁ ^ 3 * r₂ ^ 2) := by
    rw [Nat.totient_mul (cop_pow hr₁ hr₂ h12 3 2), Nat.totient_prime_pow hr₁ (by norm_num),
      Nat.totient_prime_pow hr₂ (by norm_num)]
    exact ⟨(r₁ - 1) * (r₂ - 1), by ring⟩
  have haN : r₁ ^ 2 * r₂ ∣ N := (Dvd.intro (r₁ * r₂) (by ring)).trans hM
  have hKL := le_L h hp5 (Nat.mul_pos (pow_pos hr₁.pos 2) hr₂.pos) haN (hφM.trans (Nat.totient_dvd_of_dvd hM))
  have hb1 := repeated_prime_bound h hr₁ hd₁'
  have hb2 := repeated_prime_bound h hr₂ hd₂
  set δ : ℤ := (q : ℤ) + 2 * p + 1
  have hNpos : (0 : ℤ) < N := by positivity
  have hδ : (0 : ℤ) < δ := by positivity
  have hN3 : (N : ℤ) ^ 3 ≤ (((r₁ : ℤ) ^ 2 * r₂) ^ 2) * δ ^ 3 := by
    have h1 : (N : ℤ) * N ≤ ((r₁ : ℤ) ^ 2 * δ) * ((r₁ : ℤ) ^ 2 * δ) :=
      mul_le_mul hb1 hb1 hNpos.le (by positivity)
    have h2 : (N : ℤ) * N * N ≤ ((r₁ : ℤ) ^ 2 * δ) * ((r₁ : ℤ) ^ 2 * δ) * ((r₂ : ℤ) ^ 2 * δ) :=
      mul_le_mul h1 hb2 hNpos.le (by positivity)
    nlinarith
  have hK2 : (((r₁ : ℤ) ^ 2 * r₂) ^ 2) * δ ^ 3 ≤ (L p) ^ 2 * δ ^ 3 := by
    have : ((r₁ ^ 2 * r₂ : ℕ) : ℤ) = (r₁ : ℤ) ^ 2 * r₂ := by push_cast; ring
    rw [this] at hKL
    exact mul_le_mul_of_nonneg_right (pow_le_pow_left₀ (by positivity) hKL 2) (by positivity)
  have hp5' : (5 : ℤ) ≤ p := by exact_mod_cast hp5
  have hc := E_iv_cert p q hp5' hq0.le
  have hNe : (N : ℤ) = (p : ℤ) ^ 2 * q + 12 := by simp [hN]
  rw [hNe] at hN3
  unfold L at hK2
  linarith

/-! ## E(i) -/

/-- **Theorem E(i).** If `N` is not a prime power, every prime of `N` has exponent at most `3`. -/
theorem theoremE_i (p q r : ℕ) (h : Jump p q) (hp5 : 5 ≤ p) (hq5 : 5 ≤ q)
    (hω : 2 ≤ (p ^ 2 * q + 12).primeFactors.card)
    (hr : r.Prime) (hd : r ^ 4 ∣ p ^ 2 * q + 12) : False := by
  set N := p ^ 2 * q + 12 with hN
  have hφ : r ^ 3 ∣ Nat.totient (r ^ 4) := by
    rw [Nat.totient_prime_pow hr (by norm_num)]; exact ⟨r - 1, by ring⟩
  have hr3N : r ^ 3 ∣ N := (pow_dvd_pow r (by norm_num)).trans hd
  have hL3 := le_L h hp5 (pow_pos hr.pos 3) hr3N (hφ.trans (Nat.totient_dvd_of_dvd hd))
  have hp5' : (5 : ℤ) ≤ p := by exact_mod_cast hp5
  have hq5' : (5 : ℤ) ≤ q := by exact_mod_cast hq5
  have hLp : L p < (p : ℤ) ^ 3 := by unfold L; nlinarith
  have hrp : r < p := by
    have : ((r : ℤ)) ^ 3 < (p : ℤ) ^ 3 := by push_cast at hL3; linarith
    exact_mod_cast lt_of_pow_lt_pow_left₀ 3 (by positivity) this
  have hr5 := prime_factor_ge_five h.hp h.hq hp5 hq5 hr ((dvd_pow_self r (by norm_num)).trans hd)
  have hrodd : Odd r := hr.odd_of_ne_two (by omega)
  have hpodd : Odd p := h.hp.odd_of_ne_two (by omega)
  have hrp2 : r + 2 ≤ p := by
    obtain ⟨a, ha⟩ := hrodd; obtain ⟨b, hb⟩ := hpodd; omega
  -- another prime factor t
  obtain ⟨t, htN, htr⟩ : ∃ t ∈ N.primeFactors, t ≠ r := by
    by_contra hc; push_neg at hc
    have : N.primeFactors ⊆ {r} := fun x hx => Finset.mem_singleton.2 (hc x hx)
    have := Finset.card_le_card this
    simp at this; omega
  have ht := Nat.prime_of_mem_primeFactors htN
  have htd := Nat.dvd_of_mem_primeFactors htN
  have ht5 := prime_factor_ge_five h.hp h.hq hp5 hq5 ht htd
  have hM : r ^ 4 * t ∣ N := Nat.Coprime.mul_dvd_of_dvd_of_dvd
    (by simpa using cop_pow hr ht (Ne.symm htr) 4 1) hd htd
  have hle : 5 * r ^ 4 ≤ N := by
    have h' : r ^ 4 * 5 ≤ r ^ 4 * t := Nat.mul_le_mul_left _ ht5
    have := Nat.le_of_dvd (by omega) hM
    linarith
  have hb := repeated_prime_bound h hr ((pow_dvd_pow r (by norm_num)).trans hd)
  set δ : ℤ := (q : ℤ) + 2 * p + 1
  have hNpos : (0 : ℤ) < N := by positivity
  have h5 : 5 * (r : ℤ) ^ 4 ≤ N := by exact_mod_cast hle
  have hsq : (N : ℤ) * N ≤ ((r : ℤ) ^ 2 * δ) * ((r : ℤ) ^ 2 * δ) :=
    mul_le_mul hb hb hNpos.le (by positivity)
  have h5N : 5 * (N : ℤ) ≤ δ ^ 2 := by
    by_contra hc; push_neg at hc
    have : (N : ℤ) * δ ^ 2 < (N : ℤ) * (5 * N) := mul_lt_mul_of_pos_left hc hNpos
    nlinarith
  have hrp' : (r : ℤ) ≤ p - 2 := by
    have : ((r + 2 : ℕ) : ℤ) ≤ p := by exact_mod_cast hrp2
    push_cast at this; linarith
  have h1 : (N : ℤ) ≤ ((p : ℤ) - 2) ^ 2 * δ := by
    have : (r : ℤ) ^ 2 ≤ ((p : ℤ) - 2) ^ 2 := pow_le_pow_left₀ (by positivity) hrp' 2
    nlinarith [show (0 : ℤ) ≤ δ by positivity]
  have hNe : (N : ℤ) = (p : ℤ) ^ 2 * q + 12 := by simp [hN]
  rw [hNe] at h1 h5N
  exact E_i_arith p q hp5' hq5' h1 h5N

end P2qExclusions
