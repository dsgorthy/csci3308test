#!/bin/bash
# Derek Gorthy
# Referenced (but didn't partner with) John Dinkel

# define usage statement here
# taken from online, check to see if 1 command line argument
if [ $# -ne 1 ]; then
        echo "Usage: Grades.sh filename"
        exit
fi

# while there are still lines in the file
while read -r line; do
    # read in lines in from text file and store in "name"
    name=$line

    # split each line on spaces and save the result to array
    split=' ' read -a array <<< "$name"

    # build variables
    id=${array[0]}
    lastName=${array[2]}
    firstName=${array[1]}

    # now find the average
    av=0
    # build an array for the three grades we need to average
    declare -a score_array=( ${array[3]} ${array[4]} ${array[5]} )
    # loop through three times 
    for score in ${score_array[@]}; do
    	# build the average
	   av=$(($av + $score))
    done

    # calculate the average, "bc -l" rounds and "printf" formats the average
    av=$(printf %.0f $(echo "$av/3" | bc -l))  

    # print out all data in this iteration
    echo "$av [$id] $lastName, $firstName"

# close the file
# not entirely sure how line 43 works first, but sort does order by last, first, then ID
done < "$1" | sort -k3 -k2 -k1