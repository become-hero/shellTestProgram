#!/bin/bash
trapper(){
    trap ':' INT EXIT TSTP TERM HUP
}
main(){
    while :
    do
        trapper
        clear
        cat <<menu
        1)web0111111111111111111
        2)web0222222222222222222
menu
        read -p "Pls input a num: " num
        case "$num" in
            1)
                echo 'login in 192.168.10.10'
                ssh 192.168.10.10
                ;;
            2)
                echo 'login in 192.168.10.20'
                ssh 192.168.10.20
                ;;
            110)
                read -p "you birthday: " char
                if [ "$char" = "0926" ];then
                    exit
                    sleep 3
                fi
                ;;
            *)
                echo "select error."
        esac
    done
}
main
