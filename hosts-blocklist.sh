#!/bin/bash
# Blackhole of Internet
exec &>> log
git pull

# Revision 0.1
sort -u Whitelist -o Whitelist.final
rm Whitelist
mv Whitelist.final Whitelist

# Revision 0.1
wget https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews/hosts -O StevenBlack_hosts
grep -Fvxf Whitelist StevenBlack_hosts > StevenBlack_modified_hosts

# Revision 0.1
grep -v "^\s*[#\;]\|^\s*$" Blocked_Hosts > Blocked_Hosts.tmp
grep -Fvxf blackhole_of_internet Blocked_Hosts.tmp >> blackhole_of_internet

# Revision 0.1
grep -v "^\s*[#\;]\|^\s*$" StevenBlack_modified_hosts > StevenBlack_modified_hosts.tmp
sed -i -e "s/[[:space:]]\+/ /g" StevenBlack_modified_hosts.tmp
grep -Fvxf blackhole_of_internet StevenBlack_modified_hosts.tmp >> blackhole_of_internet
sed -i '/localhost/d' StevenBlack_modified_hosts.tmp
sed -i '/\b127.0.0.1 local\b/d' StevenBlack_modified_hosts.tmp
sed -i '/255.255.255.255/d' StevenBlack_modified_hosts.tmp
sed -i '/::/d' StevenBlack_modified_hosts.tmp
sed -i '/\b0.0.0.0 0.0.0.0\b/d' StevenBlack_modified_hosts.tmp
sed -e 's/0.0.0.0/::/g' StevenBlack_modified_hosts.tmp > StevenBlack_modified_hosts.tmp2
grep -Fvxf blackhole_of_internet StevenBlack_modified_hosts.tmp2 >> blackhole_of_internet

# Revision 0.1
wget https://raw.githubusercontent.com/notracking/hosts-blocklists/master/hostnames.txt -O notracking.hostnames.txt
grep -v "^\s*[#\;]\|^\s*$" notracking.hostnames.txt > notracking.hostnames.txt.tmp
sed -i -e "s/[[:space:]]\+/ /g" notracking.hostnames.txt.tmp
grep -Fvxf blackhole_of_internet notracking.hostnames.txt.tmp >> blackhole_of_internet

# Revision 0.1
wget https://mirror1.malwaredomains.com/files/justdomains -O mirror1.malwaredomains.com.justdomains
grep -v "^\s*[#\;]\|^\s*$" mirror1.malwaredomains.com.justdomains > mirror1.malwaredomains.com.justdomains.tmp2
touch mirror1.malwaredomains.com.justdomains.tmp
sed -e 's/^/0.0.0.0 /' mirror1.malwaredomains.com.justdomains.tmp2 >  mirror1.malwaredomains.com.justdomains.tmp
sed -e 's/^/:: /' mirror1.malwaredomains.com.justdomains.tmp2 >>  mirror1.malwaredomains.com.justdomains.tmp
grep -Fvxf blackhole_of_internet mirror1.malwaredomains.com.justdomains.tmp >> blackhole_of_internet

# Revision 0.1
wget http://sysctl.org/cameleon/hosts -O sysctl.org.hosts
grep -v "^\s*[#\;]\|^\s*$" sysctl.org.hosts > sysctl.org.hosts.tmp2
sed -i '/localhost/d' sysctl.org.hosts.tmp2
touch sysctl.org.hosts.tmp
sed -i -e "s/[[:space:]]\+/ /g" sysctl.org.hosts.tmp2
sed -e 's/127.0.0.1/0.0.0.0/g' sysctl.org.hosts.tmp2 > sysctl.org.hosts.tmp
sed -e 's/127.0.0.1/::/g' sysctl.org.hosts.tmp2 >> sysctl.org.hosts.tmp
grep -Fvxf blackhole_of_internet sysctl.org.hosts.tmp >> blackhole_of_internet

