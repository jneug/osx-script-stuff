#!/usr/bin/env bash
base=$(basename "$1")
name=${base%.*}

spctl --add --label "$name" "$1"
open "$1"
