#!/usr/bin/env python3
"""Static Truth Gate checks for the Theorem L2 lock (truth-gate-L2.lock.json, P2qJumps/Semantics2.lean).
Same rules as the Theorem L checks in scripts/verify-lock.sh: independence of paper_claim2, no rfl correspondence,
public theorem via .mp, paper sha256 and verbatim quote present, hashes match the lock."""
import hashlib, json, re, sys
LOCK, SEM = "truth-gate-L2.lock.json", "P2qJumps/Semantics2.lean"
def die(m): print("TRUTH GATE (L2): REJECT " + m); sys.exit(1)
try:
    lock = json.load(open(LOCK)); sem = open(SEM, encoding="utf-8").read()
except FileNotFoundError as e:
    die("missing " + e.filename)
def block(kind, name):
    m = re.search(r"^(%s %s\b.*?)(?=^\S|\Z)" % (kind, re.escape(name)), sem, re.S | re.M)
    if not m: die("missing-%s" % name)
    return m.group(1).rstrip() + "\n"
sha = lambda s: hashlib.sha256(s.encode()).hexdigest()
pc, fc = block("def", "paper_claim2"), block("def", "formal_claim2")
ic, tl = block("theorem", "intended_correspondence2"), block("theorem", "theorem_L2")
for bad in ["formal_claim", "Jumps", "Theorem28", "Lpoly", "Cert.", "theorem28", "r2st_", "r3s_",
            "N_ne_", "N_not_", "omega4_", "preamble", "Semantics."]:
    if bad in pc.split(":=", 1)[1]: die("alias: paper_claim2 mentions %s" % bad)
if not re.search(r"theorem intended_correspondence2\s*:\s*formal_claim2\s*↔\s*paper_claim2", ic): die("correspondence-type")
body = ic.split(":=", 1)[1]
if re.search(r"\bIff\.rfl\b|^\s*rfl\s*$|by\s+rfl\b|by\s+exact\s+rfl\b|\bIff\.of_eq\b", body, re.M): die("rfl-correspondence")
if "intended_correspondence2.mp" not in tl or not re.search(r"theorem theorem_L2\s*:\s*paper_claim2", tl): die("public-theorem-not-via-mp")
prov = lock["paperClaim"]["provenance"]
psha = hashlib.sha256(open(prov["paper"], "rb").read()).hexdigest()
if psha != prov["sha256"]: die("paper-sha256 %s != lock %s" % (psha, prov["sha256"]))
if prov["sha256"] not in sem: die("paper-sha256-not-in-Semantics2")
if not prov["quote"]: die("missing-quote")
for line in prov["quote"]:
    if line not in sem: die("quote-not-in-Semantics2: " + line)
for key, src in [("paperClaim", pc), ("formalClaim", fc), ("correspondence", ic), ("publicTheorem", tl)]:
    if sha(src) != lock[key]["sourceSha256"]: die("hash-%s %s != lock %s" % (key, sha(src), lock[key]["sourceSha256"]))
print("static checks (L2): PASS")
print("paper_claim2 (locked):"); print(pc)
