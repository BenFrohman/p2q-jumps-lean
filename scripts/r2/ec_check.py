import cypari2
pari = cypari2.Pari()
pari.allocatemem(2*10**9)
print("PARI version:", pari('version()'))
E = pari.ellinit([0,-1,0,0,-12])
print("conductor:", pari.ellglobalred(E)[0])
print("disc:", E[11], "factor:", pari.factor(E[11]))
print("j:", E[12])
print("analytic rank (ellanalyticrank):", pari.ellanalyticrank(E))
print("root number w(E):", pari.ellrootno(E))
for P in ([4,6],[4,-6],[12388,1378746],[12388,-1378746]):
    print(P, "on curve:", pari.ellisoncurve(E,P))
print("ellheight(4,6) [PARI]:", pari.ellheight(E,[4,6]))
print("ellrank:", pari.ellrank(E))
print("torsion:", pari.elltors(E))
# relation 12388 point vs generator
G=[4,6]
for n in range(-6,7):
    Q=pari.ellmul(E,G,n)
    print(n, Q)
