#!/bin/bash
dir=($(ls /array))
for((i=0;i<${#dir[*]};i++))
do
    echo "this is NO.$i,filename is ${dir[$i]}"
done
