#!/bin/bash
path=/server/scripts
MAIL_GROUP="become_hero1198@163.com 1772040722@qq.com"
PAGER_GROUP="12300000000 4560000000"
LOG_FILE="/tmp/web_check.log"
[ ! -d "$path" ] && mkdir -p $path
function UrlList(){
    cat >$path/domain.list<<EOF
http://www.baidu.com
http://www.linux.com
http://www.linuxprobe.com
http://www.github.com
www.111
EOF
}
function CheckUrl(){
    FAILCOUNT=0
    for((i=1;i<=3;i++))
    do
         wget -T 5 --tries=1 --spider $1 >/dev/null 2>&1
        if [ $? -ne 0 ];then
              let FAILCOUNT+=1;
           else
               break
         fi
    done
    return $FAILCOUNT
}
function MAIL(){
    local SUBJECT_CONTENT=$1
    for MAIL_USER in `echo $MAIL_GROUP`
    do
        mail -s "$SUBJECT_CONTENT" $MAIL_USER <$LOG_FILE
    done
}
function PAGER(){
    for PAGER_USER in `echo $PAGER_GROUP`
    do
        TITLE=$1
        CONTACT=$PATH_USER
        HTTPGW=http://oldboy.sms.cn/smsproxy/sendsms.action
        #send_message methid1
        curl -d cdkey=5ADF-EFA -d password=OLDBOY -d phone=$CONTACT -d message="$TITLE[$2]" $HTTPGW
    done
}
function SendMsg(){
    if [ $1 -ge 3 ];then
        RETVAL=1
        NOW_TIME=`date +"%Y-%m-%d %H:%M:%S"`
        SUBJECT_CONTENT="http://$2 is error,${NOW_TIME}."
        echo -e "$SUBJECT_CONTENT"|tee $LOG_FILE
        MAIL $SUBJECT_CONTENT
        #PAGER $SUBJECT_CONTENT $NOW_TIME
    else
        echo "http://$2 is ok"
        RETVAL=0
    fi
    return $RETVAL
}
function main(){
    UrlList
    for url in `cat $path/domain.list`
    do
        CheckUrl $url
        SendMsg $? $url
    done
}
main
