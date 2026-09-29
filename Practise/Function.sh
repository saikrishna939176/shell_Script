#!/bin/bash


VALIDATE() {
    # echo "EXIT STATUS: $1"
    # echo "What are you doing:: $2"
    if [ $1 -ne 0 ]
    then
        echo "$2 .. Failure"
        exit 1
    else
        echo "$2 .. Success"

    fi
}
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Please run the script wih super access"
    exit 1

else
    echo "you are super access"
fi

dnf install mariadb105 -y
VALIDATE $? "Installing Mysql"

