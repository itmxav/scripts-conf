#!/bin/bash
echo "# Info about state network interface #"
echo "######################################"
clear
echo "Enter net first 3 ostets. Hosts scan (1..254):"
read netf
clear;echo $netf.{1..254} | xargs -n1 -P0 ping -c1 | grep "bytes from" | grep $netf > $netf.txt
sudo nmap -Pn $netf.0/24 >> $netf.txt
