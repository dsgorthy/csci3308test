#!/bin/bash
# Derek Gorthy

# Just as in our other Grades.sh file, we now check for 1 command line argument
if [ $# -ne 1 ]
then 
    echo "Usage: GradesAwk.sh filename"
    exit 1
fi

# "sum" is the sum of the scores, 
# printf takes a format string, 
# sort by 3rd column as in previous solution
awk '{sum = $4+$5+$6; printf "%d [%s] %s,%s\n",(s/3),$1,$3,$2}' $1 | sort -k3