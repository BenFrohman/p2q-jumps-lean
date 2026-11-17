/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib.Data.Int.Cast.Basic

/-!
# P2qJumps.P7Defs

The branch-and-bound checker `desc` for the squarefree `p = 7` descent (paper Appendix `app:p7`).
Definitions only; the soundness theorem is `P2qJumps.P7Cert.desc_sound` and the kernel
certificates are in `P2qJumps.P7Kernel`. Kept on a minimal import so that the kernel evaluation
runs with a small environment.
-/

namespace P2qJumps

namespace P7Cert

/-- The two necessary conditions for the next prime `r` with `m` primes left. -/
def okR (b h s : ℤ) (m r : ℕ) : Bool :=
  decide (7 * h * ((r : ℤ) - 1) ^ m < 6 * b * (r : ℤ) ^ m) &&
    decide (57 * b * (r : ℤ) ^ m < 49 * s * ((r : ℤ) + 1) ^ m)

/-- Terminal step (two primes left): the linear system in `P = xy` has determinant `det`;
`true` means no integer `(x, y)` can complete the prefix. -/
def terminal (b h s : ℤ) : Bool :=
  decide (2 * (7 * h) * (49 * s) - 6 * b * (49 * s) - 57 * b * (7 * h) ≠ 0) &&
    (decide (((-282 - 7 * h) * (49 * s) + 7 * h * (2697 - 49 * s)) %
        (2 * (7 * h) * (49 * s) - 6 * b * (49 * s) - 57 * b * (7 * h)) ≠ 0) ||
      decide ((6 * b * (((-282 - 7 * h) * (49 * s) + 7 * h * (2697 - 49 * s)) /
        (2 * (7 * h) * (49 * s) - 6 * b * (49 * s) - 57 * b * (7 * h))) - 282) % (7 * h) ≠ 0))

/-- Scan `r, r+1, …` while `ok` holds, calling `child` on every `r` prime to `210`. -/
def loopR (child : ℕ → Bool) (ok : ℕ → Bool) : ℕ → ℕ → Bool
  | 0, _ => false
  | F + 1, r => if ok r then ((if Nat.gcd r 210 = 1 then child r else true) && loopR child ok F (r + 1))
      else true

/-- The descent: prefix `b`, `h = ∏ (x - 1)`, `s = ∏ (x + 1)`, largest prefix element `last`,
`m` elements left. -/
def desc : ℕ → ℤ → ℤ → ℤ → ℕ → ℕ → Bool
  | 0, _, _, _, _, _ => false
  | fuel + 1, b, h, s, last, m =>
    if m = 2 then terminal b h s
    else if m < 2 then false
    else if 1 ≤ 6 * b - 7 * h then true
    else if 1 ≤ 49 * s - 57 * b then decide (12 ≤ last)
    else if 6 * b - 7 * h = 0 ∨ 49 * s - 57 * b = 0 then true
    else if 1 ≤ 342 * b * b - 343 * h * s then true
    else loopR (fun r => desc fuel (b * r) (h * ((r : ℤ) - 1)) (s * ((r : ℤ) + 1)) r (m - 1))
      (okR b h s m) 300 (max (last + 1) 11)

end P7Cert

end P2qJumps
