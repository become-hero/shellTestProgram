#!/bin/bash
trap "find /tmp -type f -name "oldboy_*"|xargs rm -f && exit" INT
while true
do
    touch /tmp/oldboy_$(date +%F-%H-%M-%S)
    sleep 3
    ls -l /tmp/oldboy_*
    done
