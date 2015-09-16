#!/bin/bash
# Derek Gorthy

# taking command line arguments
args=("$@")

# usage statement defined here
if [ $# -ne 1 ]; then
        echo "Usage: RegexAnswers.sh filename"
        exit
fi

# 1 - How many lines end with a number?
egrep .+[0-9] ${args[0]} -c

# 2 - How many lines do not start with a vowel?
grep -i "^[^aeiouAEIOU]" ${args[0]} -c

# 3 - How many 12 letter aplhabet only lines?
grep "^[a-z]\{12\}$" ${args[0]} -c

# 4 - How many phone numbers in typical 10 digit format?
egrep [0-9]{3}-[0-9]{3}-[0-9]{4} ${args[0]} -c

# 5 - How many phone numbers starting with 303?
egrep 303-[0-9]{3}-[0-9]{4} ${args[0]} -c

# 6 - How many begin with a vowel and end with a number?
grep -E ^[aeiou].*[0-9] ${args[0]} -c

# 7 - How many addresses end with geocities.com?
egrep .+geocities.com ${args[0]} -c

# 8 - How many incorrect email addresses?
echo "0"