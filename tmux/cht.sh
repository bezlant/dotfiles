#!/bin/bash

languages=$(echo "bash lua golang c cpp typescript rust" | tr " " "\n")
core_utils=$(echo "find fd xargs sed awk" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

read -rp "Query: " query

if echo "$languages" | grep -qs "$selected"; then
  tmux split-window -p 40 -h \
  bash -c \
  "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less"
else
  tmux split-window -p 40 -h \
  bash -c \
  "curl cht.sh/$selected~$query | less"
fi
