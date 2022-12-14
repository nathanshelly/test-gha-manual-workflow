#!/usr/bin/env bash

set -eu
set -o pipefail

echo "Running one-off merge job"

git checkout "$GITHUB_BRANCH"

git status

echo "Branch: $GITHUB_BRANCH"

echo "test $GITHUB_BRANCH | $GITHUB_HEAD_REF" >> bar

cat bar

git config --global user.email "nsnshelly@gmail.com"
git config --global user.name "Nathan Shelly"

git add .
git commit -am 'test change'

git push --quiet https://"${AUTOCOMMIT_TOKEN}"@github.com/nathanshelly/test-gha-manual-workflow.git \
  "$GITHUB_BRANCH"
