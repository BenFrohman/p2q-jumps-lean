/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

/-!
# P2qJumps.Omega4Q.Defs

The checker for "no solution with `ω(N) ≥ 4` and `q ≤ 10^6`". Definitions only (core Lean, no
imports) so that the kernel evaluation runs in a small environment. The soundness theorem is
`P2qJumps.Omega4Q.chkP_sound` (`P2qJumps.Omega4Q.Sound`); the kernel certificates are in
`P2qJumps.Omega4Q.Kernel`. No external data: every step is computed by the kernel.

For a prime `p` and `q` in a range, with `N = p^2 q + 12` and `F = p (p - 1) (q - 1) + 12`
(`= φ(N)` under the totient jump), the checker uses only: `16 ∣ F` (four odd prime factors),
every prime factor of `N` exceeds `p` (`omega4_constraints`), `φ(d^e) ∣ φ(N)` for every prime
power `d^e ∣ N`, and the size bound `C ≥ d^j` for `C` with `j` prime factors all `≥ d`.
-/

namespace P2qJumps

namespace Omega4Q

/-- `n!`. -/
def fct : Nat → Nat
  | 0 => 1
  | n + 1 => (n + 1) * fct n

/-- Remove every factor `d` from `C` (`f` steps of fuel). -/
def stripC (d : Nat) : Nat → Nat → Nat
  | 0, C => C
  | f + 1, C => if C % d = 0 then stripC d f (C / d) else C

/-- `D` is a power of `d` (`f` steps of fuel). -/
def isPow (d : Nat) : Nat → Nat → Bool
  | 0, _ => false
  | f + 1, D => D == 1 || (D % d == 0 && isPow d f (D / d))

/-- Trial division from `d` (odd) upward on the cofactor `C` with `k` prime factors removed.
`true` means: no `N` with `ω(N) ≥ 4` and `φ(N) = F` is compatible. -/
def tl (F : Nat) : Nat → Nat → Nat → Nat → Bool
  | 0, _, _, _ => false
  | f + 1, d, C, k =>
    if C < d ^ (4 - k) then true
    else if C % d = 0 then
      let C' := stripC d 64 C
      let D := C / C'
      if C' * D == C && C' % d != 0 && isPow d 64 D then
        if F % (D / d * (d - 1)) != 0 then true
        else if 3 ≤ k then false
        else tl F f (d + 2) C' (k + 1)
      else false
    else tl F f (d + 2) C k

/-- One `q`: `q` is skipped when `gcd(q, 1000!)` shows it composite; otherwise `N` has a prime
factor `≤ p` (`gcd(N, p!) ≠ 1`), or trial division from `p + 2` succeeds. -/
def chkQ (p P1 F1000 q : Nat) : Bool :=
  (Nat.gcd q F1000 != 1 && (Nat.gcd q F1000 != q || 1000 < q)) ||
    Nat.gcd (p * p * q + 12) P1 != 1 ||
    tl (p * (p - 1) * (q - 1) + 12) 1000000 (p + 2) (p * p * q + 12) 0

/-- `q = s, s + 16, s + 32, … ≤ hi`. -/
def loopQ (p P1 F1000 hi : Nat) : Nat → Nat → Bool
  | 0, s => decide (hi < s)
  | f + 1, s => if hi < s then true else chkQ p P1 F1000 s && loopQ p P1 F1000 hi f (s + 16)

/-- The first `s ≥ lo` with `s % 16 = c % 16`. -/
def start (lo c : Nat) : Nat := lo + (c + 16 - lo % 16) % 16

/-- All `q ∈ [lo, hi]`: the odd residue classes `c` mod 16 with `16 ∣ p (p - 1) (c - 1) + 12`
are scanned. -/
def chkP (p lo hi : Nat) : Bool :=
  [1, 3, 5, 7, 9, 11, 13, 15].all fun c =>
    (p * (p - 1) * (c - 1) + 12) % 16 != 0 ||
      loopQ p (fct p) (fct 1000) hi ((hi + 16 - lo) / 16 + 1) (start lo c)

end Omega4Q

end P2qJumps
