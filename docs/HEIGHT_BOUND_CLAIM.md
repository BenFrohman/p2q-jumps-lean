# Claimed effective height constant for y² = x³ - x² - 12

## Claimed bound

From the duplication formula and the resultant identity equal to 1968, the difference between the canonical height and half the naive height of the x-coordinate satisfies

| ĥ(P) - (1/2) h(x(P)) | < 2.66.

For a torsion point this forces h(x(P)) < 5.32, hence the reduced denominator d of x = a/d² satisfies d ≤ 14.

## Status

This bound is a classical estimate. It has not been formalized in Lean in this repository. The finite exclusion of integral points (d = 1) is proved in Curve3936b1/FiniteExclusion.lean. The verification that no rational point with 2 ≤ d ≤ 14 exists, or that doubling forces the denominator to grow beyond 14, remains open.

The statement E(ℚ)_tors = {O} is therefore not claimed.

Copyright (c) 2026 Benjamin Stanley Frohman. Apache License 2.0.
