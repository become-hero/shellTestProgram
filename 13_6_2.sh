#/bin/bash
CheckDb(){
    status=($(awk -F ':' '/_Running|_Behind/{print $NF}' slave.log))
    for((i=0;i<${#status[*]};i++))
    do
        count=0
        if [ "${status[$i]}" != "Yes" -a "${status[$i]}" != "0" ];then
            count+=1
        fi
    done
    if [ $count -ne 0 ];then
        echo "failed"
        return 1
    else
        echo "sucess"
        return 0
    fi
}
main(){
    while true
    do
        CheckDb
        sleep 3
    done
}
main
