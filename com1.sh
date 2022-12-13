#!/bin/bash
while [ "$answer" != "q" ]
do

echo "COM1 via Putty. Need superuser. Speed (8,N,1)?";
echo "A|a - 4800,";
echo "S|s - 9600,";
echo "D|d - 19200,";
echo "F|f - 38400,";
echo "G|g - 57600,";
echo "H|h - 115200,";
echo "J|j - Enter speed,";
echo "Q|q - quit.";

read answer
        case  "$answer" in
                                        A|a) putty /dev/ttyS0 -serial -sercfg 4800,8,n,1,N
                                                 ;;
                                        S|s) putty /dev/ttyS0 -serial -sercfg 9600,8,n,1,N
                                                 ;;
                                        D|d) putty /dev/ttyS0 -serial -sercfg 19200,8,n,1,N
                                                 ;;
					                              F|f) putty /dev/ttyS0 -serial -sercfg 38400,8,n,1,N
						                                     ;;
                                        G|g) putty /dev/ttyS0 -serial -sercfg 57600,8,n,1,N
                                                 ;;
                                        H|h) putty /dev/ttyS0 -serial -sercfg 115200,8,n,1,N
                                                 ;;
                                        J|j) echo "Speed = "
                                             read speed
                                             putty /dev/ttyS0 -serial -sercfg $speed,8,n,1,N
                                                 ;;
                                        Q|q)       echo "bye!"
                                                 ;;
                                        *)       echo "Nooooooo!"
                                                 ;;
        esac
done
