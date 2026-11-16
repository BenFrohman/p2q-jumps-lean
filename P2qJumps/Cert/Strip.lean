/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/
import P2qJumps.Cert.Core

/-!
# Kernel certificate: the strip `r^2 ∣ L(p)`, `r > p` for primes `5 ≤ p ≤ 10000`

For every prime `5 ≤ p ≤ 10000`, removing all prime factors `≤ p` from `L(p) = p^3 - p^2 - 12`
(via `gcd (·, p!)`) leaves `1` or a non-square, so no prime `r > p` has `r^2 ∣ L(p)`.
Checked by kernel reduction (`decide +kernel`) in eight chunks of 1250 (to bound kernel
memory); no `native_decide`.
-/

namespace P2qJumps.Cert

theorem cert_strip_0 : gstripLoop 1250 0 (Nat.factorial 0) = true := by decide +kernel

theorem cert_strip_1 : gstripLoop 1250 1250 (Nat.factorial 1250) = true := by decide +kernel

theorem cert_strip_2 : gstripLoop 1250 2500 (Nat.factorial 2500) = true := by decide +kernel

theorem cert_strip_3 : gstripLoop 1250 3750 (Nat.factorial 3750) = true := by decide +kernel

theorem cert_strip_4 : gstripLoop 1250 5000 (Nat.factorial 5000) = true := by decide +kernel

theorem cert_strip_5 : gstripLoop 1250 6250 (Nat.factorial 6250) = true := by decide +kernel

theorem cert_strip_6 : gstripLoop 1250 7500 (Nat.factorial 7500) = true := by decide +kernel

theorem cert_strip_7 : gstripLoop 1251 8750 (Nat.factorial 8750) = true := by decide +kernel

/-- Combined strip certificate: for every prime `5 ≤ p ≤ 10000`, no prime `r > p` has
`r ^ 2 ∣ L(p)`. -/
theorem strip_le_10000 {p : ℕ} (hp : p.Prime) (hp5 : 5 ≤ p) (hle : p ≤ 10000) :
    ∀ r : ℕ, r.Prime → p < r → ¬ ((r : ℤ) ^ 2 ∣ Lpoly p) := by
  by_cases h0 : p < 1250
  · exact gstripLoop_sound 1250 0 cert_strip_0 p hp hp5 (by omega) (by omega)
  by_cases h1 : p < 2500
  · exact gstripLoop_sound 1250 1250 cert_strip_1 p hp hp5 (by omega) (by omega)
  by_cases h2 : p < 3750
  · exact gstripLoop_sound 1250 2500 cert_strip_2 p hp hp5 (by omega) (by omega)
  by_cases h3 : p < 5000
  · exact gstripLoop_sound 1250 3750 cert_strip_3 p hp hp5 (by omega) (by omega)
  by_cases h4 : p < 6250
  · exact gstripLoop_sound 1250 5000 cert_strip_4 p hp hp5 (by omega) (by omega)
  by_cases h5 : p < 7500
  · exact gstripLoop_sound 1250 6250 cert_strip_5 p hp hp5 (by omega) (by omega)
  by_cases h6 : p < 8750
  · exact gstripLoop_sound 1250 7500 cert_strip_6 p hp hp5 (by omega) (by omega)
  exact gstripLoop_sound 1251 8750 cert_strip_7 p hp hp5 (by omega) (by omega)

end P2qJumps.Cert
