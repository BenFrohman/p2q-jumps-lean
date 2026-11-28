#!/usr/bin/env python3
"""Write truth-gate-partA.lock.json from P2qJumps/SemanticsPartA.lean.
Does not touch truth-gate.lock.json or truth-gate-L2.lock.json."""
import hashlib, json, re, sys
from pathlib import Path

SEM = Path("P2qJumps/SemanticsPartA.lean")
OUT = Path("truth-gate-partA.lock.json")
sem = SEM.read_text(encoding="utf-8")

def block(kind, name):
    m = re.search(r"^(%s %s\b.*?)(?=^\S|\Z)" % (kind, re.escape(name)), sem, re.S | re.M)
    if not m:
        raise SystemExit("missing %s %s" % (kind, name))
    return m.group(1).rstrip() + "\n"

sha = lambda s: hashlib.sha256(s.encode()).hexdigest()

# (id, paper_claim, formal_claim, correspondence, public theorem, paper needle, quote lines)
SPEC = [
    ("theorem28", "paper_claim_theorem28", "formal_claim_theorem28",
     "intended_correspondence_theorem28", "theorem_theorem28",
     r"\label{sec:A-ii}",
     ["Then N is not a product of three distinct primes."]),
    ("preamble", "paper_claim_preamble", "formal_claim_preamble",
     "intended_correspondence_preamble", "theorem_preamble",
     r"\label{prop:A-preamble}",
     ["If (eq:jumps) holds, then p≥5, q≥5, N is odd, N is not a square, and gcd(N,6pq)=1."]),
    ("r2st", "paper_claim_r2st", "formal_claim_r2st",
     "intended_correspondence_r2st", "theorem_r2st",
     r"\label{thm:A-r2st-empty}",
     ["N≠r^2st for pairwise distinct primes r,s,t≥5."]),
    ("omega4", "paper_claim_omega4", "formal_claim_omega4",
     "intended_correspondence_omega4", "theorem_omega4",
     r"\label{thm:A-omega4}",
     ["If N has at least four distinct prime factors, then q≥3p^2 and every",
      "prime factor r of N satisfies r>p. In particular N>p^4."]),
    ("omega4_constraints", "paper_claim_omega4_constraints", "formal_claim_omega4_constraints",
     "intended_correspondence_omega4_constraints", "theorem_omega4_constraints",
     r"\label{thm:A-omega4}",
     ["If N has at least four distinct prime factors, then q≥3p^2 and every"]),
    ("r3s", "paper_claim_r3s", "formal_claim_r3s",
     "intended_correspondence_r3s", "theorem_r3s",
     r"\label{thm:A-r3s-empty}",
     ["Assume (eq:jumps). Then N is not of the form r^3s with distinct primes r,s."]),
    ("theoremA", "paper_claim_theoremA", "formal_claim_theoremA",
     "intended_correspondence_theoremA", "theorem_theoremA",
     r"\label{thm:A-ras}",
     ["Assume (eq:jumps). Then N≠r^as for all distinct primes r,s and all a≥2.",
      "(Since r^as=s r^a, this also excludes rs^a.)"]),
    ("prime_pow", "paper_claim_prime_pow", "formal_claim_prime_pow",
     "intended_correspondence_prime_pow", "theorem_prime_pow",
     r"\label{thm:A-ras}",
     ["Assume (eq:jumps). Then N≠r^as for all distinct primes r,s and all a≥2."]),
    ("r3st", "paper_claim_r3st", "formal_claim_r3st",
     "intended_correspondence_r3st", "theorem_r3st",
     r"\label{thm:A-r3st-empty}",
     ["Assume (eq:jumps). Then N is not of the form r^3st with pairwise distinct primes r,s,t.",
      "There is no bound on p."]),
    ("theoremB", "paper_claim_theoremB", "formal_claim_theoremB",
     "intended_correspondence_theoremB", "theorem_theoremB",
     r"\label{thm:A-B}",
     ["Assume (eq:jumps). Then N is not powerful with ω(N)≥2. Together with Lemma lem:A-omega2:",
      "N is not powerful."]),
    ("theoremE", "paper_claim_theoremE", "formal_claim_theoremE",
     "intended_correspondence_theoremE", "theorem_theoremE",
     r"\label{thm:A-E}",
     ["(i) r^4 ∤ N.",
      "(v) If r^3∣N, then r^2∣L(p)."]),
    ("E_shapes", "paper_claim_E_shapes", "formal_claim_E_shapes",
     "intended_correspondence_E_shapes", "theorem_E_shapes",
     r"\label{thm:A-E-shapes}",
     ["Assume (eq:jumps) and that r^2∣N for some prime r. Then one of the following holds."]),
    ("theoremD", "paper_claim_theoremD", "formal_claim_theoremD",
     "intended_correspondence_theoremD", "theorem_theoremD",
     r"\label{thm:A-D}",
     ["Assume (eq:jumps), N squarefree and k=ω(N)≥4. Then q≥p^2(k^2-k-1)^2≥121p^2 and k≥p.",
      "In particular k=4 is impossible."]),
    ("F1", "paper_claim_F1", "formal_claim_F1",
     "intended_correspondence_F1", "theorem_F1",
     r"\label{thm:A-H1}",
     ["If N is squarefree and ω(N)≥4, then p=7 and 7≤ω(N)≤9."]),
    ("p7", "paper_claim_p7", "formal_claim_p7",
     "intended_correspondence_p7", "theorem_p7",
     r"\label{thm:A-p7-descent}",
     ["then ω(N)∉{7,8,9}."]),
    ("H1", "paper_claim_H1", "formal_claim_H1",
     "intended_correspondence_H1", "theorem_H1",
     r"\label{thm:A-H1}",
     ["Under (eq:jumps) with n=p^2q, N=n+12 is not squarefree. In particular H1 holds."]),
    ("implies", "paper_claim_implies", "formal_claim_implies",
     "intended_correspondence_implies", "theorem_implies",
     r"\label{thm:A-implies}",
     ["Conjecture conj:vanish holds if and only if H1, H2 and H3 hold. Consequently, if",
      "H1 holds, Conjecture conj:vanish holds if and only if H2 and H3 hold."]),
    ("classification", "paper_claim_classification", "formal_claim_classification",
     "intended_correspondence_classification", "theorem_classification",
     r"\label{thm:A-three}",
     ["(a) Assume (eq:jumps). Then ω(N)≥4, or N=r^2s^2t for pairwise distinct primes r,s,t."]),
    ("r2s2t_dvd", "paper_claim_r2s2t_dvd", "formal_claim_r2s2t_dvd",
     "intended_correspondence_r2s2t_dvd", "theorem_r2s2t_dvd",
     r"\label{thm:A-r2s2t-dvd}",
     ["Assume (eq:jumps). If N=r^2s^2t with pairwise distinct primes r,s,t, then rs∣L(p)",
      "and rs≤L(p)."]),
    ("H2_shapes", "paper_claim_H2_shapes", "formal_claim_H2_shapes",
     "intended_correspondence_H2_shapes", "theorem_H2_shapes",
     r"\label{thm:A-H2-shapes}",
     ["If no solution of (eq:jumps) has N=r^2s^2t with pairwise distinct primes and no",
      "solution has N=r^2s^2tu with pairwise distinct primes, then H2 holds."]),
    ("H3", "paper_claim_H3", "formal_claim_H3",
     "intended_correspondence_H3", "theorem_H3",
     r"\label{thm:A-H3}",
     ["If j(N)≥3, then 2^{j(N)-1}∣T(p) and p≡3 (mod 4). Consequently",
      "H3 holds for every p≡1 (mod 4): there is no solution with p≡1 (mod 4), R(N)≠∅",
      "and j(N)≥3."]),
    ("hensel", "paper_claim_hensel", "formal_claim_hensel",
     "intended_correspondence_hensel", "theorem_hensel",
     r"\DATAHENSEL",
     ["There are no primes p,r with 5≤p<r≤10^6 and r^2∣L(p), hence under both jumps",
      "N≠r^3s for distinct primes r,s≥5 with r≤10^6."]),
    ("propC_K", "paper_claim_propC_K", "formal_claim_propC_K",
     "intended_correspondence_propC_K", "theorem_propC_K",
     r"\label{prop:A-C-K}",
     ["Assume (eq:jumps) and r^2∣N for some prime r. Then K=N/rad(N) satisfies K>1,",
      "K∣L(p) and gcd(K,6p)=1."]),
]

