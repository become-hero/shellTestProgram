#!/bin/bash
TOTAL=500
MSG_COST=499
source /etc/init.d/functions
function IS_NUM(){
    expr $1 + 1 &>/dev/null
    if [ $? -ne 0 -a "$1" != "-1" ];then
        return 1
    fi
    return 0
}
function color(){
    RED='\E[1;31m'
    YELLOW='\E[1;33m'
    BLUE='\E[1;34m'
    PINK='\E[1;35m'
    RES='\E[0m'
    if [ $# -ne 2 ];then
        echo "usage:$0 content {red|yellow|blue|pink}"
        exit
    fi
    case "$2" in
        red|RED)
            echo -e "${RED}$1${RES}"
            ;;
        yellow|YELLOW)
            echo -e "${YELLOW}$1${RES}"
            ;;
        blue|BLUE)
            echo -e "${blue}$1${RES}"
            ;;
        pink|PINK)
            echo -e "${PINK}$1${RES}"
            ;;
        *)
            echo "usage:$0 content {red|yellow|blue|pink}"
            exit
    esac
}
function sendInfo(){
    color "total money: $TOTAL,send a msg will cost $MSG_COST" yellow
        if [ $TOTAL -lt $MSG_COST ];then
            charge
        fi
        read -p "Pls input msg: " TXT
        read -p "Are you sure to send?[y|n]" OPTION
        case "$OPTION" in
            [yY]|[yY][eE][sS])
                color "send  "$TXT" successfully!" yellow
                echo $TXT >>/tmp/consum.log
                ((TOTAL=TOTAL-MSG_COST))
                color "you have $TOTAL left." yellow
                ;;
            [nN]|[nN][oO])
                echo "Canceled."
                ;;
            *)
                echo "error"
                ;;
        esac
}
function charge(){
    if [ $TOTAL -lt $MSG_COST ];then
        color "Money is not enogh<are you want to charge?[y|n]" red
        read OPT2
        case "$OPT2" in
            y|Y)
                while true
                    do
                        read -p "Pls input charge number:" CHARGE
                            IS_NUM $CHARGE&&break||{
                                echo "Please input number"
                                 exit 100
                            }
                    done
            ((TOTAL+=CHARGE)) && echo "you have $TOTAL money"
            if [ $TOTAL -lt $MSG_COST ];then
                charge
            fi
            ;;
            n|N)
                color "You have left $TOTAL money,can not send a msg,bye." red
                ;;
            *)
                charge
                ;;
        esac
    fi
}
main(){
    while [ $TOTAL -ge $MSG_COST ]
    do
        sendInfo
        charge
    done
}
main
