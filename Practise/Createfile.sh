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
    mkdir /tmp/app-logs
    echo -e "$G Created the $SOURCE_DIRECTORY Successfully $N"

fi
cd /tmp/app-logs
for i in file{1..3} java{1..3}
do
    touch -d 20260630 $i.txt
done