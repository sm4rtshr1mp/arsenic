#! /bin/bash

host="$1"
shift

ar-mark-reviewed.sh "$host"
ar-update-flags.sh "$host" "Interesting"

while [ $# -gt 0 ]; do
    ar-update-flags.sh "$host" "$1"
    shift
done