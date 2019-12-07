arr=(I am oldboy teacher welcome to oldboy training class)
for word in ${arr[*]}
do
    if [ `echo $word|wc -L` -lt 6 ];then
        echo $word
    fi
done
chars="I am oldboy teacher welcome to oldboy training class"
for word in $chars
do
    if [ `echo $word|wc -L` -lt 6 ];then
        echo $word
    fi
done
