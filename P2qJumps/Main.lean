/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/
import P2qJumps.ClosedShapes
import P2qJumps.R2ST
import P2qJumps.R3S
import P2qJumps.Cert.Line
import P2qJumps.Cert.Strip
import P2qJumps.Cert.Pairs

/-!
# Main results of the v1.4 formalization

* `N_not_prime`, `N_ne_rs`: Theorem 1 (closed shapes), items (1) and (3).
* `theorem28_holds` (in `ClosedShapes`): `N` is not a product of three distinct primes.
* `r2st_bound`: shape `r^2 s t` forces `r = p + 4` and `p > 10000`.
* `r2st_empty`: shape `r^2 s t` (pairwise distinct primes `≥ 5`) does not occur.
* `r3s_bound`: shape `r^3 s` forces `p < r`, `r^2 ∣ L(p)` and `p > 10000`.
* `Cert.no_jumps_p2q_le_10000`: no `n = p^2 q ≤ 10000` satisfies both jumps.

The last three rest on the kernel certificates in `P2qJumps.Cert.*`.
-/

namespace P2qJumps

open Nat ArithmeticFunction
open scoped ArithmeticFunction.sigma

/-- Theorem 1(1): `N = p^2 q + 12` is not prime. -/
theorem N_not_prime {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) : ¬ (p ^ 2 * q + 12).Prime := by
  intro hN
  obtain ⟨j1, _⟩ := jumps_p2q_int hp hq hpq hJ
  rw [Nat.totient_prime hN] at j1
  have h1 : 1 ≤ p ^ 2 * q + 12 := by omega
  push_cast [h1] at j1
  have hp2 : (2 : ℤ) ≤ p := by exact_mod_cast hp.two_le
  have hq2 : (2 : ℤ) ≤ q := by exact_mod_cast hq.two_le
  -- `p (p + q - 1) = 1` is impossible.
  have : (p : ℤ) * (p + q - 1) = 1 := by linear_combination j1
  nlinarith

