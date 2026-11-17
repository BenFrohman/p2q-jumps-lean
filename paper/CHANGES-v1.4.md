# Paper changes driven by the Lean formalization (v1.4)

Each entry: the claim, what changed (old text → new text), the method, the outcome, and why
Lean (or a computation) required it. **Scope change** marks any statement that became narrower
or conditional. Outcomes: *proved (kernel-checked)*, *verified (exhaustive computation, stated
range, not kernel-checked)*, *disproved (witness)*, *open (precise blocker)*.

## C1. Preamble facts (Prop. 2/3-divides-n, Cor. gcd, Prop. N not a square)

- **Claim (Thm "Closed shapes", preamble):** under both jumps, p, q ≥ 5, N odd, gcd(N, 6pq) = 1, N not a square.
- **Method:** Lean, `P2qJumps/Preamble.lean` (`preamble`, `p_ne_two`, `q_ne_two`, `p_ne_three`, `q_ne_three`, `totient_add_div_le`, `composite_small_A`, `sigma_odd_of_odd_square`).
- **Outcome:** proved (kernel-checked), standard axioms only. The written proofs in Part B were checked step by step and are correct; no statement changed.
- **Paper change:** new Part A section "Preamble facts" (label `sec:A-preamble`) with the Lean proof translated step by step.
  - Case p = 2: old text (Part B) argued via q + 3 = 2^k t and φ(t) = t + 2^{1−k}. New Part A text uses the Lean route: 2 | N gives φ(N) ≤ N/2 = 2q + 6 < 2q + 10. Both are correct; Part A follows Lean.
  - Lemma "cot" (A(m) ≥ m/r) is replaced in Part A by the Lean form φ(m) + ⌊m/r⌋ ≤ m and its consequence m < r(d + 1) for composite m with A(m) ≤ d (floor division made explicit; the written lemma used real division).
- **Scope change:** none.

## C2. ω(N) ≥ 4 constraints: "every prime factor of N exceeds p" and "q > p − 6" (target a, b)

