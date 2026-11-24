# Final 4-sort check: HALT

- lean_status_source: `PREVIEW: #print axioms log /workspace/p2q-paperfix-notes/cert-033e12d/lean-certificate-033e12d2db946d625b409e726d358198a35ac8ff/print-axioms.log; Lean statements NOT compared`
- repo: `p2q-4sort`
- commit: `d63ad019a837cdaa546be9a48232d2c05b87a931`
- paper: `paper/p2q-jumps-v1.4.tex`
- paper_sha256: `aa29c9d153832f21ab7a99d0ae8c7b9ad03e4293b7424badf3eb9ccd3d7fa9e8`
- claim_map: `final-check/claim-map.json`
- claim_map_sha256: `79ea9fc1af63044856052df48af75abd4c0afb92c661c76bc1691cc1f6406edf`
- lean_toolchain: `leanprover/lean4:v4.26.0`
- lake_manifest_sha256: `4d3ae22e8ed4d49aca48ed63bd17a6e491c1a7d22469f20494b7c147a85f0dcc`
- generated: `2026-11-23 15:54:44 CST`

| class | count |
|---|---|
| OVERCLAIM | 0 |
| WRONGLY-RETRACTED | 3 |
| WORDING-DRIFT | 4 |
| UNMAPPED | 5 |
| UNJUDGED | 46 |
| MAP-ORPHAN | 8 |
| PROVED | 43 |
| EXTERNAL | 4 |
| NOT-CLAIMED | 16 |

Fix routes of the halt items: PAPER-FIX=3, HUMAN=4, RE-REVIEW=59

- **PAPER-FIX**: paper-fixable: Lean proves it exactly or more strongly; state the Lean theorem in the paper verbatim (keep every hypothesis, range and symbol), rebuild and commit the PDF, rerun the 4-sort
- **HUMAN**: needs the human: the paper says more than Lean proves, or matching Lean would weaken/cloak the claim; either formalize the missing part or the author decides the wording; never weaken silently
- **RE-REVIEW**: re-review: record (or re-record) the paper-vs-Lean alignment in the claim map with both pinned hashes; the item then routes as PAPER-FIX or HUMAN

## HALT items

Each item names the claim, where it is in the paper, the Lean declaration(s), the class and the exact mismatch. Nothing was changed; the fix is the author's decision (never weaken a statement to pass).

## WRONGLY-RETRACTED (3)

### `thm:L` (theorem) at paper/theorem-L.tex:3
- title: Theorem~L: Lean-certified statement, v1.4
- paper statement: [Theorem~L: Lean-certified statement, v1.4] Let \(p\) and \(q\) be distinct primes, \(n=p^2q\) and \(N=n+12\), and suppose \(\ph(N)=\ph(n)+12\) and \(\sig(N)=\sig(n)+12\). Then: \begin{enumerate} \item[\textup{(i)}] \(N\) is not prime, and \(N\) is not a product of two distinct primes; \item[\textup{(ii)}] \(N\) is not a product of three distinct primes; \item[\textup{(iii)}] \(N\) is not of the form \(r^2st\) with pairwise distinct primes \(r,s,t\ge 5\); \item[\textup{(iv)}] if \(N=r^3s\) with distinct primes \(r,s\ge 5\), then \(p<r\), \(r^2\) divides \(p^3-p^2-12\), and \(p>10^4\); \item[\textup{(v)}] \(n>10^4\). \end{enumerate}
- Lean `P2qJumps.Semantics.theorem_L`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: PAPER-FIX**
- **mismatch:** Lean proves it, but the paper labels it pending at paper/p2q-jumps-v1.4.tex:1155
- status wording at paper/p2q-jumps-v1.4.tex:1155: ['pending']: "the formal approval of the wording of <SELF> in <ID> is still pending"
- claim-map note: theorem_L : paper_claim; paper_claim is the locked transcription of paper/theorem-L.tex (Truth Gate, verify-lock.sh)

### `thm:L2` (theorem) at paper/theorem-L2.tex:3
- title: Theorem~L2: strengthened Lean-certified statement, v1.4
- paper statement: [Theorem~L2: strengthened Lean-certified statement, v1.4] Let \(p\) and \(q\) be distinct primes, \(n=p^2q\) and \(N=n+12\), and suppose \(\ph(N)=\ph(n)+12\) and \(\sig(N)=\sig(n)+12\). Then: \begin{enumerate} \item[\textup{(i)}] \(N\) is not prime, and \(N\) is not a product of two distinct primes; \item[\textup{(ii)}] \(N\) is not a product of three distinct primes; \item[\textup{(iii)}] \(N\) is not of the form \(r^2st\) with pairwise distinct primes \(r,s,t\ge 5\); \item[\textup{(iv)}] \(N\) is not of the form \(r^3s\) with distinct primes \(r,s\); \item[\textup{(v)}] \(n>10^4\); \item[\textup{(vi)}] \(N\) is not of the form \(r^k\) with \(r\) prime and \(k\ge 1\), and \(N\) is not of th
- Lean `P2qJumps.Semantics2.theorem_L2`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: PAPER-FIX**
- **mismatch:** Lean proves it, but the paper labels it pending at paper/p2q-jumps-v1.4.tex:1178
- **mismatch:** Lean proves it, but the paper labels it pending at paper/theorem-L2.tex:16
- status wording at paper/p2q-jumps-v1.4.tex:1178: ['pending']: "The author's approval of the wording of <SELF> and of <ID> is \textbf{pending}"
- status wording at paper/theorem-L2.tex:16: ['pending']: "<SELF> The transcription <ID> is \textbf{pending author approval} ( <ID> )."
- claim-map note: theorem_L2 : paper_claim2; locked transcription of paper/theorem-L2.tex

### `thm:H1-comp` (theorem) at paper/p2q-jumps-v1.4.tex:2271
- title: H1
- paper statement: [H1] Combining Theorems~\ref{thm:D} and~\ref{thm:F} (Corollary~\ref{cor:F1}) with the exact finite descent for \(p=7\) and \(k\in\{7,8,9\}\) yields: there is no solution of~\eqref{eq:jumps} with \(n=p^2q\) and \(N\) squarefree. Thus H1 holds. Since v1.4 this statement is kernel-checked in Lean (Theorem~\ref{thm:A-H1}, Section~\ref{sec:A-H1}); the written descent of Appendix~\ref{app:p7} is an external reproduction.
- Lean `P2qJumps.no_squarefree`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.H1_holds`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: PAPER-FIX**
- **mismatch:** Lean proves it, but the paper labels it is open at paper/p2q-jumps-v1.4.tex:2424
- acknowledged status sentence at paper/p2q-jumps-v1.4.tex:1993 (reviewed, not hidden): ['remain open']: "after <SELF> , only H2 and H3 remain open" (reason: the open status words refer to H2 and H3, not to H1 (prop:implies remark, line 2026); reviewed 2026-11-23 by Grok Bot)
- status wording at paper/p2q-jumps-v1.4.tex:2424: ['is open']: "Beyond \(q\le 10^6\) this case is open, apart from the squarefree part H1, closed under computer-assisted trust in <SELF>"
- claim-map note: statement: no solution with N squarefree; thus H1

## WORDING-DRIFT (4)

### `lem:A-coprime6` (lemma) at paper/p2q-jumps-v1.4.tex:144
- paper statement: A prime \(r\ge 5\) is divisible by neither \(2\) nor \(3\). Consequently, if \(N=r^2st\) or \(N=r^3s\) with all displayed primes \(\ge 5\), then \(2\nmid N\) and \(3\nmid N\) (a prime dividing a product divides one factor), and Lemma~\ref{lem:A-p5} gives \(p\ge 5\) and \(p\nmid N\).
- Lean `P2qJumps.prime_ge_five_not_dvd`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: HUMAN**
- **mismatch:** recorded relation: Lean is lean-narrower than/to the paper statement: Lean proves only the first sentence (prime r>=5 is not divisible by 2 or 3); the 'Consequently ... N=r^2st or r^3s ...' sentence has no Lean declaration
- claim-map note: Lean proves only the first sentence (prime r>=5 is not divisible by 2 or 3); the 'Consequently ... N=r^2st or r^3s ...' sentence has no Lean declaration

### `thm:A-omega4` (theorem) at paper/p2q-jumps-v1.4.tex:508
- title: \(\omega(N)\ge 4\) constraints
- paper statement: [\(\omega(N)\ge 4\) constraints] Assume~\eqref{eq:jumps}. If \(N\) has at least four distinct prime factors, then \(q\ge 3p^2\) and every prime factor \(r\) of \(N\) satisfies \(r>p\). In particular \(N>p^4\).
- Lean `P2qJumps.omega4_constraints`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: HUMAN**
- **mismatch:** recorded relation: Lean is lean-narrower than/to the paper statement: Lean omega4_constraints gives q >= 3p^2 and every prime factor > p; the closing 'In particular N > p^4' has no Lean declaration
- status wording at paper/p2q-jumps-v1.4.tex:2424: ['\\DATAOMEGAFOUR']: "the external PARI search (not kernel-checked) covers all distinct primes \(p,q\le 10^4\) (any shape, 0 hits) and the \(Q=10^6\) range \(5\le p\le 997\), \(p^2<q\le 10^6\) (any shape, no filter, 0 hits), so by <SELF> there is no solution with \(\omega(N)\ge 4\) and \(q\le 10^6\) (computationally veri"
- claim-map note: Lean omega4_constraints gives q >= 3p^2 and every prime factor > p; the closing 'In particular N > p^4' has no Lean declaration

### `lem:A-K` (lemma) at paper/p2q-jumps-v1.4.tex:716
- title: Lemma K
- paper statement: [Lemma K] Assume~\eqref{eq:jumps}. There is an integer \(m\ge 1\) with \(U-P=pm\), \(Km=p+q-1\) and \(K(p^2m-U)=L(p)\). In particular \(K\mid L(p)\). If \(r\) is prime and \(r^{e+1}\mid N\), then \(r^e\mid K\).
- Lean `P2qExclusions.setupK`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.lemmaK`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.pow_dvd_K`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: HUMAN**
- **mismatch:** recorded relation: Lean is lean-narrower than/to the paper statement: P2qExclusions.setupK assumes 5 <= p (true under the jumps by P2qJumps.preamble, but the cited declaration carries it as a hypothesis); paper states it under the jumps alone
- claim-map note: P2qExclusions.setupK assumes 5 <= p (true under the jumps by P2qJumps.preamble, but the cited declaration carries it as a hypothesis); paper states it under the jumps alone

### `prop:A-p7-prefix` (proposition) at paper/p2q-jumps-v1.4.tex:1102
- title: prefix bound
- paper statement: [prefix bound] Let \(b,h,s,M,F_-,F_+\) be integers with \(b,h,s,M\ge 0\) and \(F_-F_+\le M^2\). If \(343(hF_-)(sF_+)=342(bM)^2+108bM-760554\) and \(342b^2-343hs\ge 1\), then \(M\le 872\). Since \(872<11\cdot 13\cdot 17\), no prefix with \(342b^2-343\ph(b)\sig(b)\ge 1\) can be completed by three or more further distinct primes \(\ge 11\).
- Lean `P2qJumps.p7_prefix_bound`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.p7_prune_threshold`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: HUMAN**
- **mismatch:** recorded relation: Lean is lean-narrower than/to the paper statement: Lean proves M <= 872 and 872 < 11*13*17; the concluding 'no prefix ... can be completed by three or more further distinct primes >= 11' has no Lean declaration
- claim-map note: Lean proves M <= 872 and 872 < 11*13*17; the concluding 'no prefix ... can be completed by three or more further distinct primes >= 11' has no Lean declaration

## UNMAPPED (5)

