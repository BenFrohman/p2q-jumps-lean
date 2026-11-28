/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

/-!
# P2qJumps.Hensel.Defs

The checker for the bound `5 ≤ r ≤ 10^6` of the `r^3 s` strip: no primes `p < r` with
`r^2 ∣ L(p) = p^3 - p^2 - 12`. Definitions only (core Lean, no imports) so that the kernel
evaluation runs in a small environment. The soundness theorem is `P2qJumps.Hensel.scan_sound`
(`P2qJumps.Hensel.Sound`); the kernel certificates are in `P2qJumps.Hensel.Kernel`.

Every number is a natural number; residues modulo `r` are taken with `%`. The data (roots of
`L` modulo `r`, divisors of base-2 Fermat pseudoprimes) is produced by an untrusted generator
(`scripts/hensel/gen_kernel.py`) and every item is re-checked here.
-/

namespace P2qJumps

namespace Hensel

/-- `b ^ e % m` by binary exponentiation with `f` bits of fuel. -/
def pm (m : Nat) : Nat → Nat → Nat → Nat
  | 0, _, _ => 1 % m
  | f + 1, b, e =>
    if e % 2 = 0 then pm m f (b * b % m) (e / 2) else pm m f (b * b % m) (e / 2) * b % m

/-- Residues modulo `L(x) = x^3 - x^2 - 12` and `r`: `t0 + t1 x + t2 x^2`. -/
structure T where
  t0 : Nat
  t1 : Nat
  t2 : Nat

/-- Product in `(ℤ/r)[x]/(x^3 - x^2 - 12)`, using `x^3 = x^2 + 12`, `x^4 = x^2 + 12 x + 12`. -/
def mulT (r : Nat) (a b : T) : T :=
  let c0 := a.t0 * b.t0
  let c1 := a.t0 * b.t1 + a.t1 * b.t0
  let c2 := a.t0 * b.t2 + a.t1 * b.t1 + a.t2 * b.t0
  let c3 := a.t1 * b.t2 + a.t2 * b.t1
  let c4 := a.t2 * b.t2
  ⟨(c0 + 12 * c3 + 12 * c4) % r, (c1 + 12 * c4) % r, (c2 + c3 + c4) % r⟩

/-- `a ^ e` in `(ℤ/r)[x]/(L)`, `f` bits of fuel. -/
def powT (r : Nat) : Nat → T → Nat → T
  | 0, _, _ => ⟨1 % r, 0, 0⟩
  | f + 1, a, e =>
    if e % 2 = 0 then powT r f (mulT r a a) (e / 2) else mulT r (powT r f (mulT r a a) (e / 2)) a

/-- The residue `x`. -/
def X : T := ⟨0, 1, 0⟩

/-- `h = x^r - x` in `(ℤ/r)[x]/(L)`. -/
def hOf (r : Nat) : T :=
  let g := powT r 21 X r
  ⟨g.t0, (g.t1 + r - 1) % r, g.t2⟩

/-- Positive part of the determinant of the rows `u, v, w`. -/
def detP (u v w : T) : Nat := u.t0 * v.t1 * w.t2 + u.t1 * v.t2 * w.t0 + u.t2 * v.t0 * w.t1

/-- Negative part of the determinant of the rows `u, v, w`. -/
def detQ (u v w : T) : Nat := u.t2 * v.t1 * w.t0 + u.t0 * v.t2 * w.t1 + u.t1 * v.t0 * w.t2

/-- `L` has no root modulo `r`: with `h = x^r - x` (reduced mod `L`), the rows
`h, x h, x^2 h` have a determinant prime to `r`. -/
def noRoot (r : Nat) : Bool :=
  r < 2097152 &&
    detP (hOf r) (mulT r (hOf r) X) (mulT r (mulT r (hOf r) X) X) % r !=
      detQ (hOf r) (mulT r (hOf r) X) (mulT r (mulT r (hOf r) X) X) % r

/-- `m` is not prime: a small factor, or the base-2 Fermat test fails. -/
def comp (m : Nat) : Bool :=
  (m % 2 == 0 && 2 < m) || (m % 3 == 0 && 3 < m) || (m % 5 == 0 && 5 < m) ||
    (m % 7 == 0 && 7 < m) || (2 < m && m < 2097152 && pm m 21 2 (m - 1) != 1)

/-- The root `s` of `L` modulo `r` is not a prime `p ≥ 5` with `r^2 ∣ L(p)`. -/
def okRoot (r s : Nat) : Bool :=
  s < 5 || (s * s * s - s * s - 12) % (r * r) != 0 || comp s

/-- One data item. -/
inductive Ent where
  /-- `L` has no root modulo the prime `r`. -/
  | none (r : Nat)
  /-- `L ≡ (x - s)(x^2 + b x + c)` modulo `r` with the quadratic irreducible. -/
  | one (r s : Nat)
  /-- `L ≡ (x - s1)(x - s2)(x - s3)` modulo `r`. -/
  | three (r s1 s2 s3 : Nat)
  /-- `r` is composite, `d` a proper divisor. -/
  | comp (r d : Nat)

/-- The number an item is about. -/
def Ent.r : Ent → Nat
  | .none r => r
  | .one r _ => r
  | .three r _ _ _ => r
  | .comp r _ => r

/-- Check one item. -/
def okEnt : Ent → Bool
  | .none r => noRoot r
  | .one r s =>
    let b := (s + r - 1) % r
    let c := s * b % r
    let D := (b * b + 4 * r * r - 4 * c) % r
    r < 2097152 && s < r && s * s * s % r == (s * s + 12) % r && pm r 21 D ((r - 1) / 2) == r - 1 && okRoot r s
  | .three r s1 s2 s3 =>
    s1 < r && s2 < r && s3 < r && (s1 + s2 + s3) % r == 1 % r &&
      (s1 * s2 + s1 * s3 + s2 * s3) % r == 0 && (s1 * s2 * s3) % r == 12 % r &&
      okRoot r s1 && okRoot r s2 && okRoot r s3
  | .comp r d => 1 < d && d < r && r % d == 0

/-- Scan `m, m+1, …, hi`: a number equal to the next item's `r` is checked by the item, any
other number must be composite (`comp`). -/
def scan (hi : Nat) : Nat → Nat → List Ent → Bool
  | 0, m, _ => decide (hi < m)
  | f + 1, m, l =>
    if hi < m then true
    else match l with
      | [] => comp m && scan hi f (m + 1) []
      | e :: rest => if e.r == m then okEnt e && scan hi f (m + 1) rest
        else comp m && scan hi f (m + 1) (e :: rest)

end Hensel

end P2qJumps
