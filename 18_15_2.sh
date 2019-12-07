#!/bin/bash
for n in 10 10 10
do
    expect 18_15_1.exp ~/.ssh/id_dsa.pub 192.168.10.$n
done
