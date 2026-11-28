#!/usr/bin/env python3
import json, sys
from pathlib import Path
out = Path("/tmp/p2q_observe.out").read_text()
claims = json.load(open("truth-gate-partA.lock.json"))["claims"]
missing = []
for c in claims:
    for name in (c["publicTheorem"], c["correspondence"]):
        if not any(("depends on axioms" in line or "does not depend on any axioms" in line) and name in line
                   for line in out.splitlines()):
            missing.append(name)
if missing:
    print("missing axiom observation for:", ", ".join(missing))
    sys.exit(1)
print("observation axioms (Part A): PASS")
