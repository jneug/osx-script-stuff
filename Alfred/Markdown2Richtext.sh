#!/usr/bin/env bash
# name:           Compile CommonMark to RTF
# apps:           Alfred, CommonMark, Markdown, Tag
# description: >
#                 Converts any markdown file to rich text using
#                 CommonMark (http://commonmark.org) and copies all tags with
#                 tag (https://github.com/jdberry/tag/).
# parameters:

IFS="	"
files="{query}"
for file in $files; do
newfile="${file%.*}.rtf"
/usr/local/bin/pandoc -r commonmark -w rtf -s -out "$newfile" "$file"
tags=`/usr/local/bin/tag -N "$file"`
/usr/local/bin/tag --set $tags "$newfile"
done
