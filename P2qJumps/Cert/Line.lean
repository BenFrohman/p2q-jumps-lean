/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/
import P2qJumps.Cert.Core

/-!
# Kernel certificate: the line `r = p + 4` for `5 ≤ p ≤ 10000`

`2 F(p)` is not a perfect square for any natural `5 ≤ p ≤ 10000`. Checked by kernel reduction
(`decide +kernel`); no `native_decide`.
-/

namespace P2qJumps.Cert

theorem cert_line : lineCheck 10001 = true := by decide +kernel

end P2qJumps.Cert
