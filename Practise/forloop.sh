#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
if [ $USERID -ne 0 ]
then
    echo "Need to run the script with super access"

else
    echo "You are super access"
fi 

for packages in $@
do
    echo "packages to install: $packages"
    dnf list installed $packages &>>LOGFILE

    if [ $? -ne 0 ]
    then    
        echo "$packages is not installed.. Need to install"
    else
        echo "$packages is already installed..SKIPPING"
    fi
done