# Revision 0.1
wget https://zeustracker.abuse.ch/blocklist.php?download=domainblocklist -O zeustracker.abuse.ch
grep -v "^\s*[#\;]\|^\s*$" zeustracker.abuse.ch > zeustracker.abuse.ch.tmp2
touch zeustracker.abuse.ch.tmp
sed -e 's/^/0.0.0.0 /' zeustracker.abuse.ch.tmp2 > zeustracker.abuse.ch.tmp
sed -e 's/^/:: /' zeustracker.abuse.ch.tmp2 >> zeustracker.abuse.ch.tmp
grep -Fvxf blackhole_of_internet zeustracker.abuse.ch.tmp >> blackhole_of_internet

# Revision 0.1
wget https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt -O disconnect.me.simple_tracking.txt
grep -v "^\s*[#\;]\|^\s*$" disconnect.me.simple_tracking.txt > disconnect.me.simple_tracking.txt.tmp2
touch disconnect.me.simple_tracking.txt.tmp
sed -e 's/^/0.0.0.0 /' disconnect.me.simple_tracking.txt.tmp2 > disconnect.me.simple_tracking.txt.tmp
sed -e 's/^/:: /' disconnect.me.simple_tracking.txt.tmp2 >> disconnect.me.simple_tracking.txt.tmp
grep -Fvxf blackhole_of_internet disconnect.me.simple_tracking.txt.tmp >> blackhole_of_internet

# Revision 0.1
wget https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt -O disconnect.me.simple_ad.txt
grep -v "^\s*[#\;]\|^\s*$" disconnect.me.simple_ad.txt > disconnect.me.simple_ad.txt.tmp2
touch disconnect.me.simple_ad.txt.tmp
sed -e 's/^/0.0.0.0 /' disconnect.me.simple_ad.txt.tmp2 > disconnect.me.simple_ad.txt.tmp
sed -e 's/^/:: /' disconnect.me.simple_ad.txt.tmp2 >> disconnect.me.simple_ad.txt.tmp
grep -Fvxf blackhole_of_internet disconnect.me.simple_ad.txt.tmp >> blackhole_of_internet

# Revision 0.1
wget https://hosts-file.net/ad_servers.txt -O hosts-file.net.ad_servers.txt
grep -v "^\s*[#\;]\|^\s*$" hosts-file.net.ad_servers.txt > hosts-file.net.ad_servers.txt.tmp2
sed -i '/localhost/d' hosts-file.net.ad_servers.txt.tmp2
touch hosts-file.net.ad_servers.txt.tmp
sed -i -e "s/[[:space:]]\+/ /g" hosts-file.net.ad_servers.txt.tmp2
sed -e 's/127.0.0.1/0.0.0.0/g' hosts-file.net.ad_servers.txt.tmp2 > hosts-file.net.ad_servers.txt.tmp
sed -e 's/127.0.0.1/::/g' hosts-file.net.ad_servers.txt.tmp2 >> hosts-file.net.ad_servers.txt.tmp
grep -Fvxf blackhole_of_internet hosts-file.net.ad_servers.txt.tmp >> blackhole_of_internet

# Revision 0.1
wget https://raw.githubusercontent.com/ligyxy/Blocklist/master/BLOCKLIST -O ligyxy.BLOCKLIST
grep -v "^\s*[#\;]\|^\s*$" ligyxy.BLOCKLIST > ligyxy.BLOCKLIST.tmp2
touch ligyxy.BLOCKLIST.tmp
sed -e 's/^/0.0.0.0 /' ligyxy.BLOCKLIST.tmp2 > ligyxy.BLOCKLIST.tmp
sed -e 's/^/:: /' ligyxy.BLOCKLIST.tmp2 >> ligyxy.BLOCKLIST.tmp
grep -Fvxf blackhole_of_internet ligyxy.BLOCKLIST.tmp >> blackhole_of_internet

