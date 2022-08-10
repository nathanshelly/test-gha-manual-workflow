#!/usr/bin/env bash

set -eu
set -o pipefail

echo "Running one-off merge job"

root="$(git rev-parse --show-toplevel)"
cd "$root/js"

yarn install

npx @opendoor/awl dev:find_conflicts \
  --githubAuthToken "$AUTOCOMMIT_GITHUB_TOKEN" \
  --circleAuthToken "$CIRCLE_AUTH_TOKEN" \
  --submitWorkflows
