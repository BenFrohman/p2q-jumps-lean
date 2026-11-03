-- Axiom audit: prints the axioms of every theorem/lemma in the project.
-- CI fails unless each depends only on propext, Classical.choice, Quot.sound (or none).
import P2qJumps
import P2qJumps.LeadingForm
import P2qJumps.Statement

#print axioms P2qJumps.g_ge_six
#print axioms P2qJumps.g_sub_six_eq
#print axioms P2qJumps.quad_sos
#print axioms P2qJumps.theorem28_from_paper
