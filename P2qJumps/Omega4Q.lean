/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Omega4Q.Kernel
import P2qJumps.ClosedLedger

/-!
# P2qJumps.Omega4Q

**No `ω(N) ≥ 4` solution with `q ≤ 10^6`, kernel-checked.** For distinct primes `p, q` with
`Jumps (p^2 q)` and `q ≤ 10^6`, the number `N = p^2 q + 12` has at most three distinct prime
factors.

Proof: if `ω(N) ≥ 4`, then `3 p^2 ≤ q` and every prime factor of `N` exceeds `p`
(`omega4_size`), so `p ≤ 577`; `N` is odd (`preamble`), so `2^ω(N) ∣ φ(N)` gives
`16 ∣ φ(N) = p (p - 1) (q - 1) + 12` (`jumps_p2q_int`). The kernel certificates (`chkQ_all`)
then refute every such `q` through `chkQ_sound`.
-/

namespace P2qJumps

open Nat

/-- **No `ω(N) ≥ 4` solution with `q ≤ 10^6`.** -/
theorem omega4_q_le_1e6 {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p ≠ q)
    (hJ : Jumps (p ^ 2 * q)) (hq6 : q ≤ 10 ^ 6) :
    (p ^ 2 * q + 12).primeFactors.card < 4 := by
  by_contra hω
  push_neg at hω
  obtain ⟨h3, hbig, -⟩ := omega4_size hp hq hpq hJ hω
  obtain ⟨hp5, hq5, hodd, -, -⟩ := preamble hp hq hpq hJ
  obtain ⟨j1, -⟩ := jumps_p2q_int hp hq hpq hJ
  set N := p ^ 2 * q + 12 with hN
  have hN' : N = p * p * q + 12 := by rw [hN]; ring
  have hNodd : N % 2 = 1 := Nat.odd_iff.1 hodd
  have hF : φ N = p * (p - 1) * (q - 1) + 12 := by
    have h1 : 1 ≤ p := hp.one_le
    have h2 : 1 ≤ q := hq.one_le
    zify [h1, h2]
    exact j1
  have h16 : (p * (p - 1) * (q - 1) + 12) % 16 = 0 := by
    rw [← hF]
    have hd : 2 ^ 4 ∣ φ N :=
      (Nat.pow_dvd_pow 2 hω).trans (Omega4Q.two_pow_card_dvd_totient (by omega) hNodd)
    exact Nat.mod_eq_zero_of_dvd (by norm_num at hd; exact hd)
  have h3' : 3 * p * p ≤ q := by nlinarith [h3]
  have hp577 : p ≤ 577 := by
    by_contra hc
    push_neg at hc
    have : 3 * 578 * 578 ≤ 3 * p * p := Nat.mul_le_mul (Nat.mul_le_mul_left 3 hc) hc
    omega
  have hqo : q % 2 = 1 := Nat.odd_iff.1 (hq.odd_of_ne_two (by omega))
  have hchk := Omega4Q.chkQ_all hp hp5 hp577 h3' (by norm_num at hq6; omega) hqo h16
  exact Omega4Q.chkQ_sound hchk hp hp5 hq hN' hF hNodd hbig hω

end P2qJumps
