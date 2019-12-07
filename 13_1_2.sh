#!/bin/bash
array=(one two three four five)
for n in ${array[*]}
do
    echo $n
done
