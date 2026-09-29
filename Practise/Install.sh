#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with sudo access"
    exit 1

else    
    echo "You are super access"
fi 

dnf install mariadb105
if [ $? -ne 0 ]
then
    echo "Installation of mysql..Failure"