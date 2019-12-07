#!/bin/bash
if [ $# -ne 1 ];then
    echo "usage:$0 cmd"
    exit 1
fi
cmd=$1
for n in 10 11 12
do
    expect 18_12_1.exp 192.168.10.$n "$cmd"
done
