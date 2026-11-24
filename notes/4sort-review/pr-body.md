Adds the final **last-mile 4-sort check**: the last job of every certify run. It compares every theorem-like environment of `paper/p2q-jumps-v1.4.tex` (including the `\input` locked files `theorem-L.tex`, `theorem-L2.tex`) with the kernel-checked Lean declarations, and sorts each into PROVED / WRONGLY-RETRACTED / OVERCLAIM / WORDING-DRIFT, with EXTERNAL and NOT-CLAIMED reported separately. If anything else turns up, it halts the run and names the claim, its `file:line`, the Lean name, statement and axioms, the class, the mismatch, and a fix route (PAPER-FIX / HUMAN / RE-REVIEW). It only reports and halts. CI never edits anything.

**Files**
- `scripts/final_4sort.py`: the checker. Python stdlib plus `lake env lean`; no network, no outside math tools, no file or line exclusions.
- `.github/workflows/final-4sort.yml`: a reusable workflow (`workflow_call`).
- `.github/workflows/certify.yml`: after a passed certify run, uploads `.lake/build/lib` as `lake-build-<sha>`, then runs `final-4sort` with `needs: certify` on those same oleans. Mathlib comes from cache and is never rebuilt. The report artifact is `4sort-report-<sha>` (md + json + Lean query log).
- `final-check/claim-map.json`: one entry per paper environment (124), with recorded alignment and pinned hashes of both sides.
- `FINAL_CHECK.md`: the classes, fix routes, the agent fix-the-paper-then-rerun loop, porting steps, and limits.

**Expected result on this PR: HALT.** That is honest, not a bug. A local preview against main's paper (086a484, kernel status from the CI certificate of 033e12d, Lean statements not compared) gives: PROVED 49, EXTERNAL 4, NOT-CLAIMED 21, WORDING-DRIFT 4 (route HUMAN), UNJUDGED 46 (route RE-REVIEW), WRONGLY-RETRACTED 0, OVERCLAIM 0. The CI run additionally halts every reviewed item as UNJUDGED "Lean statement not pinned" until the pins are recorded from this run's report (`--pin-from-report`), because this machine could not load Mathlib to pin them locally.

Against the pre-#12 paper (0b82cdd), the same check flags WRONGLY-RETRACTED on thm:L and thm:L2 ("pending" approval) and on thm:H1-comp ("is open"). Those are the drifts PR #12 fixed.

Not merging: for review.
