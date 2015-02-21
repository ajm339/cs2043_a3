#! /bin/bash

# download the webpage => UNCOMMENT WHEN YOU TURN IN!!
wget http://www.cs.cornell.edu/courses/cs2043/2015sp/assignments/superbowl.html

# need to get rid of everything that is like <****>
cat superbowl.html | sed 's/<.\+>//g' > temp.html

# get rid of empty lines
cat temp.html | sed '/^[[:space:]]*$/d' > WithoutTagssuperbowl.html

# clean up
rm temp.html
