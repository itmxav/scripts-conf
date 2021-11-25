#!/bin/bash
h=`date | awk '{print $4}' | cut -f1 -d":"`
d=`date | awk '{print $3}'`
m=`tail -n 1 /path/to/site-access.log | awk '{print $4}' | cut -b 5-7`
y=`date | awk '{print $6}'`
lh=$( expr $h - 1)
ld=$( expr $d)
ly=$( expr $y)
#echo $ld
maxreq=10000
info=`tail -n 200000 /path/to/site-access.log | grep ''$ld'/'$m'/'$ly':'$lh'' | cut -d ' ' -f 1 | sort | uniq -c | sort -n | tail -n 1`
echo $info
inforeq=`echo $info | awk '{print $1}'`
infoip=`echo $info | awk '{print $2}'`

if [ "$inforeq" -gt "$maxreq" ];
        then    curl  "https://api.telegram.org/botIDBOOOT:COOONNETCWITHBOOOT/sendMessage" -d 'chat_id=IDCHAAAAAT&text=📈'$inforeq' requests for last hours from IP '$infoip''  > /dev/null 2>&1
        else    echo "1" > /dev/null
fi
