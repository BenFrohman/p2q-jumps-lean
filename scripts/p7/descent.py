# Copyright (c) 2026 Benjamin Stanley Frohman. Apache 2.0.
# Squarefree p = 7 descent (paper Appendix app:p7), exact integer arithmetic.
# Usage: python3 descent.py K [--pmin P] [--prune]
#   --pmin 5            reproduces the paper's search domain (primes >= 5, != 7)
#   --pmin 11 (default) uses P2qJumps.p7_omega4_ge11 (every prime factor >= 11)
#   --prune             adds the prefix bound P2qJumps.p7_prefix_bound
import argparse
from sympy import isprime, nextprime, primerange
from math import isqrt
ap=argparse.ArgumentParser(); ap.add_argument('K',type=int)
ap.add_argument('--pmin',type=int,default=11); ap.add_argument('--prune',action='store_true')
args=ap.parse_args()
K=args.K; PMIN=args.pmin; PRUNE2=args.prune
assert PMIN>=5
nodes=0; sols=[]; maxbound=0; pruned2=0
def ok_phi(h,b,r,m):  # 7h(r-1)^m < 6b r^m
    return 7*h*(r-1)**m < 6*b*r**m
def ok_sig(s,b,r,m):  # 49s(r+1)^m > 57b r^m
    return 49*s*(r+1)**m > 57*b*r**m
def check_full(N,ps):
    ph=1;sg=1
    for x in ps: ph*=x-1; sg*=x+1
    return 7*ph==6*N-282 and 49*sg==57*N+2697
def terminal(b,h,s,last,ps):
    f=7*h;A=6*b;g=49*s;B=57*b
    det=2*f*g-A*g-B*f
    if det==0:
        raise Exception('singular')
    Pn=(-282-f)*g+f*(2697-g)
    if Pn%det: return
    P=Pn//det
    # S from f(P-S+1)=AP-282 -> S = P+1-(AP-282)/f
    t=A*P-282
    if t%f: return
    S=P+1-t//f
    D=S*S-4*P
    if D<0: return
    sq=isqrt(D)
    if sq*sq!=D: return
    x=(S-sq)//2;y=(S+sq)//2
    if x>last and x<y and isprime(x) and isprime(y):
        if check_full(b*x*y,ps+[x,y]): sols.append(ps+[x,y])
def enum_products(b,h,s,last,m,Mmax,ps):
    # enumerate increasing m-tuples of primes > last with product <= Mmax
    global nodes
    def rec(start,m,prod,cur):
        global nodes
        if m==0:
            N=b*prod
            if check_full(N,ps+cur): sols.append(ps+cur)
            return
        r=start
        while True:
            r=nextprime(r)
            if prod*r**m>Mmax: break
            nodes+=1
            rec(r,m-1,prod*r,cur+[r])
    rec(last,m,1,[])
def descend(b,h,s,last,m,ps):
    global nodes,maxbound
    nodes+=1
    if m==2:
        terminal(b,h,s,last,ps); return
    d=6*b-7*h; e=49*s-57*b
    if d>=1:
        # M < 282/d, but M >= product of m>=3 primes > last >=... impossible if small
        Mmax=(281)//d
        enum_products(b,h,s,last,m,Mmax,ps); return
    if e>=1:
        Mmax=2696//e
        enum_products(b,h,s,last,m,Mmax,ps); return
    if d==0 or e==0: return  # impossible since 7 !| b
    if PRUNE2 and 342*b*b-343*h*s>=1:
        # p7_prefix_bound: M <= 872, but M >= 11*13*17 = 2431 (m >= 3 primes >= 11)
        assert PMIN>=11
        global pruned2; pruned2+=1; return
    # find upper bound for next prime r
    lo=max(last+1,PMIN)
    # need ok_phi and ok_sig; both monotone: ok_phi true for small r, ok_sig true for small r
    hi=lo
    while ok_phi(h,b,hi,m) and ok_sig(s,b,hi,m): hi*=2
    L,R=lo,hi  # find max r with both true
    if not (ok_phi(h,b,lo,m) and ok_sig(s,b,lo,m)): return
    while R-L>1:
        mid=(L+R)//2
        if ok_phi(h,b,mid,m) and ok_sig(s,b,mid,m): L=mid
        else: R=mid
    maxbound=max(maxbound,L)
    for r in primerange(lo,L+1):
        if r==7: continue
        descend(b*r,h*(r-1),s*(r+1),r,m-1,ps+[r])
descend(1,1,1,PMIN-1,K,[])
print('k=%d pmin=%d prune=%s nodes=%d maxbound=%d sols=%s pruned=%d'%(K,PMIN,PRUNE2,nodes,maxbound,sols,pruned2))
