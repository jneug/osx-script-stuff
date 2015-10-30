#!/usr/bin/env bash

# Randomize filename with a 8 character long string
RAND=$(date +%s | sha256sum | base64 | head -c 8)
mv "$1" "$RAND.${1##*.}"
