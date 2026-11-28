#!/usr/bin/env python3
"""Static Truth Gate checks for the Part A locks
(truth-gate-partA.lock.json, P2qJumps/SemanticsPartA.lean).

Same rules as Theorems L and L2: each paper_claim_* is an independent transcription,
correspondence is not rfl, the public theorem is obtained through .mp, and source
hashes match the lock. The v1.4.1 paper/PDF are not edited by this lock.

The full-file sha256 of paper/p2q-jumps-v1.4.tex is recorded as the audited v1.4.1
source (commit 033e12d) and is not required to match a later revision of that path.
Each entry is tied to the paper by a TeX label or needle that must still occur in
the current paper file, and by a verbatim quote that must occur in SemanticsPartA.lean.
"""
import hashlib, json, re, sys

LOCK, SEM, PAPER = (
    "truth-gate-partA.lock.json",
    "P2qJumps/SemanticsPartA.lean",
    "paper/p2q-jumps-v1.4.tex",
)

def die(m):
    print("TRUTH GATE (Part A): REJECT " + m)
    sys.exit(1)

try:
    lock = json.load(open(LOCK))
    sem = open(SEM, encoding="utf-8").read()
    paper = open(PAPER, encoding="utf-8").read()
except FileNotFoundError as e:
    die("missing " + e.filename)

def block(kind, name):
    m = re.search(r"^(%s %s\b.*?)(?=^\S|\Z)" % (kind, re.escape(name)), sem, re.S | re.M)
    if not m:
        die("missing-%s" % name)
    return m.group(1).rstrip() + "\n"

sha = lambda s: hashlib.sha256(s.encode()).hexdigest()

BANNED = [
    "formal_claim", "Jumps", "Theorem28", "Lpoly", "Cert.", "theorem28",
    "r2st_", "r3s_", "N_ne_", "N_not_", "omega4_", "Semantics.",
    "simpleCount", "repPrimes", "H1_holds", "no_squarefree",
]

claims = lock.get("claims")
if not claims:
    die("missing-claims")

recorded = lock.get("auditedPaperSha256")
if not recorded:
    die("missing-auditedPaperSha256")
if recorded not in sem:
    die("audited-paper-sha256-not-in-SemanticsPartA")

for c in claims:
    key = c["id"]
    pc = block("def", c["paperClaim"])
    fc = block("def", c["formalClaim"])
    ic = block("theorem", c["correspondence"])
    tl = block("theorem", c["publicTheorem"])
    body = pc.split(":=", 1)[1]
    for bad in BANNED:
        if bad in body:
            die("alias: %s mentions %s" % (c["paperClaim"], bad))
    if not re.search(
        r"theorem %s\s*:\s*%s\s*↔\s*%s" % (
            re.escape(c["correspondence"]),
            re.escape(c["formalClaim"]),
            re.escape(c["paperClaim"]),
        ),
        ic,
    ):
        die("correspondence-type-%s" % key)
    icbody = ic.split(":=", 1)[1]
    if re.search(
        r"\bIff\.rfl\b|^\s*rfl\s*$|by\s+rfl\b|by\s+exact\s+rfl\b|\bIff\.of_eq\b",
        icbody,
        re.M,
    ):
        die("rfl-correspondence-%s" % key)
    if ("%s.mp" % c["correspondence"]) not in tl or not re.search(
        r"theorem %s\s*:\s*%s" % (re.escape(c["publicTheorem"]), re.escape(c["paperClaim"])),
        tl,
    ):
        die("public-theorem-not-via-mp-%s" % key)
    needle = c.get("paperNeedle")
    if needle and needle not in paper:
        die("paper-needle-missing-%s: %s" % (key, needle))
    quotes = c.get("quote") or []
    if not quotes:
        die("missing-quote-%s" % key)
    for line in quotes:
        if line not in sem:
            die("quote-not-in-SemanticsPartA-%s: %s" % (key, line))
    for field, src in [
        ("paperClaimSha256", pc),
        ("formalClaimSha256", fc),
        ("correspondenceSha256", ic),
        ("publicTheoremSha256", tl),
    ]:
        if sha(src) != c[field]:
            die("hash-%s-%s %s != lock %s" % (key, field, sha(src), c[field]))

print("static checks (Part A): PASS (%d claims)" % len(claims))
