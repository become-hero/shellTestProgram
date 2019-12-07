#!/bin/bash
arr=(
    10.0.0.11
    10.0.0.22
    10.0.0.33
)
#for((i=0;i<${#arr[*]};i++))
#do
#    echo "${arr[$i]}"
#done
for n in ${arr[*]}
do
    echo "$n"
done
