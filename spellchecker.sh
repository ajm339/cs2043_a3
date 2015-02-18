#! /bin/bash

for word in $@
do
	if grep -qiw "^$word$" english.txt; then
		continue
	else
		echo $word
	fi
done