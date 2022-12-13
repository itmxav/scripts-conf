#!/bin/bash

#Simple check lastlog and mail notification.
usser="root"
FILE="/home/username/last.log"
last | head -n20 | grep $usser >> $FILE
if grep -q $usser $FILE;
 then echo "Line with '$usser':\n $(grep $usser $FILE)\n" | mail -s Last username@mail.example.loc
      #curl ....
 else echo "0" > /dev/null
fi
