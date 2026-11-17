# Paper changes driven by the Lean formalization (v1.4)

Each entry: the claim, what changed (old text → new text), the method, the outcome, and why
Lean (or a computation) required it. **Scope change** marks any statement that became narrower
or conditional. Outcomes: *proved (kernel-checked)*, *verified (exhaustive computation, stated
range, not kernel-checked)*, *disproved (witness)*, *open (precise blocker)*.

## C1. Preamble facts (Prop. 2/3-divides-n, Cor. gcd, Prop. N not a square)

- **Claim (Thm "Closed shapes", preamble):** under both jumps, p, q ≥ 5, N odd, gcd(N, 6pq) = 1, N not a square.
- **Method:** Lean, `P2qJumps/Preamble.lean` (`preamble`, `p_ne_two`, `q_ne_two`, `p_ne_three`, `q_ne_three`, `totient_add_div_le`, `composite_small_A`, `sigma_odd_of_odd_square`).
- **Outcome:** proved (kernel-checked), standard axioms only. The written proofs in Part B were checked step by step and are correct; no statement changed.
- **Paper change:** new Part A section "Preamble facts" (label `sec:A-preamble`) with the Lean proof translated step by step.
  - Case p = 2: old text (Part B) argued via q + 3 = 2^k t and φ(t) = t + 2^{1−k}. New Part A text uses the Lean route: 2 | N gives φ(N) ≤ N/2 = 2q + 6 < 2q + 10. Both are correct; Part A follows Lean.
  - Lemma "cot" (A(m) ≥ m/r) is replaced in Part A by the Lean form φ(m) + ⌊m/r⌋ ≤ m and its consequence m < r(d + 1) for composite m with A(m) ≤ d (floor division made explicit; the written lemma used real division).
- **Scope change:** none.
