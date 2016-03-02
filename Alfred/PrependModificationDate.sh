#!/usr/bin/env bash
# name:           Prepend with modification date
# apps:           Alfred
# description: >
#                 Prepends the selected filename with the date
#                 of the last modification.
# parameters:

IFS="	"
files="{query}"
for file in $files; do
mtime=`date -j -f "%s" "$(stat -f '%m' \"$file\")" +"%F"`
mv "$file" "`dirname \"$file\"`/${mtime}_`basename \"$file\"`"
done
