"""Untrusted generator for the Hensel (r^3 s strip) kernel certificate data.

For every integer 5 <= m <= B: primes r get their roots of L(x) = x^3 - x^2 - 12 modulo r
(with multiplicity when L splits completely), composites that pass the checker's cheap
compositeness test (base-2 Fermat pseudoprimes prime to 210) get a proper divisor.
Writes JSON lines. Every item is re-checked by the Lean kernel (P2qJumps.Hensel.Defs).
"""
import json, sys
import sympy
from sympy import Poly, Symbol

x = Symbol("x")
B = int(sys.argv[1]); out = sys.argv[2]
isp = bytearray([1]) * (B + 1); isp[0] = isp[1] = 0
for i in range(2, int(B ** 0.5) + 1):
    if isp[i]:
        isp[i * i::i] = bytearray(len(isp[i * i::i]))
def comp(m):
    return any(m % d == 0 and d < m for d in (2, 3, 5, 7)) or (2 < m and pow(2, m - 1, m) != 1)
hits = []
with open(out, "w") as f:
    for m in range(5, B + 1):
        if isp[m]:
            fl = Poly(x**3 - x**2 - 12, x, modulus=m).factor_list()[1]
            roots = []
            for fac, mult in fl:
                if fac.degree() == 1:
                    roots += [int(-fac.all_coeffs()[1]) % m] * mult
            roots.sort()
            if len(roots) == 0: e = ["none", m]
            elif len(roots) == 1: e = ["one", m, roots[0]]
            elif len(roots) == 3: e = ["three", m] + roots
            else: raise SystemExit(f"unexpected root count {m} {roots}")
            for a in set(roots):
                if a >= 5 and (a**3 - a**2 - 12) % (m * m) == 0:
                    hits.append((m, a, bool(isp[a])))
            f.write(json.dumps(e) + "\n")
        elif not comp(m):
            d = next(d for d in range(2, m) if m % d == 0)
            f.write(json.dumps(["comp", m, d]) + "\n")
print("root hits (r, a, a prime):", hits)
