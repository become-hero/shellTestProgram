#!/bin/bash
i="$1"
until [[ $i < 1 ]]
do
    echo "$i"
    ((i--))
done
