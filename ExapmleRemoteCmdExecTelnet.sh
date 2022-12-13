#!/bin/bash

#Example:shutdown port

USER=""
PASSWD=""
PASSWD1=""
(sleep 3;
echo -en "$USER\r";
sleep 3;
echo -en "$PASSWD\r";
sleep 3;
echo -en "en\r";
sleep 3;
echo -en "$PASSWD1\r";
sleep 3;
echo -en "conf t\r";
sleep 3;
echo -en "interface GigabitEthernet1/1\r";
sleep 3;
echo -en "shut\r";
sleep 3;
echo -en "exit\r";
sleep 3;
echo -en "exit\r";
sleep 3;
echo -en "exit\r";) | telnet  IP-ADDRESS

exit 0
