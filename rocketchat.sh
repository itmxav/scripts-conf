#!/bin/bash
url='https://example.loc/hooks/111111111111key/dfgdg123123'
username='nameuser'

#TO="$1"
subject="$1"
message="$2"

test=`echo "$subject" | awk '{print $1}'`
#echo $test > m
prob="PROBLEM"
ok="OK"

if [[ "$test" == "$prob" ]];
        then ICON="⚠️"
        elif [[ "$test" == "$ok" ]];
                then    ICON="✅"
                else    ICON="❓"
fi


payload='{"username":"'$username'","attachments":[{"title":"'${subject}'","text":"'${ICON}${message}'"}]}'

curl -X POST -H 'Content-Type: application/json' --data "${payload}" $url
#curl -x http://proxy:port -X POST -H 'Content-Type: application/json' --data "${payload}" $url
#rocketchat doesn't understand the '/n'
#exit 0
