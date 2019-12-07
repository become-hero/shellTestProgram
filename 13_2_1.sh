#!/bin/bash
array=(
oldboy
oldgirl
xiaoting
bingbing
)
for((i=0;i<${#array[*]};i++))
do
    echo "this is number $i,then content is ${array[$i]}"
done
echo -----------------------
echo "array len:${array[*]}"
