#! /bin/bash

# check if file or series of words
if [ -f $1 ]
then
	cat $1 | while read LINE
	do
		for word in $LINE
		do
			word=$(echo $word | sed 's/[[:punct:]]//g')
			if grep -qiw "^$word$" english.txt; then
				continue
			else
				echo $word
			fi
		done
	done
else
	for word in $@
	do	word=$(echo $word | sed 's/[[:punct:]]//g')
		if grep -qiw "^$word$" english.txt; then
			continue
		else
			echo $word
		fi
	done
fi
