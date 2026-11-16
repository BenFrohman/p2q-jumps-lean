/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

-- Axiom audit: prints the axioms of every theorem/lemma in the project.
-- CI fails unless each depends only on propext, Classical.choice, Quot.sound (or none).
import P2qJumps
import P2qJumps.LeadingForm
import P2qJumps.Statement

/-!
# AxiomAudit

Machine-checked Lean 4 module.
-/

#print axioms P2qJumps.g_ge_six
#print axioms P2qJumps.g_sub_six_eq
#print axioms P2qJumps.quad_sos
#print axioms P2qJumps.theorem28_from_paper
