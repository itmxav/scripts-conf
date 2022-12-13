#!/bin/bash

#Example:shutdown port
#Need sshpass utility

USER=""
IP=""
sshpass -p 'password' ssh $USER@$IP  << EOF
!
!
en
cisco
!
!
!
conf t
!
!
interface GigabitEthernet1/1
!
!
!
shut
!
!
exi
!
!
exi
!
!
exi
EOF