### `nolabel:remark:3fb358bb8292` (remark) at paper/p2q-jumps-v1.4.tex:683
- paper statement: Theorem~\ref{thm:A-r3st-empty} is not part of the locked statements \path{theorem-L.tex} and \path{theorem-L2.tex}. Adding it to Theorem~\ref{thm:L2} would change that locked statement, so it would need a new lock and the author's approval.
- **fix route: RE-REVIEW**
- **mismatch:** environment not in the claim map final-check/claim-map.json

### `nolabel:remark:f02b436ea06c` (remark) at paper/p2q-jumps-v1.4.tex:775
- paper statement: Theorem~\ref{thm:A-E}(iii) needs no prime of exponent~\(1\), so it is stronger than Theorem~\ref{thm:E}(iii) of Part~\ref{part:B}; (ii) and (iv) need a third prime factor \(t\) of any exponent, which is weaker than the hypothesis \(j\ge 1\) of Theorem~\ref{thm:E}. Combining (iv) with Theorem~\ref{thm:A-B}: if \(r^3\mid N\), then no prime \(s\ne r\) has \(s^2\mid N\). Indeed, if \(N\) has a prime factor \(t\ne r,s\), (iv) applies; otherwise \(r\) and \(s\) are the only primes of \(N\), both with square dividing \(N\), so \(N\) is powerful with \(\omega(N)=2\), which Theorem~\ref{thm:A-B} excludes.
- **fix route: RE-REVIEW**
- **mismatch:** environment not in the claim map final-check/claim-map.json

### `nolabel:remark:dbe4096aa7fc` (remark) at paper/p2q-jumps-v1.4.tex:1154
- title: New content requiring author approval
- paper statement: [New content requiring author approval] Items (iii) and the \(p>r\) half of (iv) are new relative to v1.3. In particular (iii) closes the shape \(r^2st\) completely, whereas the v1.3 text and the author's v1.4 theorem block list \(r^2st\) as open beyond computational bounds. Every step is kernel-checked. The author decided on 16~November~2026 to include the \(r^2st\) closure in the paper; the formal approval of the wording of Theorem~\ref{thm:L} in \path{truth-gate.lock.json} is still pending.
- **fix route: RE-REVIEW**
- **mismatch:** environment not in the claim map final-check/claim-map.json

### `nolabel:remark:4e4460c3c18b` (remark) at paper/p2q-jumps-v1.4.tex:2209
- paper statement: Theorem~\ref{thm:E} is kernel-checked in v1.4 as Theorem~\ref{thm:A-E}, clause by clause, with the hypothesis \(j\ge 1\) replaced by the weaker ``a third prime factor'' in (ii) and (iv) and dropped in (iii). The final sentence (``Consequently every remaining repeated-prime solution has shape \ldots'') is kernel-checked as the single Theorem~\ref{thm:A-E-shapes} (\texttt{P2qJumps.theoremE\_shapes}).
- **fix route: RE-REVIEW**
- **mismatch:** environment not in the claim map final-check/claim-map.json

### `nolabel:remark:ed00648fc5f5` (remark) at paper/p2q-jumps-v1.4.tex:2280
- title: Status of Conjecture~\ref{conj:vanish}
- paper statement: [Status of Conjecture~\ref{conj:vanish}] H1 is closed by Theorem~\ref{thm:H1-comp} (kernel-checked, Theorem~\ref{thm:A-H1}). H2 for \(p\ge 10^6\) and H3 remain open. Therefore Conjecture~\ref{conj:vanish} remains open. No novelty or priority claim is made for the broader prime-quadruplet classification beyond the attribution in~\cite{RCW2026} to McCranie via OEIS~A056777.
- **fix route: RE-REVIEW**
- **mismatch:** environment not in the claim map final-check/claim-map.json

## UNJUDGED (46)

### `lem:A-L1Q` (lemma) at paper/p2q-jumps-v1.4.tex:702
- title: L1, Lemma Q and \(\delta(N)\)
- paper statement: [L1, Lemma Q and \(\delta(N)\)] \textup{(a)} For every \(x\ge 1\), \(\delta(x)=\sum(1+\mu(a))\,b\), the sum over pairs \(ab=x\) with \(a\ne 1\); every term is \(\ge 0\). \textup{(b)} \(\delta(p^2q)=q+2p+1\) and \(Q(p^2q)=p^4+pq^2-p\), where \(Q(x)=x^2-\sig(x)\ph(x)\). \textup{(c)} Under~\eqref{eq:jumps}, \(\delta(N)=\delta(n)=q+2p+1\) and \(Q(N)=Q(n)-12\delta(n)=p^4+pq^2-p-12(2p+q+1)>0\). \textup{(d)} If \(r\) is prime and \(r^2\mid N\), then \(N\le r^2(q+2p+1)\).
- Lean `P2qExtensions.lemmaL1`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qExtensions.delta_Q_p2q`: `` axioms None NOT CERTIFIED: Lean: not in the certificate's #print axioms log /workspace/p2q-paperfix-notes/cert-033e12d/lean-certificate-033e12d2db946d625b409e726d358198a35ac8ff/print-axioms.log
- Lean `P2qExtensions.lemmaQ`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.lemmaQ_formula`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qExtensions.repeated_prime_bound`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded automatically; review required

### `prop:A-pure` (proposition) at paper/p2q-jumps-v1.4.tex:883
- title: Pure statements
- paper statement: [Pure statements] \textup{(a)} If \(p,p+2,p+6,p+8\) are prime, then \(n=p(p+8)\) satisfies~\eqref{eq:jumps}. \textup{(b)} \(D(p,\rho)>0\) for all integers \(p,\rho\ge 5\); and \((2\rho^3-2p\rho^2+2p^2\rho-\rho^2-\rho-24)-\rho D(p,\rho)=C(\rho)\). \textup{(c)} \(\Phi(p,\rho)<0\) for all integers \(p\ge 5\), \(\rho\ge 2p\). \textup{(d)} \(N(p,k)<0\) for all integers \(p\ge 5\) and \(k\in[5-p,p-1]\setminus\{0\}\). \textup{(e)} The values \(T(5),\dots,T(19)\) and their \(2\)-adic valuations listed in Corollary~\ref{cor:F1}; and \(T(m)<m^4<2^{m-1}\) for every integer \(m\ge 23\). \textup{(f)} For the model \([0,-1,0,0,-12]\) of \(E\): \(\Delta=-62976=-2^9\cdot 3\cdot 41\), \(c_4^3/\Delta=-8/123\)
- Lean `P2qJumps.quadruplet_jumps`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.D_pos`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.C_identity`: `` axioms ['propext', 'Quot.sound']
- Lean `P2qJumps.Phi_neg`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.Nfar_neg`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.T_values`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.F1_tail`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.pow_gt_T`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.curve_disc`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.curve_j`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.curve_factorizations`: `` axioms ['propext']
- Lean `P2qJumps.curve_points`: `` axioms ['propext']
- Lean `P2qJumps.F_mod16`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.sq_mod16`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.F_even`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.quartic_gt_six`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded automatically; review required

### `prop:A-vacuous` (proposition) at paper/p2q-jumps-v1.4.tex:904
- title: Statements about shapes that do not occur
- paper statement: [Statements about shapes that do not occur] Assume~\eqref{eq:jumps}. The statements of Part~\ref{part:B} listed below concern shapes of \(N\) that are proved impossible, and each is kernel-checked, with the paper's conclusion stated in Lean, as a consequence of that impossibility (so it holds vacuously). \textup{(a)} \(N=rst\) (excluded by Theorem~\ref{thm:L}(ii)): Lemma~\ref{lem:e123}; Lemmas~\ref{lem:qform}, \ref{lem:C}, the first two clauses of Lemma~\ref{lem:Phi} and Theorem~\ref{thm:rigid}(a); Proposition~\ref{prop:balanced} and Theorem~\ref{thm:closed}(5); Proposition~\ref{prop:pm2}, Theorem~\ref{thm:closed}(6) and Theorem~\ref{thm:rst-off}; the clauses \(5-p\le k<p\), \(k\ne0\), the d
- Lean `P2qJumps.rst_false`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.lem_e123`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.lem_qform_C_Phi`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.rst_balanced`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.rst_off`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.rst_far`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.r3s_statements`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.r2st_false`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.r2st_statements`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.four_false`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.four_statements`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.four_vacuous`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded automatically; review required

### `prop:A-C-K` (proposition) at paper/p2q-jumps-v1.4.tex:948
- title: the divisor \(K\)
- paper statement: [the divisor \(K\)] Assume~\eqref{eq:jumps} and \(r^2\mid N\) for some prime \(r\). Then \(K=N/\mathrm{rad}(N)\) satisfies \(K>1\), \(K\mid L(p)\) and \(\gcd(K,6p)=1\).
- Lean `P2qJumps.propC_K`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded automatically; review required

### `prop:A-C-j1` (proposition) at paper/p2q-jumps-v1.4.tex:961
- title: the system for \(j=1\)
- paper statement: [the system for \(j=1\)] Assume~\eqref{eq:jumps} and \(N=Ms\) with \(s\) prime and \(\gcd(M,s)=1\). Then \[ Ms-p^2q=12,\qquad fs-aq=f-a+12,\qquad gs-bq=b+12-g, \] the determinant \(p^2f-aM\) of the first two equations in the unknowns \((s,q)\) is nonzero, and \((s,q)\) is the only rational solution \((x,y)\) of \(Mx-p^2y=12\), \(fx-ay=f-a+12\).
- Lean `P2qJumps.propC_j1`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded automatically; review required

### `prop:A-C-j2` (proposition) at paper/p2q-jumps-v1.4.tex:980
- title: the system for \(j=2\)
- paper statement: [the system for \(j=2\)] Assume~\eqref{eq:jumps} and \(N=Mst\) with \(s\ne t\) prime and \(\gcd(M,st)=1\). Put \(S=s+t\), \(\Pi=st\). Then \[ M\Pi-p^2q=12,\qquad f\Pi-fS-aq=12-a-f,\qquad g\Pi+gS-bq=b+12-g, \] the determinant \(\Delta=M(ag+bf)-2p^2fg\) of this system in the unknowns \((q,S,\Pi)\) is nonzero, and \((q,S,\Pi)\) is its only rational solution.
- Lean `P2qJumps.propC_j2`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded automatically; review required

### `thm:A-implies` (theorem) at paper/p2q-jumps-v1.4.tex:1013
- title: Proposition~\ref{prop:implies-corrected}
- paper statement: [Proposition~\ref{prop:implies-corrected}] Conjecture~\ref{conj:vanish} (\texttt{Conjecture3}) holds if and only if H1, H2 and H3 hold. Consequently, if H1 holds, Conjecture~\ref{conj:vanish} holds if and only if H2 and H3 hold.
- Lean `P2qJumps.prop_implies_corrected`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.implies_corrected_of_H1`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded automatically; review required

### `thm:A-three` (theorem) at paper/p2q-jumps-v1.4.tex:1041
- title: reduction to \(\omega(N)\ge 4\) or \(r^2s^2t\)
- paper statement: [reduction to \(\omega(N)\ge 4\) or \(r^2s^2t\)] \begin{enumerate} \item[\textup{(a)}] Assume~\eqref{eq:jumps}. Then \(\omega(N)\ge 4\), or \(N=r^2s^2t\) for pairwise distinct primes \(r,s,t\). \item[\textup{(b)}] The claim ``every solution has \(N=r^3s\), \(N=r^2st\) or \(\omega(N)\ge 4\)'' (\texttt{ThreeRegimes}) holds if and only if no solution has \(N=r^2s^2t\) with pairwise distinct primes \(r,s,t\) (\texttt{R2S2TEmpty}). \end{enumerate} Neither \texttt{ThreeRegimes} nor \texttt{R2S2TEmpty} is proved.
- Lean `P2qJumps.omega4_or_r2s2t`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.threeRegimes_iff_r2s2t`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- status wording at paper/p2q-jumps-v1.4.tex:2432: ['is open']: "\(r^3st\) is now excluded ( <REF> ), and by <SELF> the claim is equivalent to the emptiness of \(r^2s^2t\), which is open"
- claim-map note: seeded automatically; review required

