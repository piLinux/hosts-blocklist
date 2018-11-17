#!/bin/bash
# Blackhole of Internet

git pull

wget https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews/hosts -O StevenBlack_hosts
grep -Fvxf Whitelist StevenBlack_hosts > StevenBlack_modified_hosts

grep -Fvxf blackhole_of_internet Blocked_Hosts >> blackhole_of_internet

grep -Fvxf blackhole_of_internet StevenBlack_modified_hosts >> blackhole_of_internet

wget https://raw.githubusercontent.com/notracking/hosts-blocklists/master/hostnames.txt -O notracking.hostnames.txt
grep -Fvxf blackhole_of_internet notracking.hostnames.txt >> blackhole_of_internet

wget https://mirror1.malwaredomains.com/files/justdomains -O mirror1.malwaredomains.com.justdomains
grep -Fvxf blackhole_of_internet mirror1.malwaredomains.com.justdomains >> blackhole_of_internet

wget http://sysctl.org/cameleon/hosts -O sysctl.org.hosts
grep -Fvxf blackhole_of_internet sysctl.org.hosts >> blackhole_of_internet

wget https://zeustracker.abuse.ch/blocklist.php?download=domainblocklist -O zeustracker.abuse.ch
grep -Fvxf blackhole_of_internet zeustracker.abuse.ch >> blackhole_of_internet

wget https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt -O disconnect.me.simple_tracking.txt
grep -Fvxf blackhole_of_internet disconnect.me.simple_tracking.txt >> blackhole_of_internet

wget https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt -O disconnect.me.simple_ad.txt
grep -Fvxf blackhole_of_internet disconnect.me.simple_ad.txt >> blackhole_of_internet

wget https://hosts-file.net/ad_servers.txt -O hosts-file.net.ad_servers.txt
grep -Fvxf blackhole_of_internet hosts-file.net.ad_servers.txt >> blackhole_of_internet

wget https://raw.githubusercontent.com/ligyxy/Blocklist/master/BLOCKLIST -O ligyxy.BLOCKLIST
grep -Fvxf blackhole_of_internet ligyxy.BLOCKLIST >> blackhole_of_internet

wget https://raw.githubusercontent.com/marktron/fakenews/master/fakenews -O marktron.fakenews
grep -Fvxf blackhole_of_internet marktron.fakenews >> blackhole_of_internet

wget https://raw.githubusercontent.com/w13d/adblockListABP-PiHole/master/list.txt -O adblockListABP-PiHole.list.txt
grep -Fvxf blackhole_of_internet adblockListABP-PiHole.list.txt >> blackhole_of_internet

wget https://raw.githubusercontent.com/kowith337/ThaiConsentHosts/master/ThaiConsentHosts.txt -O kowith337.ThaiConsentHosts.txt
grep -Fvxf blackhole_of_internet kowith337.ThaiConsentHosts.txt >> blackhole_of_internet

wget https://gist.githubusercontent.com/BBcan177/2a9fc2548c3c5a5e2dc86e580b5795d2/raw/2f5c90ffb3bd02199ace1b16a0bd9f53b29f0879/EasyList_DE -O BBcan177.EasyList_DE
grep -Fvxf blackhole_of_internet BBcan177.EasyList_DE >> blackhole_of_internet

wget http://someonewhocares.org/hosts/hosts -O someonewhocares.org.hosts
grep -Fvxf blackhole_of_internet someonewhocares.org.hosts >> blackhole_of_internet

wget https://raw.githubusercontent.com/Dawsey21/Lists/master/main-blacklist.txt -O Dawsey21.main-blacklist.txt
grep -Fvxf blackhole_of_internet Dawsey21.main-blacklist.txt >> blackhole_of_internet

rm StevenBlack_hosts \
notracking.hostnames.txt \
mirror1.malwaredomains.com.justdomains \
sysctl.org.hosts \
zeustracker.abuse.ch \
disconnect.me.simple_tracking.txt \
disconnect.me.simple_ad.txt \
hosts-file.net.ad_servers.txt \
ligyxy.BLOCKLIST \
marktron.fakenews \
adblockListABP-PiHole.list.txt \
kowith337.ThaiConsentHosts.txt \
BBcan177.EasyList_DE \
someonewhocares.org.hosts \
Dawsey21.main-blacklist.txt

git add *
git commit -m "auto generated commit"
git push origin master
