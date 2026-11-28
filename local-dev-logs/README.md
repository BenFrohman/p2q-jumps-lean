# local-dev-logs: NOT THE OFFICIAL CERTIFICATE

Records written by `scripts/cert-bundle.sh` on a local machine. They are development logs only,
whether the run passed or failed. The only certificate of record is the GitHub Actions artifact
`lean-certificate-<commit sha>` from a fresh `.github/workflows/certify.yml` run on the pushed commit,
built from the committed `lake-manifest.json`.
