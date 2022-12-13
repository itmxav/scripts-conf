#!/bin/bash

#Simple check df and mail notification.

diskspace=`df -h | grep 'example_filesystem_line' | awk '{print $5}' | sed '{s/.$//;}'`
max=85

if [ "$diskspace" -gt "$max" ]
        then    echo "Need more place!! Use > 85% in example_filesystem_line!" | mail -s Filesystem username@mail.example.loc
                #curl...
              else    echo "1" > /dev/null
fi
