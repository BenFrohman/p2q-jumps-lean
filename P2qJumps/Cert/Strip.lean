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
Checked by kernel reduction (`decide +kernel`); no `native_decide`.
-/

namespace P2qJumps.Cert

theorem cert_strip : gstripLoop 10001 0 1 = true := by decide +kernel

end P2qJumps.Cert
