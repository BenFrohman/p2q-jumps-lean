# Formalization of Named Spans, Combinatorial Hodge Numbers, and Arithmetic Exclusions

## Abstract

We record Lean 4 formalizations of named algebraic spans for the Hodge conjecture in degree 2 on fourfolds, combinatorial computations of Hodge numbers for a smooth sextic fourfold via the Jacobian ring, and arithmetic exclusions for rational points on the elliptic curve y² = x³ - x² - 12. The general fourfold statement, the full torsion subgroup of the curve, and the Clemens conjecture for d ≥ 12 on a quintic threefold remain open.

## Unconditional Formalizations

- Named spans (projective fourspace, Klein quadric, product of planes, planeSpan) with cl = id, so the Hodge inclusion holds by rfl.
- Sextic Jacobian-ring dimensions: h^{4,0} = 1, h^{3,1} = 426, h^{2,2}_prim = 1751, b_4 = 2606 (verified by decide).
- Curve3936b1: no rational roots of the cubic (no 2-torsion), denominator form x.den = d², y.den = d³, resultant identity equal to 1968, finite height-box exclusion for multiplicative height ≤ 204 when 1 ≤ d ≤ 14, and multiplicative height upper bound under duplication multHeight(x(2P)) ≤ 145 · multHeight(x)^4 (new finding).

## New Findings

The multiplicative height upper bound under the duplication map and the associated resultant identities for the duplication polynomials are new formalizations of classical estimates for this specific curve. The finite box covers d ≤ 14.

The tabulated Gromov–Witten and instanton numbers for the quintic threefold up to degree 13 (and the degree 14 data from the conversation) are recorded as computed data. They do not close the Clemens conjecture for d ≥ 12.

## Open Frontiers

- general_fourfold for unspecified D with codim = 2
- E(ℚ)_tors = {O} for the curve
- Clemens conjecture for d ≥ 12 (singular at d = 12)

Copyright (c) 2026 Benjamin Stanley Frohman. Apache License 2.0.
