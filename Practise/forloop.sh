#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/logs/$SCRIPT_NAME-$TIMESTAMP.log



echo "Starting the script: $TIMESTAMP"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e "$2 .. $R FAILURE $N"
    else
        echo -e "$2 .. $G Installed $N"
    fi
}
if [ $USERID -ne 0 ]
then
    echo "Need to run the script with super access"
    exit 1
else
    echo "You are super access"
fi 

for packages in $@
do
    echo "packages to install: $packages"
    dnf list installed $packages &>>$LOGFILE

    if [ $? -eq 0 ]
    then    
        echo -e "$packages $Y is already installed..SKIPPING $N"
    else
         echo -e "$packages is $R not installed..$N Installing Packages"
         sleep 3
         dnf remove $packages -y &>>LOGFILE
         VALIDATE $? "Installing mysql"
    fi  

    # echo "Need to uninstall the software type 1 to uninstall / type 0 exit"
    # read uninstall
    echo "which software need to uninstall please provide the package name" 
    read packagename
    if [ $packagename == "mariadb105" ] 
    then
        dnf remove $packagename -y &>>LOGFILE
        VALIDATE $? "Uninstall mysql"
    else    
        echo "I don't want to uninstall it"
    fi

done
