# Audit: false identity rad(N) = N / gcd(N, phi(N))  (16 Nov 2026)
Counterexample: N=12, phi=4, N/gcd=3, rad(12)=6. Only N/gcd(N,phi(N)) | rad(N) holds.
Searched (rg, case-insensitive, excluding .lake): repo Lean sources (P2qJumps/**, Cert/**), the v1.4 TeX,
the downloaded v1.3 TeX (p2q-jumps-v0.11-review2.tex), CERTIFICATE*.md, all *.py under /workspace
(patterns gcd(..phi/totient..), rad(, radical, N/gcd).
Result: no occurrence. The paper defines U = rad(N) directly and K = N/U (Lemma L2, Lemma K); no gcd formula.
rcw_vectorized_sieves.py: not present anywhere on the box (find /), so not audited.
Lean checkers: pairFastChunk evaluates sigma(n+12) by divisor pairing (sigSAux_eq_sigma, proved), no omega filter;
lineCheck / gstripLoop use only F8, L(p), gcd(m, p!) with proved soundness. None filters on omega or rad.
