arr=(I am oldboy teacher welcome to oldboy training class)
for((i=0;i<${#arr[*]};i++))
do
    if [ ${#arr[$i]} -lt 6 ];then
        echo "${arr[$i]}"
    fi
done
echo ----------------
for word in ${arr[*]}
do
    if [ `expr length $word` -lt 6 ];then
        echo $word
    fi
done
