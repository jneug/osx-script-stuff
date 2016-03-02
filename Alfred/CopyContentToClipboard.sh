#!/usr/bin/env bash
# name:           Copy content
# apps:           Alfred
# description: >
#                 Copies the content of the selected file
#                 to the clipboard.
# parameters:

cat "{query}" | pbcopy
