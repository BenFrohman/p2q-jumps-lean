#!/usr/bin/env python3
"""Regenerate truth-gate.lock.json hashes from P2qJumps/Semantics.lean (approval is never set by this script)."""
import hashlib, json, re, subprocess
sem = open("P2qJumps/Semantics.lean", encoding="utf-8").read()
def block(kind, name):
    return re.search(r"^(%s %s\b.*?)(?=^\S|\Z)" % (kind, re.escape(name)), sem, re.S | re.M).group(1).rstrip() + "\n"
sha = lambda s: hashlib.sha256(s.encode()).hexdigest()
quote = [l[2:] for l in sem.split("\n") if l.startswith("> ")]
paper = "paper/theorem-L.tex"
lock = {
  "schema": "p2q-jumps-lean/truth-gate-lock/v1",
  "semantics": "P2qJumps/Semantics.lean",
  "paperClaim": {"name": "P2qJumps.Semantics.paper_claim", "sourceSha256": sha(block("def", "paper_claim")),
    "provenance": {"paper": paper, "sha256": hashlib.sha256(open(paper, "rb").read()).hexdigest(),
      "includedIn": "paper/p2q-jumps-v1.4.tex",
      "section": "Lean-certified reductions (v1.4), Theorem L (thm:L)", "quote": quote}},
  "formalClaim": {"name": "P2qJumps.Semantics.formal_claim", "sourceSha256": sha(block("def", "formal_claim"))},
  "correspondence": {"name": "P2qJumps.Semantics.intended_correspondence", "direction": "iff",
    "sourceSha256": sha(block("theorem", "intended_correspondence"))},
  "publicTheorem": {"name": "P2qJumps.Semantics.theorem_L", "sourceSha256": sha(block("theorem", "theorem_L"))},
  "axiomsAllowed": ["propext", "Classical.choice", "Quot.sound"],
  "toolchain": open("lean-toolchain").read().strip(),
  "mathlib": "v4.26.0",
  "leanSourcesCommit": subprocess.check_output(["git", "log", "-1", "--format=%H", "--", "P2qJumps", "P2qJumps.lean", "AxiomAudit.lean"]).decode().strip(),
  "approval": {"approvedBy": "PENDING", "approvedAt": None,
    "note": "PENDING AUTHOR APPROVAL: Benjamin Stanley Frohman must confirm paper_claim transcribes Theorem L as meant."},
}
try:
    old = json.load(open("truth-gate.lock.json"))
    if old.get("approval", {}).get("approvedBy") not in (None, "PENDING"):
        raise SystemExit("lock already approved; refusing to regenerate")
except FileNotFoundError:
    pass
json.dump(lock, open("truth-gate.lock.json", "w"), indent=2, ensure_ascii=False); open("truth-gate.lock.json", "a").write("\n")
print("wrote truth-gate.lock.json")
