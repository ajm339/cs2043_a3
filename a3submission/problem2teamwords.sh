#! /bin/bash
# usage: ./text.sh nbefore nafter
# prints out the requested number of words that appear right before and right after any mention of the following words "seahawks" and "patriots"

# separate all spaces to differentiate words
cat WithoutTagssuperbowl.html | tr '[[:space:]]' '\n' > temp2.txt
 
# delete all punctuation that is at the end of the word
cat temp2.txt | sed 's/[[:punct:]]\+$//g' > temp3.txt
 
# delete all punctuation at the beginning of the word
cat temp3.txt | sed 's/^[[:punct:]]\+//g' > temp4.txt

# delete all empty lines again, as the spaces caused many errors
cat temp4.txt | sed '/^$/d' > temp5.txt

# print the nbefore and nafter lines
grep -A $1 -B $2 seahawks temp5.txt > problem2teamwords.txt
grep -A $1 -B $2 patriots temp5.txt >> problem2teamwords.txt

rm temp[2-5].txt
