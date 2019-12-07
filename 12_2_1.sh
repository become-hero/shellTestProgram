#!/bin/bash
[ -f /etc/init.d/functions ] && source /etc/init.d/functions
RETBAL=0
add(){
	for ip in {1..16}
	do
		if [ $ip -eq 10 ];then
			continue
		fi
		ifconfig eno16777728:$ip 10.10.10.$ip/24 up &>/dev/null
		#ip addr add 10.0.0.$ip/24 dev eth16777728 label eth16777728:0
		RETVAL=$?
		if [ $RETVAL -eq 0 ];then
			action "add $ip" /bin/true
		else
			action "add $ip" /bin/false
		fi
	done
	return $RETVAL
}
del(){
	for ip in {16..1}
	do
		if [ $ip -eq 10 ];then
			continue
		fi
		ifconfig eno16777728:$ip down &>/dev/null
		RETVAL=$?
		if [ $RETVAL -eq 0 ];then
			action "del $ip" /bin/true
		else
			action "del $ip" /bin/false
		fi
	done
}
case "$1" in
	start)
	add
	RETVAL=$?
	;;
	stop)
	del
	RETVAL=$?
	;;
	restart)
	del
	sleep 2
	add
	RETVAL=$?
	;;
	*)
		printf "usage:$0 {start|stop|restart}\n"
esac
exit $RETVAL
