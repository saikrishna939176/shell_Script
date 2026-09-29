#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "Script started executing at: $TIMESTAMP"

VALIDATE() {
    if [ $1 -ne 0 ] 
    then
        echo -e "$R$2 ... FAILURE $N"
        exit 1

    else
        echo -e "$G$2 ... SUCCESS $N"
    fi
}

if [ $USERID -ne 0 ]
then    
    echo "Need to run the script with super access"
    exit 1
else    
    echo "You are super access"
fi

dnf install mariadb105 -y &>>$LOGFILE
VALIDATE $? "Installing mysql" 

dnf remove1 mariadb105@ -y &>>$LOGFILE
VALIDATE $? "Removing mysql" 