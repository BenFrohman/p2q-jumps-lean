# PIP-2 progress (p2q 4-sort review, drift formalization) — Texas time (CST)

## Done
- PR #14 (4-sort gate) merged to main at 2026-11-23 18:20 CST (c60ad38) at head ad6df43, with its final-4sort job failing (46 unjudged at the time).
- PR #11 merged 18:22 CST -> main 84b3da0 (H2K h2_p_lt_1e6, propC_p_lt_1e6, Omega4Q, Hensel label).
- Review of the 46 unjudged entries: local commit 585e3ca (script apply_review2_20261123.py).
- PR #15 https://github.com/BenFrohman/p2q-jumps-lean/pull/15 head 494b024: 6 checks green on pre-conflict head
  (certify 45286325457/45286313585, kernel-cert 45286313362, header 45286325302/45286313528, truth-gate 45286325120). Conflicts with main in AxiomAudit.lean + PDF.
- Conflict commits on main (decision 19:06 CST: keep all three, merge main into #15):
  f5c39a1 (H2K AxiomAudit lines, kernel-certified), a3c80bd (PDF, Hensel kernel-checked label), b57b23d (PDF with PR #12 corrections).

## Decisions from Benjamin (19:06 CST)
- lem:equiv: state exactly jumps <-> (A,B equal), jumps -> delta equal; remark + Lean lemma for n=63 (delta(75)=delta(63)=14, A(75)=35 != A(63)=27).
- hyp:R1: define V and the rst solution from his paper; formalize the converse, or log counterexample/blocker; until proved, the paper says the discharge is open.

## Queue
1. backup branch backup/4sort-review-585e3ca (585e3ca + notes)
2. main drift: tex remark ~2313 H2 p<10^6 label swap (h2_p_lt_1e6, propC_p_lt_1e6; certify run 45296678282; kernel-cert 45296678332), plus stale omega4/Hensel labels; PDF; PR
3. merge origin/main into #15 (signed), AxiomAudit both sides, PDF, push
4. lem:equiv fix + lemma; hyp:R1; review PR; CI + 4-sort; merge only when all green
