#!/usr/bin/env bash
# Run the real `lake build`, the sorry/axiom-declaration scan and the `#print axioms` audit
# (AxiomAudit.lean) from this repo's OWN committed lake-manifest.json and record the run verbatim
# (nothing excerpted, nothing hand-written).
#
# The ONLY certificate of record is the GitHub Actions artifact `lean-certificate-<commit sha>`
# uploaded by .github/workflows/certify.yml from a fresh CI run on the pushed commit. That run calls
# this script with CERT_OUT=cert-out.
#
# Run locally (no CERT_OUT, or not on GitHub Actions) the record goes to
#   local-dev-logs/<YYYYmmdd-HHMMSS-CT>-<commit>/   with NOT-THE-OFFICIAL-CERTIFICATE.txt.
# A local record is a development log only; it is never a certificate, whether it passed or not.
#
# Every run, pass or fail, records: lake-manifest.json and its sha256, lean-toolchain, lakefile,
# commit, Mathlib rev, elan / lake / lean versions, the full build log, the full scan output and the
# full #print axioms output, plus STATUS (PASS or FAILED) and SHA256SUMS.
# Usage: [CERT_OUT=dir] scripts/cert-bundle.sh [lake build targets...]   (default: whole package)
set -u
cd "$(git rev-parse --show-toplevel)"
commit=$(git rev-parse HEAD)
stamp=$(TZ=America/Chicago date +%Y%m%d-%H%M%S-CT)
official=0
if [ -n "${CERT_OUT:-}" ] && [ "${GITHUB_ACTIONS:-}" = "true" ]; then
  official=1; out="$CERT_OUT"
else
  out="local-dev-logs/${stamp}-${commit:0:7}"
fi
mkdir -p "$out"
finish() {  # $1 = PASS or FAILED, $2 = reason
  {
    echo "$1"
    echo "commit: $commit"
    echo "reason: $2"
  } > "$out/STATUS"
  if [ "$official" -eq 0 ]; then
    {
      echo "NOT THE OFFICIAL CERTIFICATE."
      echo "Local development log of a run on this machine (status: $1). The only certificate of record"
      echo "is the GitHub Actions artifact lean-certificate-<commit sha> from .github/workflows/certify.yml."
    } > "$out/NOT-THE-OFFICIAL-CERTIFICATE.txt"
  elif [ "$1" = PASS ]; then
    {
      echo "CERTIFICATE (GitHub Actions)"
      echo "commit: $commit"
      echo "run: ${GITHUB_SERVER_URL:-https://github.com}/${GITHUB_REPOSITORY:-}/actions/runs/${GITHUB_RUN_ID:-} (attempt ${GITHUB_RUN_ATTEMPT:-})"
      echo "lake build exit 0; sorry/axiom scan exit 0; #print axioms exit 0; only propext / Classical.choice / Quot.sound."
      echo "Built from the committed lake-manifest.json (sha256 in lake-manifest.json.sha256)."
    } > "$out/CERTIFICATE"
  else
    {
      echo "FAILED - NOT A CERTIFICATE."
      echo "Verbatim record of a CI attempt that did not pass: $2"
    } > "$out/FAILED-NOT-A-CERTIFICATE.txt"
  fi
  (cd "$out" && find . -maxdepth 1 -type f ! -name SHA256SUMS -printf '%f\n' | LC_ALL=C sort | xargs -d '\n' sha256sum > SHA256SUMS)
  echo "$out"
  [ "$1" = PASS ] && exit 0 || exit 1
}
cp lake-manifest.json lean-toolchain lakefile.* "$out/" 2>/dev/null
sha256sum lake-manifest.json > "$out/lake-manifest.json.sha256"
{
  echo "commit: $commit"
  echo "dirty_tracked_files: $(git status --porcelain --untracked-files=no | wc -l)"
  echo "lean-toolchain: $(cat lean-toolchain)"
  echo "lake-manifest.json sha256: $(sha256sum lake-manifest.json | cut -d' ' -f1)"
  echo "mathlib_rev: $(python3 -c "import json;print([p['rev'] for p in json.load(open('lake-manifest.json'))['packages'] if p['name']=='mathlib'][0])")"
  echo "elan: $(elan --version 2>&1)"
  echo "lake: $(lake --version 2>&1)"
  echo "lean: $(lake env lean --version 2>&1)"
  echo "github_run: ${GITHUB_RUN_ID:-none} attempt ${GITHUB_RUN_ATTEMPT:-none} event ${GITHUB_EVENT_NAME:-none} repo ${GITHUB_REPOSITORY:-none}"
  echo "started: $(TZ=America/Chicago date '+%Y-%m-%d %H:%M:%S %Z')"
  echo "targets: ${*:-<default>}"
} > "$out/env.txt"
# The manifest must be the committed one (no local edits).
if ! git diff --quiet HEAD -- lake-manifest.json; then
  finish FAILED "lake-manifest.json differs from the committed version (refused to build)"
fi
lake build "$@" > "$out/lake-build.log" 2>&1; b=$?
echo "lake_build_exit: $b" >> "$out/env.txt"
python3 scripts/check_no_sorry.py > "$out/scan-sorry-axiom.log" 2>&1; s=$?
echo "scan_exit: $s" >> "$out/env.txt"
lake env lean AxiomAudit.lean > "$out/print-axioms.log" 2>&1; a=$?
echo "print_axioms_exit: $a" >> "$out/env.txt"
echo "finished: $(TZ=America/Chicago date '+%Y-%m-%d %H:%M:%S %Z')" >> "$out/env.txt"
[ "$b" -eq 0 ] || finish FAILED "lake build exited $b"
[ "$s" -eq 0 ] || finish FAILED "scripts/check_no_sorry.py exited $s"
[ "$a" -eq 0 ] || finish FAILED "#print axioms (lake env lean AxiomAudit.lean) exited $a"
[ -s "$out/print-axioms.log" ] || finish FAILED "#print axioms output is empty"
std='depends on axioms: \[(propext|Classical\.choice|Quot\.sound)(, (propext|Classical\.choice|Quot\.sound))*\]$|does not depend on any axioms$'
if grep -vE "$std" "$out/print-axioms.log" | grep -q .; then
  finish FAILED "#print axioms output contains a non-standard axiom or other output"
fi
finish PASS "all checks passed"
