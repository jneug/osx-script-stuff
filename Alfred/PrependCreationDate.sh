#!/usr/bin/env bash
# name:           Prepend with creation date
# apps:           Alfred
# description: >
#                 Prepends the selected filename with the creation date.
# parameters:

IFS="	"
files="{query}"
for file in $files
do mv "$file" "`dirname \"$file\"`/`date '+%Y-%m-%d'`_`basename \"$file\"`"
done
