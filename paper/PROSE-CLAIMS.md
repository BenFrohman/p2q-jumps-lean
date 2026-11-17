# Prose-claims ledger for `paper/p2q-jumps-v1.4.tex` (Truth Gate rule: every mathematical statement in the prose)

Scope: every mathematical statement or proposition in the prose of the paper. Narrative, motivation,
history (v0.10 hypotheses R1–R3, the quoted original Proposition 32, change logs, the 6 Nov 2026
formalization-status snapshot), commentary ("what this note does not claim", "what an empty family
means" as an explanation) and proofs of statements listed here are excluded. Part A, the locked
Theorems L and L2 and Part C already cite their Lean declarations in the paper and are not repeated.

Statuses:
- **Lean** `decl` (`file:line`): kernel-checked, standard axioms only (`AxiomAudit.lean`). "vacuous"
  means the statement concerns a shape of `N` that is proved impossible, and the Lean theorem states
  the paper's conclusion and derives it from that impossibility.
- **cited external**: a citation (RCW 2026, LMFDB, PARI, David 1995, Hardy–Littlewood) or an
  external computation, kept in the cited/external-results text; no Lean proof depends on it.
- **removed**: a false statement, not asserted in the paper; counterexample logged.
- **in progress**: not yet formalized; the exact blocker is given.

Paths are relative to `P2qJumps/`.

## Abstract, background (Part B §"Background and the v1.3 statements")

| # | Statement | Status |
|---|---|---|
| 1 | Every prime quadruplet (p, p+2, p+6, p+8) gives a solution n = p(p+8) | Lean `quadruplet_jumps` (ProseClaims2.lean:75) |
| 2 | RCW: Conjecture 1.1; proved for squarefree semiprime n, N; prime-power n excluded; no counterexample n ≤ 10^12 (166 solutions, all quadruplet type) | cited external (RCW 2026) |
| 3 | Hardy–Littlewood heuristic | cited external (HL 1923), not used |
| 4 | Conjecture `conj:vanish` | in progress — blocker: it is the open problem (not asserted; Lean `Conjecture3`, Statement.lean:33, is a definition, unproved) |

## Theorem `thm:closed` and Section "Identities", "Proof of Theorem closed"

| # | Statement | Status |
|---|---|---|
| 5 | `thm:closed` (p, q ≥ 5; N odd, coprime to 6pq, not a square; items (1)–(6); {p,q}∩{2,3} = ∅) | Lean `theorem_closed` (ClosedLedger.lean:253); items (5),(6) also `rst_balanced` (ProseClaims2.lean:130), `rst_off` (ProseClaims2.lean:138) |
| 6 | `lem:equiv` | Lean `jumps_iff_AB`, `jumps_delta` (ProseClaims.lean:23, :41) |
| 7 | `lem:AB` | Lean `AB_p2q` (ProseClaims.lean:48) |
| 8 | `lem:cot` (A(m) ≥ m/r, equality iff m is a power of r) | Lean `cot_le`, `cot_eq_iff` (ProseClaims.lean:68, :75) |
| 9 | `lem:Ark` | Lean `A_prime_pow` (ProseClaims.lean:59) |
| 10 | `prop:23` | Lean `prop_23` (ClosedLedger.lean:194) |
| 11 | `cor:gcd` | Lean `cor_gcd` (ClosedLedger.lean:187) |
| 12 | `prop:square` | Lean `prop_square` (ClosedLedger.lean:216) |
| 13 | `prop:primepower` | Lean `prop_primepower` (ClosedLedger.lean:222) |
| 14 | `prop:rs` | Lean `prop_rs` (ClosedLedger.lean:228) |
| 15 | `prop:r2s` | Lean `prop_r2s` (ClosedLedger.lean:234) |
| 16 | `lem:e123` (N = rst) | Lean, vacuous: `lem_e123` (ProseClaims2.lean:109) |
| 17 | `lem:qform` (q formula; D(p,ρ) > 0 for p, ρ ≥ 5) | Lean `lem_qform_C_Phi` (vacuous, ProseClaims2.lean:117); D > 0: `D_pos` (ProseClaims2.lean:266) |
| 18 | `lem:C` | Lean `lem_qform_C_Phi` (vacuous); identity `C_identity` (ProseClaims2.lean:270) |
| 19 | `lem:Phi` (N − ρ³ = ρΦ/D; ρ³ ≤ N ⇔ Φ ≥ 0; Φ < 0 for p ≥ 5, ρ ≥ 2p) | Lean `lem_qform_C_Phi` (vacuous, first two clauses); `Phi_neg` (ProseClaims2.lean:52) |
| 20 | `prop:balanced` | Lean `prop_balanced` (ClosedLedger.lean:284), `rst_balanced` (ProseClaims2.lean:130) |
| 21 | `prop:pm2` | Lean `prop_pm2` (ClosedLedger.lean:293), `rst_off` (ProseClaims2.lean:138) |

## Theorem `thm:rigid` and its proof section

| # | Statement | Status |
|---|---|---|
| 22 | (a) q = ρ + C/D, D ∣ C; finitely many p per ρ | Lean, vacuous: `lem_qform_C_Phi` (ProseClaims2.lean:117) |
| 23 | (b) r³s: r² ∣ p+q−1, s, q, displayed identity, dual congruences | Lean, vacuous: `r3s_statements` (ProseClaims2.lean:155) |
| 24 | (c) r²st: σ, π, q formulas; r = p ± 2 empty | Lean, vacuous: `r2st_statements` (ProseClaims2.lean:201) |
| 25 | `thm:r3sint` | Lean, vacuous: `r3s_statements` (ProseClaims2.lean:155) |
| 26 | Proof-section claims "σ < 0 on r = p ± 2" | Lean, vacuous: `r2st_statements` (r ≠ p ± 2) |

## Four or more prime factors (`thm:four`), square-discriminant and offset sections

| # | Statement | Status |
|---|---|---|
| 27 | `thm:four` (1) e₂ = p + (q−1)/2, e₂ ≥ 6√N; (4) no solution with {r,s} = {5,7} | Lean, vacuous (squarefree ω = 4 excluded by Theorem D): `four_statements` (ProseClaims2.lean:218) via `four_false` (:168) |
| 28 | `thm:four` (2) σ = N_σ/D_σ; (3) q bound when 2p² > rs; "q ≍ 144p²" heuristic | Lean, vacuous: `four_vacuous` (ProseClaims2.lean:229) (statement-generic form) |
| 29 | r = p+4 line: σ² − 4π = 2F(p)/((p+4)²(p+12)²); 2F mod 16 table; F(p) even for odd p | Lean, vacuous for the r²st clauses: `r2st_false` (ProseClaims2.lean:190); the pure congruences: Lean `F_mod16`, `sq_mod16`, `F_even` (ProseClaims2.lean:276, :282, :283) |
| 30 | Plus-side lines r = p+2ℓ (3 ≤ ℓ ≤ 10) and r = p−10, p−12: negative discriminant | Lean, vacuous: `r2st_false` (ProseClaims2.lean:190) |
| 31 | rst line ρ = p+k: Δ = N(p,k)/(p²−p+k(k−1))²; leading form; quartic 4t⁴+4t³+11t²+6t+7 has minimum > 6 | Lean, vacuous for Δ: `rst_far` (ProseClaims2.lean:146); the quartic bound: Lean `quartic_gt_six` (ProseClaims2.lean:286) |
| 32 | `thm:rst-off` | Lean, vacuous: `rst_off` (ProseClaims2.lean:138) |
| 33 | `thm:rst-far` (5−p ≤ k < p, k ≠ 0; Δ formula; N(p,k) < 0 on the region; no triple) | Lean `rst_far` (vacuous, ProseClaims2.lean:146); N(p,k) < 0: `Nfar_neg` (ProseClaims2.lean:35) for all integers p ≥ 5 |
| 34 | `thm:r2st-off`, `thm:rp4` | Lean, vacuous: `r2st_statements` (ProseClaims2.lean:201) |
| 35 | `thm:r3s-plarge`, `thm:r3s-strip` | Lean, vacuous: `r3s_statements` (ProseClaims2.lean:155) |
| 36 | `thm:R1` (no rst) | Lean `theorem28_holds` (ClosedShapes.lean:139) |
| 37 | Offset-strip list of §"What an empty family means" | Lean, vacuous: `rst_off`, `r2st_statements`, `r3s_statements` |

## Computational survey (`tab:bounds`) and external computations

| # | Statement | Status |
|---|---|---|
| 38 | Table `tab:bounds` rows for rst, r²st, r³s, ω ≥ 4 with q = O(p) | Lean, vacuous (shapes empty): `rst_false` (ProseClaims2.lean:103), `r2st_false`, `r3s_empty` (R3SEmpty.lean:112), `four_false` |
| 39 | Table row "all shapes, n ≤ 10^12" | cited external (RCW 2026) |
| 40 | `search_residual.py` runs; larger rst sweep from the collaboration record | cited external (computation, not reproduced in Lean) |
| 41 | PARI runs p, q ≤ 10^4 and the Q = 10^6 range; unfinished `search_omega4_1e6.py` | cited external (computation); the Lean bound is n ≤ 10^4 (`Cert.no_jumps_p2q_le_10000`, Cert/Pairs.lean:47) |

## Exhaustive factor-pattern reduction (Lemmas L1, L2, K; Theorems A, B, C, D, E, F, G)

| # | Statement | Status |
|---|---|---|
| 42 | `lem:L1` | Lean `lemmaL1` (ClosedLedger.lean:36); `P2qExtensions.lemmaL1` (Ext/Extensions/DeltaQ.lean:41) |
| 43 | `lem:L2` (radical scaling) | Lean `radical_scaling` (ProseClaims.lean:150) |
| 44 | `lem:K` (incl. r^{e−1} ∣ L(p)) | Lean `lemmaK` (TheoremsBE.lean:123), `pow_dvd_K` (TheoremsBE.lean:97) |
| 45 | `thm:B` | Lean `theoremB` (TheoremsBE.lean:46), `N_not_powerful` (:54) |
| 46 | `thm:A` | Lean `theoremA` (ClosedLedger.lean:244), `N_ne_ras` (TheoremA.lean:62) |
| 47 | `prop:C` (finite per p for 1 ≤ j ≤ 2; nonsingular systems; enumeration p < 10^6) | structural clauses: Lean `propC_K` (K > 1, K ∣ L(p), gcd(K, 6p) = 1; PropC.lean:40), `propC_j1` (j = 1 system, determinant ≠ 0, unique solution; PropC.lean:64), `propC_j2` (j = 2 system, determinant ≠ 0, unique solution; PropC.lean:109); enumeration: cited external (computation) |
| 48 | `lem:Q` (Q(N) formula, Q > 0; Q(m)/m² = 1 − ∏(1 − r^{−e−1})) | Lean `lemmaQ_formula` (TheoremsBE.lean:214); product formula `P2qExtensions.sigma_mul_totient_prod` (Ext/Extensions/DeltaQ.lean:72) |
| 49 | `thm:D` | Lean `theoremD` (TheoremsBE.lean:173), `theoremD_four` (:185) |
| 50 | `thm:E` (i)–(v) | Lean `theoremE_i` … `theoremE_iv_sqrt` (TheoremsBE.lean:60–235); see the remark in Part A for the widened hypotheses |
| 51 | `thm:E` final sentence ("every remaining repeated-prime solution has shape r²V, r³V (ω(V) ≥ 2) or r₁²r₂²V …") | Lean `theoremE_shapes` (ThmEShapes.lean:45) |
| 52 | `lem:G` (identity, gcd ∣ 2T(p), T(p) > 0) | Lean `lemmaG` (ClosedLedger.lean:83); `lemmaG_gcd`, `T_pos` (ProseClaims.lean:172, :182) |
| 53 | `thm:F` | Lean `theoremF` (ClosedLedger.lean:115) |
| 54 | `cor:F1` (p = 7, 7 ≤ k ≤ 9; T-values, v₂; 2^{m−1} > m⁴ > T(m) for m ≥ 23) | Lean `corollaryF1` (TheoremsBE.lean:193); `T_explicit` (ClosedLedger.lean:152), `T_values`, `F1_tail` (ProseClaims2.lean:236, :260) |
| 55 | `prop:implies-corrected` (Conjecture ⇔ H1 ∧ H2 ∧ H3; given H1, Conjecture ⇔ H2 ∧ H3) | Lean `prop_implies_corrected`, `implies_corrected_of_H1` (ImpliesCorrected.lean:47, :114), with R, j, H1–H3 defined at ImpliesCorrected.lean:24–42; the equivalence only (H1–H3 are not proved). The trust statements (H1 by `thm:H1-comp`, H2 for p < 10^6 by Proposition C) are row 56 and row 47 |
| 56 | `thm:H1-comp` (H1 under computer-assisted trust) | in progress — blocker: the p = 7 enumeration (item 62) is not kernel-checked |
| 57 | Remark "Status of Conjecture" | commentary (excluded) |

## The curve E and its twists (§`sec:v14-curve`)

| # | Statement | Status |
|---|---|---|
| 58 | Model [0,−1,0,0,−12]: Δ = −62976 = −2⁹·3·41, j = −8/123, 3936 = 2⁵·3·41; (4, ±6), (12388, ±1378746) on E | Lean `curve_disc`, `curve_j`, `curve_factorizations`, `curve_points` (ProseClaims2.lean:92, :95, :99, :98) |
| 59 | LMFDB label 3936.b1, conductor, minimality, rank 1, trivial torsion, generator, height, list of integral points, (12388,1378746) = 3P, rank-0 correction | cited external (LMFDB, PARI) |
| 60 | Link with r³s: integral point (kp, k²r) on E^(k); r² < p³; p ∣ r+s−1, p ∣ r⁴ − r³ + 12 | Lean `twist_point`, `twist_r_bound`, `twist_link_congr` (ProseClaims.lean:247, :253, :189) |
| 61 | Root numbers of the twists; Siegel/David finiteness per fibre | cited external (standard twisting rule + PARI; Siegel, David 1995) |

## Appendix `app:p7` (p = 7 descent) and the rad note

| # | Statement | Status |
|---|---|---|
| 62 | p = 7 branch-and-bound enumeration: branch bounds, product enumeration, terminal two-prime elimination, node counts, zero solutions for k = 7, 8, 9 | in progress — blocker: Lean soundness proof of the enumeration (monotone branch bounds, finite product enumeration, terminal elimination) and a kernel certificate of the run; reproduced by `scripts/p7/descent.py` (paper domain 93,159 nodes for k = 7; primes ≥ 11 with the prefix bound: 134 / 748 / 5,773 nodes, 0 solutions) |
| 68 | p = 7 equations φ(N) = 42q − 30, σ(N) = 57q + 69, 7φ = 6N − 282, 49σ = 57N + 2697, 42σ − 57φ = 4608; N ≡ φ(N) ≡ 5 (mod 7) and the singular-branch argument (7 ∤ φ(N)); "every prime factor ≥ 5" (strengthened: ≥ 11 when ω(N) ≥ 4, so 5 ∤ N) | Lean `p7_identities`, `p7_mod`, `p7_omega4_ge11` (P7.lean:24, :38, :47); new prefix bound `p7_prefix_bound`, `p7_prune_threshold` (P7.lean:65, :79) |
| 63 | Soundness note: N/gcd(N, φ(N)) ∣ rad N; rad(12) = 6 ≠ 3 | Lean `div_gcd_totient_dvd_rad`, `rad_ne_div_gcd_totient` (ProseClaims.lean:202, :228) |
| 64 | "rad(N) = N/gcd(N, φ(N))" | **removed** (false; counterexample N = 12: rad 12 = 6, 12/gcd(12, 4) = 3; kernel-checked as `rad_ne_div_gcd_totient`) |

## Classification ledger `thm:main-p2q`

| # | Statement | Status |
|---|---|---|
| 65 | Kernel-checked clauses (not prime, prime power, rs, r²s, rs², rst, r²st, r³s, r³st; ω ≥ 4 constraints; n ≤ 10^4) | Lean `classification_ledger` (ClosedLedger.lean:368) |
| 66 | Item (2): no solution with ω(N) ≥ 4 and q ≤ 10^6 | cited external (PARI computation) on top of Lean `omega4_constraints` (Omega4.lean:164) |
| 67 | Item (4): other repeated-prime shapes (r²s²t) open | in progress — blocker: no proof that r²s²t is empty. Kernel-checked: it is the only shape with ω(N) ≤ 3 left, `omega4_or_r2s2t` (ThreeRegimes.lean:41). Size inequalities alone do not exclude it (real solutions exist, `NOTES/r2s2t_status.md`); an arithmetic (integrality / square-discriminant) argument is needed |
| 69 | Deviation 1: "every counterexample falls into the three regimes r³s, r²st, ω(N) ≥ 4" | not asserted; Lean: the claim is equivalent to the emptiness of r²s²t, `threeRegimes_iff_r2s2t` (ThreeRegimes.lean:150) |

## Counts

69 ledger rows (some rows group several clauses of one statement):

- **Lean: 54** (of which 20 rows are proved vacuously, from the impossibility of the shape they
  concern: rst, r³s, r²st, squarefree rstu).
- **cited external: 8** (rows 2, 3, 39, 40, 41, 59, 61, 66).
- **removed: 1** (row 64, rad(N) = N/gcd(N, φ(N)); counterexample N = 12, kernel-checked).
- **in progress: 4** (rows 4 Conjecture — the open problem itself; 56 Theorem `thm:H1-comp`; 62 the p = 7 enumeration;
  67 the shape r²s²t).
- **mixed: 1** (row 47, Proposition C: structural clauses Lean, enumeration cited external).
- **excluded as commentary: 1** (row 57).