/-- Theorem 1(3): `N = p^2 q + 12` is not a product of two distinct primes. -/
theorem N_ne_rs {p q r s : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime) (hs : s.Prime)
    (hpq : p ≠ q) (hrs : r ≠ s) (hJ : Jumps (p ^ 2 * q)) : p ^ 2 * q + 12 ≠ r * s := by
  intro hN
  obtain ⟨j1, j2⟩ := jumps_p2q_int hp hq hpq hJ
  have crs : r.Coprime s := (Nat.coprime_primes hr hs).2 hrs
  rw [hN, Nat.totient_mul crs, Nat.totient_prime hr, Nat.totient_prime hs] at j1
  rw [hN, isMultiplicative_sigma.map_mul_of_coprime crs, sigma_one_prime' hr,
    sigma_one_prime' hs] at j2
  push_cast [hr.one_le, hs.one_le] at j1 j2
  have E0 : (r : ℤ) * s = (p : ℤ) ^ 2 * q + 12 := by exact_mod_cast hN.symm
  have hp2 : (2 : ℤ) ≤ p := by exact_mod_cast hp.two_le
  have hq2 : (2 : ℤ) ≤ q := by exact_mod_cast hq.two_le
  -- `2 p + q = 1`.
  have : 2 * (p : ℤ) + q = 1 := by linear_combination 2 * E0 - j1 - j2
  linarith

/-- Shape `r^2 s t`: only the line `r = p + 4` survives, and on it `p > 10000`
(kernel certificate `Cert.cert_line`). -/
theorem r2st_bound {p q r s t : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime)
    (hs : s.Prime) (ht : t.Prime) (hpq : p ≠ q) (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t)
    (hr5 : 5 ≤ r) (hs5 : 5 ≤ s) (ht5 : 5 ≤ t) (hJ : Jumps (p ^ 2 * q))
    (hN : p ^ 2 * q + 12 = r ^ 2 * s * t) : r = p + 4 ∧ 10000 < p := by
  obtain ⟨h4, hsq⟩ := r2st_reduction hp hq hr hs ht hpq hrs hrt hst hr5 hs5 ht5 hJ hN
  refine ⟨h4, ?_⟩
  by_contra hle
  push_neg at hle
  have hp5 : 5 ≤ p := by
    have := hp.two_le
    by_contra h
    push_neg at h
    -- `p ∈ {2,3,4}` contradicts `N` coprime to `6`
    have hnd : ∀ d, (d = 2 ∨ d = 3) → ¬ d ∣ r ^ 2 * s * t := by
      intro d hd hdvd
      have hdp : d.Prime := by rcases hd with rfl | rfl <;> norm_num
      rcases (Nat.Prime.dvd_mul hdp).1 hdvd with h | h
      · rcases (Nat.Prime.dvd_mul hdp).1 h with h | h
        · exact prime_ge_five_not_dvd hr hr5 d hd (hdp.dvd_of_dvd_pow h)
        · exact prime_ge_five_not_dvd hs hs5 d hd h
      · exact prime_ge_five_not_dvd ht ht5 d hd h
    exact absurd (p_ge_five_of_dvd hp hN (hnd 2 (Or.inl rfl)) (hnd 3 (Or.inr rfl))).1 (by omega)
  exact Cert.lineCheck_sound Cert.cert_line hp5 (by omega)
    (((p : ℤ) + 4) * ((p : ℤ) + 12) * ((s : ℤ) - t)) (by rw [← hsq]; ring)

/-- Shape `r^2 s t` is impossible. Lemma K in this case gives `r ∣ L(p)`; with `r = p + 4`
(`r2st_bound`) this forces `p + 4 ∣ 92`, contradicting `p > 10000`. -/
theorem r2st_empty {p q r s t : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime)
    (hs : s.Prime) (ht : t.Prime) (hpq : p ≠ q) (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t)
    (hr5 : 5 ≤ r) (hs5 : 5 ≤ s) (ht5 : 5 ≤ t) (hJ : Jumps (p ^ 2 * q)) :
    p ^ 2 * q + 12 ≠ r ^ 2 * s * t := by
  intro hN
  obtain ⟨h4, hbig⟩ := r2st_bound hp hq hr hs ht hpq hrs hrt hst hr5 hs5 ht5 hJ hN
  obtain ⟨j1, _⟩ := jumps_p2q_int hp hq hpq hJ
  obtain ⟨f1, _⟩ := totient_sigma_r2st hr hs ht hrs hrt hst
  rw [hN] at j1
  have E0 : (r : ℤ) ^ 2 * ((s : ℤ) * t) = (p : ℤ) ^ 2 * q + 12 := by
    have := congrArg (fun x : ℕ => (x : ℤ)) hN; push_cast at this; linarith
  have E1 : (r : ℤ) * (r - 1) * (s - 1) * (t - 1) = (p : ℤ) * (p - 1) * (q - 1) + 12 := by
    rw [← f1, j1]
  -- Lemma K, case `K = r`: `r ∣ p (p + q - 1)`, hence `r ∣ p + q - 1`, hence `r ∣ L(p)`.
  have hA : (r : ℤ) ∣ (p : ℤ) * ((p : ℤ) + q - 1) :=
    ⟨r * s * t - (r - 1) * (s - 1) * (t - 1), by linear_combination (-1 : ℤ) * E0 + E1⟩
  have hrZ : Prime (r : ℤ) := Nat.prime_iff_prime_int.mp hr
  have hrp : ¬ (r : ℤ) ∣ (p : ℤ) := by
    rw [Int.natCast_dvd_natCast]
    intro h
    have := Nat.le_of_dvd hp.pos h
    omega
  have hB : (r : ℤ) ∣ (p : ℤ) + q - 1 := (hrZ.dvd_or_dvd hA).resolve_left hrp
  have hLeq : (p : ℤ) ^ 3 - p ^ 2 - 12 = p ^ 2 * ((p : ℤ) + q - 1) - r * (r * s * t) := by
    linear_combination E0
  have hL : (r : ℤ) ∣ (p : ℤ) ^ 3 - p ^ 2 - 12 := by
    rw [hLeq]; exact dvd_sub (dvd_mul_of_dvd_right hB _) (dvd_mul_right _ _)
  rw [h4] at hL
  push_cast at hL
  have h92 : ((p : ℤ) + 4) ∣ 92 := by
    have : (92 : ℤ) = ((p : ℤ) + 4) * ((p : ℤ) ^ 2 - 5 * p + 20) - ((p : ℤ) ^ 3 - p ^ 2 - 12) := by
      ring
    rw [this]; exact dvd_sub (dvd_mul_right _ _) hL
  have := Int.le_of_dvd (by norm_num) h92
  omega

/-- Shape `r^3 s`: `p < r`, `r^2 ∣ L(p)`, and `p > 10000` (kernel certificate
`Cert.cert_strip`). -/
theorem r3s_bound {p q r s : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime) (hs : s.Prime)
    (hpq : p ≠ q) (hrs : r ≠ s) (hr5 : 5 ≤ r) (hs5 : 5 ≤ s) (hJ : Jumps (p ^ 2 * q))
    (hN : p ^ 2 * q + 12 = r ^ 3 * s) :
    p < r ∧ ((r : ℤ) ^ 2 ∣ Lpoly p) ∧ 10000 < p := by
  obtain ⟨hlt, hdvd⟩ := r3s_reduction hp hq hr hs hpq hrs hr5 hs5 hJ hN
  refine ⟨hlt, hdvd, ?_⟩
  by_contra hle
  push_neg at hle
  have hnd : ∀ d, (d = 2 ∨ d = 3) → ¬ d ∣ r ^ 3 * s := by
    intro d hd hdvd
    have hdp : d.Prime := by rcases hd with rfl | rfl <;> norm_num
    rcases (Nat.Prime.dvd_mul hdp).1 hdvd with h | h
    · exact prime_ge_five_not_dvd hr hr5 d hd (hdp.dvd_of_dvd_pow h)
    · exact prime_ge_five_not_dvd hs hs5 d hd h
  have hp5 := (p_ge_five_of_dvd hp hN (hnd 2 (Or.inl rfl)) (hnd 3 (Or.inr rfl))).1
  exact Cert.strip_le_10000 hp hp5 (by omega) r hr hlt hdvd

end P2qJumps