claims = []
for (i, pc, fc, ic, tl, needle, quote) in SPEC:
    # quotes must appear in the Lean file
    for line in quote:
        if line not in sem:
            raise SystemExit("quote not in SemanticsPartA.lean (%s): %s" % (i, line))
    claims.append({
        "id": i,
        "paperClaim": pc,
        "formalClaim": fc,
        "correspondence": ic,
        "publicTheorem": tl,
        "paperNeedle": needle,
        "quote": quote,
        "paperClaimSha256": sha(block("def", pc)),
        "formalClaimSha256": sha(block("def", fc)),
        "correspondenceSha256": sha(block("theorem", ic)),
        "publicTheoremSha256": sha(block("theorem", tl)),
    })

lock = {
    "schema": "p2q-jumps-lean/truth-gate-lock-partA/v1",
    "semantics": "P2qJumps/SemanticsPartA.lean",
    "auditedPaper": "paper/p2q-jumps-v1.4.tex",
    "auditedPaperSha256": "48d680bc3287b76434970dffd9bb80cdfa122affd6c76c8b70bb7061f20c5767",
    "auditedPaperCommit": "033e12d2db946d625b409e726d358198a35ac8ff",
    "axiomsAllowed": ["propext", "Classical.choice", "Quot.sound"],
    "toolchain": Path("lean-toolchain").read_text().strip(),
    "mathlib": "v4.26.0",
    "approval": {
        "approvedBy": "standing-rule: kernel-build-and-paper-match",
        "approvedAt": None,
        "note": (
            "paper_claim_* are independent transcriptions of the cited v1.4.1 Part A "
            "statements. Under the standing rule, approval holds once the official "
            "kernel build and the paper match. The v1.4.1 paper/PDF was not edited. "
            "Conjecture 3, H2 in full, H3 for p≡3 (mod 4), and the emptiness of "
            "r^2s^2t and r^2s^2tu remain open."
        ),
    },
    "claims": claims,
}
OUT.write_text(json.dumps(lock, indent=2, ensure_ascii=False) + "\n")
print("wrote %s (%d claims)" % (OUT, len(claims)))
