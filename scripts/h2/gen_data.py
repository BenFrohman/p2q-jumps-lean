"""Untrusted generator of H2 certificate data: for each prime 5 <= p < B, the factorization of
L(p) = p^3 - p^2 - 12 with stack-machine primality certificates (trial division for n < SMALL,
Pratt/Lucas otherwise)."""
import sys, json
from sympy import factorint, primerange, isprime
from sympy.ntheory import primitive_root
from multiprocessing import Pool
SMALL = 1 << 16
def witness(n, fs):
    # smallest a with a^(n-1)=1 and a^((n-1)/q) != 1 for all q
    for a in range(2, n):
        if pow(a, n-1, n) != 1: continue
        if all(pow(a, (n-1)//q, n) != 1 for q in fs): return a
    raise Exception(n)
def cert(n, out):
    """append instructions proving n prime; pushes exactly one entry (n)"""
    if n < SMALL:
        out.append(["s", n]); return
    f = factorint(n-1)
    qs = sorted(f)
    for q in qs: cert(q, out)
    # stack top is last pushed = qs[-1]; multiplicities listed top first
    out.append(["b", n, witness(n, qs), [f[q] for q in reversed(qs)]])
def per_p(p):
    L = p**3 - p**2 - 12
    f = factorint(L)
    a2 = f.pop(2, 0); a3 = f.pop(3, 0)
    out = []
    rs = sorted(f)
    for r in rs: cert(r, out)
    return [p, a2, a3, out, [f[r] for r in reversed(rs)]]
if __name__ == "__main__":
    B = int(sys.argv[1])
    ps = list(primerange(5, B))
    with Pool(6) as pool:
        res = pool.map(per_p, ps, chunksize=100)
    with open(sys.argv[2], "w") as fh:
        for r in res: fh.write(json.dumps(r) + "\n")
    nb = sum(sum(1 for i in r[3] if i[0] == "b") for r in res)
    ns = sum(sum(1 for i in r[3] if i[0] == "s") for r in res)
    print(len(res), "big", nb, "small", ns)
