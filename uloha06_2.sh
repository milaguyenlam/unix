#!/bin/sh

f1() {
awk '
BEGIN {
FS="\""
}
{print $2}
'
}

cat "$1" | f1 | sed 's/ /$/g' | sort > tempfile1
cat "$2" | f1 | sed 's/ /$/g' | sort > tempfile2

join tempfile1 tempfile2 > tempfile3

cat tempfile3 | sed 's/\$/ /g'

rm tempfile1 tempfile2 tempfile3