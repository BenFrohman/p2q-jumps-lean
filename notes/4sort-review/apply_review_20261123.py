# Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Authors: Benjamin Stanley Frohman
"""One-off: record the 2026-11-23 alignment review in final-check/claim-map.json.
Each judgment below was made by reading the paper environment next to the Lean source statement.
Entries not listed stay UNJUDGED (halt, route RE-REVIEW)."""
import json
REV = "Grok Bot agent review (not the author), 2026-11-23 America/Chicago, paper on main 1f2b324 vs Lean source"
E, N, C, X, O = "exact", "lean-narrower", "commentary", "external", "open"
J = {  # id: (disposition, relation, lean or None (keep seeded), note)
 "thm:L": ("proved", E, ["P2qJumps.Semantics.theorem_L"], "theorem_L : paper_claim; paper_claim is the locked transcription of paper/theorem-L.tex (Truth Gate, verify-lock.sh)"),
 "thm:L2": ("proved", E, ["P2qJumps.Semantics2.theorem_L2"], "theorem_L2 : paper_claim2; locked transcription of paper/theorem-L2.tex"),
 "lem:A-values": ("proved", E, None, "three lemmas, same hypotheses (distinct primes), integer identities"),
 "lem:A-jumps": ("proved", E, None, ""),
 "lem:A-p5": ("proved", E, None, "p prime from the Part A setting"),
 "lem:A-coprime6": ("proved", N, None, "Lean proves only the first sentence (prime r>=5 is not divisible by 2 or 3); the 'Consequently ... N=r^2st or r^3s ...' sentence has no Lean declaration"),
 "lem:A-totdiv": ("proved", E, None, "m/r is natural division in both"),
 "lem:A-compA": ("proved", E, None, "least prime factor = Nat.minFac"),
 "prop:A-preamble": ("proved", E, None, ""),
 "prop:A-notprime": ("proved", E, None, ""),
 "prop:A-rs": ("proved", E, None, ""),
 "prop:A-rst": ("proved", E, None, "theorem28_discriminant states N != rst with no lower bound on r,s,t"),
 "prop:A-r2st-red": ("proved", E, ["r2st_reduction"], "F(p) displayed = def F8 (R2ST.lean:48) term by term; F8 itself is a definition and is not listed as a proof"),
 "prop:A-r2st-bound": ("proved", E, None, ""),
 "thm:A-r2st-empty": ("proved", E, None, ""),
 "prop:A-r3s-red": ("proved", E, None, "L(p) = Lpoly p = p^3-p^2-12"),
 "prop:A-r3s-bound": ("proved", E, None, ""),
 "prop:A-pairs": ("proved", E, None, ""),
 "lem:A-2M": ("proved", E, None, "M>=1 vs M != 0 over N"),
 "lem:A-pair": ("proved", E, None, "delta(N) = sigma(N)+phi(N)-2N (paper line 474)"),
 "lem:A-four": ("proved", E, None, ""),
 "thm:A-omega4": ("proved", N, None, "Lean omega4_constraints gives q >= 3p^2 and every prime factor > p; the closing 'In particular N > p^4' has no Lean declaration"),
 "thm:A-r3s-empty": ("proved", E, None, ""),
 "prop:A-primepower": ("proved", E, None, ""),
 "thm:A-ras": ("proved", E, None, ""),
 "thm:A-r3st-empty": ("proved", E, None, ""),
 "lem:A-omega2": ("proved", E, None, "omega(N) = card of primeFactors"),
 "lem:A-K": ("proved", N, None, "P2qExclusions.setupK assumes 5 <= p (true under the jumps by P2qJumps.preamble, but the cited declaration carries it as a hypothesis); paper states it under the jumps alone"),
 "thm:A-B": ("proved", E, None, "powerful = every prime factor squared divides N"),
 "thm:A-E": ("proved", E, None, "(i)-(v) clause by clause; the N/delta > sqrt(L(p)) clause of (iv) is theoremE_iv_sqrt under q > 5p^2-4p-3, which (ii) supplies under the hypotheses of (ii)"),
 "thm:A-D": ("proved", E, None, ""),
 "cor:A-F1": ("proved", E, None, ""),
 "cor:A-omega4-five": ("proved", E, None, ""),
 "lem:A-equiv": ("proved", E, None, "A(m)=m-phi(m), B(m)=sigma(m)-m"),
 "lem:A-AB": ("proved", E, None, ""),
 "lem:A-cot": ("proved", E, None, ""),
 "lem:A-radscale": ("proved", E, None, "A(N)=N-phi(N); K=N/rad N"),
 "lem:A-G": ("proved", E, None, "T(p)=p^4-13p-6"),
 "lem:A-twist": ("proved", E, None, ""),
 "prop:A-rad": ("proved", E, None, ""),
 "thm:A-E-shapes": ("proved", E, None, ""),
 "prop:A-p7": ("proved", E, None, ""),
 "prop:A-p7-ge11": ("proved", E, None, ""),
 "prop:A-p7-prefix": ("proved", N, None, "Lean proves M <= 872 and 872 < 11*13*17; the concluding 'no prefix ... can be completed by three or more further distinct primes >= 11' has no Lean declaration"),
 "thm:A-p7-descent": ("proved", E, None, "p7_squarefree_empty: 7 <= omega <= 9 -> False"),
 "thm:A-H1": ("proved", E, ["no_squarefree", "H1_holds", "P2qJumps.conjecture_iff_H2_H3"], ""),
 "thm:H1-comp": ("proved", E, ["no_squarefree", "H1_holds"], "statement: no solution with N squarefree; thus H1"),
 "thm:B": ("proved", E, ["P2qJumps.theoremB"], ""),
 "thm:A": ("proved", E, ["P2qJumps.N_ne_ras"], ""),
 "thm:D": ("proved", E, ["P2qJumps.theoremD", "P2qJumps.theoremD_four"], ""),
 "thm:A-r2s2t-dvd": ("proved", E, None, "rs <= L(p) is stated with natural subtraction in Lean; equal to the integer L(p) since p >= 5"),
 "thm:A-H2-shapes": ("proved", E, None, "H2, R2S2TEmpty, R2S2TUEmpty as defined in ImpliesCorrected.lean / H2Reduction.lean"),
 "thm:A-H3": ("proved", E, None, "j(N) = simpleCount N; second sentence = H3_of_mod4"),
 "conj:vanish": ("open", "unjudged", [], "the open problem; Lean has only the definition Conjecture3 and Conjecture3 <-> H2 and H3"),
 "hyp:R2": ("open", "unjudged", [], "historical v0.10 hypothesis, stated as such"),
 "hyp:R3": ("open", "unjudged", [], "historical v0.10 hypothesis, stated as such"),
 "prop:implies": (C, "unjudged", [], "remark: the superseded v0.10 Proposition 32, explicitly not a current theorem"),
 "prop:C": (X, N, None, "mixed: structural clauses are Lean propC_K/propC_j1/propC_j2; the enumeration p < 10^6 is external data (\\DATAHTWO) until kernel-proved, so the claim as a whole is EXTERNAL"),
}
REMARK_DECLS = {  # unlabeled remarks that assert kernel-checked status: the declarations they cite
 "Lemma~\\ref{lem:K} is kernel-checked": ["P2qExclusions.setupK", "P2qJumps.lemmaK", "P2qJumps.pow_dvd_K"],
 "Theorem~\\ref{thm:D} is kernel-checked": ["P2qJumps.theoremD", "P2qJumps.lemmaQ_formula", "P2qExtensions.sigma_mul_totient_prod"],
 "Theorem~\\ref{thm:E} is kernel-checked": ["P2qJumps.theoremE_shapes", "P2qJumps.theoremE_i", "P2qJumps.theoremE_ii", "P2qJumps.theoremE_iii", "P2qJumps.theoremE_iv", "P2qJumps.theoremE_v"],
 "Lemmas~\\ref{lem:G},~\\ref{lem:K} and Theorem~\\ref{thm:F} are kernel-checked": ["P2qStructural.lemmaG", "P2qStructural.theoremF", "P2qJumps.corollaryF1"],
 "H1 is closed by Theorem~\\ref{thm:H1-comp}": ["H1_holds"],
 "Theorem~\\ref{thm:A-implies} proves the equivalence only": ["P2qJumps.prop_implies_corrected", "H1_holds"],
 "Items (iii) and the": ["P2qJumps.Semantics.theorem_L"],
 "Theorem~\\ref{thm:A-E}(iii) needs no prime": ["P2qJumps.cube_excludes_second_square"],
}
import sys; sys.path.insert(0, "scripts"); import final_4sort as F
m = json.load(open("final-check/claim-map.json"))
cfg = dict(F.DEFAULT_CONFIG); cfg.update(m["config"])
TEXT = {e["id"]: e["statement"] for e in F.parse_paper(F.read_tex(cfg["paper"]), cfg["envs"])[0]}
n = 0
for c in m["claims"]:
    c["_text"] = TEXT.get(c["id"], "")
    if c["id"] in J:
        d, r, lean, note = J[c["id"]]
        c["disposition"], c["relation"], c["note"] = d, r, note
        if lean is not None:
            c["lean"] = lean
        c["reviewed"] = REV; n += 1
    elif c["kind"] == "remark":
        c["disposition"], c["relation"] = C, "unjudged"
        c["reviewed"] = REV; n += 1
        c["note"] = "remark: commentary"
        for key, decls in REMARK_DECLS.items():
            if key in c.get("_text", ""):
                c["lean"] = decls; c["note"] = "remark asserting kernel-checked status; cites these declarations"
        if not c.get("lean") and "not kernel-checked" in c.get("_text", "") or "cited, not formalized" in c.get("title", ""):
            c["disposition"] = X; c["note"] = "remark on external/cited material, labeled as such"
    c.pop("_text", None)
json.dump(m, open("final-check/claim-map.json", "w"), indent=1, ensure_ascii=False)
open("final-check/claim-map.json", "a").write("\n")
print(n, "entries reviewed")
