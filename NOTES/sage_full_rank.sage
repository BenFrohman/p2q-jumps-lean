# Full MW ranks + integral points for the R2 residual family
# Paste into https://sagecell.sagemath.org/

from sage.all import *

print("Full MW ranks and integral points for R2 residual curves")
print("E_k : y^2 = 27*k*(x^3 - 3*x - 326)")
print("=" * 60)

for k in range(1, 21):
    E = EllipticCurve([0, 0, 0, 27*k*(-3), 27*k*(-326)])
    rank = E.rank()
    points = E.integral_points()
    print(f"k={k:2d}: rank={rank}, #integral points={len(points)}")
    if points:
        print(f"         points: {points}")

print("=" * 60)
print("Done.")
