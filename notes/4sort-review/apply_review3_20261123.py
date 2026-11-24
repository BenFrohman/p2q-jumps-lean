# Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Authors: Benjamin Stanley Frohman
"""One-off: third 2026-11-23 review pass on feat/4sort-drift-formalization (PR #15 with main 84b3da0
and PR #16 merged in). Records the judgments of the second pass with the PR #15 declarations now
present, the corrected lem:equiv, the formalized hyp:R1, the kernel-checked H2 (p < 10^6) and
omega(N) >= 4 (q <= 10^6) labels, and the remarks whose text changed. Each judgment was made by
reading the current paper statement next to the Lean statement."""
import json, sys
sys.path.insert(0, "scripts"); import final_4sort as F
REV = "Grok Bot agent review (not the author), 2026-11-23 America/Chicago, third pass, paper on feat/4sort-drift-formalization"
E, C, X = "exact", "commentary", "external"
J = {
 "prop:A-C-K": ("proved", E, None, "f=phi(M), a=p(p-1), g=sigma(M), b=p^2+p+1"),
 "prop:A-C-j1": ("proved", E, ["P2qJumps.propC_j1"], "f=phi(M), a=p(p-1), g=sigma(M), b=p^2+p+1; determinant and unique rational solution clause by clause"),
 "prop:A-C-j2": ("proved", E, ["P2qJumps.propC_j2"], "Delta = M(ag+bf)-2p^2 fg with the same f,a,g,b; unknowns (q,S,Pi)"),
 "thm:A-implies": ("proved", E, ["P2qJumps.prop_implies_corrected", "P2qJumps.implies_corrected_of_H1"], ""),
 "thm:A-three": ("proved", E, None, "ThreeRegimes and R2S2TEmpty as defined in ThreeRegimes.lean"),
 "thm:closed": ("proved", E, None, "items 1-6 and the closing sentence are conjuncts of theorem_closed"),
 "lem:AB": ("proved", E, None, ""), "lem:cot": ("proved", E, None, ""), "lem:Ark": ("proved", E, None, ""),
 "prop:23": ("proved", E, None, ""), "cor:gcd": ("proved", E, None, ""), "prop:square": ("proved", E, None, ""),
 "prop:primepower": ("proved", E, None, ""), "prop:rs": ("proved", E, None, ""), "prop:r2s": ("proved", E, None, ""),
 "lem:e123": ("proved", E, ["lem_e123", "P2qJumps.rst_false"], "shape rst does not occur (rst_false); conclusion stated in Lean (prop:A-vacuous)"),
 "lem:qform": ("proved", E, None, ""), "lem:C": ("proved", E, None, ""), "lem:Phi": ("proved", E, None, ""),
 "prop:balanced": ("proved", E, ["prop_balanced", "rst_balanced", "theorem_closed"], ""),
 "prop:pm2": ("proved", E, None, ""),
 "thm:r3sint": ("proved", E, ["r3s_statements", "P2qJumps.r3s_empty"], "Lean needs no integrality hypothesis; r3s does not occur"),
 "thm:four": ("proved", E, None, "squarefree omega=4 does not occur (four_false); the conclusions are stated in Lean"),
 "thm:rst-off": ("proved", E, None, ""), "thm:rst-far": ("proved", E, None, "Nfar is the paper polynomial term by term"),
 "thm:r2st-off": ("proved", E, None, ""), "thm:rp4": ("proved", E, None, ""), "thm:r3s-plarge": ("proved", E, None, ""), "thm:r3s-strip": ("proved", E, None, ""),
 "thm:R1": ("proved", E, ["theorem28_holds", "P2qJumps.rst_false"], "Theorem28 = no rst solution of the jumps"),
 "lem:L1": ("proved", E, None, ""), "lem:L2": ("proved", E, None, "phi(N)=K phi(U), A(N)=K A(U)"),
 "lem:G": ("proved", E, None, "T(p)=p^4-13p-6"), "cor:F1": ("proved", E, None, ""),
 "prop:implies-corrected": ("proved", E, None, ""),
 "lem:A-L1Q": ("proved", E, "+P2qJumps.lemmaL1_terms_nonneg", "(a) every term >= 0 for every x is lemmaL1_terms_nonneg"),
 "prop:A-pure": ("proved", E, "+P2qJumps.sq_mod16_exact", "(g) the squares modulo 16 are exactly 0,1,4,9: sq_mod16_exact"),
 "prop:A-vacuous": ("proved", E, "+P2qJumps.rigid_finite_candidates,P2qJumps.r2st_offset_sigma_neg", "non-vacuous sentences of thm:rigid(a),(c): rigid_finite_candidates, r2st_offset_sigma_neg"),
 "thm:rigid": ("proved", E, ["lem_qform_C_Phi", "r3s_statements", "r2st_statements", "P2qJumps.rst_false", "P2qJumps.r3s_empty", "P2qJumps.r2st_false", "P2qJumps.rigid_finite_candidates", "P2qJumps.r2st_offset_sigma_neg"], ""),
 "lem:K": ("proved", E, ["P2qJumps.lemmaK_param", "lemmaK", "pow_dvd_K", "P2qJumps.p_not_dvd_K"], "lemmaK_param is under the jumps alone"),
 "lem:Q": ("proved", E, "+P2qJumps.lemmaQ_ratio", "Q(m)/m^2 = 1 - prod(1-r^(-e-1)) is lemmaQ_ratio"),
 "thm:E": ("proved", E, "+P2qJumps.theoremE_v_lt", "clause list as thm:A-E; r < p^(3/2) is theoremE_v_lt"),
 "thm:F": ("proved", E, "+P2qJumps.theoremF_v2", "'equivalently o <= 1 + v2(T(p))' is theoremF_v2"),
 "thm:main-p2q": ("proved", E, ["theorem_closed", "theorem28_holds", "P2qJumps.rst_false", "r2st_empty", "r3s_empty", "omega4_constraints", "P2qJumps.omega4_N_gt_p4", "P2qJumps.omega4_q_le_1e6", "r3st_empty", "omega4_or_r2s2t", "H1_holds"], "'hence N > p^4' is omega4_N_gt_p4; omega(N)>=4 with q<=10^6 is omega4_q_le_1e6; the PARI/Python runs are labeled external"),
 "lem:equiv": ("proved", E, ["jumps_iff_AB", "jumps_delta"], "corrected: jumps <-> (A,B equal) and jumps -> delta equal; the converse fails (remark, delta_eq_not_jumps_63)"),
 "hyp:R1": ("proved", E, ["P2qJumps.hypR1_holds", "P2qJumps.hypR1_data_gives_jumps"], "V = p+(q+1)/2, N = p^2q+12; (q-rho)D = C, 2(s+t) = 2p+q+1-2rho, rho st = N; Lean needs no p,rho >= 5 and no newness beyond pairwise distinct primes; hypR1_data_gives_jumps gives an rst solution, rst_false refutes it"),
 # first-pass entries whose status changed
 "lem:A-coprime6": ("proved", E, "+P2qJumps.coprime6_r2st,P2qJumps.coprime6_r3s", "the 'Consequently' sentence is coprime6_r2st / coprime6_r3s"),
 "thm:A-omega4": ("proved", E, "+P2qJumps.omega4_N_gt_p4", "'In particular N > p^4' is omega4_N_gt_p4"),
 "lem:A-K": ("proved", E, ["P2qJumps.lemmaK_param", "P2qJumps.lemmaK", "P2qJumps.pow_dvd_K"], "lemmaK_param states it under the jumps alone (5 <= p from preamble)"),
 "prop:A-p7-prefix": ("proved", E, "+P2qJumps.p7_prefix_no_completion", "the concluding sentence is p7_prefix_no_completion"),
 "prop:C": ("proved", E, ["P2qJumps.propC_K", "P2qJumps.propC_j1", "P2qJumps.propC_j2", "P2qJumps.propC_p_lt_1e6"], "the enumeration clause p < 10^6 is propC_p_lt_1e6 (kernel-checked since PR #11)"),
}
REMARKS = {  # text key -> declarations the remark cites
 "The enumeration clause for \\(5\\le p<10^6\\) is kernel-checked": ["P2qJumps.propC_K", "P2qJumps.propC_j1", "P2qJumps.propC_j2", "P2qJumps.propC_p_lt_1e6"],
 "Theorem~\\ref{thm:A-implies} proves the equivalence only": ["P2qJumps.prop_implies_corrected", "H1_holds", "P2qJumps.h2_p_lt_1e6"],
 "The converse of the last implication is false": ["P2qJumps.delta_eq_not_jumps_63"],
 "Lemma~\\ref{lem:K} is kernel-checked": ["P2qJumps.lemmaK_param", "P2qExclusions.setupK", "P2qJumps.lemmaK", "P2qJumps.pow_dvd_K"],
 "Theorem~\\ref{thm:D} is kernel-checked": ["P2qJumps.theoremD", "P2qJumps.lemmaQ_formula", "P2qExtensions.sigma_mul_totient_prod", "P2qJumps.lemmaQ_ratio"],
 "Theorem~\\ref{thm:E} is kernel-checked": ["P2qJumps.theoremE_shapes", "P2qJumps.theoremE_i", "P2qJumps.theoremE_ii", "P2qJumps.theoremE_iii", "P2qJumps.theoremE_iv", "P2qJumps.theoremE_v", "P2qJumps.theoremE_v_lt"],
 "Lemmas~\\ref{lem:G},~\\ref{lem:K} and Theorem~\\ref{thm:F} are kernel-checked": ["P2qStructural.lemmaG", "P2qStructural.theoremF", "P2qJumps.corollaryF1", "P2qJumps.theoremF_v2"],
 "H1 is closed by Theorem~\\ref{thm:H1-comp}": ["H1_holds", "P2qJumps.h2_p_lt_1e6", "P2qJumps.H3_of_mod4"],
}
m = json.load(open("final-check/claim-map.json"))
cfg = dict(F.DEFAULT_CONFIG); cfg.update(m["config"])
envs = F.parse_paper(F.read_tex(cfg["paper"]), cfg["envs"])[0]
env = {e["id"]: e for e in envs}
before = len(m["claims"])
m["claims"] = [c for c in m["claims"] if c["id"] in env]  # drop map orphans (text of unlabeled remarks changed)
print("dropped orphans:", before - len(m["claims"]))
by = {c["id"]: c for c in m["claims"]}
for k, (d, rel, lean, note) in J.items():
    c = by[k]
    c["disposition"], c["relation"], c["note"], c["reviewed"] = d, rel, note, REV
    if isinstance(lean, list):
        c["lean"] = lean
    elif isinstance(lean, str):
        c["lean"] = list(dict.fromkeys(c["lean"] + lean[1:].split(",")))
    c["paper_sha256"] = env[k]["sha256"]
