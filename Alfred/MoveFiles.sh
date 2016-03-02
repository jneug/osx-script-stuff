#!/usr/bin/env bash
# name:           Move files
# apps:           Alfred
# description:    "Moves the passed in files to `folder`"
# parameters:
#     folder:     "The folder the files will be moved to, **default**: `~/Downloads`"
folder="~/Downloads"

IFS="	"
files="{query}"
for file in $files
do mv "$file" "$folder"
done
