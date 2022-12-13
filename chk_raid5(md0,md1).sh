#!/bin/bash
raidtop=`cat /proc/mdstat | grep 'level 5' | awk '{print $12}' | head -n1`
raiddown=`cat /proc/mdstat | grep 'level 5' | awk '{print $12}' | tail -n1`
chk="[UUU]"
if [ "$raidtop" != "$chk" ]
	then	echo "Raid is bad!" | mail -s Raid username@mail.example.loc
		#curl "https://api.telegram.org/botIDBOOOT:COOONNETCWITHBOOOT/sendMessage" -d 'chat_id=IDCHAAAAAT&text=Raid is bad!'  > /dev/null 2>&1
	else	echo "1" > /dev/null > /dev/null 2>&1
fi

if [ "$raiddown" != "$chk" ]
	then   echo "Raid is bad!" | mail -s Raid username@mail.example.loc
		#curl "https://api.telegram.org/botIDBOOOT:COOONNETCWITHBOOOT/sendMessage" -d 'chat_id=IDCHAAAAAT&text=Raid is bad!'  > /dev/null 2>&1
	else   echo "1" > /dev/null > /dev/null 2>&1
fi
