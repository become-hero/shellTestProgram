#!/bin/bash
PATH="/usr/bin/mysql/bin:$PATH"
DBPATH=/server/backup
MYUSER=root
MYPASS=aaaassss
SOCKET="/var/lib/mysql/mysql.sock"
MYCMD="mysql -u$MYUSER -p$MYPASS -S $SOCKET"
MYDUMP="mysqldump -u$MYUSER -p$MYPASS -S $SOCKET"
[ ! -d $DBPATH ] && mkdir $DBPATH
for dbname in `$MYCMD -e "show databases;"|sed '1,2d'|egrep -v "mysql|schema"`
do
    mkdir $DBPATH/${dbname}_$(date +%F) -p
    for table in `$MYCMD -e "show tables from $dbname;"|sed '1d'`
    do
        $MYDUMP $dbname $table|gzip >$DBPATH/${dbname}_$(date +%F)/${table}_$(date +%F).sql.gz
    done
done
