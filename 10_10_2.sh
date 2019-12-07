#!/bin/bash
file=$1
ip=0
count=0
if expr "$file" : ".*\.log" &>/dev/null;then
    :
else
    echo "usage: $0 xxx.log"
    exit 1
fi
while true
do
    grep "ESTABLISHED" $1|awk -F "[ :]+" '{ ++S[$(NF-3)]}END {for(key in S)print S[key], key}'|sort -rn -k1|head -5 >/tmp/tmp.log
    while read line
    do
        ip=`echo $line|awk '{print $2}'`
        counts=`echo $line|awk '{print $1}'`
        if [ $counts -gt 1 ] && [ `iptables -L -n|grep "$ip"|wc -l` -lt 1 ];then
            iptables -I INPUT -s $ip -j DROP
            echo "$line is stopped" >>/tmp/droplist_$(date +%F).log
        fi
    done</tmp/tmp.log
    sleep 180
done
