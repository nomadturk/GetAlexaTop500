#!/bin/sh
# Let's get the Global Top 2500 sites from alexa with the command:
curl -s -O http://s3.amazonaws.com/alexa-static/top-1m.csv.zip ; unzip -q -o top-1m.csv.zip top-1m.csv ; head -2500 top-1m.csv | cut -d, -f2 | cut -d/ -f1 > AlexaTop2500.txt


# Run the script to get Top 500 sites from Alexa.
php AlexaTop500Country.php

# Now before going to the next step lets wait a bit.
# Appearently Alexa is banning people who run the code a lot. 
# So let's a least give it a small cooling time
ping -i 1 -c 10 127.0.0.1

# Now let's parse all those sweet categories from Alexa Top Categories.
php AlexaTopCategories.php

# Find and remove any sites with / in it.
# We can't use it for digging afterall...
sed --in-place '/\//d' AlexaTopCategories.txt
sed --in-place '/\//d' AlexaTop500-*.txt
sed --in-place '/\//d' AlexaTop2500-*.txt

# Combine them, clean the previous files.
cat AlexaTop*.txt > AlexaDigList.txt
rm -r -f AlexaTop*.txt

# Now, let's dig all those sites. We need them cached in dnsmasq.
# On my case, 10.0.13.1 is my local dns server
#echo "Time to dig master!".
#dig -f AlexaDigList.txt @208.67.220.220 +nocomments +noauthority +noadditional +nostats  +short +noall
echo "Done..."
echo  "AlexaDigList.txt file still exists, use it as you see fit."
