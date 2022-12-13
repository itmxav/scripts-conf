#!/bin/bash
SERVER=IP_Addres_NFS
PORT=111

nc -z -v -w5 $SERVER $PORT > /dev/null
result1=$?
#return the exit status (true - 0/false - 1) of last command

if  mount | grep IP_Addres_NFS | grep -q "IP_Addres_NFS:/path/to/foldernfs"; then
	#echo "ok"
	if [  "$result1" != 0 ]; then
    echo "Port is closed!" | mail -s Filesystem username@mail.example.loc
 		#echo  'port '$PORT' is closed'
	else
    echo "Port is open!" | mail -s Filesystem username@mail.example.loc
    #echo 'port '$PORT' is open'
		rsync --delete -az /path/to/work/folder1 /path/to/MountedFolderNFS/folder1
		rsync --delete -az /path/to/work/folder2 /path/to/MountedFolderNFS/folder2
    #rsync --delete -az .....
    #--delete   delete files that don't exist on sender
    #-a, --archive     archive mode
    #-z, --compress    compress file data during the transfer

  fi
else
  echo "Folder is not mount!" | mail -s Filesystem username@mail.example.loc
  #echo "Noo!" > /dev/null
fi

#mount -t nfs IP_Addres_NFS:/path/to/foldernfs /path/to/MountFolder/
