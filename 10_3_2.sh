#!/bin/bash
total=0
export LANG="zh_CN.UTF-8"
NUM=$((RANDOM%61))
echo "$NUM"
echo "------------------------"
sleep 1
clear
echo '0~60 number:'
apple(){
    read -p "Pls input price:" PRICE
    expr $PRICE + 1 &>/dev/null
    if [ $? -ne 0 ];then
        echo "must be number"
            apple
    fi
}
guess(){
    ((total++))
    if [ $PRICE -eq $NUM ];then
        echo "yes.you are rigth."
        if [ $total -le 3 ];then
            echo "total:${total} 1111111"
        elif [ $total -gt 3 -a $total -le 6 ];then
            echo "total:${total} 222222222"
        elif [ $total -gt 6 ];then
            echo "total:${total} 33333"
        fi
        exit 0
    elif [ $PRICE -gt $NUM ];then
        echo "too high,Pls input:"
        apple
    elif [ $PRICE -lt $NUM ];then
        echo "too lower,Pls input"
        apple
    fi
}
main(){
    apple
    while true
    do
        guess
    done
}
main
