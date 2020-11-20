#! /bin/bash

host="$1"
ar-mark-reviewed.sh "$host"
ar-update-flags.sh "$host" "unresponsive"