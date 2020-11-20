#! /bin/bash

flag="$1"

ls hosts | while read host; do
  if [[ -z "$(ar-get-flags.sh "$host" | grep "$flag")" ]]; then
    continue
  fi
  echo "$host"
done