#!/bin/bash
RETVAR=0
path=/server/scripts
[ ! -d "$path" ] && mkdir $path -p
function Usage(){
    echo "Usage:$0 argv"
    return 1
}
function InstallService(){
    if [ $# -ne 1 ];then
        Usage
    fi
    local RETVAR=0
    echo "start install $1"
    sleep 2;
    if [ ! -x "$path/${1}.sh" ];then
        echo "not exist!"
        return 1
    else
        $path/${1}.sh
        return $RETVAR
    fi
}
function main(){
    PS3="`echo pls input the num you want:`"
    select var in "Install lamp" "Install lnmp" "exit"
    do
        case "$var" in 
        "Install lamp")
            InstallService lamp
            RETVAR=$?
            ;;
        "Install lnmp")
            InstallService lnmp
            RETVAR=$?
            ;;
        exit)
            echo bye.
            return 3
            ;;
        *)
            echo "the num you input must be {1|2|3}"
            echo "input ERROR"
        esac
    done
    exit $RETVAR
}
main
