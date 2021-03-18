#!/bin/bash
set -eu

lastTag=$(git tag -l | tail -n 1)
version=${lastTag##*-}
echo "Current version is: $version"

major=${version%.*}
minor=${version#*.}
nextMinor=$((minor+1))
echo "Next version will be: $major.$nextMinor"

git tag "$major.$nextMinor"
git push origin --tags