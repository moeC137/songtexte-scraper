# songtexte-scraper
fetches songs from songtexte 

generating: link list for all songs
for ((i=1;i<=3;i++)); do  curl   https://www.songtexte.com/artist/kiz-43d6e377.html?page=$i  | grep songtext/kiz ; done |grep -o -P '(?<="..).*(?=" )' > linklist.txt

downloading lyrics:

curl https://www.songtexte.com/songtext/kiz/der-durch-die-tur-geher-3da09ab.html | sed 's/<[^>]*>//g' | sed -n '/Noch keine/,/Noch keine/p' | sed -e :a -e '$d;N;2,13ba' -e 'P;D' |  awk 'NR > 11 { print }' | sed -e '/<!--*/,+2d' > kiztext4.txt
