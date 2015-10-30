# Converts any markdown file to html using
# CommonMark (http://commonmark.org) and copies all tags with
# tag (https://github.com/jdberry/tag/).
target="${1%.*}.html"
/usr/local/bin/cmark -t html --safe "$file" > "$target"
tags=`/usr/local/bin/tag -N "$file"`
/usr/local/bin/tag --set $tags "$target"
