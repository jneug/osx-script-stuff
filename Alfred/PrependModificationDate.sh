#!/usr/bin/env bash
IFS="	"
files="{query}"
for file in $files; do
mtime=`date -j -f "%s" "$(stat -f '%m' \"$file\")" +"%F"`
mv "$file" "`dirname \"$file\"`/${mtime}_`basename \"$file\"`"
done
