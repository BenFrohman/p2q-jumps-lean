# Truth Gate lock coverage, starting from main `086a484`

Inventory only. This note does not extend the lock and is not a
certificate. The certificate of record is the official CI artifact named
in root `CERTIFICATE.md` (Lean certificate run 45262293009 on `033e12d`).

## Currently locked (whole-statement, approved 21 November 2026)

- Theorem L: `P2qJumps/Semantics.lean`, `truth-gate.lock.json`.
  `paper_claim` transcribes `paper/theorem-L.tex`. Public theorem
  `theorem_L`.
- Theorem L2: `P2qJumps/Semantics2.lean`, `truth-gate-L2.lock.json`.
  `paper_claim2` transcribes `paper/theorem-L2.tex`. Public theorem
  `theorem_L2`.

Both correspondences were approved by Benjamin Stanley Frohman. Conjecture 3
stays open in the approval notes.

## Kernel-proved on this commit, not yet a separate paper_claim lock

These statements are proved in Lean with standard axioms only (see the
official artifact of run 45262293009 and `AxiomAudit.lean`). Several are
already conjuncts of `formal_claim` / `formal_claim2`. They do not yet
each have an independent, non-vacuous `paper_claim` lock of their own:

- Theorem 28: `theorem28_holds` (N is not a product of three distinct primes)
- H1: `H1_holds`, `no_squarefree`, `p7_squarefree_empty`
- Theorem A: `theoremA`, `N_ne_ras`, `N_ne_prime_pow`
- Theorem B: `theoremB`, `N_not_powerful`
- Theorem E (i)--(v): `theoremE_i` .. `theoremE_v`
- classification: `prop_implies_corrected`, `conjecture_iff_H2_H3`
- `r3s_empty`, `r3st_empty`, `r2st_empty`
- `omega4_constraints`, `omega4_size`
- Hensel bound: `hensel_r_le_1e6`, `r3s_r_le_1e6`
- H3 for p ≡ 1 (mod 4): `H3_of_mod4`
- H2 reduction (not H2 itself): `H2_of_shapes`, `H3_twoAdic`, `r2s2t_rs_dvd_L`
- preamble and the other Part A statements already listed in the v1.4.1 paper

A later PR may add honest, non-vacuous locks for these, with `paper_claim`
transcribed from the paper and never aliased to `formal_claim`. That work
must not weaken or cloak any statement.

## Must remain open (named hypotheses / open Props, never sorry, never claimed proved)

- H2 in full, and H2 for p < 10^6 until official CI of PR #11 is green
- H3 for p ≡ 3 (mod 4)
- R2 (`R2S2TEmpty`) and R3 / `R2S2TUEmpty`
- Conjecture 3

## v0.11-review2 references

The remaining "0.11-review2" mentions in `paper/p2q-jumps-v1.4.tex` are
historical: the v1.3 source text, the 6 November 2026 snapshot column, the
v0.11-review2 change-log appendix, and the bibliography entry. PR #12
already labels them as historical and updates the Lean status column to
commit `0b82cdd` / run 44893346388. This branch does not edit that paper,
so the PDF Depositor is auditing is unchanged.

## Stale verification documents

`paper/verification_certificate.*` moved to `paper/historical/` (commit
821e35e, four declarations only). Not a certificate.
