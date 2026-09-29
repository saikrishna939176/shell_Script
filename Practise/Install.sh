#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with sudo access"
    exit 1

else    
    echo "You are super access"
fi 

dnf install mariadb105 -N
if [ $? -ne 0 ]
then
    echo "Installation of mysql..Failure"
else
    echo "Installation of mysql..SUCCESS"
fi

dnf1 remove mariadb105 -y
if [ $? -ne 0 ]
then    
    echo "Removing the mysql.. Failure"

else
    echo "Removing the mysql.. SUCCESS"
fi
