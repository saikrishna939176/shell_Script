#!/bin/bash



USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Please run the script wih super access"
    exit 1

else
    echo "you are super access"
fi
VALIDATE $? "Installing Mysql"

VALIDATE() {
    echo "EXIT STATUS: $1"
    echo "What are you doing:: $2"
}