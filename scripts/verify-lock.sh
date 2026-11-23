#!/usr/bin/env bash
# Truth Gate checker for p2q-jumps-lean: scripts/verify-lock.sh
#
# Checks that the Lean certificate inhabits the locked paper_claim (P2qJumps/Semantics.lean) and that the lock
# (truth-gate.lock.json) matches the sources. Never edit Semantics.lean or the lock to make this pass.
#
# Every stage always runs: static checks, sorry scan, lake build, observation pass, axiom audit.
# There is no option that leaves a stage out.
#
# Exit 0 = pass, 1 = reject.
set -uo pipefail
cd "$(dirname "$0")/.."
reject() { echo "TRUTH GATE: REJECT $1"; exit 1; }
stage() { echo "== $1"; }
LOCK=truth-gate.lock.json
SEM=P2qJumps/Semantics.lean
[ -f "$LOCK" ] || reject missing-lock
[ -f "$SEM" ] || reject missing-semantics

stage "static checks (independence, no rfl correspondence, provenance, hashes)"
python3 - "$LOCK" "$SEM" <<'PY' || exit 1
import hashlib, json, re, sys
lock = json.load(open(sys.argv[1])); sem = open(sys.argv[2], encoding="utf-8").read()
def die(m): print("TRUTH GATE: REJECT " + m); sys.exit(1)
def block(kind, name):
    m = re.search(r"^(%s %s\b.*?)(?=^\S|\Z)" % (kind, re.escape(name)), sem, re.S | re.M)
    if not m: die("missing-%s" % name)
    return m.group(1).rstrip() + "\n"
sha = lambda s: hashlib.sha256(s.encode()).hexdigest()
pc, fc = block("def", "paper_claim"), block("def", "formal_claim")
ic, tl = block("theorem", "intended_correspondence"), block("theorem", "theorem_L")
for bad in ["formal_claim", "Jumps", "Theorem28", "Lpoly", "Cert.", "theorem28", "r2st_", "r3s_"]:
    if bad in pc.split(":=", 1)[1]: die("alias: paper_claim mentions %s" % bad)
if not re.search(r"theorem intended_correspondence\s*:\s*formal_claim\s*↔\s*paper_claim", ic): die("correspondence-type")
body = ic.split(":=", 1)[1]
if re.search(r"\bIff\.rfl\b|^\s*rfl\s*$|by\s+rfl\b|by\s+exact\s+rfl\b|\bIff\.of_eq\b", body, re.M): die("rfl-correspondence")
if "intended_correspondence.mp" not in tl or not re.search(r"theorem theorem_L\s*:\s*paper_claim", tl): die("public-theorem-not-via-mp")
prov = lock["paperClaim"]["provenance"]
psha = hashlib.sha256(open(prov["paper"], "rb").read()).hexdigest()
if psha != prov["sha256"]: die("paper-sha256 %s != lock %s" % (psha, prov["sha256"]))
if prov["sha256"] not in sem: die("paper-sha256-not-in-Semantics")
for line in prov["quote"]:
    if line not in sem: die("quote-not-in-Semantics: " + line)
for key, src in [("paperClaim", pc), ("formalClaim", fc), ("correspondence", ic), ("publicTheorem", tl)]:
    if sha(src) != lock[key]["sourceSha256"]: die("hash-%s %s != lock %s" % (key, sha(src), lock[key]["sourceSha256"]))
print("static checks: PASS")
print("paper_claim (locked):"); print(pc)
PY

stage "static checks for the Theorem L2 lock (truth-gate-L2.lock.json)"
python3 scripts/verify-lock-L2.py || exit 1

stage "scan: sorry / admit / native_decide / axiom declarations"
python3 scripts/check_no_sorry.py || reject forbidden-token

  stage "lake build (Mathlib from cache; never rebuilt)"
  lake exe cache get || reject mathlib-cache-get-failed
  lake build || reject lake-build-failed
  stage "observation pass"
  printf 'import P2qJumps\nopen P2qJumps.Semantics\n#check @intended_correspondence\n#print paper_claim\n#print formal_claim\n#check @theorem_L\n#print axioms theorem_L\n#print axioms intended_correspondence\nopen P2qJumps.Semantics2\n#check @intended_correspondence2\n#print paper_claim2\n#print formal_claim2\n#check @theorem_L2\n#print axioms theorem_L2\n#print axioms intended_correspondence2\n' > /tmp/p2q_observe.lean
  lake env lean /tmp/p2q_observe.lean | tee /tmp/p2q_observe.out || reject observation
  stage "axiom audit"
  lake env lean AxiomAudit.lean > /tmp/p2q_axioms.txt 2>&1 || reject axiom-audit-failed
  python3 - /tmp/p2q_axioms.txt <<'PY' || { cat /tmp/p2q_axioms.txt; reject nonstandard-axioms; }
import re, sys
ok = re.compile(r"depends on axioms: \[(propext|Classical\.choice|Quot\.sound)(, (propext|Classical\.choice|Quot\.sound))*\]$|does not depend on any axioms$")
raw = open(sys.argv[1], encoding="utf-8").read().splitlines()
lines = []
for l in raw:  # Lean wraps a long axiom list onto indented continuation lines
    if lines and l[:1].isspace(): lines[-1] += " " + l.strip()
    else: lines.append(l)
bad = [l for l in lines if l.strip() and not ok.search(l)]
print(f"axiom audit: read {len(lines)} lines, {len(bad)} not a standard-axiom report")
for l in bad: print("  " + l)
sys.exit(1 if bad or not lines else 0)
PY
  grep -E "theorem_L|intended_correspondence" /tmp/p2q_observe.out | grep -q "depends on axioms" || reject observation-axioms
  grep -E "theorem_L2|intended_correspondence2" /tmp/p2q_observe.out | grep -q "depends on axioms" || reject observation-axioms-L2

approver=$(python3 -c 'import json;print(json.load(open("truth-gate.lock.json"))["approval"]["approvedBy"])')
approver2=$(python3 -c 'import json;print(json.load(open("truth-gate-L2.lock.json"))["approval"]["approvedBy"])')
echo "TRUTH GATE: PASS (lock L recorded by $approver, lock L2 recorded by $approver2); the formal certificate inhabits the locked paper_claim and paper_claim2, nothing more"
