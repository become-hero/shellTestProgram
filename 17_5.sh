#!/bin/bash
trap 'echo "you are typing ctrl+c,sorry,script will not terminate."' INT
trap 'echo "you are typing ctrl+\,sorry,script will not terminate."' QUIT
trap 'echo "you are typing ctrl+z,sorry,script will not terminate."' TSTP
while true
do
    echo "now,test singal `date`"
    sleep 5
done    
