#!/bin/bash

# Returns 1 if lsblk reports that the drive specified is removable

RETURN=0
for i in $(lsblk -l -n -d -o NAME,HOTPLUG -e 7 | awk '{if ($2 == "1") print $0;}' | cut -d " " -f1)
do
    if [ $1 == $i ] || [ $1 == "/dev/$i" ]
    then
    RETURN=1  
    fi
done

echo $RETURN


