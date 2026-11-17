#!/usr/bin/env python3
"""Regenerate truth-gate-L2.lock.json hashes from P2qJumps/Semantics2.lean (approval is never set by this script).
The Theorem L lock (truth-gate.lock.json, P2qJumps/Semantics.lean, paper/theorem-L.tex) is not touched."""
import hashlib, json, re, subprocess
SEM = "P2qJumps/Semantics2.lean"
LOCK = "truth-gate-L2.lock.json"
sem = open(SEM, encoding="utf-8").read()
def block(kind, name):
    return re.search(r"^(%s %s\b.*?)(?=^\S|\Z)" % (kind, re.escape(name)), sem, re.S | re.M).group(1).rstrip() + "\n"
sha = lambda s: hashlib.sha256(s.encode()).hexdigest()
quote = [l[2:] for l in sem.split("\n") if l.startswith("> ")]
paper = "paper/theorem-L2.tex"
lock = {
  "schema": "p2q-jumps-lean/truth-gate-lock/v1",
  "semantics": SEM,
  "paperClaim": {"name": "P2qJumps.Semantics2.paper_claim2", "sourceSha256": sha(block("def", "paper_claim2")),
    "provenance": {"paper": paper, "sha256": hashlib.sha256(open(paper, "rb").read()).hexdigest(),
      "includedIn": "paper/p2q-jumps-v1.4.tex",
      "section": "Lean-certified reductions (v1.4), Theorem L2 (thm:L2)", "quote": quote}},
  "formalClaim": {"name": "P2qJumps.Semantics2.formal_claim2", "sourceSha256": sha(block("def", "formal_claim2"))},
  "correspondence": {"name": "P2qJumps.Semantics2.intended_correspondence2", "direction": "iff",
    "sourceSha256": sha(block("theorem", "intended_correspondence2"))},
  "publicTheorem": {"name": "P2qJumps.Semantics2.theorem_L2", "sourceSha256": sha(block("theorem", "theorem_L2"))},
  "axiomsAllowed": ["propext", "Classical.choice", "Quot.sound"],
  "toolchain": open("lean-toolchain").read().strip(),
  "mathlib": "v4.26.0",
  "leanSourcesCommit": subprocess.check_output(["git", "log", "-1", "--format=%H", "--", "P2qJumps", "P2qJumps.lean", "AxiomAudit.lean"]).decode().strip(),
  "approval": {"approvedBy": "PENDING", "approvedAt": None,
    "note": "PENDING AUTHOR APPROVAL: Benjamin Stanley Frohman must confirm paper_claim2 transcribes Theorem L2 (paper/theorem-L2.tex) as meant."},
}
try:
    old = json.load(open(LOCK))
    if old.get("approval", {}).get("approvedBy") not in (None, "PENDING"):
        raise SystemExit("lock already approved; refusing to regenerate")
except FileNotFoundError:
    pass
json.dump(lock, open(LOCK, "w"), indent=2, ensure_ascii=False); open(LOCK, "a").write("\n")
print("wrote " + LOCK)
