# Final 4-sort check (paper vs kernel-checked Lean)

Copyright (c) 2026 Benjamin Stanley Frohman. Licensed under Apache 2.0 (see LICENSE).

The last gate of every build. After `certify` has built the package from the committed
`lean-toolchain` and `lake-manifest.json` (Mathlib from cache, never rebuilt) and passed its sorry scan and
`#print axioms` audit, this job compares every theorem-like statement of the paper with the Lean
declarations that back it, and sorts each one into exactly one class.

| class | meaning | fails the run |
|---|---|---|
| PROVED | the paper states it as proved; a kernel-certified Lean theorem states exactly it (same hypotheses, quantifiers, ranges, symbols) | no |
| WRONGLY-RETRACTED | Lean proves it (theorem, 0 sorry, only `propext`, `Classical.choice`, `Quot.sound`), but the paper calls it open / conjectural / data / pending / retracted, or states it weaker | **yes** |
| OVERCLAIM | the paper presents it as proved, but no kernel-certified theorem backs it: name missing, a `def` (a statement, not a proof), `sorryAx`, or a non-standard axiom such as `Lean.ofReduceBool` (`native_decide`) | **yes** |
| WORDING-DRIFT | paper and Lean differ: Lean narrower, conditional or different; or either side changed since the alignment was recorded | **yes** |
| EXTERNAL | a cited external result or external data, in a labeled external section or carrying an explicit external marker, and not described as proved | no (reported separately) |
| NOT-CLAIMED | a conjecture, hypothesis or commentary stated as such, with no Lean proof of it | no (reported separately) |
| UNMAPPED / UNJUDGED / MAP-ORPHAN | the environment is not in the claim map, its alignment was never recorded, or the map names a claim the paper no longer has | **yes** |

PASS only if every claim is PROVED, EXTERNAL or NOT-CLAIMED. Otherwise the job exits 1 and prints a HALT
report with, for each item: the claim id, `file:line` in the paper, the Lean name and its statement and
axioms, the class, the exact mismatch, the status wording it found, and a **fix route**.

The job never edits anything. It never weakens a statement, never excludes files or lines, and uses no
outside tool (no PARI, LMFDB, SymPy, network). It is Python standard library plus `lake env lean`.

## Fix routes in the HALT report

| route | when | who |
|---|---|---|
| PAPER-FIX | WRONGLY-RETRACTED: Lean proves exactly what the paper says, or more | the agent fixes the paper |
| HUMAN | OVERCLAIM; or WORDING-DRIFT where Lean is narrower, conditional or different, so matching Lean would weaken or cloak the paper's claim | the author decides, or the missing part is formalized |
| RE-REVIEW | UNMAPPED, UNJUDGED, MAP-ORPHAN, or a pinned hash changed on either side | a reviewer records the alignment again; the item then routes as PAPER-FIX or HUMAN |

## The fix-then-rerun loop (agents)

CI only reports and halts. When the HALT report shows the paper behind Lean (route PAPER-FIX):

1. Fix the paper first: state the Lean theorem in the paper exactly, with every hypothesis, range and
   symbol, and remove the stale open / data / pending / retracted wording. Never weaken or cloak a claim.
2. Rebuild the PDF from the committed `.tex` and commit both (signed, author Benjamin Stanley Frohman).
3. Re-record the alignment in the claim map for the items you changed (new `paper_sha256`, `relation`
   `exact`, `reviewed`), after comparing the new text with the Lean statement printed in the report.
4. Rerun `python3 scripts/final_4sort.py` locally, then push once; the CI 4-sort on that commit is the
   record.

Route HUMAN items are never "fixed" by editing the paper down to Lean or by editing Lean: stop and ask the
author, or formalize the missing part. An OVERCLAIM is resolved by a kernel proof or by the author's
decision on the wording, never silently.

## Files

- `scripts/final_4sort.py`: the checker (Python 3 stdlib). `--seed` appends new environments to the
  claim map as UNJUDGED entries (it never changes a reviewed entry); `--no-lean` runs the paper-side checks
  only.
  `--pin-missing` records the current Lean statement for mapped declarations that have none yet (never
  overwrites a pin; use it while recording a review). `--pin-from-report 4sort-report.json` does the same
  from the report of a CI run (its live Lean query), for a machine that cannot load Mathlib. `--axioms-log <cert>/print-axioms.log` is a
  preview mode for an overloaded machine: kernel status comes from a CI certificate's `#print axioms`
  log and Lean statements are not compared; the report says so in its first line. Only the CI run with a
  live Lean query is the record.
