# Truth Gate (p2q-jumps-lean)

**Status: paper_claim PENDING AUTHOR APPROVAL.**

The gate checks one thing: the Lean development proves the locked transcription `paper_claim` of the paper's
Theorem L. It says nothing beyond that statement.

| Piece | Location |
|---|---|
| Paper statement (locked file) | `paper/theorem-L.tex`, input into `paper/p2q-jumps-v1.4.tex`, Theorem L |
| Transcription | `P2qJumps.Semantics.paper_claim` (doc comment carries the verbatim quote, path, sha256, section) |
| Proved statements | `P2qJumps.Semantics.formal_claim` |
| Correspondence | `P2qJumps.Semantics.intended_correspondence : formal_claim ↔ paper_claim` (proved by unfolding and reordering; not `rfl`) |
| Public theorem | `P2qJumps.Semantics.theorem_L : paper_claim := intended_correspondence.mp formal_claim_holds` |
| Lock | `truth-gate.lock.json` (sha256 of the paper file and of each locked declaration's source) |
| Checker | `scripts/verify-lock.sh` (CI: `.github/workflows/truth-gate.yml`) |

`scripts/verify-lock.sh` rejects: a `paper_claim` that mentions `formal_claim` or any proof-side definition
(`Jumps`, `Theorem28`, `Lpoly`, `Cert.*`); an `rfl`/`Iff.rfl` correspondence; a public theorem not obtained via
`.mp`; a paper file or locked declaration whose sha256 differs from the lock; a missing quote; `sorry`, `admit`,
`native_decide` or `axiom` declarations; a failed `lake build`; any axiom other than `propext`,
`Classical.choice`, `Quot.sound`.

The `author-approval` CI job fails until `approval.approvedBy` in the lock names the author. Approval is set by
the author only; `scripts/make-lock.py` refuses to regenerate an approved lock. If the transcription is wrong,
fix the transcription (or the paper) and re-approve; never weaken the check.

Scope of Theorem L: conditional on both jumps at `n = p^2 q` with distinct primes `p, q`. It does not prove
Conjecture 3 (no `n = p^2 q` solution). The residual `r^3 s` beyond `p = 10^4`, `ω(N) ≥ 4` beyond
`n = 10^4`, and the other residual shapes of the paper's corrected classification remain open.
