#!/usr/bin/env bash
# name:           Compile CommonMark
# apps:           Alfred, CommonMark, Markdown, Tag
# description: >
#                 Converts any markdown file to html using
#                 CommonMark (http://commonmark.org) and
#                 copies all tags with tag (https://github.com/jdberry/tag/).
# parameters:

IFS="	"
files="{query}"
for file in $files; do
newfile="${file%.*}.html"
/usr/local/bin/cmark -t html --safe "$file" > "$newfile"
tags=`/usr/local/bin/tag -N "$file"`
/usr/local/bin/tag --set $tags "$newfile"
done
