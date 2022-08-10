#!/usr/bin/env bash

set -eu
set -o pipefail

echo "Running one-off merge job"

echo "Branch: $GITHUB_BRANCH"

echo "test $GITHUB_BRANCH | $GITHUB_HEAD_REF" >> bar

git config --global user.email "nsnshelly@gmail.com"
git config --global user.name "Nathan Shelly"

git add .
git commit -m 'test change'

git push --quiet https://"${AUTOCOMMIT_TOKEN}"@github.com/opendoor-labs/code.git \
  "$GITHUB_HEAD_REF"
