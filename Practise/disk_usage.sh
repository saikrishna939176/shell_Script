#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=10
Message=""

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print $1F}')

    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        Message=echo "$FOLDER is more than $DISK_THRESHOLD, current usage: $USAGE"
    else
        Message=echo "$FOLDER is less than $DISK_THRESHOLD, current usage: $USAGE"
    fi

done <<< $DISK_USAGE

echo "Message:: $Message"

#echo "$Message" | mail -s "Disk usage alert" devasai6711@gmail.com