- **Claim (author's block, Lemma "omega-ge-4-constraints"):** if ω(N) ≥ 4 then every prime factor r_i of N satisfies r_i > p, and q > p − 6.
- **Method:** hand algebra, checked with sympy and a numeric sweep (pair inequality δ(N)·ab ≥ 2N tested on all N < 2·10^5 and all prime pairs: 0 failures), then Lean, `P2qJumps/Omega4.lean`.
  1. 2M ≤ σ(M) + φ(M) (Gauss: M − φ(M) = Σ_{d|M, d<M} φ(d) ≤ σ(M) − M).
  2. Pair inequality: for distinct primes a, b | N, δ(N)·ab ≥ 2N, where δ = σ + φ − 2·id, via N = a^{i+1} b^{j+1} M and (a+1)(b+1)S + (a−1)(b−1)F − 2abM − 2M = (ab+1)(S+F−2M) + (a+b)(S−F).
  3. Two disjoint pairs and abcd | N give δ(N)² ≥ 4N.
  4. Under both jumps δ(N) = 2p + q + 1, so (2p+q+1)² ≥ 4(p²q+12), which forces q ≥ 3p² (identity (2p+q+1)² − 4(p²q+12) = (q−5)(q−3p²) − (p²−4p−7)q − 11p² + 4p − 47).
  5. If a prime r ≤ p divides N then r ≤ p − 1 (gcd(N, p) = 1) and φ(N) + ⌊N/r⌋ ≤ N gives N < (p−1)(p(p+q−1)+1), i.e. q < p², contradicting step 4.
- **Outcome:** **proved (kernel-checked)**: `omega4_constraints` — if N has four pairwise distinct prime factors then 3p² ≤ q and p < r for every prime r | N. Both block constraints hold (q ≥ 3p² is far stronger than q > p − 6). Standard axioms only.
- **Paper changes:**
  - New Part A subsection "Four or more distinct prime factors" (`sec:A-omega4`, Theorem `thm:A-omega4`).
  - Ledger item (2), old: "Conditional on the constraint that every prime factor of N exceeds p (stated as a hypothesis; not yet proved), which forces N > p^4 and hence q > p^2, … Under that hypothesis, an exhaustive search … excludes every solution with ω(N) ≥ 4 and q ≤ Q." New: "Every prime factor of N exceeds p, and q ≥ 3p², hence N > p^4 (Theorem thm:A-omega4, kernel-checked, v1.4). Consequently an exhaustive search over all distinct primes 5 ≤ p ≤ ⌊√Q⌋ and all primes q with p² < q ≤ Q covers every pair with ω(N) ≥ 4 and q ≤ Q. … so by Theorem thm:A-omega4 there is no solution with ω(N) ≥ 4 and q ≤ 10^6 (computationally verified, not kernel-checked) …". Why: the hypothesis is now a Lean theorem, so the conditional wording would understate what is proved; the PARI no-filter run over 5 ≤ p ≤ 997, p² < q ≤ 10^6 now covers all ω ≥ 4 pairs with q ≤ 10^6.
  - Deviations (4)–(5) rewritten: the constraints are proved; the p = 7 factor 5 cannot occur when ω(N) ≥ 4.
  - External-computation note on `search_omega4_1e6.py`: old "that step is sound only under the unproved claim r_i > p above"; new "for ω(N) ≥ 4 this step is sound by Theorem thm:A-omega4".
- **Scope change:** none (strengthening). The main theorem's kernel bound stays n ≤ 10^4.
- **Hint from the p = 7 descent:** Appendix p7 allows the prime 5 for p = 7. That appendix concerns squarefree N with ω(N) ∈ {7, 8, 9}; by Theorem thm:A-omega4 every prime factor then exceeds 7, so 5 cannot occur. The descent's search space can be shrunk accordingly (not yet re-run).

## C3. The shape r³s (Theorem A, a = 3; target d)

- **Claim (Theorem A, v1.3, written proof):** N ≠ r^a s for a ≥ 2; the a = 3, p < r case was argued by Descartes' rule and Sturm isolation of "a degree-6 polynomial in p".
- **Method:** sympy elimination of s, q from E0, A(N) = A(n), B(N) = B(n); sign certificates; Lean, `P2qJumps/R3SEmpty.lean`.
- **Outcome:** **proved (kernel-checked)**: `r3s_empty` — N ≠ r³s for all distinct primes r, s, **no bound on p**. Standard axioms only.
  - Correction to the written proof: with r = p + k the master polynomial G(p, k) has degree **5** in p, not 6. Its root location k² − 2k + 3 < p* < k² − 2k + 4 (k ≥ 6) is confirmed. The Lean proof replaces Descartes/Sturm by: (i) −G has 33 positive coefficients after p = k²−2k+4+u, k = 1+w; (ii) G(p)/p⁵ is decreasing for k ≥ 6 and G(k²−2k+3, k) > 0; (iii) direct evaluation for k ≤ 5, p ≤ 18.
- **Paper changes:** new Part A subsection "The shape r³s is empty" (`sec:A-r3s-empty`). Ledger item (1) old: "Then p < r < p^{3/2}, r² | L(p) and p | r⁴ − r³ + 12, and (kp, k²r) ∈ E^{(k)}(Z) … The Lean development proves only the bounded statement." New: "Excluded with no bound (Theorem thm:A-r3s-empty, kernel-checked, v1.4). The earlier bounded statements … remain true and are now superseded." Remark added: Theorem L(iv) is vacuous; the twist link is no longer needed for any exclusion.
- **Scope change:** none (strengthening). `theorem-L.tex` is untouched; clause (iv) stays true (vacuously). The new result will get its own locked statement file once the remaining Theorem A cases are green.

## C4. Theorem A in full: prime powers, r²s, rs², r^a s (a ≥ 2) (target d, item 2 of the Part B plan)

- **Claim (Thm "Closed shapes" (2), (4); Theorem A, v1.3):** N is not a prime power r^k (k ≥ 2), not r²s or rs², and not r^a s (a ≥ 3).
- **Method:** sympy check of the written identities (m·Q₁ = P₁ holds exactly; Q₁ − P₁ = (p+1)(R − r); L(p) = R(r(r−1) − pm(r−p))), then Lean, `P2qJumps/TheoremA.lean` (`N_ne_prime_pow`, `N_ne_ras`, `sigma_prime_pow_mul_sub_one`).
- **Outcome:** **proved (kernel-checked)**, standard axioms only, no bound. `N_ne_prime_pow` covers k ≥ 1 (so also N prime); `N_ne_ras` covers every a ≥ 2 and, since r^a s = s r^a, the form rs^a.
- **Written proof audit:** the parametrization, the r < p (a ≥ 3) sign argument and the r²s argument are correct. Corrections:
  - a = 3, r > p: the polynomial in p has degree 5, not 6 (see C3); Lean uses `r3s_empty`.
  - a ≥ 4, r > p: old text "the equation H = 0 forces E ≤ −1 and simultaneously E > −1"; new Lean route: L(p) = R·X with X a positive integer, so L(p) ≥ R ≥ r³ > p³ > L(p). The written E-argument was not needed and is not used.
  - The written r < p case states "If P₁ < 0 then m > 0 forces Q₁ < 0, whence p > 3R"; Lean needs only Q₁ ≤ 0 ⇒ 2R ≤ p (from p − r + 1 ≥ 2), then 2P₁ ≥ p(r−2) + 2r > 0. New text uses the Lean inequality.
- **Paper change:** new Part A subsection "Theorem A: prime powers and r^a s" (`sec:A-thmA`), with a remark recording the corrections above.
- **Scope change:** none.

## C5. "The three regimes r³s, r²st, ω(N) ≥ 4 cover every counterexample" (target c)

- **Claim (author's block):** every counterexample has N = r³s, N = r²st, or ω(N) ≥ 4.
- **Method:** case analysis of exponent patterns with ω(N) ≤ 3 against what is now kernel-checked; sympy solution of the r³st system; numeric scan of its feasibility region.
- **Outcome:** **open (precise blocker)**, not disproved (a disproof needs an actual solution, and none is known).
  - With v1.4 Lean results, every shape with ω(N) ≤ 3 is excluded **except**: ω(N) = 2 with both exponents ≥ 2 (r^a s^b, a, b ≥ 2: paper Theorem B, written proof, not yet in Lean); ω(N) = 3 with a repeated prime other than r²st: r^a st (a ≥ 3), r^a s^b t (a, b ≥ 2), r^a s^b t^c (all ≥ 2). Paper Theorem E (written, not in Lean) cuts these to r³st, r²s²t and powerful shapes.
  - Since r³s and r²st are now empty (Lean), the block's claim is equivalent to: **every counterexample has ω(N) ≥ 4**, which holds iff r³st, r²s²t (and the other ω = 3 repeated-prime shapes) are impossible. Neither is proved.
  - r³st exploration: E0, A(N) = A(n), B(N) = B(n) are linear in (s + t, st, q), so a solution is determined by (p, r) (as for r²st). Scan of all odd 5 ≤ p < 3000, 5 ≤ r ≤ p^{3/2}: the positivity region s + t > 0, st > 0, q > 0, (s+t)² > 4st is nonempty only for r = p + k with 4 ≤ k ≲ √(2p) (no r < p). Combined with r² | L(p) (per-prime Lemma K), writing L(p) = (p+k)²(p − 1 − 2k + i) forces i(p+k)² = (3k²+2k)p + 2k³ + k² − 12, so i is a small positive integer (i ≤ 6 inside the band) and p is a root of a quadratic in p with discriminant k²(3k+2)² − 4i(k³ + k² + 12). Finishing needs: a proof of the band, and for each i ≤ 6 a "square between consecutive squares" bound on k. Not done yet.
- **Paper change:** none yet (ledger deviation (1) already says the claim is not justified; README "What remains open" updated).
  - **Update (C8):** r³st is now empty with no bound (`r3st_empty`, kernel-checked). The block's claim is still open: r²s²t and the other ω = 3 repeated-prime shapes are not excluded.
- **Scope change:** none.

## C6. D_true / R₁₀ (target e)

- **Claim (author's block):** r²st is "governed by the exact rational system over D_true(p, r) = p² − 2pr² + pr + r³ − r², requiring D_true | R₁₀(r) and r | L(p) with 5 ≤ p < 2r²; an exhaustive modular sieve excludes 5 ≤ r ≤ 10^4."
- **Method:** searched every v0.x–v1.4 source on the box (paper, drafts, notes, audits, `user-inputs/theorem_block.tex`): R₁₀ is never defined anywhere; D_true appears only in the block and in `NOTES/version_update_ready.md` (no formula). Recomputed the exact r²st system with sympy.
- **Outcome:** **disproved as stated (witness: the exact system).** Solving E0, A(N) = A(n), B(N) = B(n) for (σ = s + t, π = st, q) gives denominators r(pr + 2p − r² + r) (σ) and r(p − r)(pr + 2p − r² + r) (π, q). D_true is not a factor of these: (p − r)(pr + 2p − r² + r) = (r+2)p² − 2pr² − pr + r³ − r², which differs from D_true in the p² and pr coefficients. So the "exact rational system over D_true" is not the r²st system.
  - Reconstruction attempt for R₁₀: the resultant Res_p(D_true, numerator of σ) has degree exactly 10 in r: R₁₀?(r) = 8r¹⁰ − 9r⁹ − 25r⁸ + 60r⁷ − 144r⁶ + 229r⁵ − 203r⁴ + 48r³ + 36r² + 144. This is the most likely meaning of "R₁₀" (degree matches, and D_true | numerator would force D_true | this resultant), but it is a reconstruction, not confirmed by any source; with the true denominator the corresponding resultant for q is 4(r⁵ − r² − 6r − 12)(r⁷ + 4r⁶ + r⁵ − r⁴ − 10r³ − 37r² − 72r − 48) (degree 12).
  - Moot for the main result: r²st is empty with no bound (Theorem L(iii), `r2st_empty`).
- **Paper change:** none (ledger deviation (2) already records that R₁₀ is undefined and the route unchecked); this entry adds the computed reason.
- **Scope change:** none.

## C7. Theorem L2: strengthened locked statement (task item 2)

- **Claim (new file `paper/theorem-L2.tex`):** under both jumps, clauses (i)–(iii), (v) of Theorem L; (iv) N ≠ r³s for distinct primes r, s (no bound, no r, s ≥ 5 hypothesis); (vi) N ≠ r^k (r prime, k ≥ 1) and N ≠ r^a s (distinct primes, a ≥ 2); (vii) if ω(N) ≥ 4 then q ≥ 3p² and every prime r | N has r > p.
- **Method:** Lean, `P2qJumps/Semantics2.lean`: independent `paper_claim2` (verbatim quote, sha256 `0014494d52f73f89e1a36b1287f92f5bcac3b84ff7dc2bdd2cec79c22cd86dba`, section "Lean-certified reductions (v1.4), Theorem L2"), native `formal_claim2`, `formal_claim2_holds` (assembled from `N_not_prime`, `N_ne_rs`, `theorem28_holds`, `r2st_empty`, `r3s_empty`, `Cert.no_jumps_p2q_le_10000`, `N_ne_prime_pow`, `N_ne_ras`, `omega4_constraints`), `intended_correspondence2 : formal_claim2 ↔ paper_claim2` (unfolding, 10^4 = 10000, contrapositive for (v), and the new lemmas `exists_four_primes_of_omega` / `omega_ge_four_of_primes` relating Mathlib's ω to four distinct prime divisors; not rfl), `theorem_L2 := intended_correspondence2.mp formal_claim2_holds`. Lock `truth-gate-L2.lock.json` (generated by `scripts/make-lock-L2.py`, approver PENDING), static checks `scripts/verify-lock-L2.py`, called from `scripts/verify-lock.sh` (also observation of `theorem_L2` and its axioms, and the approval check for both locks).
- **Outcome:** proved (kernel-checked), standard axioms only. Approval of the wording of Theorem L2 and of `paper_claim2`: **PENDING**.
- **Paper changes:** Theorem L2 is input after the status paragraph of Theorem L ("Strengthened statement" paragraph, with sha256); new Part A section "Proof of Theorem L2 and its semantics lock" (`sec:A-L2`, Steps 1–5 and the lock description); the intro of `sec:A-beyond` now points to Theorem L2 instead of "locked statement file written separately".
- **Unchanged:** `paper/theorem-L.tex`, `P2qJumps/Semantics.lean`, `truth-gate.lock.json`.
- **Scope change:** none (strengthening; Theorem L unchanged). Note: (iv) of Theorem L2 removes the hypothesis r, s ≥ 5 present in Theorem L(iv); this widens the statement and is proved (`r3s_empty` derives r, s ≥ 5 from gcd(N, 6) = 1).

## C8. The shape r³st is empty (task item 3)

- **Claim:** under both jumps, N ≠ r³st for pairwise distinct primes r, s, t (no bound on p).
- **Method:** Lean, `P2qJumps/R3ST.lean`, theorem `r3st_empty` (R3ST.lean:217). E0, E1, E2 linear in (S, P, q) = (s + t, st, q); δ-identity ⇒ r > p (k = r − p ≥ 1); X-identity r²X = L(p) ⇒ 0 < X < p; S² ≥ 4P, S ≥ 10 ⇒ 5kS ≥ 16p(r − 1); D > 0 (`NQr3st_pos`, R3ST.lean:82) ⇒ G ≥ 0; band certificate `Gr3st_neg` (R3ST.lean:89; multiplier Λ = 16a⁶ + 48a⁵m + 4288a⁵ + 461936a⁴ + 24283264a³, p = 5 + a, k = 48 + m): k ≥ 48 ⇒ k² < 3p. With i = X − p + 1 + 2k: i(p+k)² = (3k² + 2k)p + 2k³ + k² − 12, 1 ≤ i ≤ 2k, i ≤ 9 in the band, and (2ip + 2ik − 3k² − 2k)² = Δ_i(k) = 9k⁴ + (12 − 4i)k³ + (4 − 4i)k² − 48i. Runge (`Dlt_not_sq`, R3ST.lean:118): for 1 ≤ i ≤ 9, k ≥ 298, 729Δ_i(k) = H² − 4i(i³ + 6i² + 9i + 8748 + 18k(i² − 9)) with H = 81k² + 9(6 − 2i)k − 2i(3 + i) lies strictly between consecutive squares. Kernel certificate `cert_r3st` (R3ST.lean:166, `decide +kernel`) for k ≤ 297: Δ_i(k) is a square only at (i, k) ∈ {(2,2), (2,5), (4,8), (5,4), (27,15)}; `r3st_exceptions` (R3ST.lean:194): four have no integer root p ≥ 5, and (4,8) forces p = 41, r = 49 = 7², not prime.
- **Outcome:** proved (kernel-checked), standard axioms only. This replaces the band estimate "4 ≤ k ≲ √(2p)" of C5 (numeric) by the proved statement "k ≤ 47 or k² < 3p", and the bound "i ≤ 6" by the proved "i ≤ 9".
- **Paper changes:** new subsection "The shape r³st is empty" (`sec:A-r3st-empty`, Theorem `thm:A-r3st-empty`, Steps 1–11) in `sec:A-beyond` (title and intro updated); classification ledger item (3) now records r³st as excluded, and the old item (3) "Other shapes" is item (4), with r²s²t as the example.
- **Unchanged:** `paper/theorem-L.tex`, `paper/theorem-L2.tex` and both locks. r³st is not added to Theorem L2: that would change a locked statement and needs a new lock and the author's approval.
- **Scope change:** none.

## C9. Outcome of the ω(N) ≥ 4 Python run at Q = 10^6 (task item 0)

- **Claim:** `search_omega4_1e6.py` (sha256 ab59fc89…5046) finds no solution for primes 5 ≤ p ≤ 997, p² < q ≤ 10^6.
- **Method:** external run `timeout 10800 python3 search_omega4_1e6.py`, started Mon 16 Nov 2026 17:42:14 CST.
- **Outcome:** **no result.** Stopped by the timeout at 20:42:14 CST (exit code 124, wall_s = 10800). The script prints only at the end, so there is no hit count and no partial output. The same range remains covered by the assumption-free PARI run B (8,912,452 pairs, 0 hits): computationally verified, not kernel-checked.
- **Paper changes:** `\OMEGAFOURSTATUS` and the ledger item (2) of the classification theorem record the timeout; README.md, certificates/README.md and scripts/omega4/README.md likewise.
- **Unchanged:** the main-theorem kernel bound n ≤ 10^4; `paper/theorem-L.tex`, `paper/theorem-L2.tex` and both locks.
- **Scope change:** none.

## C10. Theorems B, D, E, Lemma K, Lemma Q, Corollary F1 in Lean (task item 4, part)

- **Claim:** Part B's Theorem B, Theorem D, Theorem E(i)–(v), Lemma K, Lemma L1, Lemma Q, Lemma G, Theorem F and Corollary F1, under the jumps only.
- **Method:** Lean. The audited packages `P2qStructural`, `P2qExtensions`, `P2qTheoremD`, `P2qExclusions` (Lean v4.22.0, `/workspace/p2q-lean-exclusions-corrected-2026-11-06`) are ported to `P2qJumps/Ext/` (v4.26.0). Changes: import paths; `open scoped ArithmeticFunction.sigma ArithmeticFunction.Moebius` (σ, μ notation is scoped in the newer Mathlib); four proof steps adapted to the newer Mathlib (`FourAnalytic.four_cauchy`, `GeneralAnalytic.finite_cauchy`: the final `field_simp` already yields the goal, closed by `linarith`; `F1.corollaryF1` and `Setup.p_not_dvd_N`: `interval_cases` case closing). No statement changed. New file `P2qJumps/TheoremsBE.lean` discharges the packages' extra hypotheses (p, q ≥ 5 from `preamble`; ω(N) ≥ 2 from `two_le_omega` via `N_ne_prime_pow`) and adds `pow_dvd_K` (r^(e+1) ∣ N ⇒ r^e ∣ N/rad N), `theoremE_v`, `theoremE_iv_dvd` (r₁r₂ ∣ L(p)), `E_iv_companion` (L(p)δ² < N²), `theoremE_iv_sqrt` (N/δ > √L(p)), `lemmaQ_formula` (Q(N) formula and Q(N) > 0), `cube_excludes_second_square`, `omega4_five_not_dvd`.
- **Outcome:** proved (kernel-checked), standard axioms only.
- **Paper changes:** new Part A section `sec:A-BDE` (Lemmas `lem:A-omega2`, `lem:A-L1Q`, `lem:A-K`; Theorems `thm:A-B`, `thm:A-E`, `thm:A-D`; Corollaries `cor:A-F1`, `cor:A-omega4-five`), step-by-step proofs following the Lean proofs. Part B: titles of Theorems A, B, E now say "kernel-checked in v1.4" with a pointer; the remarks after Lemma K, Theorem D, Theorem E and Theorem F/Corollary F1 now point to this repository instead of the external packages.
- **Unchanged:** `paper/theorem-L.tex`, `paper/theorem-L2.tex` and both locks. None of these results is added to a locked statement.
- **Scope change:** none for B, D, F1, E(i), E(v). E(ii) and E(iv) are proved under a weaker hypothesis than Part B states (a third prime factor of any exponent instead of j ≥ 1) and E(iii) without j ≥ 1: these widen the statements. The final sentence of Part B Theorem E ("Consequently every remaining repeated-prime solution has shape …") is not one Lean theorem; its parts are proved separately.

