cat /var/log/secure | awk '/Failed/{print $(NF-3)}' | sort | uniq -c | awk '{print $2" = "$1;}'
cat /var/log/secure | awk '/Failed/{print $(NF-3)}' | sort | uniq -c |awk '$1 >10{print $2}' |xargs -I {} ipset add blacklist {}

ipset
### Create ipset
ipset create blacklist hash:net maxelem 1000000
### Check ipset
ipset list
### Add an ip in to blacklist
ipset add blacklist x.x.x.x
### Delete an ip 
ipset del blacklist x.x.x.x
### Create iptables rule
iptables -I INPUT -m set -–match-set blacklist src -p tcp -j DROP
iptables -I INPUT -m set -–match-set setname src -p tcp –destination-port 80 -j DROP
### Save ipset rule to file
ipset save blacklist -f blacklist.txt
### Delete ipset
ipset destroy blacklist
### import ipset rule
ipset restore -f blacklist

