#!/bin/sh

cat "$1" | sed 's/ //g' | sort > tempfile1
cat "$2" | sed 's/ //g' | sort > tempfile2
cat "$3" | sed 's/ //g' | sort > tempfile3

join tempfile1 tempfile2 > tempfile4
join tempfile4 tempfile3 > tempfile5

cat tempfile5 | sed -E 's/([a-z])([A-Z])/\1 \2/g'

rm tempfile1 tempfile2 tempfile3 tempfile4 tempfile5