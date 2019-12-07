#!/bin/bash
PATH="/usr/bin/mysql/bin:$PATH"
MYUSER=root
MYPASS=aaaassss
SOCKET=/var/lib/mysql/mysql.sock
MYCMD="mysql -u$MYUSER -p$MYPASS -S $SOCKET"
for dbname in oldboy oldgirl xiaoting bingbing
do
    $MYCMD -e "create database $dbname"
done
