# Trivial torsion of E : y^2 = x^3 - x^2 - 12 (3936.b1): plan and status

Status: UNFINISHED. Nothing in this note is a Lean theorem. Identities below were found with
SymPy and are not yet checked by `ring`; they must be before anything relies on them.

Target (Mathlib's group law):

    theorem torsion_trivial (P : E3936.toAffine.Point) (hP : IsOfFinOrder P) : P = 0

## Proved on this branch (pending CI)

`P2qJumps/Curve3936Finite.lean`: Bezout identity `(3x-164) f + (-x^2+55x-18) f' = 1968`,
refutation of the forwarded identity with right side 3936, fixed `validYList` (with `y = 0`),
proof that the forwarded claim "no integer point with `y = 0` or `y | 3936`" is false
(`(4, 6)`, `6 | 3936`), and the correct finite step: no integer point with `y = 0` or `y^2 | 3936`.

## Route chosen: doubling plus naive height (no formal group, no general addition)

1. Height `H(x) = max(|num x|, den x)`. Height of a point: `H(0) = 0`, `H(x, y) = H(x)`.
2. Doubling: for `y != 0`, `x(2P) = A/D` with, for `x = m/n` in lowest terms,
   `A = m^4 + 96 m n^3 - 48 n^4`, `D = 4 n (m^3 - m^2 n - 12 n^3)`.
3. Homogeneous Bezout (SymPy, unverified):
   `F1 A + G1 D = 15744 n^7`, `F1 = 12 m^2 n - 8 m n^2 - 4 n^3`, `G1 = -3 m^3 - m^2 n - 324 n^3`;
   `F2 A + G2 D = 82 m^7`, `F2 = 82 m^3 - 60 m^2 n + 12 m n^2 - 864 n^3`,
   `G2 = 15 m^3 + 12 m^2 n - 1740 m n^2 + 864 n^3`.
4. If `x(2P) = num/den` then `D = den k`, `A = num k`, and `k | 15744` (coprimality of m, n).
   Bounding the cofactors gives `H(x(2P)) >= H(x)^4 / C` for an explicit `C`, so
   `H(2P) <= H(P)` forces `H(P) <= B` (about 89 with the crude constants).
5. If `P` is torsion and nonzero, take `Q` of maximal height in the finite orbit `{kP}`. Then
   `2Q` is in the orbit, `2Q != 0` (no rational root of `x^3 - x^2 - 12`, so no 2-torsion), and
   `H(2Q) <= H(Q)`, so `H(Q) <= B`.
6. Kernel search over coprime `(m, n)` with `|m|, n <= B`: every candidate either is not on
   the curve or has `H(x(2P)) > H(x)`. Contradiction, so `P = 0`.

This avoids Nagell-Lutz integrality (E_1(Q_p) torsion-free) entirely; only doubling is used.

## Remaining work

- Lean statements of steps 2-6 against `WeierstrassCurve.Affine.Point` (names on Mathlib
  `2df2f01`, the rev pinned by this repo's lake-manifest.json with Lean v4.26.0).
- The finite search in step 6 (to be sized; run the search before choosing `B`).
- Estimate: 1-3 focused days with a working local Lean build; the box build was unavailable.
