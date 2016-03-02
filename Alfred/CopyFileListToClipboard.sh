#!/usr/bin/env bash
# name:           List files
# apps:           Alfred
# description: >
#                 Copies a list of all files in the selected
#                 folder to the clipboard.
# parameters:

ls -A -1 "{query}" | pbcopy
