# Full Handoff: Sage MW Ranks + Elliptic Residual Evidence (2026-11-13)

## Purpose
Package for GitHub Actions and Zenodo bots to complete PR/merge and publication.
Nothing left out.

## Sage Results (k = 1 to 20)
Family: E_k : y^2 = 27*k*(x^3 - 3*x - 326)

- Rank 0 (no integral points): k=5,7,9,10,12,20
- Rank 1: k=1,2,3,8,14,15,16,18
- Rank 2: k=17
- Sha[2] obstruction (lower bound only): k=4,6,11,13,19

Integral points found:
- k=1: (22 : -8 : 1)
- k=8: (57 : -279 : 1), (84 : -684 : 1)
- k=14: (1506 : -58428 : 1)

**Verification**: None of these points give integer p = (X+1)/3. Therefore none produce a residual prime pair p < r < p^{3/2}.

Consistent with pure-Python residual emptiness to p ≤ 15 000.

## Zenodo
- Concept DOI: 10.5281/zenodo.22713135
- Latest published: Version 1.3 (record 24180774)
- Draft with strengthened TeX: record 24180777 (p2q-jumps-v0.16-sage-ranks.tex uploaded, not published)
- Token used: dook (provided by user)

## Lean Status
Paper rule: never publish until accompanying Lean certificates exist.
Current repo has Theorem 28 and structural lemmas kernel-verified.
Elliptic-rank certificate for the R2 residual is **not yet formalized**.

## Manuscript Status
Strengthened TeX includes elliptic packaging of R2 as finiteness reduction + computational evidence.
Full vanishing of n=p²q remains open (reduced to R2/R3).

## Next Actions for Bots
1. Replace placeholder paper/p2q-jumps-v0.15-family-search.tex with real content if still placeholder.
2. Include this note and Sage verification in PR.
3. For Zenodo: publish draft 24180777 only after Lean certificate for ranks exists, or publish as computational update with clear non-closure language.
4. CI must pass lake build with 0 sorry.

Author responsible for every theorem, computation, and error.
