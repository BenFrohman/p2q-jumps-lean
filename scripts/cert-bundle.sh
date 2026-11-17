#!/usr/bin/env bash
# Run a real `lake build` + `#print axioms` audit from this repo's OWN committed
# lake-manifest.json and package the result (pass, fail or partial) as a certificate bundle:
#   certificates/attempts/<YYYYmmdd-HHMMSS-CT>-<commit>/
# Nothing in the bundle is hand-written: every file is copied or captured verbatim.
# Usage: scripts/cert-bundle.sh [lake build targets...]   (default: whole package)
set -u
cd "$(git rev-parse --show-toplevel)"
commit=$(git rev-parse HEAD)
stamp=$(TZ=America/Chicago date +%Y%m%d-%H%M%S-CT)
out="certificates/attempts/${stamp}-${commit:0:7}"
mkdir -p "$out"
# The manifest must be the committed one (no local edits).
if ! git diff --quiet HEAD -- lake-manifest.json; then
  echo "lake-manifest.json differs from the committed version; refusing" | tee "$out/REFUSED"; exit 2
fi
cp lake-manifest.json lean-toolchain lakefile.* "$out/" 2>/dev/null
sha256sum lake-manifest.json > "$out/lake-manifest.json.sha256"
{
  echo "commit: $commit"
  echo "dirty_tracked_files: $(git status --porcelain --untracked-files=no | wc -l)"
  echo "lean-toolchain: $(cat lean-toolchain)"
  echo "mathlib_rev: $(python3 -c "import json;print([p['rev'] for p in json.load(open('lake-manifest.json'))['packages'] if p['name']=='mathlib'][0])")"
  echo "elan: $(elan --version 2>&1)"
  echo "lake: $(lake --version 2>&1)"
  echo "lean: $(lake env lean --version 2>&1)"
  echo "started: $(TZ=America/Chicago date '+%Y-%m-%d %H:%M:%S %Z')"
  echo "targets: ${*:-<default>}"
} > "$out/env.txt"
lake build "$@" > "$out/lake-build.log" 2>&1; b=$?
echo "lake_build_exit: $b" >> "$out/env.txt"
if [ -f AxiomAudit.lean ]; then
  lake env lean AxiomAudit.lean > "$out/print-axioms.log" 2>&1; a=$?
  echo "print_axioms_exit: $a" >> "$out/env.txt"
fi
echo "finished: $(TZ=America/Chicago date '+%Y-%m-%d %H:%M:%S %Z')" >> "$out/env.txt"
(cd "$out" && sha256sum $(ls | grep -v SHA256SUMS) > SHA256SUMS)
echo "$out"
exit $b
