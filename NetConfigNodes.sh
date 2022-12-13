#!/bin/bash
USER=""
PASSWD=""

#Example traffic-shape and conf-part Zyxel Keenetic Wi-Fi
#net-nodes: 10.0.1.10-100 (<100) & 10.0.2.10-100 (<=100)

commands(){
	(sleep 3;
	echo -en "$USER\r";
	sleep 3;
	echo -en "$PASSWD\r";
	sleep 3;
	echo -en "interface Home traffic-shape rate 40000\r";
	sleep 3;
	echo -en "interface WifiMaster0\r";
	sleep 3;
	echo -en "compatibility N\r";
	sleep 3;
	echo -en "power 100\r";
	sleep 3;
	echo -en "interface WifiMaster0/AccessPoint0\r";
	sleep 3;
	echo -en "no wps\r";
	sleep 3;
	echo -en "wmm\r";
	sleep 3;
	echo -en "system configuration save\r";
	sleep 3;
	echo -en "exit\r";) | telnet $1
}

ipaddress(){
	if [ $2 -eq 1 ]
	then
		f="10.0.1.$1"
		echo "Start $f..."
		commands "$f"
	else
		f="10.0.2.$1"
		echo "Start $f..."
		commands "$f"
        fi
}

for (( i = 10; i < 100; i++ ))
do
	ipaddress "$i" "1"
done

for (( i = 10; i <= 100; i++ ))
do