# Revision 0.1
wget https://raw.githubusercontent.com/marktron/fakenews/master/fakenews -O marktron.fakenews
grep -v "^\s*[#\;]\|^\s*$" marktron.fakenews > marktron.fakenews.tmp2
sed -i -e "s/[[:space:]]\+/ /g" marktron.fakenews.tmp2
cp marktron.fakenews.tmp2 marktron.fakenews.tmp
sed -e 's/0.0.0.0/::/g' marktron.fakenews.tmp2 >> marktron.fakenews.tmp
grep -Fvxf blackhole_of_internet marktron.fakenews.tmp >> blackhole_of_internet

# Revision
wget https://raw.githubusercontent.com/w13d/adblockListABP-PiHole/master/list.txt -O adblockListABP-PiHole.list.txt
grep -v "^\s*[#\;]\|^\s*$" adblockListABP-PiHole.list.txt > adblockListABP-PiHole.list.txt.tmp2
sed -i -e "s/[[:space:]]\+/ /g" adblockListABP-PiHole.list.txt.tmp2
touch adblockListABP-PiHole.list.txt.tmp
sed -e 's/127.0.0.1/0.0.0.0/g' adblockListABP-PiHole.list.txt.tmp2 > adblockListABP-PiHole.list.txt.tmp
sed -e 's/127.0.0.1/::/g' adblockListABP-PiHole.list.txt.tmp2 >> adblockListABP-PiHole.list.txt.tmp
grep -Fvxf blackhole_of_internet adblockListABP-PiHole.list.txt.tmp >> blackhole_of_internet

# Revision 0.1
wget https://raw.githubusercontent.com/kowith337/ThaiConsentHosts/master/ThaiConsentHosts.txt -O kowith337.ThaiConsentHosts.txt
grep -v "^\s*[#\;]\|^\s*$" kowith337.ThaiConsentHosts.txt > kowith337.ThaiConsentHosts.txt.tmp2
sed -i -e "s/[[:space:]]\+/ /g" kowith337.ThaiConsentHosts.txt.tmp2
cp kowith337.ThaiConsentHosts.txt.tmp2 kowith337.ThaiConsentHosts.txt.tmp
sed -e 's/0.0.0.0/::/g' kowith337.ThaiConsentHosts.txt.tmp2 >> kowith337.ThaiConsentHosts.txt.tmp
grep -Fvxf blackhole_of_internet kowith337.ThaiConsentHosts.txt.tmp >> blackhole_of_internet

# Revision 0.1
wget https://gist.githubusercontent.com/BBcan177/2a9fc2548c3c5a5e2dc86e580b5795d2/raw/2f5c90ffb3bd02199ace1b16a0bd9f53b29f0879/EasyList_DE -O BBcan177.EasyList_DE
grep -v "^\s*[#\;]\|^\s*$" BBcan177.EasyList_DE > BBcan177.EasyList_DE.tmp2
touch BBcan177.EasyList_DE.tmp
sed -e 's/^/0.0.0.0 /' BBcan177.EasyList_DE.tmp2 > BBcan177.EasyList_DE.tmp
sed -e 's/^/:: /' BBcan177.EasyList_DE.tmp2 >> BBcan177.EasyList_DE.tmp
grep -Fvxf blackhole_of_internet BBcan177.EasyList_DE.tmp >> blackhole_of_internet

