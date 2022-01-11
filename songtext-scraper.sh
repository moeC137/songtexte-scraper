#!/bin/bash
file="linklist.txt"
while IFS= read -r line
do
        # display $line or do somthing with $line
	curl https://www.songtexte.com/$line | sed 's/<[^>]>//g' | sed -n '/Noch keine/,/Noch keine/p' | sed -e :a -e '$d;N;2,13ba' -e 'P;D' | awk 'NR > 11 { print }' | sed -e '/<!--/,+2d' | sed 's/<[^>]*>//g' > $line.txt
	printf '%s\n' "$line"
done <"$file"