### `thm:closed` (theorem) at paper/p2q-jumps-v1.4.tex:1200
- title: Closed shapes
- paper statement: [Closed shapes] Let \(p\) and \(q\) be distinct primes, \(n=p^2q\), and \(N=n+12\). Suppose~\eqref{eq:jumps} holds. Then \(p,q\ge 5\), the integer \(N\) is odd, coprime to \(6pq\), and not a square, and \(N\) is of none of the following forms: \begin{enumerate} \item a prime; \item a prime power \(r^k\) with \(k\ge 2\); \item a product of two distinct primes; \item \(r^2s\) or \(rs^2\) with distinct primes \(r,s\); \item a product of three distinct primes each at least \(2p\); \item a product of three distinct primes of which one equals \(p-2\). \end{enumerate} In particular there is no solution with \(\{p,q\}\cap\{2,3\}\ne\emptyset\).
- Lean `P2qJumps.theorem_closed`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.rst_balanced`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.rst_off`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 5: Lean `theorem_closed` (ClosedLedger.lean:253); items (5),(6) also `rst_balanced` (ProseClaims2.lean:130), `rst_off` (ProseClaims2.lean:138)

### `thm:rigid` (theorem) at paper/p2q-jumps-v1.4.tex:1217
- title: Rigidity equations
- paper statement: [Rigidity equations] Assume the hypotheses of Theorem~\ref{thm:closed}. \begin{enumerate} \item[\textup{(a)}] If \(N=rst\) with distinct primes \(r,s,t\ge 5\) and \(\rho\) denotes any one of them, then \begin{equation} q=\rho+\frac{C(\rho)}{D(p,\rho)},\qquad C(\rho)=(\rho-3)(\rho^2+3\rho+8),\qquad D(p,\rho)=2p^2-2p\rho+\rho^2-\rho. \end{equation} In particular \(D(p,\rho)\) divides the \(p\)-free integer \(C(\rho)\). For each prime \(\rho\) there are only finitely many candidate values of \(p\). \item[\textup{(b)}] If \(N=r^3s\) with distinct primes \(r,s\ge 5\), then \(r^2\) divides \(p+q-1\). Writing \(p+q-1=r^2m\) with an integer \(m\ge 1\), one has \(s=pm-r+1\), \(q=r^2m-p+1\), and \begi
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded automatically; review required

### `lem:equiv` (lemma) at paper/p2q-jumps-v1.4.tex:1268
- paper statement: The identities~\eqref{eq:jumps} are equivalent to \(A(N)=A(n)\) and \(B(N)=B(n)\), hence also to \(\delta(N)=\delta(n)\).
- Lean `P2qJumps.jumps_iff_AB`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.jumps_delta`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 6: Lean `jumps_iff_AB`, `jumps_delta` (ProseClaims.lean:23, :41)

### `lem:AB` (lemma) at paper/p2q-jumps-v1.4.tex:1281
- paper statement: If \(n=p^2q\) with distinct primes \(p,q\), then \begin{equation} A(n)=p(p+q-1),\qquad B(n)=(1+p)(1+q)+p^2,\qquad \delta(n)=2p+q+1. \end{equation}
- Lean `P2qJumps.AB_p2q`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 7: Lean `AB_p2q` (ProseClaims.lean:48)

### `lem:cot` (lemma) at paper/p2q-jumps-v1.4.tex:1304
- paper statement: If \(m>1\) and \(r\) is the least prime factor of \(m\), then \(A(m)\ge m/r\), with equality if and only if \(m\) is a power of \(r\).
- Lean `P2qJumps.cot_le`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.cot_eq_iff`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 8: Lean `cot_le`, `cot_eq_iff` (ProseClaims.lean:68, :75)

### `lem:Ark` (lemma) at paper/p2q-jumps-v1.4.tex:1315
- paper statement: If \(r\) is prime and \(k\ge 1\), then \(A(r^k)=r^{k-1}\).
- Lean `P2qJumps.A_prime_pow`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 9: Lean `A_prime_pow` (ProseClaims.lean:59)

### `prop:23` (proposition) at paper/p2q-jumps-v1.4.tex:1329
- paper statement: No solution of~\eqref{eq:jumps} exists if \(2\mid n\) or \(3\mid n\).
- Lean `P2qJumps.prop_23`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 10: Lean `prop_23` (ClosedLedger.lean:194)

### `cor:gcd` (corollary) at paper/p2q-jumps-v1.4.tex:1356
- paper statement: If~\eqref{eq:jumps} holds then \(p,q\ge 5\), \(N\) is odd, and \(\gcd(N,6pq)=1\).
- Lean `P2qJumps.cor_gcd`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 11: Lean `cor_gcd` (ClosedLedger.lean:187)

### `prop:square` (proposition) at paper/p2q-jumps-v1.4.tex:1367
- paper statement: If~\eqref{eq:jumps} holds then \(N\) is not a square.
- Lean `P2qJumps.prop_square`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 12: Lean `prop_square` (ClosedLedger.lean:216)

### `prop:primepower` (proposition) at paper/p2q-jumps-v1.4.tex:1378
- paper statement: If~\eqref{eq:jumps} holds then \(N\) is neither prime nor a prime power \(r^k\) with \(k\ge 2\).
- Lean `P2qJumps.prop_primepower`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 13: Lean `prop_primepower` (ClosedLedger.lean:222)

### `prop:rs` (proposition) at paper/p2q-jumps-v1.4.tex:1389
- paper statement: If~\eqref{eq:jumps} holds then \(N\) is not a product of two distinct primes.
- Lean `P2qJumps.prop_rs`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 14: Lean `prop_rs` (ClosedLedger.lean:228)

### `prop:r2s` (proposition) at paper/p2q-jumps-v1.4.tex:1398
- paper statement: If~\eqref{eq:jumps} holds then \(N\) is neither \(r^2s\) nor \(rs^2\).
- Lean `P2qJumps.prop_r2s`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 15: Lean `prop_r2s` (ClosedLedger.lean:234)

### `lem:e123` (lemma) at paper/p2q-jumps-v1.4.tex:1409
- paper statement: If~\eqref{eq:jumps} holds and \(N=rst\) with distinct primes \(r,s,t\), then \begin{align} r+s+t&=V:=p+\frac{q+1}{2},\\ rs+rt+st&=p^2+pq+\frac{q-1}{2},\\ rst&=p^2q+12. \end{align} In particular \(q\) is odd, and \(r,s,t\) are the roots of \(X^3-VX^2+\bigl(p^2+pq+(q-1)/2\bigr)X-(p^2q+12)=0\).
- Lean `P2qJumps.lem_e123`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 16: Lean, vacuous: `lem_e123` (ProseClaims2.lean:109)