by["thm:E"]["lean"] = list(dict.fromkeys(by["thm:E"]["lean"] + by["thm:A-E"]["lean"]))
n = 0
for c in m["claims"]:
    if c["kind"].startswith("remark") and not c.get("reviewed"):
        txt = env[c["id"]]["statement"]
        hits = [v for key, v in REMARKS.items() if key in txt]
        assert len(hits) == 1, (c["id"], txt[:120])
        c["disposition"], c["relation"], c["lean"] = C, "unjudged", hits[0]
        c["note"] = "remark asserting kernel-checked status; cites these declarations"
        c["reviewed"] = REV; c["paper_sha256"] = env[c["id"]]["sha256"]; n += 1
print("remarks judged:", n)
left = [c["id"] for c in m["claims"] if not c.get("reviewed")]
print("still unreviewed:", left)
json.dump(m, open("final-check/claim-map.json", "w"), indent=1, ensure_ascii=False)
open("final-check/claim-map.json", "a").write("\n")

# ---- part 2 (after the first preview) ----
import hashlib
m = json.load(open("final-check/claim-map.json"))
# \DATAHTWO, \DATAOMEGAFOUR and \DATAHENSEL now expand to kernel-checked labels with a CI certificate
# (paper lines 10-12); only \OMEGAFOURSTATUS still marks an unproved status.
m["config"]["retraction_macros"] = ["\\OMEGAFOURSTATUS"]
by = {c["id"]: c for c in m["claims"]}
QUAL = {"lem:L1": ["P2qJumps.lemmaL1", "P2qExtensions.lemmaL1"],
        "lem:G": ["P2qJumps.lemmaG", "lemmaG_gcd", "T_pos"],
        "thm:F": ["P2qJumps.theoremF", "P2qJumps.theoremF_v2"]}
