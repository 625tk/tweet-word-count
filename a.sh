cut -d ',' -f 6 tweets.csv > col6.txt
ruby a.rb < col6.txt > out
