#!/bin/bash
echo "Hi!"
while [ "$answer" != "q" ]

do

echo "What you need to do with mail queue?";
echo "C|c - delete queue with Host not found,";
echo "D|d - delete queue with Rejected: Domain not found,";
echo "E|e - delete queue with Could not complete sender verify callout,";
echo "P|p - view mail queue,";
echo "q - quit.";
read answer
        case  "$answer" in
                                        C|c) postqueue -p | grep -B1 'Host not found' | grep -vE '(--|\()' | awk '{print $1}' | postsuper -d -
                                                 ;;
                                        D|d) postqueue -p | grep -B1 'rejected: Domain not found' | grep -vE '(--|reject)' | awk '{print $1}' | postsuper -d -
                                                 ;;
                                        E|e) postqueue -p | grep -B1 'Could not complete sender verify callout' | grep -vE '(--|\()' | awk '{print $1}' | postsuper -d - 
                                                 ;;
					P|p) 	postqueue -p | less
						 ;;
                                        q)       echo "bye!"
                                                 ;;
                                        *)       echo "Nooooooo!"
                                                 ;;
        esac
done
