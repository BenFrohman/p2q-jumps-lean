# Axiom status

The file Curve3936b1/ArithmeticCore.lean uses only the standard axioms
`propext`, `Classical.choice`, and `Quot.sound` (via `decide` and `ring`).
A `#print axioms` check must be run on a machine with the pinned Mathlib
to confirm.

The height-growth and totient-collapse steps that would complete the
torsion argument are not present. No claim of E(ℚ)_tors = {O} is made.

Copyright (c) 2026 Benjamin Stanley Frohman. Apache License 2.0.
