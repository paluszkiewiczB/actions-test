#!/bin/bash
set -eu

lastTag=$(git tag -l | tail -n 1)
version=${lastTag##*-}
major=${version%.*}
minor=${version#*.}
nextMinor=$((minor+1))

git tag "$major.$nextMinor"
