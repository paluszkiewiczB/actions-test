#!/bin/bash
set -eu

git tag
git tag -l | tail -n 1
lastTag=$(git tag -l | tail -n 1)
echo "lastTag: $lastTag"
version=${lastTag##*-}
major=${version%.*}
minor=${version#*.}
echo "major: $major, minor: $minor"
nextMinor=$((minor+1))

echo "next version: $major.$nextMinor"

git tag "$major.$nextMinor"