- `final-check/claim-map.json`: configuration and one entry per paper environment.
- `.github/workflows/final-4sort.yml`: reusable workflow (`workflow_call`).
- `.github/workflows/certify.yml`: uploads `.lake/build/lib` as `lake-build-<sha>` after a passed certify
  run, then calls the reusable workflow with `needs: certify`. The report is uploaded as
  `4sort-report-<sha>` (markdown, JSON, console log, raw Lean query log) on every run, pass or halt.

## Claim map entry

```json
{
 "id": "thm:L2",                       // the \label, or nolabel:<env>:<sha12 of the statement>
 "kind": "theorem",
 "disposition": "proved",              // what the paper asserts: proved | open | external | commentary
 "lean": ["P2qJumps.Semantics.theorem_L2"],
 "relation": "exact",                  // exact | paper-weaker | lean-narrower | conditional | different | unjudged
 "paper_sha256": "...",                // sha256 of the normalized statement when the alignment was recorded
 "lean_expected": {"P2qJumps.Semantics.theorem_L2": "<pinned type, as Lean prints it>"},
 "reviewed": "who, date (America/Chicago)",
 "note": "what was compared"
}
```

Normalization of the paper statement: comments removed, `\label{..}` and the footnote macro `\lean{..}{..}`
removed (they are locations, not statement), whitespace collapsed. The environment's optional title is part
of the statement. `\input`/`\include` files are expanded, so a locked statement file such as
`paper/theorem-L.tex` is checked in place.

Status wording is searched in the statement itself, in the `\textbf{Status...}` paragraph right after it,
and in every sentence (or table cell) elsewhere in the paper that `\ref`s its label. References become
tokens first (`Conjecture~\ref{conj:vanish}` becomes `<REF>`, the claim's own label `<SELF>`; `\path` and
`\texttt` identifiers are dropped), so a reference to a conjecture or a Lean name such as
`conjecture_iff_H2_H3` is not itself a status word. Each status word is attributed to the nearest
reference before it in the same parenthesis group, so "`<SELF>` (not kernel-checked)" counts against the
claim and "the conjecture remains open (`<SELF>`, kernel-checked)" does not.

When a flagged sentence is correct (its status words are about another object), a reviewer may record it
under the claim's `reviewed_status_sentences` with the sha256 of the tokenized sentence and a reason. The
report still lists it as "acknowledged (reviewed, not hidden)", and any edit to the sentence re-flags it.

## Porting to another repository

1. Copy `scripts/final_4sort.py`, `.github/workflows/final-4sort.yml` and this file.
2. Create `final-check/claim-map.json` with a `config` block: `paper`, `envs`, `lean_imports` (the root
   module), `lean_open`, `external_sections` (section labels or titles), `retraction_macros`.
3. Add to the certify workflow the `lake-build-<sha>` upload and the `final-4sort` job (`needs: certify`).
4. Run `lake build`, then `python3 scripts/final_4sort.py --seed`, and review every entry: compare the
   paper statement with the pinned Lean statement, set `disposition`, `relation`, `reviewed`, `note`.
5. Make `final-4sort / final-4sort` a required status check on `main` in the repository settings.

## What it can and cannot catch

It catches: claims with no recorded alignment; any change to a paper statement or to a Lean statement after
the alignment was recorded; Lean names that do not exist, are definitions rather than theorems, or depend on
`sorryAx` or non-standard axioms; open / data / pending / retracted wording near a claim Lean proves; external
items described as proved or not labeled external; recorded narrower / conditional / different relations.

It cannot decide by itself that an English statement and a Lean type mean the same thing. That judgment is
recorded by a reviewer in the claim map (pinned to both texts), and the tool holds every later change to it.
It checks only theorem-like environments: claims made in running prose outside an environment are not
sorted (keep a prose ledger, such as `paper/PROSE-CLAIMS.md`, for those). The status-wording search is a
word-level heuristic: it can flag a clause whose open-language is about a different object, and it can miss
a downgrade phrased in words it does not list. It cannot recover intent the paper never wrote down.
