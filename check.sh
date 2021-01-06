#!/bin/bash

for ((i=1;i<3;i++)); do

date_time=`/usr/bin/date "+%Y-%m-%d %H:%M:%S"`

echo "############################################################################################" >>$(dirname $0)/checkOSMON.log

echo "### 开始时间:"$date_time" ###" >> $(dirname $0)/checkOSMON.log

echo "############################################################################################" >>$(dirname $0)/checkOSMON.log

echo "" >>$(dirname $0)/checkOSMON.log

echo -e "\033[36m************CPU信息*************\033[0m" >>$(dirname $0)/checkOSMON.log

/usr/bin/top -b -n2|head -30 >>$(dirname $0)/checkOSMON.log

echo "" >>$(dirname $0)/checkOSMON.log

echo -e "\033[36m************CPU占用TOP 10进程*************\033[0m" >>$(dirname $0)/checkOSMON.log

echo -e "用户 进程ID %CPU 命令

$(ps aux | awk '{print $1, $2, $3, $11}' | sort -k3rn | head -n 10 )"| column -t >>$(dirname $0)/checkOSMON.log

echo "" >>$(dirname $0)/checkOSMON.log

echo -e "\033[36m************内存占用TOP 10进程*************\033[0m" >>$(dirname $0)/checkOSMON.log

echo -e "用户 进程ID %MEM 虚拟内存 常驻内存 命令

$(ps aux | awk '{print $1, $2, $4, $5, $6, $11}' | sort -k3rn | head -n 10 )"| column -t >>$(dirname $0)/checkOSMON.log

echo "" >>$(dirname $0)/checkOSMON.log

echo -e "\033[36m##############内存信息:##############\033[0m">>$(dirname $0)/checkOSMON.log

/usr/bin/free -m >>$(dirname $0)/checkOSMON.log

echo "" >>$(dirname $0)/checkOSMON.log

echo -e "\033[36m##############TCP连结数:##############\033[0m">>$(dirname $0)/checkOSMON.log

echo "TCP数量:" `/usr/bin/netstat -anlp | grep tcp | awk '{print $5}'|awk -F ':' '{print substr($1,1)}'|sort -u|uniq|wc -l` >>$(dirname $0)/checkOSMON.log

echo "UDP数量:" `/usr/bin/netstat -anlp | grep udp | awk '{print $5}'|awk -F ':' '{print substr($1,1)}'|sort -u|uniq|wc -l` >>$(dirname $0)/checkOSMON.log

echo "" >>$(dirname $0)/checkOSMON.log

echo -e "\033[36m##############查看挂载点##############\033[0m">>$(dirname $0)/checkOSMON.log

/usr/bin/df -h >>$(dirname $0)/checkOSMON.log

echo "" >>$(dirname $0)/checkOSMON.log

echo -e "\033[36m##############读取磁盘IO信息:##############\033[0m">>$(dirname $0)/checkOSMON.log

vmstat -a -S m 1 2 >>$(dirname $0)/checkOSMON.log

echo "" >>$(dirname $0)/checkOSMON.log

echo -e "\033[33m************************检查网络稳定性**********************************\033[0m">>$(dirname $0)/checkOSMON.log

echo -e "\033[36m##############检查公共网络192.168.168.21/22##############\033[0m">>$(dirname $0)/checkOSMON.log

echo `/usr/bin/date "+%Y-%m-%d %H:%M:%S"` >> $(dirname $0)/checkOSMON.log

traceroute -r -F -s 192.168.10.147 192.168.10.20 >>$(dirname $0)/checkOSMON.log

echo `/usr/bin/date "+%Y-%m-%d %H:%M:%S"` >> $(dirname $0)/checkOSMON.log

traceroute -r -F -s 192.168.10.147 192.168.10.20 >>$(dirname $0)/checkOSMON.log

echo `/usr/bin/date "+%Y-%m-%d %H:%M:%S"` >> $(dirname $0)/checkOSMON.log

traceroute -r -F -s 192.168.10.147 192.168.10.20 >>$(dirname $0)/checkOSMON.log

echo "" >>$(dirname $0)/checkOSMON.log

echo -e "\033[36m###############检查私有网络10.1.1.1/2##############\033[0m">>$(dirname $0)/checkOSMON.log

echo `/usr/bin/date "+%Y-%m-%d %H:%M:%S"` >> $(dirname $0)/checkOSMON.log

traceroute -r -F -s 172.16.84.167 172.16.84.132 >>$(dirname $0)/checkOSMON.log

echo `/usr/bin/date "+%Y-%m-%d %H:%M:%S"` >> $(dirname $0)/checkOSMON.log

traceroute -r -F -s 172.16.84.167 172.16.84.132 >>$(dirname $0)/checkOSMON.log

echo `/usr/bin/date "+%Y-%m-%d %H:%M:%S"` >> $(dirname $0)/checkOSMON.log

traceroute -r -F -s 172.16.84.167 172.16.84.132 >>$(dirname $0)/checkOSMON.log

echo "" >>$(dirname $0)/checkOSMON.log

echo -e "\033[36m##############读取网卡流量信息:##############\033[0m" >>$(dirname $0)/checkOSMON.log

/usr/bin/sar -n DEV 1 1 >> $(dirname $0)/checkOSMON.log

echo "" >>$(dirname $0)/checkOSMON.log

echo -e "\033[36m##############TOMCAT的进程号:##############\033[0m" >>$(dirname $0)/checkOSMON.log

ps -ef|grep "/opt/gdsoft/apache" |grep tomcat| cut -c -160 >>$(dirname $0)/checkOSMON.log

echo " 结束时间:"`/usr/bin/date "+%Y-%m-%d %H:%M:%S"` >> $(dirname $0)/checkOSMON.log

echo "" >>$(dirname $0)/checkOSMON.log

sleep 30

done