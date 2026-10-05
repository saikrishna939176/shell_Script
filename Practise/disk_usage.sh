#!/bin/bash

DISK_USAGE=$(df -hT | grep vfat)
DISK_THRESHOLD=10

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print $1F}')

    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        echo "$FOLDER is more than $DISK_THRESHOLD, current usage: $USAGE"
    else
        echo "$FOLDER is less than $DISK_THRESHOLD, current usage: $USAGE"
    fi

done <<< $DISK_USAGE