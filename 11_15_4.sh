#!/bin/bash
PS3="Pls input number: "
select name in oldboy oldgirl tingting
do
    echo -e "i guess you selectrf the menu is:\n $REPLY) $name"
done
