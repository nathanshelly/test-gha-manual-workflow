#!/usr/bin/env bash

set -eu
set -o pipefail

echo "Running one-off merge job"

root="$(git rev-parse --show-toplevel)"
cd "$root/js"

yarn install
git config --global user.email "developers@opendoor.com"
git config --global user.name "Code CI User"
npx @opendoor/awl dev:fix_conflicts --merge

git push --quiet https://"${AUTOCOMMIT_GITHUB_TOKEN}"@github.com/opendoor-labs/code.git \
  "$GITHUB_HEAD_REF"
