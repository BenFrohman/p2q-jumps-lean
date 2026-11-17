/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Hensel.Kernel
import P2qJumps.R3S
import P2qJumps.Preamble

/-!
# P2qJumps.Hensel

The bound `5 ≤ r ≤ 10^6` of the `r^3 s` strip, kernel-checked (paper Section
`sec:v14-external`, `scripts/r2/r2_rbound.py 1000000`, and the block's "Hensel lifting excludes
all primes `5 ≤ r ≤ 10^6`"): there are no primes `p, r` with `5 ≤ p < r ≤ 10^6` and
`r^2 ∣ L(p) = p^3 - p^2 - 12`. Proof: the checker `Hensel.scan` (`P2qJumps.Hensel.Defs`), its
soundness theorem `Hensel.scan_sound`, and the kernel certificates `P2qJumps.Hensel.Kernel.*`
(`decide +kernel`).
-/

namespace P2qJumps

open Nat

/-- **Hensel bound, `5 ≤ r ≤ 10^6`.** No primes `p, r` with `5 ≤ p < r ≤ 10^6` and
`r^2 ∣ L(p)`. -/
theorem hensel_r_le_1e6 {p r : ℕ} (hp : p.Prime) (hr : r.Prime) (hp5 : 5 ≤ p) (hpr : p < r)
    (hr6 : r ≤ 10 ^ 6) : ¬ ((r : ℤ) ^ 2 ∣ Lpoly p) := by
  have := Hensel.good_upto r (by omega) (by simpa using hr6) hr p hp hp5 hpr
  simpa [Lpoly] using this

/-- **Shape `r^3 s` with `5 ≤ r ≤ 10^6`** (Theorem L(iv) and the Hensel bound, independent of
`r3s_empty`): under both jumps at `n = p^2 q`, `n + 12 ≠ r^3 s` for distinct primes
`r, s ≥ 5` with `r ≤ 10^6`. -/
theorem r3s_r_le_1e6 {p q r s : ℕ} (hp : p.Prime) (hq : q.Prime) (hr : r.Prime) (hs : s.Prime)
    (hpq : p ≠ q) (hrs : r ≠ s) (hr5 : 5 ≤ r) (hs5 : 5 ≤ s) (hr6 : r ≤ 10 ^ 6)
    (hJ : Jumps (p ^ 2 * q)) : p ^ 2 * q + 12 ≠ r ^ 3 * s := by
  intro hN
  obtain ⟨hpr, hdvd⟩ := r3s_reduction hp hq hr hs hpq hrs hr5 hs5 hJ hN
  obtain ⟨hp5, _, _, _, _⟩ := preamble hp hq hpq hJ
  exact hensel_r_le_1e6 hp hr hp5 hpr hr6 hdvd

end P2qJumps
