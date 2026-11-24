"""Untrusted planner: simulates the Lean checker `chkQ` (P2qJumps.Omega4Q.Defs) on every q and
splits each p's range [3p^2, 10^6] into chunks of roughly CHUNK cost units.
usage: plan.py CHUNK OUT.json"""
import math, json, sys
from multiprocessing import Pool
F1000 = math.factorial(1000)
Q = 10**6
def cost_q(p, P1, q):
    g = math.gcd(q, F1000)
    if g != 1 and (g != q or q > 1000): return 1
    N = p*p*q + 12
    if math.gcd(N, P1) != 1: return 2
    F = p*(p-1)*(q-1) + 12; d = p + 2; C = N; k = 0; it = 0
    while True:
        it += 1
        if C < d**(4-k): return 3 + it
        if C % d == 0:
            Cp = C
            while Cp % d == 0: Cp //= d
            D = C // Cp
            if F % (D//d*(d-1)): return 3 + it
            if k >= 3: raise SystemExit(f"FAIL p={p} q={q}")
            C = Cp; k += 1
        d += 2
def per_p(args):
    p, chunk = args
    lo, hi = 3*p*p, Q
    P1 = math.factorial(p)
    cs = [0]*(hi - lo + 1)
    for c in range(1, 16, 2):
        if (p*(p-1)*(c-1) + 12) % 16: continue
        s = lo + (c + 16 - lo % 16) % 16
        while s <= hi:
            cs[s - lo] = cost_q(p, P1, s); s += 16
    out = []; a = lo; acc = 0
    for i, x in enumerate(cs):
        acc += x + 0.02
        if acc >= chunk:
            out.append((a, lo + i)); a = lo + i + 1; acc = 0
    if a <= hi: out.append((a, hi))
    return p, out
if __name__ == "__main__":
    chunk = float(sys.argv[1])
    ps = [p for p in range(5, 578) if all(p % d for d in range(2, int(p**.5)+1))]
    with Pool(8) as pool:
        res = dict(pool.map(per_p, [(p, chunk) for p in ps]))
    json.dump({str(p): res[p] for p in ps}, open(sys.argv[2], "w"))
    print(len(ps), sum(len(v) for v in res.values()))
