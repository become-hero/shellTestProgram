#!/bin/bash
#>/tmp/zhiwen.log
md5char="4fe8bf20ed"
while read line
do
    if [ `echo $line|grep "$md5char"|wc -l` -eq 1 ];then
        echo $line
        break
    fi
done </tmp/zhiwen.log
