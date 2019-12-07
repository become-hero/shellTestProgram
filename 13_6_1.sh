#!/bin/bash
count=0
status=($(awk -F ':' '/_Running|_Behind/{print $NF}' slave.log))
for((i=0;i<${#status[*]};i++))
do
    if [ "${status[$i]}" != "Yes" -a "${status[$i]}" != "0" ];then
        let count+=1
    fi
done
if [ $count -ne 0 ];then
    echo "mysql replcation is failed."
else
    echo "mysql replcation is sucess."
fi
