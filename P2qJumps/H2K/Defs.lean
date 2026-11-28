/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import P2qJumps.Hensel.Defs

/-!
# P2qJumps.H2K.Defs

The checker for H2 below `p < 10^6`. Definitions only (core Lean) so that the kernel
evaluation runs in a small environment. For each prime `p` the data gives the factorization
`L(p) = p^3 - p^2 - 12 = 2^a 3^b ∏ rᵢ^eᵢ` with a primality certificate for every `rᵢ`
(a stack program: trial division for small numbers, Lucas–Pratt witnesses otherwise). For every
pair `r₁ ≠ r₂` of these primes the checker `ref` refutes the two shapes `N = r₁² r₂² t` and
`N = r₁² r₂² t u` of Proposition C (the unique rational solution of the linear systems is not
integral, or violates the third equation). Composite `m` in the range are rejected by
`Hensel.comp` or by a divisor witness. The data is produced by an untrusted generator
(`scripts/h2/gen_data.py`) and every item is re-checked here. The soundness theorem is
`P2qJumps.H2K.scan_sound` (`P2qJumps.H2K.Sound`).
-/

namespace P2qJumps

namespace H2K

/-- Trial division: no `d' ∈ [d, √n]` divides `n` (`f` steps of fuel). -/
def td (n : Nat) : Nat → Nat → Bool
  | 0, _ => false
  | f + 1, d => if n < d * d then true else n % d != 0 && td n f (d + 1)

/-- `∏ qᵢ ^ mᵢ` over the common prefix of the two lists. -/
def prodS : List Nat → List Nat → Nat
  | q :: qs, m :: ms => q ^ m * prodS qs ms
  | _, _ => 1

/-- The Lucas conditions for `n` with base `a` and the prime factors `qs` of `n - 1`. -/
def lucas (n a : Nat) (qs : List Nat) : Bool :=
  n < 18446744073709551616 && Hensel.pm n 64 a (n - 1) == 1 && qs.all fun q => Hensel.pm n 64 a ((n - 1) / q) != 1

/-- An instruction of the primality stack program. -/
inductive I where
  /-- Push `n`, proved prime by trial division. -/
  | s (n : Nat)
  /-- Pop `ms.length` primes `qᵢ` with `n - 1 = ∏ qᵢ ^ mᵢ` and push `n`, proved prime by the
  Lucas test with base `a`. -/
  | b (n a : Nat) (ms : List Nat)

/-- Run the stack program; every pushed number is prime (`run_sound`). -/
def run : List I → List Nat → Option (List Nat)
  | [], st => some st
  | .s n :: is, st => if 2 ≤ n && td n n 2 then run is (n :: st) else none
  | .b n a ms :: is, st =>
    if 2 ≤ n && (st.take ms.length).length == ms.length &&
        prodS (st.take ms.length) ms == n - 1 && lucas n a (st.take ms.length)
    then run is (n :: st.drop ms.length) else none

/-- `j = 1` (`N = M t`): with `D1 t = Nt`, `M t - 12 = p² q` and the `σ` equation, the
unique rational solution is not integral or violates the third equation. -/
def j1 (pp M σ b D1 Nt : Int) : Bool :=
  D1 != 0 && (Nt % D1 != 0 || (M * (Nt / D1) - 12) % pp != 0 ||
    σ * (Nt / D1) - b * ((M * (Nt / D1) - 12) / pp) != b + 12 - σ)

/-- `j = 2` (`N = M s t`): with `D2 q = Nq`, `M Π = 12 + p² q` and
`φ S = φ Π - p(p-1) q - 12 + p(p-1) + φ`, the unique rational solution is not integral. -/
def j2 (pp M φ a D2 Nq : Int) : Bool :=
  D2 != 0 && (Nq % D2 != 0 || (12 + pp * (Nq / D2)) % M != 0 ||
    (φ * ((12 + pp * (Nq / D2)) / M) - a * (Nq / D2) - 12 + a + φ) % φ != 0)

/-- Refutes `N = r₁² r₂² t` (`j = 1`) and `N = r₁² r₂² s t` (`j = 2`) for the prime `p`. -/
def ref (p r1 r2 : Int) : Bool :=
  let M := r1 * r1 * r2 * r2
  let φ := r1 * r2 * (r1 - 1) * (r2 - 1)
  let σ := (r1 * r1 + r1 + 1) * (r2 * r2 + r2 + 1)
  let a := p * (p - 1)
  let b := p * p + p + 1
  j1 (p * p) M σ b (p * p * φ - a * M) (p * p * (φ - a + 12) - 12 * a) &&
    j2 (p * p) M φ a (2 * φ * σ * p * p - (σ * a + φ * b) * M)
      ((σ * (12 - a - φ) + φ * (b + 12 - σ)) * M - 24 * φ * σ)

/-- The check for one prime `p`: the program certifies the primes, the factorization of
`L(p)` holds, and every pair of distinct primes is refuted. -/
def okP (p a2 a3 : Nat) (is : List I) (es : List Nat) : Bool :=
  match run is [] with
  | none => false
  | some S =>
    p * p * p - p * p - 12 == 2 ^ a2 * 3 ^ a3 * prodS S es &&
      S.all fun x => S.all fun y => x == y || ref p x y

/-- One data item. -/
inductive E where
  /-- A prime `p` with its certificate. -/
  | pr (p a2 a3 : Nat) (is : List I) (es : List Nat)
  /-- A composite `m` (passing `Hensel.comp`) with a divisor `d`. -/
  | c (m d : Nat)

/-- The number an item is about. -/
def E.m : E → Nat
  | .pr p _ _ _ _ => p
  | .c m _ => m

/-- Check one item. -/
def okE : E → Bool
  | .pr p a2 a3 is es => okP p a2 a3 is es
  | .c m d => 1 < d && d < m && m % d == 0

/-- Scan `m, m+1, …, hi`: a number equal to the next item's `m` is checked by the item, any
other number must be composite (`Hensel.comp`). -/
def scan (hi : Nat) : Nat → Nat → List E → Bool
  | 0, m, _ => decide (hi < m)
  | f + 1, m, l =>
    if hi < m then true
    else match l with
      | [] => Hensel.comp m && scan hi f (m + 1) []
      | e :: rest => if e.m == m then okE e && scan hi f (m + 1) rest
        else Hensel.comp m && scan hi f (m + 1) (e :: rest)

end H2K

end P2qJumps
