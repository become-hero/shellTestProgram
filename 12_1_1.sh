#!/bin/bash
if [ $# -ne 1 ];then
    echo "uasge:$0 {break|continue|exit|return}"
    exit 1
fi
test(){
    for((i=0;i<=5;i++))
    do
        if [ $i -eq 3 ];then
            $*;
        fi
        echo $i
    done
    echo "i am in func."
}
test $*
func_ret=$?
if [ `echo $*|grep return|wc -l` -eq 1  ];then
    echo "return's exit status:$func_ret"
fi
echo "ok"
