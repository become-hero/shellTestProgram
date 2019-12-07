#!/bin/bash
PATH="/usr/bin/mysql/bin:$PATH"
MYUSER=root
MYPASS=aaaassss
SOCKET=/var/lib/mysql/mysql.sock
MYCMD="mysql -u$MYUSER -p$MYPASS -S $SOCKET"
for dbname in oldboy oldgirl xiaoting bingbing
do
    $MYCMD -e "use $dbname;create table test(id int,name varchar(16));insert into test values(1,'testdata');"
done
