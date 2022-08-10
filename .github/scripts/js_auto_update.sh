#!/usr/bin/env bash

set -eu
set -o pipefail

echo "Running one-off merge job"

echo "TODO: kick off manual job here"

curl -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: token $AUTOCOMMIT_TOKEN" \
  https://api.github.com/repos/nathanshelly/test-gha-manual-workflow/actions/workflows/js-fix-merge-conflicts.yaml/dispatches \
  -d '{"ref":"main","inputs":{"branch":"foo", "name":"Mona the Octocat"}}'
