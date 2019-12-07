#!/bin/bash
PATH="/usr/bin/mysql:$PATH"
MYUSER=root
MYPASS=aaaassss
SOCKET=/var/lib/mysql/mysql.sock
MYCMD="mysql -u$MYUSER -p$MYPASS -S $SOCKET"
for dbname in oldboy oldgirl xiaoting bingbing
do
    echo ==============${dbname}.test=============
    $MYCMD -e "use $dbname;select * from ${dbname}.test;"
done
