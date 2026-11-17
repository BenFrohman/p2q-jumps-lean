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
import P2qJumps.ClosedShapes
import P2qJumps.Q_neg_positivity
import P2qJumps.Semantics

/-!
# AxiomAudit

Machine-checked Lean 4 module.
-/

#print axioms P2qJumps.g_ge_six
#print axioms P2qJumps.g_sub_six_eq
#print axioms P2qJumps.quad_sos
#print axioms P2qJumps.theorem28_from_paper
#print axioms P2qJumps.discriminant_ratio_bound
#print axioms P2qJumps.theorem28_discriminant
#print axioms P2qJumps.theorem28_holds
#print axioms P2qJumps.H_positive_on_region
#print axioms P2qJumps.theorem28_jumps_hypothesis_needed

-- v1.4: shape reductions, kernel certificates, main results, semantics lock
#print axioms P2qJumps.sigma_one_prime'
#print axioms P2qJumps.sigma_one_prime_sq
#print axioms P2qJumps.sigma_one_prime_cube
#print axioms P2qJumps.totient_sigma_p2q
#print axioms P2qJumps.totient_sigma_r2st
#print axioms P2qJumps.totient_sigma_r3s
#print axioms P2qJumps.jumps_p2q_int
#print axioms P2qJumps.p_ge_five_of_dvd
#print axioms P2qJumps.prime_ge_five_not_dvd
#print axioms P2qJumps.discriminant_identity
#print axioms P2qJumps.H_line_p4
#print axioms P2qJumps.A_pos_of_gt
#print axioms P2qJumps.Q_pos_of_gt
#print axioms P2qJumps.A_pos_line_p2
#print axioms P2qJumps.r2st_linear
#print axioms P2qJumps.r2st_disc
#print axioms P2qJumps.r2st_reduction
#print axioms P2qJumps.r3s_reduction
#print axioms P2qJumps.Cert.allBelow_spec
#print axioms P2qJumps.Cert.notSquareB_spec
#print axioms P2qJumps.Cert.notSquareB_spec_int
#print axioms P2qJumps.Cert.F8nat_cast
#print axioms P2qJumps.Cert.lineCheck_sound
#print axioms P2qJumps.Cert.strip_zero
#print axioms P2qJumps.Cert.strip_succ
#print axioms P2qJumps.Cert.strip_spec
#print axioms P2qJumps.Cert.Lnat_cast
#print axioms P2qJumps.Cert.primeFilter_of_prime
#print axioms P2qJumps.Cert.stripB_sound
#print axioms P2qJumps.Cert.stripCheck_sound
#print axioms P2qJumps.Cert.sigAux_eq
#print axioms P2qJumps.Cert.sigLoop_eq
#print axioms P2qJumps.Cert.pairCheck_sound
#print axioms P2qJumps.Cert.pairChunk_sound
#print axioms P2qJumps.Cert.Covered.trans
#print axioms P2qJumps.Cert.Covered.of_not_prime
#print axioms P2qJumps.Cert.Covered.mono
#print axioms P2qJumps.Cert.gstrip_succ
#print axioms P2qJumps.Cert.gstrip_spec
#print axioms P2qJumps.Cert.gstripB_sound
#print axioms P2qJumps.Cert.gstripLoop_succ
#print axioms P2qJumps.Cert.gstripLoop_sound
#print axioms P2qJumps.Cert.sigSAux_eq
#print axioms P2qJumps.Cert.sigSAux_eq_sigma
#print axioms P2qJumps.Cert.sigFast_eq
#print axioms P2qJumps.Cert.pairFastChunk_sound
#print axioms P2qJumps.Cert.cert_line
#print axioms P2qJumps.Cert.cert_strip_0
#print axioms P2qJumps.Cert.cert_strip_1
#print axioms P2qJumps.Cert.cert_strip_2
#print axioms P2qJumps.Cert.cert_strip_3
#print axioms P2qJumps.Cert.cert_strip_4
#print axioms P2qJumps.Cert.cert_strip_5
#print axioms P2qJumps.Cert.cert_strip_6
#print axioms P2qJumps.Cert.cert_strip_7
#print axioms P2qJumps.Cert.strip_le_10000
#print axioms P2qJumps.Cert.cert_pair_2
#print axioms P2qJumps.Cert.cert_pair_3
#print axioms P2qJumps.Cert.cert_pair_5
#print axioms P2qJumps.Cert.cert_pair_7
#print axioms P2qJumps.Cert.cert_pair_11
#print axioms P2qJumps.Cert.cert_pair_13
#print axioms P2qJumps.Cert.cert_pair_17
#print axioms P2qJumps.Cert.cert_pair_19
#print axioms P2qJumps.Cert.cert_pair_23
#print axioms P2qJumps.Cert.cert_pair_29
#print axioms P2qJumps.Cert.cert_pair_31
#print axioms P2qJumps.Cert.cert_pair_37
#print axioms P2qJumps.Cert.cert_pair_41
#print axioms P2qJumps.Cert.cert_pair_43
#print axioms P2qJumps.Cert.cert_pair_47
#print axioms P2qJumps.Cert.cert_pair_53
#print axioms P2qJumps.Cert.cert_pair_59
#print axioms P2qJumps.Cert.cert_pair_61
#print axioms P2qJumps.Cert.cert_pair_67
#print axioms P2qJumps.Cert.cert_pair_71
#print axioms P2qJumps.Cert.cert_pair_73
#print axioms P2qJumps.Cert.cert_pair_79
#print axioms P2qJumps.Cert.cert_pair_83
#print axioms P2qJumps.Cert.cert_pair_89
#print axioms P2qJumps.Cert.cert_pair_97
#print axioms P2qJumps.Cert.no_jumps_p2q_le_10000
#print axioms P2qJumps.N_not_prime
#print axioms P2qJumps.N_ne_rs
#print axioms P2qJumps.r2st_bound
#print axioms P2qJumps.r2st_empty
#print axioms P2qJumps.r3s_bound
#print axioms P2qJumps.Semantics.formal_claim_holds
#print axioms P2qJumps.Semantics.intended_correspondence
#print axioms P2qJumps.Semantics.theorem_L
#print axioms P2qJumps.totient_add_div_le
#print axioms P2qJumps.composite_small_A
#print axioms P2qJumps.sigma_odd_of_odd_square
#print axioms P2qJumps.p_ne_two
#print axioms P2qJumps.q_ne_two
#print axioms P2qJumps.p_ne_three
#print axioms P2qJumps.q_ne_three
#print axioms P2qJumps.preamble
#print axioms P2qJumps.two_mul_le_sigma_add_totient
#print axioms P2qJumps.sigma_prime_pow_succ_ge
#print axioms P2qJumps.delta_pair_core
#print axioms P2qJumps.delta_pair
#print axioms P2qJumps.four_primes_delta_sq
#print axioms P2qJumps.q_ge_three_p_sq_core
#print axioms P2qJumps.omega4_constraints
#print axioms P2qJumps.Gr3s_neg
#print axioms P2qJumps.Gr3s_at_c_pos
#print axioms P2qJumps.Gr3s_pos
#print axioms P2qJumps.Gr3s_ne_zero
#print axioms P2qJumps.r3s_empty
#print axioms P2qJumps.N_ne_prime_pow
#print axioms P2qJumps.sigma_prime_pow_mul_sub_one
#print axioms P2qJumps.N_ne_ras
