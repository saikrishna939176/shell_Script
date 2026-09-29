#!/bin/bash

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e "$2.. $R FAILURE $N"
        exit 1
    else 
        echo -e "$2..$G SUCCESS $N"
    fi
}

USER= $(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP
R="\e[31m"
G="\e[32m"
N="\e[0m]"

echo "script started executing at: $TIMESTAMP"


if [ $USER -ne 0 ] 
then
    echo "Please run this script with root access"
    exit 1 #manually exit if error comes

else
    echo "You are super access"


dnf install nginx -y &>>LOGFILE

VALIDATE $? "INSTALLING MYSQL"

dnf install git -y &>>LOGFILE

VALIDATE $? "INSTALLING GIT"
