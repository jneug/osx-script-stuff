#!/usr/bin/env bash
# name:           Copy files
# apps:           Alfred
# description:    "Copies the passed in files to `folder`"
# parameters:
#     folder:     "The folder the files will be copied to, **default**: `~/Downloads`"
folder="~/Downloads"

IFS="	"
files="{query}"
for file in $files
do cp "$file" "$folder"
done
