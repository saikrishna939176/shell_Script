#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Need to run the script with super access"

else
    echo "You are super access"
fi 

for packages in mariadb105,git,docker
do
    echo "$packages"
done