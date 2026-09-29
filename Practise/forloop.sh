#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

echo "Starting the script: $TIMESTAMP"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
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
        echo -e "$packages is $R not installed..$N Need to install"
    else
        echo -e "$packages $Y is already installed..SKIPPING $N"
    fi
done