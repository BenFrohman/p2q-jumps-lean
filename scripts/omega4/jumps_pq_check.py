"""Assumption-free external check of both jumps at n = p^2 q (no omega filter, no prime-factor > p filter).

Mode A: distinct primes 5 <= p, q <= QA (default 10^4).
Mode B: primes 5 <= p <= PB, p^2 < q <= QB (default PB = 997, QB = 10^6): same range as search_omega4_1e6.py.
phi, sigma of N = p^2 q + 12 from PARI factorization (cypari2). Not kernel-checked.
Primes 2, 3 are skipped: the paper's Corollary (gcd(N, 6pq) = 1) excludes them; mode A also runs p, q in {2, 3}.
"""
import sys, time
import cypari2
pari = cypari2.Pari()
pari.allocatemem(10**9)

def jumps(p, q):
    n = p * p * q
    N = n + 12
    fN = pari.factor(N)
    phiN = int(pari.eulerphi(fN)); sigN = int(pari.sigma(fN))
    phin = p * (p - 1) * (q - 1); sign = (p * p + p + 1) * (q + 1)
    return phiN == phin + 12 and sigN == sign + 12

mode = sys.argv[1]
t0 = time.time(); hits = []; count = 0
if mode == "A":
    QA = int(sys.argv[2]) if len(sys.argv) > 2 else 10**4
    P = [int(x) for x in pari.primes([2, QA])]
    for p in P:
        for q in P:
            if p != q:
                count += 1
                if jumps(p, q): hits.append((p, q))
    print(f"mode A: distinct primes 2 <= p, q <= {QA}: pairs={count} hits={hits}")
else:
    PB = int(sys.argv[2]) if len(sys.argv) > 2 else 997
    QB = int(sys.argv[3]) if len(sys.argv) > 3 else 10**6
    for p in [int(x) for x in pari.primes([5, PB])]:
        for q in [int(x) for x in pari.primes([p * p + 1, QB])]:
            count += 1
            if jumps(p, q): hits.append((p, q))
    print(f"mode B: primes 5 <= p <= {PB}, p^2 < q <= {QB}: pairs={count} hits={hits}")
print(f"elapsed_s {time.time() - t0:.1f}")
