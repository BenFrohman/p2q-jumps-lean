# Copyright (c) 2026 Benjamin Stanley Frohman. Apache 2.0.
# real-solution scan for N = r^2 s^2 t: solve N and phi equations for (t,q), check sigma residual sign change in s
from fractions import Fraction as F
def tq(p,r,s):
    M=r*r*s*s; f=r*s*(r-1)*(s-1); a=p*(p-1)
    # M t - p^2 q = 12 ; f t - a q = f - a + 12
    det = -M*a + p*p*f
    t = (12*(-a) + p*p*(f-a+12))/det
    q = (M*t-12)/(p*p)
    return t,q
def res(p,r,s):
    t,q=tq(p,r,s)
    return (r*r+r+1)*(s*s+s+1)*(t+1) - ((p*p+p+1)*(q+1)+12), t, q
for p in [101, 1009, 10007]:
    found=0
    for r in [p*1.5, p*3, p*10, p**1.2, p**1.4]:
        prev=None
        ss=[r*(1.01**k) for k in range(1,1500)]
        for s in ss:
            if r*s > p**3: break
            v,t,q=res(p,r,s)
            if prev is not None and (v>0)!=(prev[0]>0) and t>1 and q>1:
                print("p",p,"r",round(r),"s~",round(s),"t~",round(t,2),"q~",round(q), "t/p^2",round(t/p/p,3)); found+=1
            prev=(v,t,q)
    print(p,"sign changes",found)
