#!/usr/bin/env bash
# Run the real `lake build` + `#print axioms` audit (AxiomAudit.lean) from this repo's OWN committed
# lake-manifest.json and save the verbatim record of the run.
#
#   PASS  (lake build exit 0 AND #print axioms exit 0 AND only propext / Classical.choice /
#          Quot.sound):  certificates/passed/<YYYYmmdd-HHMMSS-CT>-<commit>/  with a CERTIFICATE file.
#   anything else:       certificates/attempt-logs/<YYYYmmdd-HHMMSS-CT>-<commit>/  with
#                        FAILED-NOT-A-CERTIFICATE.txt. Such a record certifies nothing.
#
# Only directories under certificates/passed/ are certificates. Nothing here is hand-written:
# every file is copied or captured verbatim.
# Usage: scripts/cert-bundle.sh [lake build targets...]   (default: whole package)
set -u
cd "$(git rev-parse --show-toplevel)"
commit=$(git rev-parse HEAD)
stamp=$(TZ=America/Chicago date +%Y%m%d-%H%M%S-CT)
name="${stamp}-${commit:0:7}"
tmp=$(mktemp -d)
fail() {
  mkdir -p certificates/attempt-logs
  out="certificates/attempt-logs/${name}"
  mv "$tmp" "$out"
  {
    echo "FAILED - NOT A CERTIFICATE."
    echo "This is the verbatim log of a build attempt that did not pass: $1"
    echo "It certifies nothing."
  } > "$out/FAILED-NOT-A-CERTIFICATE.txt"
  (cd "$out" && sha256sum $(ls | grep -v SHA256SUMS) > SHA256SUMS)
  echo "$out"
  exit 1
}
# The manifest must be the committed one (no local edits).
if ! git diff --quiet HEAD -- lake-manifest.json; then
  fail "lake-manifest.json differs from the committed version (refused to build)"
fi
cp lake-manifest.json lean-toolchain lakefile.* "$tmp/" 2>/dev/null
sha256sum lake-manifest.json > "$tmp/lake-manifest.json.sha256"
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
} > "$tmp/env.txt"
lake build "$@" > "$tmp/lake-build.log" 2>&1; b=$?
echo "lake_build_exit: $b" >> "$tmp/env.txt"
lake env lean AxiomAudit.lean > "$tmp/print-axioms.log" 2>&1; a=$?
echo "print_axioms_exit: $a" >> "$tmp/env.txt"
echo "finished: $(TZ=America/Chicago date '+%Y-%m-%d %H:%M:%S %Z')" >> "$tmp/env.txt"
[ "$b" -eq 0 ] || fail "lake build exited $b"
[ "$a" -eq 0 ] || fail "#print axioms (lake env lean AxiomAudit.lean) exited $a"
[ -s "$tmp/print-axioms.log" ] || fail "#print axioms output is empty"
std='depends on axioms: \[(propext|Classical\.choice|Quot\.sound)(, (propext|Classical\.choice|Quot\.sound))*\]$|does not depend on any axioms$'
if grep -vE "$std" "$tmp/print-axioms.log" | grep -q .; then
  fail "#print axioms output contains a non-standard axiom or other output"
fi
mkdir -p certificates/passed
out="certificates/passed/${name}"
mv "$tmp" "$out"
{
  echo "CERTIFICATE"
  echo "commit: $commit"
  echo "lake build exit 0; #print axioms exit 0; only propext / Classical.choice / Quot.sound."
  echo "Built from the committed lake-manifest.json (sha256 in lake-manifest.json.sha256)."
} > "$out/CERTIFICATE"
(cd "$out" && sha256sum $(ls | grep -v SHA256SUMS) > SHA256SUMS)
echo "$out"
exit 0
