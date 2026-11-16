import cypari2
pari = cypari2.Pari(); pari.allocatemem(2*10**9)
E = pari.ellinit([0,-1,0,0,-12]); N=3936
wE = int(pari.ellrootno(E))
def kron(a,b): return int(pari.kronecker(a,b))
tested=fail=0; fails=[]; noncop={'agree':0,'disagree':0}; ex_nc=[]
B=5000
for D in range(-B,B+1):
    if D in (0,1) or not pari.isfundamental(D): continue
    Et = pari.ellinit(pari.elltwist(E,D))
    w = int(pari.ellrootno(Et))
    pred = -kron(-N, abs(D))
    if pari.gcd(D,N)==1:
        tested+=1
        if w!=pred: fail+=1; fails.append((D,w,pred))
    else:
        if w==pred: noncop['agree']+=1
        else:
            noncop['disagree']+=1
            if len(ex_nc)<12: ex_nc.append((D,w,pred))
print("w(E) =", wE)
print(f"fundamental D, 1<|D|<={B}, gcd(D,3936)=1: tested={tested} failures={fail}", fails[:10])
print("fundamental D NOT coprime to 3936:", noncop, "sample disagreements (D, w(E^D), -(-3936/|D|)):", ex_nc)
