# songtexte-scraper
fetches songs from songtexte 
curl https://www.songtexte.com/songtext/kiz/der-durch-die-tur-geher-3da09ab.html | sed 's/<[^>]*>//g' | sed -n '/Noch keine/,/Noch keine/p' | sed -e :a -e '$d;N;2,13ba' -e 'P;D' |  awk 'NR > 11 { print }' | sed -e '/<!--*/,+2d' > kiztext4.txt
