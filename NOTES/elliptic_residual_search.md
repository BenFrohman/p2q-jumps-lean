## Elliptic curve residual search for Hypothesis R2 (updated November 2026)

The residual condition for Hypothesis R2 is equivalent to finding integral points on the family of elliptic curves

\[ E_k : Y^2 = 27 k (X^3 - 3 X - 326) \]

with \( X = 3p - 1 \) and primes \( p < r < p^{3/2} \).

### Computational findings (pure Python + sympy)
- Exhaustive search over all primes \( p \le 15000 \): **zero** cases where there exists a prime \( r \) in the strip such that \( r^2 \) divides \( p^3 - p^2 - 12 \).
- Integer-point searches for \( 1 \le k \le 100 \) and \( |X| \le 5000 \): only non-prime points recovered. No valid residual prime pairs.

### Next steps
Full Mordell-Weil rank and integral_points computations require SageMath or Magma (script prepared in session). Effective height bounds can close remaining cases.

These findings strengthen the computational evidence for the emptiness of the residual. The elliptic framing is a finiteness reduction via Siegel's theorem.

Prepared with assistance from Grok collaboration.
