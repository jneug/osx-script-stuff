#!/usr/bin/env bash
IFS="	"
files="{query}"
for file in $files
do mv "$file" "`dirname \"$file\"`/`date '+%Y-%m-%d'`_`basename \"$file\"`"
done
