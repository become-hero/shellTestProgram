#!/bin/bash
for n in {0..32767}
do
    echo "`echo $n|md5sum` $n" >>/tmp/zhiwen.log
done
