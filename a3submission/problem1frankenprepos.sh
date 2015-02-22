#! /bin/bash

# separate each word into it's own line
cat frankenstein.txt | tr '[[:space:]]' '\n' > temp.txt

# random notice... uses -- as a way to separate things, not necessary, but cleaner
cat temp.txt | sed 's/--/\n/g' > temp1.txt

# now, get rid of punctuation, but only if it is the last thing or the first thing
cat temp1.txt | sed 's/[[:punct:]]\+$//' | sed 's/^[[:punct:]]\+//g' > temp2.txt

# now, find all lines that do not contain anything from the prepositions.txt
grep -wvif prepositions.txt temp2.txt > temp3.txt

# change all things lowercase
cat temp3.txt | tr '[[:upper:]]' '[[:lower:]]' > temp4.txt

# Go through and delete empty lines
cat temp4.txt | sed '/^[[:space:]]*$/d' > temp5.txt

# sort
cat temp5.txt | sort | uniq -c | sort -nr > temp6.txt

# get the most common 100 words
cat temp6.txt | head -100 | sed 's/^[[:space:]]\+//g' > problem1frankenprepos.txt

rm temp.txt temp1.txt temp2.txt temp3.txt temp4.txt temp5.txt temp6.txt
