Formalizes the four parts of the paper that the final 4-sort check (PR #14) flagged as WORDING-DRIFT, where the cited Lean declaration was narrower than the paper sentence. No paper statement is changed or weakened. The paper only gains `\lean{}` citations, and the PDF is rebuilt with tectonic.

| paper item | new declaration | statement |
|---|---|---|
| lem:A-coprime6, "Consequently, if N = r²st or N = r³s with all displayed primes ≥ 5, then 2 ∤ N, 3 ∤ N, … p ≥ 5 and p ∤ N" | `P2qJumps.coprime6_r2st`, `P2qJumps.coprime6_r3s` (Arith.lean) | for prime p and primes r, s, t ≥ 5 (resp. r, s ≥ 5) with p²q + 12 = r²st (resp. r³s): ¬2 ∣ N ∧ ¬3 ∣ N ∧ 5 ≤ p ∧ ¬p ∣ N |
| thm:A-omega4, "In particular N > p⁴" | `P2qJumps.omega4_N_gt_p4` (Omega4.lean) | same hypotheses as `omega4_constraints` ⇒ p⁴ < p²q + 12 |
| lem:A-K, stated under the jumps alone | `P2qJumps.lemmaK_param` (TheoremsBE.lean) | jumps at p²q ⇒ ∃ m ≥ 1, U − P = pm, Km = p + q − 1, K(p²m − U) = L(p). The hypothesis 5 ≤ p of `P2qExclusions.setupK` is discharged by `preamble`, so it is not an extra hypothesis |
| prop:A-p7-prefix, "no prefix with 342b² − 343φ(b)σ(b) ≥ 1 can be completed by three or more further distinct primes ≥ 11" | `P2qJumps.p7_prefix_no_completion` (P7.lean), with the helper `totient_mul_sigma_prod_primes_le` | q prime, q ≠ 7, jumps at 7²q, 7²q + 12 = b·∏_{r∈S} r with S a set of ≥ 3 primes r ≥ 11, r ∤ b ⇒ 342b² − 343φ(b)σ(b) < 1 |

New declarations are appended at the end of each file, so every existing `file:line` citation in the paper is unchanged. All of them are listed in AxiomAudit.lean. They contain no sorry and no `native_decide`, and the expected axioms are propext, Classical.choice and Quot.sound only. The official certify run on this head is the certificate. This machine could not load Mathlib (I/O pressure above 90%), so CI is the first build.

Not merging until certify on the exact head is green with 0 sorry and standard axioms only.
