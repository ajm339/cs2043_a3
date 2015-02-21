#! /bin/bash
# The point of this is to detect the number of phone numbers in the file phone-data.txt

# Go through and delete all letters and clean up the front and change all ,'s to new lines
sed 's/[[:alpha:]]//g' < phone-data.txt | sed 's/^[[:space:]]\+//g' | sed 's/,/\n/g' > temp1.txt

grep -o '(\{0,1\}\(\([[:digit:]]\{3\}\)\{0,1\}-\{0,1\}.\{0,1\})\{0,1\}[[:space:]]\{0,1\}\([[:digit:]]\{3\}\)\{0,1\}-\{0,1\}[[:space:]]\{0,1\}\([[:digit:]]\{4\}\)\{0,1\}\([[:digit:]]\{7\}\)\{0,1\}\)\{0,1\}\([[:digit:]]\{7,8\}\)\{0,1\}\([[:digit:]]\{4\}-[[:digit:]]\{4\}\)\{0,1\}' < temp1.txt | sed '/^[[:space:]]*$/d' > problem6phonebook.txt

# clean up
rm temp1.txt
