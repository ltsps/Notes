### new ipset
firewall-cmd --permanent --new-ipset=blacklist --type=hash:net
firewall-cmd --permanent --new-ipset=blacklist6 --type=hash:ip --option=family=inet6
### get ipset infomation
firewall-cmd --permanent --get-ipsets
### Add a new entry to ipset
firewall-cmd --permanent --ipset=blacklist --add-entry=x.x.x.x

### Add to zone
firewall-cmd --permanent --add-source=ipset:blacklist
### Add a rich rule
firewall-cmd --permanent --add-rich-rule='rule source ipset=blacklist drop'

### Query entry
firewall-cmd --permanent --ipset=blacklist --query-entry=x.x.x.x
### Get entrys
firewall-cmd --permanent --ipset=blacklist --get-entries
### remove entry
firewall-cmd --permanent --ipset=blacklist --remove-entry=x.x.x.x


cat /var/log/secure* |grep Failed|grep -v "username" | awk '/Failed/{print $(NF-3)}' | sort | uniq -c |awk '$1 >10{print $2}' |xargs -I {} firewall-cmd --permanent --ipset=blacklist --add-entry={}

cat /var/log/secure |grep Failed|grep -v "username" | awk '/Failed/{print $(NF-3)}' | sort | uniq |xargs -I {} firewall-cmd --permanent --ipset=blacklist --add-entry={}


### Add port
firewall-cmd --permanent --add-port xxx/tcp
