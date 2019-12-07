exec <apache.log
sum=0
while read line
do
    [ -z "`echo $line|awk '{print $10}'|sed 's#[0-9]##g'`" ] || continue
    ((sum=sum+`echo $line|awk '{print $10}'`))
done
echo $sum
