# Lean kernel certificate

This file is not a certificate.

The only certificate of record for the current main-line v1.4.1 sources
(PR #12, head `033e12d`, merge `086a484`) is the official GitHub Actions
artifact from this repository's own `certify.yml` run, built with the
committed `lean-toolchain`, lakefile, and `lake-manifest.json`:

- commit: `033e12d2db946d625b409e726d358198a35ac8ff`
- merge onto main: `086a484092ae6366bc0c0b130d26a826db6d221d`
- Lean certificate run: https://github.com/BenFrohman/p2q-jumps-lean/actions/runs/45262293009
- artifact: `lean-certificate-033e12d2db946d625b409e726d358198a35ac8ff`
  (committed `lake-manifest.json` and its sha256, toolchain, elan/lake/lean
  versions, full build, sorry scan, and `#print axioms` logs)

The matching kernel re-check of every module on the same commit is:

- Kernel certificate run: https://github.com/BenFrohman/p2q-jumps-lean/actions/runs/45262293051
- artifact: `kernel-certificate`

A typed status line in this file, a local `lake build` log, an audit zip,
or the historical files under `paper/historical/` and `certificates/` is
not a certificate.

R2 and R3 remain open and are not proved. Conjecture 3 remains open.

Author: Benjamin Stanley Frohman
ORCID: 0009-0006-7068-3718
