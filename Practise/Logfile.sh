#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

VALIDATE() {
    if [ $1 -ne 0 ] 
    then
        echo "$2 ... FAILURE"
        exit 1

    else
        echo "$2 ... SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then    
    echo "Need to run the script with super access"
    exit 1
else    
    echo "You are super access"
fi

dnf remove mariadb105 -y &>>$LOGFILE
VALIDATE $? "Installing mysql" 

