#!/bin/bash
echo "Interfaces list:"
ls -la /sys/class/net/ | awk '{print $9}' | tail -n +4
echo "\nShow info intf - Y|y or N|n - exit:"
read showf
	case  "$showf" in
			Y|y)	echo "\nEnter interface name from list:"
				read intf
				echo "---\nInfo:"; cat /sys/class/net/$intf/uevent
				echo "---\nLink state:"; cat /sys/class/net/$intf/operstate
				echo "---\nDuplex:"; cat /sys/class/net/$intf/duplex
				echo "---\nSpeed:"; cat /sys/class/net/$intf/speed
				echo "---\nMTU:"; cat /sys/class/net/$intf/mtu
				echo "---\nMAC:"; cat /sys/class/net/$intf/address
				;;
			N|n)	;;
                	*)	echo "no!))) "
				;;
	esac
echo "\n;)"
