#!/bin/bash
array=(oldboy oldgirl tingting)
select name in "${array[@]}"
do
    echo $name
done
