#! /bin/bash
# use: ./problem5songremix.sh song1.txt song2.txt
# remixes the lines of song1.txt and song2.txt and outputs to problem5songremix.txt

# for i in {1..numberOfLinesTotal}
# if i modulo 2 == 1
# paste the next line of song1
# else paste the next line of song2
# might need indeces for each, or might just need to do int (i/2), deal with possible offset

# check to see if problem5songremix.txt is a thing if it is, delete it
if [ -e problem5songremix.txt ]
then
	rm problem5songremix.txt
fi

# clean up the music file of empty lines for each
sed '/^[[:space:]]*$/d' < $1 > song_to_be_removed_song1_temp
sed '/^[[:space:]]*$/d' < $2 > song_to_be_removed_song2_temp

wc_song1=$(($(wc -l < song_to_be_removed_song1_temp)+1))
wc_song2=$(($(wc -l < song_to_be_removed_song2_temp)+1))

numLines=$(($wc_song1+$wc_song2))
line1=1
line2=1
for (( i=0; i<$numLines; i++))
do
	if (($(($i%2))==0))
	then
		# would like to add the next line from song1
#		if (($(($(($i/2)))) < $wc_song1))
		if (($line1 <= $wc_song1))
		then
			sed -n "${line1}p" song_to_be_removed_song1_temp >> problem5songremix.txt
			if (( $line1 == $wc_song1 ))
			then
				echo >> problem5songremix.txt
			fi
			line1=$(($line1+1))
		else
			sed -n "${line2}p" song_to_be_removed_song2_temp >> problem5songremix.txt
			line2=$(($line2+1))

		fi
	else
		if (($line2 <= $wc_song2))
		then
			sed -n "${line2}p" song_to_be_removed_song2_temp >> problem5songremix.txt
			if (( $line2 == $wc_song2 ))
			then
				echo >> problem5songremix.txt
			fi
			line2=$(($line2+1))
		else
			sed -n "${line1}p" song_to_be_removed_song1_temp >> problem5songremix.txt
			line1=$(($line1+1))
		fi
	fi
done


# clean up everything
rm song_to_be_removed_song1_*
rm song_to_be_removed_song2_*
