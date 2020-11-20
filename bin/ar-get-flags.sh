#! /bin/bash

host="$1"
split_by_comma_regex="s/,/\n/g"
remove_quotes_regex='s/"//g'
get_flags_regex='s/.*\[\(.*\)\]/\1/'

if [ ! -f hosts/$host/README.md ]; then
  exit
fi

grep -P "^flags" hosts/$host/README.md | sed "$get_flags_regex;$remove_quotes_regex;$split_by_comma_regex"