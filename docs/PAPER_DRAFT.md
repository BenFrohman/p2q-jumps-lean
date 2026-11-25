# Formalization of Named Spans, Combinatorial Hodge Numbers, and Arithmetic Exclusions

## Abstract

We record Lean 4 formalizations of named algebraic spans for the Hodge conjecture in degree 2 on fourfolds, combinatorial computations of Hodge numbers for a smooth sextic fourfold via the Jacobian ring, and arithmetic exclusions for rational points on the elliptic curve y² = x³ - x² - 12. The general fourfold statement, the full torsion subgroup of the curve, and the Clemens conjecture for d ≥ 12 on a quintic threefold remain open.

## 1. Named Spans

On named spans (projective fourspace, Klein quadric, product of planes, planeSpan on the special sextic) the cycle class map is the identity on a finite-dimensional rational vector space, so the Hodge inclusion holds by rfl.

## 2. Sextic Fourfold Combinatorics

For a smooth sextic fourfold in ℙ⁵ the primitive Hodge numbers are h^{4,0} = 1, h^{3,1} = 426, h^{2,2}_prim = 1751, with b_4 = 2606. These are verified by decide on the Jacobian ring dimensions.

## 3. Curve3936b1

The curve has no 2-torsion. Integral points with y² dividing the discriminant are excluded. The denominator form x.den = d², y.den = d³ holds for rational points. Multiplicative height bounds under doubling are recorded. The statement that the torsion subgroup is trivial remains open.

## 4. Open Frontiers

- general_fourfold for unspecified D with codim = 2
- E(ℚ)_tors = {O} for the curve
- Clemens conjecture for d ≥ 12 (singular at d = 12)

Copyright (c) 2026 Benjamin Stanley Frohman. Apache License 2.0.
