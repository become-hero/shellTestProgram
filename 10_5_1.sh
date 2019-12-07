#!/bin/bash
export LANG=en
sum=15
msg_cost=15
msg_count=0
menu(){
    cat <<END
total is ${sum},one msg will cost ${msg_cost}
---------------------------------------------
    1.rechange
    2.sent msg
    3.exit
---------------------------------------------
END
}
rechange(){
    read -p "Pls input rechange number:" money
        expr $money + 1 &>/dev/null
        if [ $? -ne 0 ];then
            echo "Pls input number"
        else
            sum=$(($sum+$money))
            echo "total money is :$sum"
        fi
}
sendInfo(){
    if [ ${sum} -lt ${msg_cost} ];then
        echo "money don't enough."
    else
        while true
        do
            read -p "Pls inpput msg:" msg
            printf "send "$msg" successfully!\n\n"
            sum=$(($sum-$msg_cost))
            printf "money is $sum\n"
            if [ $sum -lt $msg_cost ];then
                echo -e "money don't enough.\nPls rechange\n"
                return 1
            fi
        done
    fi
}
main(){
    while true
    do
        
        menu
        read -p "Pls input number: " men
        case "$men" in
            1)
                rechange
                clear
                ;;
            2)
                sendInfo
                ;;
            3)
                exit 1
                ;;
            *)
                echo "error"
        esac
    done
}
main
