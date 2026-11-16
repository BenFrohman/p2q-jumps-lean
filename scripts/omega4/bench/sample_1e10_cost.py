import time, random, cypari2
pari=cypari2.Pari(); pari.allocatemem(2*10**9)
random.seed(1)
# 1) pair count
t=time.time()
P=[int(x) for x in pari.primes([5,10**5])]
pi10=455052511  # pi(10^10), standard value
# sum pi(p^2) for p<=1e5 estimated with PARI primepi for small p and Li for large
def li(x): return x/ (__import__("math").log(x)-1.0)
S=0.0
for p in P:
    S+= li(p*p)
pairs=len(P)*pi10 - S
print("primes p<=1e5:",len(P),"pairs ~ %.3e"%pairs, "(%.1fs)"%(time.time()-t))
# 2) pre-sieve survival and factor cost: sample p in buckets, random q near 1e10
for p in [11, 101, 1009, 10007, 99991]:
    rs=[int(r) for r in pari.primes([5,p-1])]
    inv={r:(-12*pow(p*p,-1,r))%r for r in rs}
    tested=surv=0; tf=0.0; omega4=0; t0=time.time()
    while time.time()-t0<15:
        q=int(pari.nextprime(random.randint(p*p+1 if p*p<10**10 else 10**10-10**8, 10**10)))
        if q>10**10: continue
        tested+=1
        if any(q%r==inv[r] for r in rs): continue
        surv+=1
        N=p*p*q+12
        a=time.perf_counter(); f=pari.factor(N); tf+=time.perf_counter()-a
        pr=[int(x) for x in f[0]]
        if min(pr)>p and len(pr)>=4: omega4+=1
    print(f"p={p}: tested {tested}, presieve survival {surv/tested:.4f}, mean PARI factor time {tf/max(surv,1)*1e6:.0f} us, omega>=4 & all>p fraction of survivors {omega4/max(surv,1):.4f}")
