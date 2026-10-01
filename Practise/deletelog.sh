#!/bin/bash

SOURCE_DIRECTORY=/tmp/app-logs  

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURCE_DIRECTORY ]
then
    echo -e "$G Source directory exists $N "

else    
    echo -e "$R Please make sure $SOURCE_DIRECTORY exists $N"
    sleep 3
    mkdir /app-logs
    echo "Created the $SOURCE_DIRECTORY $G Successfully $N"

fi

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)
# echo "Files to delete: $FILES"
while IFS= read -r file
do
    echo "Deleting file: $file"
    rm -rf $file
done <<< $FILES

    