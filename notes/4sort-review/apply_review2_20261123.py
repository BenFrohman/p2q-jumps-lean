# Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Authors: Benjamin Stanley Frohman
"""One-off: record the second 2026-11-23 review (the 46 entries left UNJUDGED by the first pass) in
final-check/claim-map.json. Each judgment was made by reading the paper statement next to the Lean
signature (notes/unjudged-sigs.txt). Items marked PENDING15 are lean-narrower on main and become exact
only when the declarations of PR #15 are on main; they are re-judged after that merge."""
import json, sys
REV = "Grok Bot agent review (not the author), 2026-11-23 America/Chicago, second pass, paper on main 086a484 vs Lean source"
E, N = "exact", "lean-narrower"
P15 = "PENDING15: "
J = {
 "prop:A-C-K": (E, None, "f=phi(M), a=p(p-1), g=sigma(M), b=p^2+p+1"),
 "prop:A-C-j1": (E, ["P2qJumps.propC_j1"], "f=phi(M), a=p(p-1), g=sigma(M), b=p^2+p+1; determinant and unique rational solution clause by clause"),
 "prop:A-C-j2": (E, ["P2qJumps.propC_j2"], "Delta = M(ag+bf)-2p^2 fg with the same f,a,g,b; unknowns (q,S,Pi)"),
 "thm:A-implies": (E, ["P2qJumps.prop_implies_corrected", "P2qJumps.implies_corrected_of_H1"], ""),
 "thm:A-three": (E, None, "ThreeRegimes and R2S2TEmpty as defined in ThreeRegimes.lean; 'neither is proved' is a status sentence"),
 "thm:closed": (E, None, "items 1-6 and the closing sentence are conjuncts of theorem_closed"),
 "lem:AB": (E, None, ""), "lem:cot": (E, None, ""), "lem:Ark": (E, None, ""), "prop:23": (E, None, ""),
 "cor:gcd": (E, None, ""), "prop:square": (E, None, ""), "prop:primepower": (E, None, ""),
 "prop:rs": (E, None, ""), "prop:r2s": (E, None, ""),
 "lem:e123": (E, ["lem_e123", "P2qJumps.rst_false"], "shape rst does not occur (rst_false); the conclusion is stated in Lean (prop:A-vacuous)"),
 "lem:qform": (E, None, ""), "lem:C": (E, None, ""), "lem:Phi": (E, None, ""),
 "prop:balanced": (E, ["prop_balanced", "rst_balanced", "theorem_closed"], ""),
 "prop:pm2": (E, None, ""),
 "thm:r3sint": (E, ["r3s_statements", "P2qJumps.r3s_empty"], "Lean needs no integrality hypothesis; r3s does not occur (r3s_empty)"),
 "thm:four": (E, None, "squarefree omega=4 does not occur (four_false); the conclusions are stated in Lean"),
 "thm:rst-off": (E, None, ""), "thm:rst-far": (E, None, "Nfar is the paper polynomial term by term"),
 "thm:r2st-off": (E, None, ""), "thm:rp4": (E, None, ""), "thm:r3s-plarge": (E, None, ""), "thm:r3s-strip": (E, None, ""),
 "thm:R1": (E, ["theorem28_holds", "P2qJumps.rst_false"], "Theorem28 = no rst solution of the jumps"),
 "lem:L1": (E, None, ""), "lem:L2": (E, None, "phi(N)=K phi(U), A(N)=K A(U)"),
 "lem:G": (E, None, "T(p)=p^4-13p-6"),
 "cor:F1": (E, None, ""),
 "prop:implies-corrected": (E, None, "the 10^6 computation is labeled external (DATAHTWO)"),
 "lem:A-L1Q": (N, None, P15 + "(a) 'every term is >= 0' for every x is lemmaL1_terms_nonneg (PR #15)"),
 "prop:A-pure": (N, None, P15 + "(g) 'the squares modulo 16 are 0,1,4,9' (exact set) is sq_mod16_exact (PR #15)"),
 "prop:A-vacuous": (N, None, P15 + "the finite-candidates sentence of thm:rigid(a) and the offset sentence of thm:rigid(c) are not vacuous; rigid_finite_candidates, r2st_offset_sigma_neg (PR #15)"),
 "thm:rigid": (N, ["lem_qform_C_Phi", "r3s_statements", "r2st_statements", "P2qJumps.rst_false", "P2qJumps.r3s_empty", "P2qJumps.r2st_false"], P15 + "rigid_finite_candidates, r2st_offset_sigma_neg (PR #15)"),
 "lem:K": (N, None, P15 + "lemmaK_param (jumps only), p_not_dvd_K (PR #15)"),
 "lem:Q": (N, None, P15 + "Q(m)/m^2 = 1 - prod(1-r^(-e-1)) is lemmaQ_ratio (PR #15)"),
 "thm:E": (N, None, P15 + "theoremE_v_lt for r < p^(3/2) (PR #15); clause list as thm:A-E"),
 "thm:F": (N, None, P15 + "'equivalently o <= 1 + v2(T(p))' is theoremF_v2 (PR #15)"),
 "thm:main-p2q": (N, ["theorem_closed", "theorem28_holds", "P2qJumps.rst_false", "r2st_empty", "r3s_empty", "omega4_constraints", "r3st_empty", "omega4_or_r2s2t", "H1_holds"], P15 + "'hence N > p^4' is omega4_N_gt_p4 (PR #15); search ranges are labeled external (DATAOMEGAFOUR)"),
 "lem:equiv": (N, None, "HUMAN: Lean proves jumps <-> (A(N)=A(n) and B(N)=B(n)) and jumps -> delta(N)=delta(n). The paper's 'hence also [equivalent] to delta(N)=delta(n)' is false as an equivalence: n=63=3^2*7 has delta(75)=delta(63)=14 but A(75)=35 != A(63)=27 (also n=7^2*17). Rewording to 'imply' changes the stated claim; author decision"),
 "hyp:R1": (N, None, "HUMAN: '(Discharged by Theorem thm:R1)' needs that the data (p, rho, q from eq:qCD, the quadratic splitting) gives an rst solution of the jumps; that sufficiency is not in Lean, and V is not defined in the hypothesis's statement"),
}
sys.path.insert(0, "scripts")
m = json.load(open("final-check/claim-map.json"))
by = {c["id"]: c for c in m["claims"]}
missing = [k for k in J if k not in by]
assert not missing, missing
for k, (rel, lean, note) in J.items():
    c = by[k]
    assert c["relation"] == "unjudged", (k, c["relation"])
    c["relation"], c["note"], c["reviewed"] = rel, note, REV
    if lean is not None:
        c["lean"] = lean
if "thm:E" in J:
    by["thm:E"]["lean"] = sorted(set(by["thm:E"]["lean"]) | set(by["thm:A-E"]["lean"]))
json.dump(m, open("final-check/claim-map.json", "w"), indent=1, ensure_ascii=False)
open("final-check/claim-map.json", "a").write("\n")
print(len(J), "entries judged")
