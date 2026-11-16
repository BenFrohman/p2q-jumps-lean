"""R2 strip, external check: primes 5 <= p < r <= B with r^2 | L(p) = p^3 - p^2 - 12.

Since p < r, p is a root of L modulo r; enumerate the linear factors of L over GF(r).
Not kernel-checked. Trust base: Python 3, SymPy.
"""
import sys
import sympy
from sympy import Poly, Symbol

x = Symbol("x")
B = int(sys.argv[1])
hits, hist = [], {0: 0, 1: 0, 2: 0, 3: 0}
for r in sympy.primerange(5, B + 1):
    f = Poly(x**3 - x**2 - 12, x, modulus=r)
    roots = sorted({int(-fac.all_coeffs()[1]) % r for fac, _ in f.factor_list()[1] if fac.degree() == 1})
    hist[len(roots)] += 1
    for a in roots:
        if a >= 5 and (a**3 - a**2 - 12) % (r * r) == 0 and sympy.isprime(a):
            hits.append((a, r))
print("B", B, "root-count histogram", hist, "hits", hits)
