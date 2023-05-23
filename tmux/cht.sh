#!/bin/bash

languages=$(echo "bash lua golang c cpp typescript rust" | tr " " "\n")
core_utils=$(echo "find fd xargs sed awk" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

read -rp "Query: " query

if echo "$languages" | grep -qs "$selected"; then
  bash -c \
  "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less"
else
  bash -c \
  "curl cht.sh/$selected~$query | less"
fi