### `lem:qform` (lemma) at paper/p2q-jumps-v1.4.tex:1427
- paper statement: In the setting of Lemma~\ref{lem:e123}, if \(\rho\in\{r,s,t\}\) then \begin{equation} q=\frac{2\rho^3-2p\rho^2+2p^2\rho-\rho^2-\rho-24}{D(p,\rho)}, \end{equation} where \(D(p,\rho)=2p^2-2p\rho+\rho^2-\rho>0\) for all primes \(p,\rho\ge 5\).
- Lean `P2qJumps.lem_qform_C_Phi`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.D_pos`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 17: Lean `lem_qform_C_Phi` (vacuous, ProseClaims2.lean:117); D > 0: `D_pos` (ProseClaims2.lean:266)

### `lem:C` (lemma) at paper/p2q-jumps-v1.4.tex:1450
- paper statement: With the notation of Lemma~\ref{lem:qform}, \[ q-\rho=\frac{C(\rho)}{D(p,\rho)},\qquad C(\rho)=(\rho-3)(\rho^2+3\rho+8). \]
- Lean `P2qJumps.lem_qform_C_Phi`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.C_identity`: `` axioms ['propext', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 18: Lean `lem_qform_C_Phi` (vacuous); identity `C_identity` (ProseClaims2.lean:270)

### `lem:Phi` (lemma) at paper/p2q-jumps-v1.4.tex:1467
- paper statement: Write \[ \Phi(p,\rho)=-\rho^4+(2p+1)\rho^3-(2p^3+p^2-12)\rho+2p^4-p^2-24p-12. \] Then \(N-\rho^3=\rho\,\Phi(p,\rho)/D(p,\rho)\). Consequently \(\rho^3\le N\) if and only if \(\Phi(p,\rho)\ge 0\). Moreover \(\Phi(p,\rho)<0\) whenever \(p\ge 5\) and \(\rho\ge 2p\).
- Lean `P2qJumps.lem_qform_C_Phi`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.Phi_neg`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 19: Lean `lem_qform_C_Phi` (vacuous, first two clauses); `Phi_neg` (ProseClaims2.lean:52)

### `prop:balanced` (proposition) at paper/p2q-jumps-v1.4.tex:1486
- paper statement: If~\eqref{eq:jumps} holds and \(N=rst\), then \(\min(r,s,t)<2p\). In particular \(N\) cannot be a product of three primes each at least \(2p\).
- Lean `P2qJumps.prop_balanced`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.rst_balanced`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 20: Lean `prop_balanced` (ClosedLedger.lean:284), `rst_balanced` (ProseClaims2.lean:130)

### `prop:pm2` (proposition) at paper/p2q-jumps-v1.4.tex:1495
- paper statement: If~\eqref{eq:jumps} holds and \(N=rst\), then none of \(r,s,t\) equals \(p-2\).
- Lean `P2qJumps.prop_pm2`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.rst_off`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 21: Lean `prop_pm2` (ClosedLedger.lean:293), `rst_off` (ProseClaims2.lean:138)

### `thm:r3sint` (theorem) at paper/p2q-jumps-v1.4.tex:1519
- title: Integrality criterion for \(r^3s\)
- paper statement: [Integrality criterion for \(r^3s\)] Assume the hypotheses of Theorem~\ref{thm:closed} and \(N=r^3s\). Write \(\lambda=(r^4-r^3+12)/p\) and \[ m=\frac{\lambda+p-p^2}{r^2(r-p)} \] as in Theorem~\ref{thm:rigid}(b). If \(m\) is an integer, then \[ r^2\mid(p^3-p^2-12). \] In particular there is no solution with \(r\in\{p-4,p-2,p+2,p+4\}\).
- Lean `P2qJumps.r3s_statements`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 25: Lean, vacuous: `r3s_statements` (ProseClaims2.lean:155)

### `thm:four` (theorem) at paper/p2q-jumps-v1.4.tex:1591
- title: Four-prime rigidity
- paper statement: [Four-prime rigidity] Assume the hypotheses of Theorem~\ref{thm:closed} and suppose \(N\) is squarefree with four distinct prime factors. Write \(N=rstu\). Then: \begin{enumerate} \item \(\TT(N)=2(e_2+1)\), so \[ e_2=rs+rt+ru+st+su+tu=p+\frac{q-1}{2}. \] AM--GM gives \(e_2\ge 6\sqrt{N}\). Consequently there is no solution with \(q=O(p)\). Comparable-factor quadruples are compatible with this bound only if \(q\asymp 144p^2\). \item For any two of the prime factors, say \(r\) and \(s\), write \(\sigma=t+u\) and \(\pi=tu\). Then \[ \sigma=\frac{N_{\sigma}(p,r,s)}{D_{\sigma}(p,r,s)}, \] where \begin{align*} N_{\sigma}&=-(2p^4-2p^3(r+s)+2p^2rs(r+s)+p^2(rs-r-s+1)\\ &\qquad-2prs(rs)-24p-rs(rs-r-s)+
- Lean `P2qJumps.four_statements`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.four_false`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.four_vacuous`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 27: Lean, vacuous (squarefree ω = 4 excluded by Theorem D): `four_statements` (ProseClaims2.lean:218) via `four_false` (:168)

### `thm:rst-off` (theorem) at paper/p2q-jumps-v1.4.tex:1678
- title: Nearby triple factors
- paper statement: [Nearby triple factors] If~\eqref{eq:jumps} holds and \(N=rst\), then none of \(r,s,t\) equals \(p\pm 2\), \(p\pm 4\), \(p\pm 6\), or \(p\pm 8\).
- Lean `P2qJumps.rst_off`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 32: Lean, vacuous: `rst_off` (ProseClaims2.lean:138)

### `thm:rst-far` (theorem) at paper/p2q-jumps-v1.4.tex:1697
- title: Far triples
- paper statement: [Far triples] Assume~\eqref{eq:jumps} and \(N=rst\) with distinct primes \(r,s,t\ge 5\). Write \(\rho\) for the least prime factor of \(N\) and \(k=\rho-p\). Then \(5-p\le k<p\), \(k\neq 0\), and the complementary discriminant is \[ \Delta=\frac{N(p,k)}{\bigl(p^2-p+k(k-1)\bigr)^2}, \] where \begin{align*} N(p,k)&= -7p^6-6kp^5-11k^2p^4-4k^3p^3-4k^4p^2\\ &\quad+4k^4p+k^4+14k^3p^2-4k^3p-50k^3+22k^2p^3-6k^2p^2-2k^2p+73k^2\\ &\quad+20kp^4-12kp^3-76kp^2+2kp-24k+12p^5-2p^4+20p^3+p^2-24p+144. \end{align*} The polynomial \(N(p,k)\) is strictly negative for every prime \(p\ge 5\) and every integer \(k\) in \([5-p,p-1]\setminus\{0\}\). Hence \(\Delta<0\), and no such triple exists.
- Lean `P2qJumps.rst_far`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.Nfar_neg`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 33: Lean `rst_far` (vacuous, ProseClaims2.lean:146); N(p,k) < 0: `Nfar_neg` (ProseClaims2.lean:35) for all integers p ≥ 5

### `thm:r2st-off` (theorem) at paper/p2q-jumps-v1.4.tex:1745
- title: Nearby square factors
- paper statement: [Nearby square factors] If~\eqref{eq:jumps} holds and \(N=r^2st\), then \(r\notin\{p-6,p-4,p-2,p+2,p+6,p+8\}\).
- Lean `P2qJumps.r2st_statements`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 34: Lean, vacuous: `r2st_statements` (ProseClaims2.lean:201)

### `thm:rp4` (theorem) at paper/p2q-jumps-v1.4.tex:1772
- title: The line \(r=p+4\)
- paper statement: [The line \(r=p+4\)] If~\eqref{eq:jumps} holds and \(N=r^2st\) with \(r=p+4\), then \(p\not\equiv 1,3,9,11\pmod{16}\).
- Lean `P2qJumps.r2st_statements`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 34: Lean, vacuous: `r2st_statements` (ProseClaims2.lean:201)

### `thm:r3s-plarge` (theorem) at paper/p2q-jumps-v1.4.tex:1798
- title: No cube-times-prime with \(p>r\)
- paper statement: [No cube-times-prime with \(p>r\)] If~\eqref{eq:jumps} holds and \(N=r^3s\), then \(p<r\).
- Lean `P2qJumps.r3s_statements`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 35: Lean, vacuous: `r3s_statements` (ProseClaims2.lean:155)

### `thm:r3s-strip` (theorem) at paper/p2q-jumps-v1.4.tex:1825
- title: Cube-times-prime strip
- paper statement: [Cube-times-prime strip] If~\eqref{eq:jumps} holds and \(N=r^3s\) with \(p<r\), then \[ p<r<p^{3/2}\qquad\text{and}\qquad r^2\mid(p^3-p^2-12). \] In particular, for each prime \(p\ge 5\) only finitely many primes \(r\) can occur, and each must be a prime whose square divides the single integer \(p^3-p^2-12\).
- Lean `P2qJumps.r3s_statements`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 35: Lean, vacuous: `r3s_statements` (ProseClaims2.lean:155)

### `thm:R1` (theorem) at paper/p2q-jumps-v1.4.tex:1901
- title: Unbalanced triples are empty
- paper statement: [Unbalanced triples are empty] If~\eqref{eq:jumps} holds and \(n=p^2q\), then \(N\) is not a product of three distinct primes.
- Lean `P2qJumps.theorem28_holds`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 36: Lean `theorem28_holds` (ClosedShapes.lean:139)

### `hyp:R1` (hypothesis) at paper/p2q-jumps-v1.4.tex:1975
- title: R1
- paper statement: [R1] \itshape (Discharged by Theorem~\ref{thm:R1}.) There are no primes \(p,\rho\ge 5\) for which \(D(p,\rho)\) divides \(C(\rho)\), the resulting \(q\) in~\eqref{eq:qCD} is a new prime, and \(X^2-(V-\rho)X+N/\rho\) splits into two further new primes.
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded automatically; review required

### `lem:L1` (lemma) at paper/p2q-jumps-v1.4.tex:2040
- title: M\"obius form of \(\delta\); L1
- paper statement: [M\"obius form of \(\delta\); L1] For every integer \(x>1\), \[ \delta(x)=\sum_{\substack{e\mid x\\ e>1}}(1+\mu(e))\,\frac{x}{e}. \] Every summand is nonnegative.
- Lean `lemmaL1`: `` axioms None NOT CERTIFIED: Lean: ambiguous in the #print axioms log: ['P2qExtensions.lemmaL1', 'P2qJumps.lemmaL1']
- Lean `P2qExtensions.lemmaL1`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 42: Lean `lemmaL1` (ClosedLedger.lean:36); `P2qExtensions.lemmaL1` (Ext/Extensions/DeltaQ.lean:41)

### `lem:L2` (lemma) at paper/p2q-jumps-v1.4.tex:2053
- title: Radical scaling; L2
- paper statement: [Radical scaling; L2] If \(N=KU\) with \(U=\mathrm{rad}(N)\), then \(\ph(N)=K\,\ph(U)\) and \(A(N)=K\,A(U)\).
- Lean `P2qJumps.radical_scaling`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 43: Lean `radical_scaling` (ProseClaims.lean:150)

### `lem:K` (lemma) at paper/p2q-jumps-v1.4.tex:2062
- title: Lemma~K
- paper statement: [Lemma~K] Assume~\eqref{eq:jumps} with \(n=p^2q\) and \(K>1\). Then \(p\nmid K\), \(p\) divides \(A(U)\), and writing \(A(U)=pm\) one has \(p+q-1=Km\) and \[ K\,(p^2m-U)=L(p). \] In particular \(K\mid L(p)\). Consequently every repeated prime \(r\) of \(N\) satisfies \(r^{e_r-1}\mid L(p)\).
- Lean `P2qJumps.lemmaK`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.pow_dvd_K`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 44: Lean `lemmaK` (TheoremsBE.lean:123), `pow_dvd_K` (TheoremsBE.lean:97)

### `lem:Q` (lemma) at paper/p2q-jumps-v1.4.tex:2141
- title: Lemma~Q
- paper statement: [Lemma~Q] Under~\eqref{eq:jumps}, writing \(Q(m)=m^2-\ph(m)\sig(m)\), \[ Q(N)=p^4+pq^2-p-12(2p+q+1)>0. \] For every \(m=\prod r_i^{e_i}\) one has \(Q(m)/m^2=1-\prod(1-r_i^{-e_i-1})\).
- Lean `P2qJumps.lemmaQ_formula`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qExtensions.sigma_mul_totient_prod`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 48: Lean `lemmaQ_formula` (TheoremsBE.lean:214); product formula `P2qExtensions.sigma_mul_totient_prod` (Ext/Extensions/DeltaQ.lean:72)

### `thm:E` (theorem) at paper/p2q-jumps-v1.4.tex:2182
- title: Theorem~E; kernel-checked in v1.4, Theorem~\ref{thm:A-E}
- paper statement: [Theorem~E; kernel-checked in v1.4, Theorem~\ref{thm:A-E}] Assume~\eqref{eq:jumps} with \(n=p^2q\). Write \(\delta=\delta(N)=q+2p+1\). \begin{enumerate} \item Every prime of \(N\) has exponent at most~3. \item If \(j\ge 1\) and \(|R|\ge 2\), then \(q>5p^2-4p-3\). \item If \(j\ge 1\), then \(|R|\le 2\). \item If \(j\ge 1\) and \(R=\{r_1,r_2\}\), then both exponents equal~2, \(r_1r_2\mid L(p)\), and each \(r_i\) satisfies \(r_i^2\ge N/\delta>\sqrt{L(p)}\). \item Any prime of exponent~3 satisfies \(r^2\mid L(p)\) (hence \(r<p^{3/2}\)); after excluding \(j=0\) via Theorems~\ref{thm:closed} and~\ref{thm:B}, this occurs only for \(|R|=1\). \end{enumerate} Consequently every remaining repeated-prim
- Lean `P2qJumps.theoremE_i`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.theoremE_iv_sqrt`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.theoremE_shapes`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 50: Lean `theoremE_i` … `theoremE_iv_sqrt` (TheoremsBE.lean:60–235); see the remark in Part A for the widened hypotheses

### `lem:G` (lemma) at paper/p2q-jumps-v1.4.tex:2216
- title: Lemma~G
- paper statement: [Lemma~G] Under~\eqref{eq:jumps}, writing \(T(p)=p^4-13p-6\), \[ p(p-1)\sig(N)-(p^2+p+1)\ph(N)=2T(p). \] In particular \(\gcd(\ph(N),\sig(N))\mid 2T(p)\). Moreover \(T(p)>0\) for every prime \(p\ge 5\).
- Lean `lemmaG`: `` axioms None NOT CERTIFIED: Lean: ambiguous in the #print axioms log: ['P2qStructural.lemmaG', 'P2qJumps.lemmaG']
- Lean `P2qJumps.lemmaG_gcd`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.T_pos`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 52: Lean `lemmaG` (ClosedLedger.lean:83); `lemmaG_gcd`, `T_pos` (ProseClaims.lean:172, :182)

### `thm:F` (theorem) at paper/p2q-jumps-v1.4.tex:2233
- title: Theorem~F
- paper statement: [Theorem~F] Assume~\eqref{eq:jumps}. Let \(o\) be the number of odd exponents in the prime factorization of \(N\). Then \(2^o\mid 2T(p)\), equivalently \(o\le 1+v_2(T(p))\). When \(o\ge 1\) one has \(2^{o-1}\mid T(p)\). For squarefree \(N\) one has \(o=\omega(N)=k\), so \(2^{k-1}\mid T(p)\).
- Lean `theoremF`: `` axioms None NOT CERTIFIED: Lean: ambiguous in the #print axioms log: ['P2qStructural.theoremF', 'P2qJumps.theoremF']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 53: Lean `theoremF` (ClosedLedger.lean:115)

### `cor:F1` (corollary) at paper/p2q-jumps-v1.4.tex:2242
- title: Squarefree residual after D+F
- paper statement: [Squarefree residual after D+F] If~\eqref{eq:jumps} holds and \(N\) is squarefree with \(k=\omega(N)\ge 4\), then Theorems~\ref{thm:D} and~\ref{thm:F} force \(k\ge p\ge 5\) and \(k-1\le v_2(T(p))\). The only surviving possibility is \(p=7\) with \(v_2(T(7))=8\), hence \(7\le k\le 9\). Explicitly: \(T(5)=554\) (\(v_2=1\)); \(T(7)=2304\) (\(v_2=8\)); \(T(11)=14492\) (\(v_2=2\)); \(T(13)=28386\) (\(v_2=1\)); \(T(17)=83294\) (\(v_2=1\)); \(T(19)=130068\) (\(v_2=2\)); and for every integer \(m\ge 23\) one has \(2^{m-1}>m^4>T(m)\) by induction from \(2^{22}>23^4\).
- Lean `P2qJumps.corollaryF1`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.T_explicit`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.T_values`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.F1_tail`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- claim-map note: seeded; PROSE-CLAIMS.md row 54: Lean `corollaryF1` (TheoremsBE.lean:193); `T_explicit` (ClosedLedger.lean:152), `T_values`, `F1_tail` (ProseClaims2.lean:236, :260)

### `prop:implies-corrected` (proposition) at paper/p2q-jumps-v1.4.tex:2256
- title: Corrected residual equivalence
- paper statement: [Corrected residual equivalence] Conjecture~\ref{conj:vanish} holds if and only if H1, H2 and H3 all hold, where these quantify over distinct primes \(p,q\) with both jumps~\eqref{eq:jumps}: \begin{itemize} \item[\textbf{H1.}] There is no solution with \(N\) squarefree and \(\omega(N)\ge 4\). \item[\textbf{H2.}] There is no solution with \(R\neq\emptyset\), \(j\in\{1,2\}\), and \(N\) not of the form \(r^as\) (\(a\ge 2\)). By Proposition~\ref{prop:C}, the case \(p<10^6\) is empty under the stated computational trust \DATAHTWO; only \(p\ge 10^6\) remains open. \item[\textbf{H3.}] There is no solution with \(R\neq\emptyset\) and \(j\ge 3\). \end{itemize} H1 is established by Theorem~\ref{thm:H1
- Lean `P2qJumps.prop_implies_corrected`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.implies_corrected_of_H1`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- status wording at paper/p2q-jumps-v1.4.tex:2256: ['\\DATAHTWO']: "[Corrected residual equivalence] <REF> holds if and only if H1, H2 and H3 all hold, where these quantify over distinct primes \(p,q\) with both jumps~ <REF> : \begin{itemize} \item[\textbf{H1.}] There is no solution with \(N\) squarefree and \(\omega(N)\ge 4\). \item[\textbf{H2.}] There is no soluti"
- status wording at paper/p2q-jumps-v1.4.tex:2426: ['remains open']: "The shape \(r^2s^2t\) lies in H2 of <SELF> and remains open"
- claim-map note: seeded; PROSE-CLAIMS.md row 55: Lean `prop_implies_corrected`, `implies_corrected_of_H1` (ImpliesCorrected.lean:47, :114), with R, j, H1–H3 defined at ImpliesCorrected.lean:24–42; the equivalence only (H1–H3 are not proved). The trust statements (H1 by `thm:H1-comp`, H2 for p < 10^6 by Proposition C) are row 56 and row 47

### `thm:main-p2q` (theorem) at paper/p2q-jumps-v1.4.tex:2419
- title: Classification ledger, v1.4
- paper statement: [Classification ledger, v1.4] Let \(p\ne q\) be primes, \(n=p^2q\), \(N=n+12\), and assume~\eqref{eq:jumps}. Then \(p,q\ge 5\), \(N\) is odd, not a square and coprime to \(6pq\), and \(N\) is not a prime, a prime power, a product of two distinct primes, \(r^2s\) or \(rs^2\) (Theorem~\ref{thm:closed}), a product of three distinct primes (Theorem~\ref{thm:R1}), or \(r^2st\) (Theorem~\ref{thm:L}(iii)). Moreover: \begin{enumerate} \item \textbf{\(N=r^3s\).} Excluded with no bound (Theorem~\ref{thm:A-r3s-empty}, kernel-checked, v1.4). The earlier bounded statements (Theorem~\ref{thm:L}(iv): \(p<r\), \(r^2\mid L(p)\), \(p>10^4\); the external check \(5\le r\le 10^6\), \DATAHENSEL) remain true and 
- **fix route: RE-REVIEW**
- **mismatch:** no recorded review of this claim (claim-map field 'reviewed' is empty)
- status wording at paper/p2q-jumps-v1.4.tex:2419: ['\\DATAHENSEL', '\\DATAOMEGAFOUR', 'computationally verified', 'not kernel-checked']: "[Classification ledger, v1.4] Let \(p\ne q\) be primes, \(n=p^2q\), \(N=n+12\), and assume~ <REF> . Then \(p,q\ge 5\), \(N\) is odd, not a square and coprime to \(6pq\), and \(N\) is not a prime, a prime power, a product of two distinct primes, \(r^2s\) or \(rs^2\) ( <REF> ), a product of three dist"
- claim-map note: seeded automatically; review required

## MAP-ORPHAN (8)

### `nolabel:remark:768e45b1cc54` (remark) at paper/p2q-jumps-v1.4.tex:682
- paper statement: 
- **fix route: RE-REVIEW**
- **mismatch:** claim-map entry has no environment in the paper (removed or relabeled claim)

### `nolabel:remark:d5e7c24675a7` (remark) at paper/p2q-jumps-v1.4.tex:774
- paper statement: 
- **fix route: RE-REVIEW**
- **mismatch:** claim-map entry has no environment in the paper (removed or relabeled claim)

### `thm:A-r2s2t-dvd` (theorem) at paper/p2q-jumps-v1.4.tex:1150
- title: \(r^2s^2t\) forces \(rs\mid L(p)\)
- paper statement: 
- **fix route: RE-REVIEW**
- **mismatch:** claim-map entry has no environment in the paper (removed or relabeled claim)

### `thm:A-H2-shapes` (theorem) at paper/p2q-jumps-v1.4.tex:1160
- title: Reduction of H2
- paper statement: 
- **fix route: RE-REVIEW**
- **mismatch:** claim-map entry has no environment in the paper (removed or relabeled claim)

### `thm:A-H3` (theorem) at paper/p2q-jumps-v1.4.tex:1168
- title: Two-adic condition for H3
- paper statement: 
- **fix route: RE-REVIEW**
- **mismatch:** claim-map entry has no environment in the paper (removed or relabeled claim)

### `nolabel:remark:757aff6e801d` (remark) at paper/p2q-jumps-v1.4.tex:1187
- title: New content relative to v1.3
- paper statement: 
- **fix route: RE-REVIEW**
- **mismatch:** claim-map entry has no environment in the paper (removed or relabeled claim)

### `nolabel:remark:5735d72be262` (remark) at paper/p2q-jumps-v1.4.tex:2242
- paper statement: 
- **fix route: RE-REVIEW**
- **mismatch:** claim-map entry has no environment in the paper (removed or relabeled claim)

### `nolabel:remark:8948373e5dae` (remark) at paper/p2q-jumps-v1.4.tex:2313
- title: Status of Conjecture~\ref{conj:vanish}
- paper statement: 
- **fix route: RE-REVIEW**
- **mismatch:** claim-map entry has no environment in the paper (removed or relabeled claim)

## PROVED (43)

### `lem:A-values` (lemma) at paper/p2q-jumps-v1.4.tex:107
- title: Values of \(\ph\) and \(\sig\)
- paper statement: [Values of \(\ph\) and \(\sig\)] For distinct primes \(p,q\), pairwise distinct primes \(r,s,t\), and distinct primes \(r,s\) respectively, \begin{align*} \ph(p^2q)&=p(p-1)(q-1), & \sig(p^2q)&=(p^2+p+1)(q+1);\\ \ph(r^2st)&=r(r-1)(s-1)(t-1), & \sig(r^2st)&=(r^2+r+1)(s+1)(t+1);\\ \ph(r^3s)&=r^2(r-1)(s-1), & \sig(r^3s)&=(r^3+r^2+r+1)(s+1). \end{align*} In Lean these are three lemmas.
- Lean `P2qJumps.totient_sigma_p2q`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.totient_sigma_r2st`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.totient_sigma_r3s`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: three lemmas, same hypotheses (distinct primes), integer identities

### `lem:A-jumps` (lemma) at paper/p2q-jumps-v1.4.tex:122
- title: The jumps as integer identities
- paper statement: [The jumps as integer identities] Under~\eqref{eq:jumps}, \begin{equation} \ph(N)=p(p-1)(q-1)+12,\qquad \sig(N)=(p^2+p+1)(q+1)+12. \end{equation}
- Lean `P2qJumps.jumps_p2q_int`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `lem:A-p5` (lemma) at paper/p2q-jumps-v1.4.tex:135
- title: \(p\ge 5\) and \(p\nmid N\)
- paper statement: [\(p\ge 5\) and \(p\nmid N\)] If \(N=p^2q+12\) is divisible neither by \(2\) nor by \(3\), then \(p\ge 5\) and \(p\nmid N\).
- Lean `P2qJumps.p_ge_five_of_dvd`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: p prime from the Part A setting

### `lem:A-totdiv` (lemma) at paper/p2q-jumps-v1.4.tex:154
- paper statement: If a prime \(r\) divides \(m\), then \(\ph(m)+m/r\le m\).
- Lean `P2qJumps.totient_add_div_le`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: m/r is natural division in both

### `lem:A-compA` (lemma) at paper/p2q-jumps-v1.4.tex:163
- paper statement: Let \(m>1\) be composite with \(m\le\ph(m)+d\), and let \(r\) be the least prime factor of \(m\). Then \(r^2\le m\) and \(m<r(d+1)\).
- Lean `P2qJumps.composite_small_A`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: least prime factor = Nat.minFac

### `prop:A-preamble` (proposition) at paper/p2q-jumps-v1.4.tex:172
- paper statement: If~\eqref{eq:jumps} holds, then \(p\ge 5\), \(q\ge 5\), \(N\) is odd, \(N\) is not a square, and \(\gcd(N,6pq)=1\).
- Lean `P2qJumps.preamble`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `prop:A-notprime` (proposition) at paper/p2q-jumps-v1.4.tex:198
- title: \(N\) is not prime
- paper statement: [\(N\) is not prime] \(N\) is not prime.
- Lean `P2qJumps.N_not_prime`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `prop:A-rs` (proposition) at paper/p2q-jumps-v1.4.tex:211
- title: \(N\) is not a product of two distinct primes
- paper statement: [\(N\) is not a product of two distinct primes] \(N\ne rs\) for distinct primes \(r,s\).
- Lean `P2qJumps.N_ne_rs`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `prop:A-rst` (proposition) at paper/p2q-jumps-v1.4.tex:231
- title: Theorem~28
- paper statement: [Theorem~28] \(N\ne rst\) for pairwise distinct primes \(r,s,t\) (no lower bound on \(r,s,t\) is assumed).
- Lean `P2qJumps.theorem28_discriminant`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.theorem28_holds`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: theorem28_discriminant states N != rst with no lower bound on r,s,t

### `prop:A-r2st-red` (proposition) at paper/p2q-jumps-v1.4.tex:284
- paper statement: Under the above hypotheses, \(r=p+4\) and \[ (p+4)^2(p+12)^2(s-t)^2=2F(p), \] where \[ F(p)=p^8+20p^7+158p^6+685p^5+2064p^4+4836p^3+7976p^2+5760p-2808 . \]
- Lean `P2qJumps.r2st_reduction`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: F(p) displayed = def F8 (R2ST.lean:48) term by term; F8 itself is a definition and is not listed as a proof

### `prop:A-r2st-bound` (proposition) at paper/p2q-jumps-v1.4.tex:360
- paper statement: Under the above hypotheses, \(r=p+4\) and \(p>10^4\).
- Lean `P2qJumps.r2st_bound`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `thm:A-r2st-empty` (theorem) at paper/p2q-jumps-v1.4.tex:372
- title: \(r^2st\) is impossible
- paper statement: [\(r^2st\) is impossible] \(N\ne r^2st\) for pairwise distinct primes \(r,s,t\ge 5\).
- Lean `P2qJumps.r2st_empty`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `prop:A-r3s-red` (proposition) at paper/p2q-jumps-v1.4.tex:404
- title: Reduction
- paper statement: [Reduction] If \(N=r^3s\) with distinct primes \(r,s\ge 5\), then \(p<r\) and \(r^2\mid L(p)\).
- Lean `P2qJumps.r3s_reduction`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: L(p) = Lpoly p = p^3-p^2-12

### `prop:A-r3s-bound` (proposition) at paper/p2q-jumps-v1.4.tex:444
- title: The bound \(p>10^4\)
- paper statement: [The bound \(p>10^4\)] If \(N=r^3s\) with distinct primes \(r,s\ge 5\), then \(p<r\), \(r^2\mid L(p)\) and \(p>10^4\).
- Lean `P2qJumps.r3s_bound`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `prop:A-pairs` (proposition) at paper/p2q-jumps-v1.4.tex:456
- paper statement: If \(p\ne q\) are primes with \(p^2q\le 10^4\), then~\eqref{eq:jumps} fails at \(n=p^2q\).
- Lean `P2qJumps.Cert.no_jumps_p2q_le_10000`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `lem:A-2M` (lemma) at paper/p2q-jumps-v1.4.tex:477
- paper statement: For every \(M\ge 1\), \(2M\le\sig(M)+\ph(M)\).
- Lean `P2qJumps.two_mul_le_sigma_add_totient`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: M>=1 vs M != 0 over N

### `lem:A-pair` (lemma) at paper/p2q-jumps-v1.4.tex:486
- title: Pair inequality
- paper statement: [Pair inequality] If \(a\ne b\) are primes dividing \(N\ge 1\), then \(2N\le\delta(N)\,ab\).
- Lean `P2qJumps.delta_pair`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: delta(N) = sigma(N)+phi(N)-2N (paper line 474)

### `lem:A-four` (lemma) at paper/p2q-jumps-v1.4.tex:499
- paper statement: If \(N\ge 1\) has four pairwise distinct prime factors \(a,b,c,d\), then \(\delta(N)^2\ge 4N\).
- Lean `P2qJumps.four_primes_delta_sq`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `thm:A-r3s-empty` (theorem) at paper/p2q-jumps-v1.4.tex:532
- paper statement: Assume~\eqref{eq:jumps}. Then \(N\) is not of the form \(r^3s\) with distinct primes \(r,s\).
- Lean `P2qJumps.r3s_empty`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `prop:A-primepower` (proposition) at paper/p2q-jumps-v1.4.tex:567
- paper statement: Assume~\eqref{eq:jumps}. Then \(N\ne r^k\) for every prime \(r\) and \(k\ge 1\).
- Lean `P2qJumps.N_ne_prime_pow`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `thm:A-ras` (theorem) at paper/p2q-jumps-v1.4.tex:576
- title: Theorem~A
- paper statement: [Theorem~A] Assume~\eqref{eq:jumps}. Then \(N\ne r^as\) for all distinct primes \(r,s\) and all \(a\ge 2\). (Since \(r^as=s\,r^a\), this also excludes \(rs^a\).)
- Lean `P2qJumps.N_ne_ras`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `thm:A-r3st-empty` (theorem) at paper/p2q-jumps-v1.4.tex:609
- paper statement: Assume~\eqref{eq:jumps}. Then \(N\) is not of the form \(r^3st\) with pairwise distinct primes \(r,s,t\). There is no bound on \(p\).
- Lean `P2qJumps.r3st_empty`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `lem:A-omega2` (lemma) at paper/p2q-jumps-v1.4.tex:694
- title: \(\omega(N)\ge 2\)
- paper statement: [\(\omega(N)\ge 2\)] Assume~\eqref{eq:jumps}. Then \(N\) has at least two distinct prime factors.
- Lean `P2qJumps.two_le_omega`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: omega(N) = card of primeFactors

### `thm:A-B` (theorem) at paper/p2q-jumps-v1.4.tex:730
- title: Theorem~B
- paper statement: [Theorem~B] Assume~\eqref{eq:jumps}. Then \(N\) is not powerful with \(\omega(N)\ge 2\). Together with Lemma~\ref{lem:A-omega2}: \(N\) is not powerful.
- Lean `P2qJumps.theoremB`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.N_not_powerful`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: powerful = every prime factor squared divides N

### `thm:A-E` (theorem) at paper/p2q-jumps-v1.4.tex:746
- title: Theorem~E
- paper statement: [Theorem~E] Assume~\eqref{eq:jumps} and write \(\delta=q+2p+1\). Let \(r,r_1,r_2,t\) and \(a,b,c\) denote primes. \begin{enumerate} \item[\textup{(i)}] \(r^4\nmid N\). \item[\textup{(ii)}] If \(r_1\ne r_2\), \(r_1^2,r_2^2\mid N\), and \(t\mid N\) with \(t\ne r_1,r_2\), then \(q>5p^2-4p-3\). \item[\textup{(iii)}] There are no pairwise distinct \(a,b,c\) with \(a^2,b^2,c^2\mid N\). \item[\textup{(iv)}] Under the hypotheses of \textup{(ii)}: \(r_1^3\nmid N\) (and likewise \(r_2^3\nmid N\)); \(r_1r_2\mid L(p)\); \(N\le r_i^2\delta\); and \(N/\delta>\sqrt{L(p)}\). \item[\textup{(v)}] If \(r^3\mid N\), then \(r^2\mid L(p)\). \end{enumerate}
- Lean `P2qJumps.theoremE_i`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.theoremE_ii`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.theoremE_iii`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.theoremE_iv`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.theoremE_iv_dvd`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.theoremE_iv_size`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.theoremE_iv_sqrt`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.theoremE_v`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: (i)-(v) clause by clause; the N/delta > sqrt(L(p)) clause of (iv) is theoremE_iv_sqrt under q > 5p^2-4p-3, which (ii) supplies under the hypotheses of (ii)

### `thm:A-D` (theorem) at paper/p2q-jumps-v1.4.tex:781
- title: Theorem~D
- paper statement: [Theorem~D] Assume~\eqref{eq:jumps}, \(N\) squarefree and \(k=\omega(N)\ge 4\). Then \(q\ge p^2(k^2-k-1)^2\ge 121p^2\) and \(k\ge p\). In particular \(k=4\) is impossible.
- Lean `P2qJumps.theoremD`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.theoremD_four`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `cor:A-F1` (corollary) at paper/p2q-jumps-v1.4.tex:793
- title: Corollary~F1
- paper statement: [Corollary~F1] Assume~\eqref{eq:jumps}, \(N\) squarefree and \(\omega(N)\ge 4\). Then \(p=7\) and \(7\le\omega(N)\le 9\).
- Lean `P2qJumps.corollaryF1`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `cor:A-omega4-five` (corollary) at paper/p2q-jumps-v1.4.tex:803
- paper statement: Assume~\eqref{eq:jumps} and \(\omega(N)\ge 4\). Then \(5\nmid N\).
- Lean `P2qJumps.omega4_five_not_dvd`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `lem:A-equiv` (lemma) at paper/p2q-jumps-v1.4.tex:816
- title: Lemma~\ref{lem:equiv}
- paper statement: [Lemma~\ref{lem:equiv}] For every \(n\), \(\ph(n+12)=\ph(n)+12\) and \(\sig(n+12)=\sig(n)+12\) hold if and only if \(A(n+12)=A(n)\) and \(B(n+12)=B(n)\); they imply \(\delta(n+12)=\delta(n)\).
- Lean `P2qJumps.jumps_iff_AB`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.jumps_delta`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: A(m)=m-phi(m), B(m)=sigma(m)-m

### `lem:A-AB` (lemma) at paper/p2q-jumps-v1.4.tex:826
- title: Lemma~\ref{lem:AB}
- paper statement: [Lemma~\ref{lem:AB}] If \(p\ne q\) are primes, then \(A(p^2q)=p(p+q-1)\), \(B(p^2q)=(1+p)(1+q)+p^2\) and \(\delta(p^2q)=2p+q+1\).
- Lean `P2qJumps.AB_p2q`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `lem:A-cot` (lemma) at paper/p2q-jumps-v1.4.tex:834
- title: Lemmas~\ref{lem:Ark} and~\ref{lem:cot}
- paper statement: [Lemmas~\ref{lem:Ark} and~\ref{lem:cot}] \textup{(a)} For a prime \(r\) and \(k\ge 1\), \(A(r^k)=r^{k-1}\). \textup{(b)} For \(m>1\) with least prime factor \(r\), \(m/r\le A(m)\) (natural division). \textup{(c)} Equality \(A(m)=m/r\) holds if and only if \(m\) is a power of \(r\).
- Lean `P2qJumps.A_prime_pow`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.cot_le`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.cot_eq_iff`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `lem:A-radscale` (lemma) at paper/p2q-jumps-v1.4.tex:846
- title: Lemma~\ref{lem:L2}, radical scaling
- paper statement: [Lemma~\ref{lem:L2}, radical scaling] For every \(N\), with \(U=\mathrm{rad}(N)\) and \(K=N/U\): \(\ph(N)=K\ph(U)\) and \(A(N)=K\,A(U)\).
- Lean `P2qJumps.radical_scaling`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: A(N)=N-phi(N); K=N/rad N

### `lem:A-G` (lemma) at paper/p2q-jumps-v1.4.tex:854
- title: Lemma~\ref{lem:G}, remaining clauses
- paper statement: [Lemma~\ref{lem:G}, remaining clauses] Under~\eqref{eq:jumps}, \(\gcd(\ph(N),\sig(N))\mid 2T(p)\); and \(T(p)>0\) for every integer \(p\ge 5\).
- Lean `P2qJumps.lemmaG_gcd`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.T_pos`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: T(p)=p^4-13p-6

### `lem:A-twist` (lemma) at paper/p2q-jumps-v1.4.tex:862
- title: Link with the shape \(r^3s\), Section~\ref{sec:v14-curve}
- paper statement: [Link with the shape \(r^3s\), Section~\ref{sec:v14-curve}] Let \(p,r,s,k\) be integers. \textup{(a)} If \(L(p)=kr^2\), then \((X,Y)=(kp,k^2r)\) satisfies \(Y^2=X^3-kX^2-12k^3\). \textup{(b)} If \(p\ge 5\) and \(r^2\mid L(p)\), then \(r^2<p^3\). \textup{(c)} If \(p\) is prime, \(p\nmid r\), \(p\mid r^2(r+s-1)\) and \(p\mid r^3s-12\), then \(p\mid r+s-1\) and \(p\mid r^4-r^3+12\).
- Lean `P2qJumps.twist_point`: `` axioms ['propext', 'Quot.sound']
- Lean `P2qJumps.twist_r_bound`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.twist_link_congr`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `prop:A-rad` (proposition) at paper/p2q-jumps-v1.4.tex:870
- title: Soundness note on \(\mathrm{rad}\)
- paper statement: [Soundness note on \(\mathrm{rad}\)] \textup{(a)} For \(N\ne 0\), \(N/\gcd(N,\ph(N))\) divides \(\mathrm{rad}(N)\). \textup{(b)} The identity \(\mathrm{rad}(N)=N/\gcd(N,\ph(N))\) is false: \(\mathrm{rad}(12)=6\) and \(12/\gcd(12,\ph(12))=3\).
- Lean `P2qJumps.div_gcd_totient_dvd_rad`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.rad_ne_div_gcd_totient`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `thm:A-E-shapes` (theorem) at paper/p2q-jumps-v1.4.tex:918
- title: final sentence of Theorem~\ref{thm:E}
- paper statement: [final sentence of Theorem~\ref{thm:E}] Assume~\eqref{eq:jumps} and that \(r^2\mid N\) for some prime \(r\). Then one of the following holds. \begin{enumerate} \item[\textup{(a)}] \(N=r^2V\) or \(N=r^3V\) for a prime \(r\) and a squarefree \(V\) with \(\gcd(r,V)=1\) and \(\omega(V)\ge 2\). \item[\textup{(b)}] \(N=r_1^2r_2^2V\) for distinct primes \(r_1,r_2\) and a squarefree \(V\) with \(\gcd(r_1r_2,V)=1\) and \(\omega(V)\ge 1\); moreover \(r_1r_2\mid L(p)\) and \(q>5p^2-4p-3\). \end{enumerate}
- Lean `P2qJumps.theoremE_shapes`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `prop:A-p7` (proposition) at paper/p2q-jumps-v1.4.tex:1069
- title: the \(p=7\) equations
- paper statement: [the \(p=7\) equations] Let \(p=7\) and let \(q\ne 7\) be prime with~\eqref{eq:jumps}. Then, in \(\mathbb Z\), \[ \ph(N)=42q-30,\quad \sig(N)=57q+69,\quad 7\ph(N)=6N-282,\quad 49\sig(N)=57N+2697, \] \[ 42\sig(N)-57\ph(N)=4608,\qquad 343\,\ph(N)\sig(N)=342N^2+108N-760554 . \] Moreover \(N\equiv 5\) and \(\ph(N)\equiv 5\pmod 7\); in particular \(7\nmid\ph(N)\).
- Lean `P2qJumps.p7_identities`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.p7_mod`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `prop:A-p7-ge11` (proposition) at paper/p2q-jumps-v1.4.tex:1093
- title: no prime \(\le 7\) when \(\omega(N)\ge 4\)
- paper statement: [no prime \(\le 7\) when \(\omega(N)\ge 4\)] With \(p=7\) and four pairwise distinct primes dividing \(N\), every prime factor of \(N\) is at least \(11\); in particular \(5\nmid N\).
- Lean `P2qJumps.p7_omega4_ge11`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `thm:A-p7-descent` (theorem) at paper/p2q-jumps-v1.4.tex:1126
- title: \(p=7\) descent; \path{p7_squarefree_empty}, \path{p7_squarefree_7_8_9}
- paper statement: [\(p=7\) descent; \path{p7_squarefree_empty}, \path{p7_squarefree_7_8_9}] Let \(q\neq 7\) be prime, \(n=49q\), \(N=n+12\), and suppose~\eqref{eq:jumps}. If \(N\) is squarefree, then \(\omega(N)\notin\{7,8,9\}\).
- Lean `P2qJumps.p7_squarefree_empty`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.p7_squarefree_7_8_9`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: p7_squarefree_empty: 7 <= omega <= 9 -> False

### `thm:A-H1` (theorem) at paper/p2q-jumps-v1.4.tex:1135
- title: H1; \path{H1_holds}, \path{no_squarefree}
- paper statement: [H1; \path{H1_holds}, \path{no_squarefree}] Under~\eqref{eq:jumps} with \(n=p^2q\), \(N=n+12\) is not squarefree. In particular H1 holds, and Conjecture~\ref{conj:vanish} holds if and only if H2 and H3 hold (\path{conjecture_iff_H2_H3}).
- Lean `P2qJumps.no_squarefree`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.H1_holds`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.conjecture_iff_H2_H3`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `thm:B` (theorem) at paper/p2q-jumps-v1.4.tex:2079
- title: Theorem~B: powerful \(N\) impossible; kernel-checked in v1.4, Theorem~\ref{thm:A-B}
- paper statement: [Theorem~B: powerful \(N\) impossible; kernel-checked in v1.4, Theorem~\ref{thm:A-B}] If~\eqref{eq:jumps} holds with \(n=p^2q\), then \(N\) is not powerful with \(\omega(N)\ge 2\).
- Lean `P2qJumps.theoremB`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `thm:A` (theorem) at paper/p2q-jumps-v1.4.tex:2096
- title: Theorem~A: mixed powers \(r^as\); kernel-checked in v1.4, Theorem~\ref{thm:A-ras}
- paper statement: [Theorem~A: mixed powers \(r^as\); kernel-checked in v1.4, Theorem~\ref{thm:A-ras}] If~\eqref{eq:jumps} holds with \(n=p^2q\), then \(N\) is not of the form \(r^as\) with distinct primes \(r,s\) and an integer \(a\ge 2\). (The form \(rs^a\) is identical after renaming.)
- Lean `P2qJumps.N_ne_ras`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

### `thm:D` (theorem) at paper/p2q-jumps-v1.4.tex:2154
- title: Theorem~D
- paper statement: [Theorem~D] Suppose~\eqref{eq:jumps} holds and \(N\) is squarefree with \(k=\omega(N)\ge 4\). Then \[ q\ge p^2(k^2-k-1)^2\ge 121p^2,\qquad k\ge p. \] In particular the case \(k=4\) is impossible.
- Lean `P2qJumps.theoremD`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.theoremD_four`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']

## EXTERNAL (4)

### `nolabel:remark:7751db65c983` (remark) at paper/p2q-jumps-v1.4.tex:1001
- paper statement: These are the structural clauses of Proposition~\ref{prop:C}. Propositions~\ref{prop:A-C-j1}--\ref{prop:A-C-j2} hold for every divisor \(M\) of \(N\) with the stated cofactor, in particular for \(M=K\cdot\mathrm{rad}(K)\); for each eligible \(K\) the candidate is therefore unique. The enumeration over \(5\le p<10^6\) is an external computation and is not kernel-checked \DATAHTWO.
- status wording at paper/p2q-jumps-v1.4.tex:1001: ['\\DATAHTWO']: "These are the structural clauses of <REF> . <REF> -- <REF> hold for every divisor \(M\) of \(N\) with the stated cofactor, in particular for \(M=K\cdot\mathrm{rad}(K)\); for each eligible \(K\) the candidate is therefore unique. The enumeration over \(5\le p<10^6\) is an external computation and is "
- claim-map note: remark on external/cited material, labeled as such

### `prop:C` (proposition) at paper/p2q-jumps-v1.4.tex:2129
- title: Finite per \(p\) for \(1\le j\le 2\); Proposition~C
- paper statement: [Finite per \(p\) for \(1\le j\le 2\); Proposition~C] Fix a prime \(p\ge 5\). Under~\eqref{eq:jumps} with \(R\neq\emptyset\) and \(j\in\{1,2\}\), every candidate arises from a divisor \(K\mid L(p)\) with \(K>1\) and \(\gcd(K,6p)=1\). The resulting linear systems in the remaining unknowns are nonsingular whenever they admit an integer solution, and for each such \(K\) there are only finitely many rational candidates. An independently reproduced exact enumeration finds no solution for any prime \(5\le p<10^6\). \DATAHTWO
- Lean `P2qJumps.propC_K`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.propC_j1`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.propC_j2`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- status wording at paper/p2q-jumps-v1.4.tex:2129: ['\\DATAHTWO']: "[Finite per \(p\) for \(1\le j\le 2\); Proposition~C] Fix a prime \(p\ge 5\). Under~ <REF> with \(R\neq\emptyset\) and \(j\in\{1,2\}\), every candidate arises from a divisor \(K\mid L(p)\) with \(K>1\) and \(\gcd(K,6p)=1\). The resulting linear systems in the remaining unknowns are nonsingular whene"
- status wording at paper/p2q-jumps-v1.4.tex:1035: ['\\DATAHTWO']: "the computational status of H2 for \(p<10^6\) ( <SELF> ) is an external computation \DATAHTWO"
- status wording at paper/p2q-jumps-v1.4.tex:1184: ['not kernel-checked']: "Not kernel-checked are in particular: the enumeration of <SELF> (its structural clauses are <REF> ) and the other external computations"
- status wording at paper/p2q-jumps-v1.4.tex:2261: ['\\DATAHTWO']: "By <SELF> , the case \(p<10^6\) is empty under the stated computational trust \DATAHTWO"
- status wording at paper/p2q-jumps-v1.4.tex:2461: ['not kernel-checked']: "item Not kernel-checked: the enumeration of <SELF> and the other external computations of <REF> , and the LMFDB/PARI data of <REF>"
- claim-map note: mixed: structural clauses are Lean propC_K/propC_j1/propC_j2; the enumeration p < 10^6 is external data (\DATAHTWO) until kernel-proved, so the claim as a whole is EXTERNAL

### `nolabel:remark:3e0585123507` (remark) at paper/p2q-jumps-v1.4.tex:2344
- title: Root numbers of the twists; not kernel-checked
- paper statement: [Root numbers of the twists; not kernel-checked] For a fundamental discriminant \(D\ne 1\) with \(\gcd(D,3936)=1\), \[ w\bigl(E^{(D)}\bigr)=-\Bigl(\frac{-3936}{|D|}\Bigr) \] (Kronecker symbol); this is the standard twisting rule \(w(E^{(D)})=w(E)\,\chi_D(-N_E)\) with \(w(E)=-1\). PARI \texttt{ellrootno} confirms it for all \(1481\) such \(D\) with \(1<|D|\le 5000\), with no exception. The hypothesis \(\gcd(D,3936)=1\) is needed: for the \(1559\) fundamental \(D\) in that range sharing a factor with \(3936\) the right-hand side is \(0\) and the formula does not apply.
- status wording at paper/p2q-jumps-v1.4.tex:2344: ['not kernel-checked']: "[Root numbers of the twists; not kernel-checked] For a fundamental discriminant \(D\ne 1\) with \(\gcd(D,3936)=1\), \[ w\bigl(E^{(D)}\bigr)=-\Bigl(\frac{-3936}{|D|}\Bigr) \] (Kronecker symbol); this is the standard twisting rule \(w(E^{(D)})=w(E)\,\chi_D(-N_E)\) with \(w(E)=-1\). PARI <ID> confirms "
- claim-map note: remark on external/cited material, labeled as such

### `nolabel:remark:b1ce1bab6622` (remark) at paper/p2q-jumps-v1.4.tex:2352
- title: Finiteness per fibre; cited, not formalized
- paper statement: [Finiteness per fibre; cited, not formalized] For each fixed \(k\), Siegel's theorem makes the integral points of \(E^{(k)}\) finite, and lower bounds for linear forms in elliptic logarithms (David~\cite{David1995}) make them effectively computable. This gives no bound uniform in \(k\), so it does not close the \(r^3s\) residual. Neither statement is formalized in Lean. Uniform analytic bounds (David's theorem across all twist fibres, effective genus-one bounds) remain open.
- status wording at paper/p2q-jumps-v1.4.tex:2352: ['not formalized', 'remain open']: "[Finiteness per fibre; cited, not formalized] For each fixed \(k\), Siegel's theorem makes the integral points of \(E^{(k)}\) finite, and lower bounds for linear forms in elliptic logarithms (David~\cite{David1995}) make them effectively computable. This gives no bound uniform in \(k\), so it does n"
- claim-map note: remark on external/cited material, labeled as such

## NOT-CLAIMED (16)

### `nolabel:remark:fae4e01a37ca` (remark) at paper/p2q-jumps-v1.4.tex:397
- paper statement: Step~3 uses from Step~2 only that \(p+4>92\). The certificate of Step~2 is how the Lean proof excludes the primes \(5\le p\le 88\); no other argument for those primes is used.
- claim-map note: remark: commentary

### `nolabel:remark:21eb4d25d6a0` (remark) at paper/p2q-jumps-v1.4.tex:525
- paper statement: Theorem~\ref{thm:A-omega4} proves the two \(\omega(N)\ge 4\) constraints of the author's theorem block (``every prime factor of \(N\) exceeds \(p\)'' and ``\(q>p-6\)''; indeed \(q\ge 3p^2\)). It also implies that, when \(\omega(N)\ge 4\), no prime factor of \(N\) equals~\(5\) unless \(p<5\), which Proposition~\ref{prop:A-preamble} excludes; for \(p=7\) this removes the prime~\(5\) from the squarefree descent of Appendix~\ref{app:p7}.
- claim-map note: remark: commentary

### `nolabel:remark:689fe0dce7fd` (remark) at paper/p2q-jumps-v1.4.tex:560
- paper statement: Theorem~\ref{thm:A-r3s-empty} makes Theorem~\ref{thm:L}(iv) vacuous: its hypothesis \(N=r^3s\) never holds. It also replaces the \(a=3\) case of the written proof of Theorem~\ref{thm:A}, whose polynomial in \(p\) has degree~\(5\), not~\(6\) as stated in v1.3. The twist link between \(r^3s\) and the curves \(E^{(k)}\) (Part~\ref{part:B}) is no longer needed for any exclusion.
- claim-map note: remark: commentary

### `nolabel:remark:a96a1e132fe2` (remark) at paper/p2q-jumps-v1.4.tex:602
- paper statement: The written v1.3 proof of Theorem~\ref{thm:A} (Part~\ref{part:B}) is correct in its parametrization and its \(r<p\), \(a\ge 3\) case (the identity \(mQ_1=P_1\) and \(Q_1-P_1=(p+1)(R-r)\) were checked symbolically). Two changes follow the Lean proof: the case \(r>p\), \(a\ge 4\) uses the size bound \(R\mid L(p)<p^3<r^3\le R\) instead of the sign argument on \(E=k^2-k-r+1\); and the case \(a=3\), \(r>p\) uses Theorem~\ref{thm:A-r3s-empty} (degree~\(5\), not~\(6\)). The case \(a=2\) follows the parametrization rather than the \(U,V\) elimination of Proposition~\ref{prop:r2s}; both are correct.
- claim-map note: remark: commentary

### `nolabel:remark:80bda696b840` (remark) at paper/p2q-jumps-v1.4.tex:939
- paper statement: Theorem~\ref{thm:A-E-shapes} is the final sentence of Theorem~\ref{thm:E}. In (a), \(\omega(V)\) is the number \(j\) of primes of exponent~\(1\). In (b) it also proves that \(V\) is squarefree, prime to \(r_1r_2\), and has \(\omega(V)\ge 1\); the paper sentence leaves these implicit.
- claim-map note: remark: commentary

### `nolabel:remark:a3dc429c4d0d` (remark) at paper/p2q-jumps-v1.4.tex:1034
- paper statement: Theorem~\ref{thm:A-implies} proves the equivalence only. H1 is proved in Lean in Section~\ref{sec:A-H1} (Theorem~\ref{thm:A-H1}, kernel-checked); H2 and H3 are not proved, and Conjecture~\ref{conj:vanish} remains open. H1 is the statement of Theorem~\ref{thm:H1-comp}; the computational status of H2 for \(p<10^6\) (Proposition~\ref{prop:C}) is an external computation \DATAHTWO.
- Lean `P2qJumps.prop_implies_corrected`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.H1_holds`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- status wording at paper/p2q-jumps-v1.4.tex:1034: ['\\DATAHTWO']: "<REF> proves the equivalence only. H1 is proved in Lean in <REF> ( <REF> , kernel-checked); H2 and H3 are not proved, and <REF> remains open. H1 is the statement of <REF> ; the computational status of H2 for \(p<10^6\) ( <REF> ) is an external computation \DATAHTWO."
- claim-map note: remark asserting kernel-checked status; cites these declarations

### `nolabel:remark:6c8769e94602` (remark) at paper/p2q-jumps-v1.4.tex:1062
- title: why \(r^2s^2t\) is not closed by size alone
- paper statement: [why \(r^2s^2t\) is not closed by size alone] For \(N=r^2s^2t\), Lemma~\ref{lem:A-K} gives \(K=rs\mid L(p)\), and Propositions~\ref{prop:A-C-K}--\ref{prop:A-C-j1} (with \(M=r^2s^2\)) determine \((t,q)\) uniquely from \((p,r,s)\). The size inequalities used for \(r^2st\) and \(\omega(N)\ge 4\) do not exclude it: for \(p=101\), \(1009\), \(10007\) and \(r\approx 1.5p\), the real equations for \(N\), \(\ph(N)\), \(\sig(N)\) have real solutions with \(p<r<s\), \(rs<p^3\), \(t>1\), \(q>1\) (\path{NOTES/r2s2t_status.md}). Excluding the shape needs an arithmetic argument (integrality of \(t\) and \(q\), or a square discriminant), which is not available.
- claim-map note: remark: commentary

### `conj:vanish` (conjecture) at paper/p2q-jumps-v1.4.tex:1255
- title: Vanishing of \(p^2q\)
- paper statement: [Vanishing of \(p^2q\)] There do not exist distinct primes \(p\) and \(q\) such that \(n=p^2q\) satisfies both jump identities~\eqref{eq:jumps} simultaneously, where \(\ph\) denotes Euler's totient and \(\sig\) denotes the ordinary sum of positive divisors. Equivalently: both a \(\ph\)-jump of length~12 and a \(\sig\)-jump of length~12 are impossible for \(n=p^2q\) with distinct primes \(p,q\).
- status wording at paper/p2q-jumps-v1.4.tex:51: ['remains open']: "<SELF> remains open"
- status wording at paper/p2q-jumps-v1.4.tex:77: ['remains open']: "<REF> does not prove <SELF> , which remains open"
- status wording at paper/p2q-jumps-v1.4.tex:1035: ['not proved', 'remains open']: "H2 and H3 are not proved, and <SELF> remains open"
- status wording at paper/p2q-jumps-v1.4.tex:1144: ['remains open']: "<SELF> remains open"
- status wording at paper/p2q-jumps-v1.4.tex:2281: ['remains open']: "Therefore <SELF> remains open"
- status wording at paper/p2q-jumps-v1.4.tex:2457: ['is open']: "item <SELF> (no \(n=p^2q\) satisfies both jumps) is open"
- claim-map note: the open problem; Lean has only the definition Conjecture3 and Conjecture3 <-> H2 and H3

### `nolabel:remark:5957e57bde4f` (remark) at paper/p2q-jumps-v1.4.tex:1794
- title: Superseded in v1.4
- paper statement: [Superseded in v1.4] Theorem~\ref{thm:L}(iii) shows that no solution lies on the line \(r=p+4\) for any \(p\) (Section~\ref{sec:A-iii-3}); Theorem~\ref{thm:rp4} is kept as the v1.3 record.
- claim-map note: remark: commentary

### `hyp:R2` (hypothesis) at paper/p2q-jumps-v1.4.tex:1980
- title: R2
- paper statement: [R2] \itshape (Historical v0.10 label.) The rational number \(m\) defined by~\eqref{eq:r3s} is never a positive integer, for distinct primes \(p,r\ge 5\) in the strip \(p<r<p^{3/2}\) with \(r^2\mid(p^3-p^2-12)\).
- claim-map note: historical v0.10 hypothesis, stated as such

### `hyp:R3` (hypothesis) at paper/p2q-jumps-v1.4.tex:1985
- title: R3
- paper statement: [R3] \itshape (Historical v0.10 label.) There is no solution of~\eqref{eq:jumps} with \(n=p^2q\) and \(N\) of the form \(r^2st\) for which~\eqref{eq:r2st-sig}--\eqref{eq:r2st-q} produce two further new primes \(s,t\); and there is no solution with \(\omega(N)\ge 4\).
- claim-map note: historical v0.10 hypothesis, stated as such

### `prop:implies` (remark) at paper/p2q-jumps-v1.4.tex:1990
- title: Original Proposition~32 is superseded
- paper statement: [Original Proposition~32 is superseded] The v0.10 statement ``Theorem~\ref{thm:R1} and Hypotheses~\ref{hyp:R2}--\ref{hyp:R3} together imply Conjecture~\ref{conj:vanish}'' is \textbf{not a valid current theorem}. Its proof assumed an incomplete list of residual shapes and therefore does not justify the implication. The historical wording is quoted in Appendix~\ref{app:hist-prop32} and must not be cited as a live result. The corrected equivalence is Proposition~\ref{prop:implies-corrected}; after Theorem~\ref{thm:H1-comp}, only H2 and H3 remain open.
- claim-map note: remark: the superseded v0.10 Proposition 32, explicitly not a current theorem

### `nolabel:remark:7331b32b1cd9` (remark) at paper/p2q-jumps-v1.4.tex:2075
- paper statement: Lemma~\ref{lem:K} is kernel-checked in this repository (Lemma~\ref{lem:A-K}: \texttt{P2qExclusions.setupK}, \texttt{P2qJumps.lemmaK}, with \(L(p)\) integer-valued and the exact natural quotient \(N/\mathrm{rad}(N)\)). The clause ``every repeated prime \(r\) of \(N\) satisfies \(r^{e_r-1}\mid L(p)\)'' is \texttt{P2qJumps.pow\_dvd\_K} combined with \(K\mid L(p)\).
- Lean `P2qExclusions.setupK`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.lemmaK`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.pow_dvd_K`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: remark asserting kernel-checked status; cites these declarations

### `nolabel:remark:3af6a2935a61` (remark) at paper/p2q-jumps-v1.4.tex:2125
- paper statement: Theorem~\ref{thm:A} uses both jumps. It does not prove the \(\ph\)-only Hypothesis~\ref{hyp:R2}; that hypothesis remains open as a \(\ph\)-only statement. For the reduction of Conjecture~\ref{conj:vanish} under both jumps, Theorem~\ref{thm:A} replaces the use of Hypothesis~\ref{hyp:R2} on the shape \(r^as\).
- claim-map note: remark: commentary

### `nolabel:remark:11c22fe20895` (remark) at paper/p2q-jumps-v1.4.tex:2175
- paper statement: Theorem~\ref{thm:D} is kernel-checked in this repository as Theorem~\ref{thm:A-D} (\texttt{P2qJumps.theoremD}, with an elementary finite-product replacement for the fractional-power AM--GM step). Lemma~\ref{lem:Q} is kernel-checked as Lemma~\ref{lem:A-L1Q}(c) (\texttt{P2qJumps.lemmaQ\_formula}); its product formula is \texttt{P2qExtensions.sigma\_mul\_totient\_prod}.
- Lean `P2qJumps.theoremD`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.lemmaQ_formula`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qExtensions.sigma_mul_totient_prod`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: remark asserting kernel-checked status; cites these declarations

### `nolabel:remark:ef55cdf210a9` (remark) at paper/p2q-jumps-v1.4.tex:2247
- paper statement: Lemmas~\ref{lem:G},~\ref{lem:K} and Theorem~\ref{thm:F} are kernel-checked in this repository (\texttt{P2qStructural.lemmaG}, Lemma~\ref{lem:A-K}, \texttt{P2qStructural.theoremF}; F counts odd primes via \texttt{Nat.primeFactors}, and for odd \(N\) these counts agree with the paper). Corollary~\ref{cor:F1} is kernel-checked as Corollary~\ref{cor:A-F1} (\texttt{P2qJumps.corollaryF1}). It does not formalize the local \(q\)-congruence refinements.
- Lean `P2qStructural.lemmaG`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qStructural.theoremF`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- Lean `P2qJumps.corollaryF1`: `` axioms ['propext', 'Classical.choice', 'Quot.sound']
- claim-map note: remark asserting kernel-checked status; cites these declarations

## Scope

This check compares recorded paper-vs-Lean alignments, kernel status (sorryAx, non-standard axioms, def vs theorem) and status wording. Whether a Lean statement says what the English says is a human judgment, recorded in the claim map with pinned hashes of both sides; the tool detects any later change on either side and halts. It cannot recover unwritten intent.
