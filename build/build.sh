#!/bin/bash

set -e

# Get rid of existing binaries
rm -f dist/$PROJECT_NAME*

echo "Building default binary"

# Set GOPATH and GOBIN
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/src/$PKG_SRC/dist"

# get git hash, short and long and commit date
LONG_HASH=$(git log -n1 --pretty="format:%H" | cat)
SHORT_HASH=$(git log -n1 --pretty="format:%h"| cat)
BUILD_DATE=$(date "+%D/%H/%I/%S"| sed -e "s/\//-/g")

# ldflags to set version hash and commit hash in version pkg
FLAGS="-X $PKG_SRC/pkg/version.hash=$LONG_HASH -X $PKG_SRC/pkg/version.short=$SHORT_HASH -X $PKG_SRC/pkg/version.build=$BUILD_DATE"

# Build the default application
CGO_ENABLED=0 go install -v -ldflags "$FLAGS" ./...