for k, v in QUAL.items():
    by[k]["lean"] = v
    by[k]["lean_expected"] = {d: t for d, t in by[k].get("lean_expected", {}).items() if d in v}
cfg = dict(F.DEFAULT_CONFIG); cfg.update(m["config"])
lines = F.read_tex(cfg["paper"])
envs_found, tl, _ = F.parse_paper(lines, cfg["envs"])
env = {e["id"]: e for e in envs_found}
ment = F.mention_clauses(cfg, tl, lines, envs_found)
ACK = {"prop:implies-corrected": ("lies in H2 of", "'remains open' is said of the shape r^2s^2t (H2), not of this proposition, which is proved"),
       "thm:A-three": ("which is open", "'is open' is said of the emptiness of r^2s^2t, not of Theorem A-three, which is proved")}
for k, (key, why) in ACK.items():
    lab = env[k]["label"]
    hits = [c for f, n, c in ment.get(lab, []) if key in c]
    assert len(hits) == 1, (k, len(hits))
    by[k]["reviewed_status_sentences"] = [{"sha256": hashlib.sha256(hits[0].encode()).hexdigest(), "reason": why}]
json.dump(m, open("final-check/claim-map.json", "w"), indent=1, ensure_ascii=False)
open("final-check/claim-map.json", "a").write("\n")
print("part 2 done")