# Revision 0.1
wget https://someonewhocares.org/hosts/zero/hosts -O someonewhocares.org.zero.hosts
grep -v "^\s*[#\;]\|^\s*$" someonewhocares.org.zero.hosts > someonewhocares.org.zero.hosts.tmp2
sed -i '/127.0.0.1/d' someonewhocares.org.zero.hosts.tmp2
sed -i '/255.255.255.255/d' someonewhocares.org.zero.hosts.tmp2
sed -i '/::/d' someonewhocares.org.zero.hosts.tmp2
sed -i '/goatse.cx/d' someonewhocares.org.zero.hosts.tmp2
sed -i '/oralse.cx/d' someonewhocares.org.zero.hosts.tmp2
echo '0.0.0.0 goatse.cx' >> someonewhocares.org.zero.hosts.tmp2
echo '0.0.0.0 www.goatse.cx' >> someonewhocares.org.zero.hosts.tmp2
echo '0.0.0.0 oralse.cx' >> someonewhocares.org.zero.hosts.tmp2
echo '0.0.0.0 www.oralse.cx' >> someonewhocares.org.zero.hosts.tmp2
sed -i -e "s/[[:space:]]\+/ /g" someonewhocares.org.zero.hosts.tmp2
cp someonewhocares.org.zero.hosts.tmp2 someonewhocares.org.zero.hosts.tmp
sed -e 's/0.0.0.0/::/g' someonewhocares.org.zero.hosts.tmp2 >> someonewhocares.org.zero.hosts.tmp
grep -Fvxf blackhole_of_internet someonewhocares.org.hosts.tmp >> blackhole_of_internet

# Revision 0.1
wget https://raw.githubusercontent.com/Dawsey21/Lists/master/main-blacklist.txt -O Dawsey21.main-blacklist.txt
grep -v "^\s*[#\;]\|^\s*$" Dawsey21.main-blacklist.txt > Dawsey21.main-blacklist.txt.tmp2
touch Dawsey21.main-blacklist.txt.tmp
sed -e 's/^/0.0.0.0 /' Dawsey21.main-blacklist.txt.tmp2 > Dawsey21.main-blacklist.txt.tmp
sed -e 's/^/:: /' Dawsey21.main-blacklist.txt.tmp2 >> Dawsey21.main-blacklist.txt.tmp
grep -Fvxf blackhole_of_internet Dawsey21.main-blacklist.txt.tmp >> blackhole_of_internet

# Revision 0.1
sort -u blackhole_of_internet -o blackhole_of_internet.tmp
sed -i -e 's/[[:space:]]*$//' blackhole_of_internet.tmp
rm blackhole_of_internet
touch blackhole_of_internet
grep -Fvxf Whitelist blackhole_of_internet.tmp > blackhole_of_internet
rm blackhole_of_internet.tmp

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
someonewhocares.org.zero.hosts \
Dawsey21.main-blacklist.txt \
Blocked_Hosts.tmp \
StevenBlack_modified_hosts.tmp \
StevenBlack_modified_hosts.tmp2 \
notracking.hostnames.txt.tmp \
mirror1.malwaredomains.com.justdomains.tmp \
mirror1.malwaredomains.com.justdomains.tmp2 \
sysctl.org.hosts.tmp \
sysctl.org.hosts.tmp2 \
zeustracker.abuse.ch.tmp \
zeustracker.abuse.ch.tmp2 \
disconnect.me.simple_tracking.txt.tmp \
disconnect.me.simple_tracking.txt.tmp2 \
disconnect.me.simple_ad.txt.tmp \
disconnect.me.simple_ad.txt.tmp2 \
hosts-file.net.ad_servers.txt.tmp \
hosts-file.net.ad_servers.txt.tmp2 \
ligyxy.BLOCKLIST.tmp \
ligyxy.BLOCKLIST.tmp2 \
marktron.fakenews.tmp \
marktron.fakenews.tmp2 \
adblockListABP-PiHole.list.txt.tmp \
adblockListABP-PiHole.list.txt.tmp2 \
kowith337.ThaiConsentHosts.txt.tmp \
kowith337.ThaiConsentHosts.txt.tmp2 \
BBcan177.EasyList_DE.tmp \
BBcan177.EasyList_DE.tmp2 \
someonewhocares.org.zero.hosts.tmp \
someonewhocares.org.zero.hosts.tmp2 \
Dawsey21.main-blacklist.txt.tmp \
Dawsey21.main-blacklist.txt.tmp2

git add *
git commit -m "auto generated commit"
git push origin master
