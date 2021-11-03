#!/bin/bash
set -e

if test -z "$1"; then
    latestRcTag=$(git tag --sort=-version:refname | grep "\-rc$" | head -n 1)
else
    latestRcTag="$1"
fi

pattern="^[0-9]+\.[0-9]+\.[0-9]+\-rc$" 
if [[ ! $latestRcTag =~ $pattern ]]; then
    echo "release candidate does not match expected pattern"
    exit 1
fi

echo $latestRcTag