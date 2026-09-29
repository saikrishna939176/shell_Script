#!/bin/bash

VALIDATE(){
    if [ $1 -ne 0]
    then    
        echo "$2...FAILURE"
        exit 1
    else
        echo "$2...SUCCESS"
    fi
}

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP

if [ $USERID -ne 0 ]
then   
    echo "Please run this script with root access"
    exit 1
else
    echo "you are super access"
fi

for i in $@
do  
    echo "package to install: $i"
    dnf list installed $i &>>$LOGFILE
    if  [ $? -eq 0 ] 
    then
        echo "$i already installed... SKIPPING"
    else    
        #echo "$i not installed.. Need to install"
        dnf install $i -y &>>$LOGFILE
        VALIDATE $? "installation of $i"
    fi
done