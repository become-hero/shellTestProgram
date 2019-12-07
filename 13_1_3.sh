#!/bin/bash
array=(1 2 3 4 5)
i=0
while ((i<${#array[*]}))
do
    echo ${array[i]}
    ((i++))
done
