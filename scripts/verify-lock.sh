#!/usr/bin/env bash
# Truth Gate checker for p2q-jumps-lean: scripts/verify-lock.sh
#
# Checks that the Lean certificate inhabits the locked paper_claim (P2qJumps/Semantics.lean) and that the lock
# (truth-gate.lock.json) matches the sources. Never edit Semantics.lean or the lock to make this pass.
#
#   SKIP_BUILD=1        skip `lake build` / axiom audit (static checks only)
#   REQUIRE_APPROVAL=1  also fail while the lock's approval is PENDING
#
# Exit 0 = pass, 1 = reject, 2 = technical checks pass but author approval is PENDING (REQUIRE_APPROVAL=1 only).
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

if [ "${SKIP_BUILD:-0}" != 1 ]; then
  stage "lake build (Mathlib from cache; never rebuilt)"
  lake exe cache get >/dev/null 2>&1 || true
  lake build || reject lake-build-failed
  stage "observation pass"
  printf 'import P2qJumps\nopen P2qJumps.Semantics\n#check @intended_correspondence\n#print paper_claim\n#print formal_claim\n#check @theorem_L\n#print axioms theorem_L\n#print axioms intended_correspondence\nopen P2qJumps.Semantics2\n#check @intended_correspondence2\n#print paper_claim2\n#print formal_claim2\n#check @theorem_L2\n#print axioms theorem_L2\n#print axioms intended_correspondence2\n' > /tmp/p2q_observe.lean
  lake env lean /tmp/p2q_observe.lean | tee /tmp/p2q_observe.out || reject observation
  stage "axiom audit"
  lake env lean AxiomAudit.lean > /tmp/p2q_axioms.txt 2>&1 || reject axiom-audit-failed
  if grep -vE "depends on axioms: \[(propext|Classical\.choice|Quot\.sound)(, (propext|Classical\.choice|Quot\.sound))*\]$|does not depend on any axioms$" /tmp/p2q_axioms.txt | grep -q .; then
    cat /tmp/p2q_axioms.txt; reject nonstandard-axioms; fi
  grep -E "theorem_L|intended_correspondence" /tmp/p2q_observe.out | grep -q "depends on axioms" || reject observation-axioms
  grep -E "theorem_L2|intended_correspondence2" /tmp/p2q_observe.out | grep -q "depends on axioms" || reject observation-axioms-L2
fi

approver=$(python3 -c 'import json;print(json.load(open("truth-gate.lock.json"))["approval"]["approvedBy"])')
approver2=$(python3 -c 'import json;print(json.load(open("truth-gate-L2.lock.json"))["approval"]["approvedBy"])')
if [ "$approver2" = "PENDING" ]; then
  echo "TRUTH GATE (L2): technical checks PASS; paper_claim2 is PENDING AUTHOR APPROVAL"
fi
if [ "$approver" = "PENDING" ] || [ "$approver2" = "PENDING" ]; then
  echo "TRUTH GATE: technical checks PASS; paper_claim (L: $approver) / paper_claim2 (L2: $approver2) approval PENDING"
  [ "${REQUIRE_APPROVAL:-0}" = 1 ] && exit 2
  exit 0
fi
echo "TRUTH GATE: PASS (L approved by $approver, L2 approved by $approver2); the formal certificate inhabits the locked paper_claim and paper_claim2, nothing more"
