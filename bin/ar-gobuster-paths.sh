#! /bin/bash

host="$1"
depth=1
if [ $# -eq 2 ]; then
  depth=$2
fi

if [ $depth -le 0 ]; then
  depth=1
fi

run(){
  cat hosts/$host/recon/gobuster.* | awk '{print $1}' | sed 's|http\(s\?\)://||' | awk -F / '{$1=""; print $0}' | sed 's/^\s*//g' | while read path; do
    parts=$(echo "$path" | sed 's/\s/\n/g')
    count=$(echo "$parts" | wc -l)
    if [ $count -lt $depth ]; then
      continue
    fi

    echo /$(echo "$parts" | head -n $depth) | sed 's/\s/\//g'
  done
}

if [[ "$host" == "-" ]]; then
  while read host; do
    host=$(echo "$host" | sed 's|https://||' | awk -F / '{print $1}')
    run
  done | sort -u
else
  run | sort -u
fi