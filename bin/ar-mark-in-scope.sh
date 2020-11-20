#! /bin/bash

host="$1"
ar-update-flags.sh "$host" "in scope"
ar-mark-reviewed.sh "$host"