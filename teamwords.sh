#! /bin/bash

# delete empty lines
cat WithoutTagssuperbowl.html | sed '/^[[:space:]]*$/d' > temp.txt

# separate all spaces to differentiate words
cat temp.txt | tr '[[:space:]]' '\n' > temp2.txt

# change all to lower case
cat temp2.txt | tr '[[:upper:]]' '[[:lower:]]' > temp3.txt

# delete all punctuation that is at the end of the word
cat temp3.txt | sed 's/[[:punct:]]$//g' > temp4.txt

# delete all punctuation at the beginning of the word
cat temp4.txt | sed 's/^[[:punct:]]//g' > temp5.txt

# sort
cat temp5.txt | sort | uniq -c | sort -nr > temp6.txt

# delete spaces at beginning
cat temp6.txt | sed 's/^[[:space:]]\+//g' > temp7.txt

# extract the top 100
cat temp7.txt | head -101 | tail -100 > 100WordsSuperbowl.txt

# clean up
rm temp.txt temp[1-7].txt
