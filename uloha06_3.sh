#!/bin/sh

f1() { awk 'BEGIN {FS=","}{print NF-1,$1}'; }
f2() { awk '{if (NR == 1) {max = $1;print $2} else {if (max == $1) {print $2}}}'; }

cat "$1" | sed 's/:[a-z]:[0-9]*:/,/g' | f1 | sort -r | f2