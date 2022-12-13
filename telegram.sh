#!/bin/bash

#Notification for Zabbix

TOKEN='IDBOOOT:COOONNETCWITHBOOOT'

if [ $# -ne 3 ] ; then echo 'Error! You must to define three params' && exit 1 ; fi

CHAT_ID="$1"
SUBJECT="$2"
MESSAGE="$3"

test=`echo "$SUBJECT" | awk '{print $1}'`
prob="PROBLEM"
ok="OK"

if [[ "$test" == "$prob" ]];
        then ICON="⚠"
        elif [[ "$test" == "$ok" ]];
                then    ICON="✅"
                else    ICON="❓"
fi
curl -s --header 'Content-Type: application/json' --request 'POST' --data "{\"chat_id\":\"${CHAT_ID}\",\"text\":\"$ICON ${SUBJECT}\n${MESSAGE}\"}" "https://api.telegram.org/bot${TOKEN}/sendMessage" | grep -q '"ok":false,'
exit 0
