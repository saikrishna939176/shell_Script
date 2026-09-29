#!/bin/bash

num1=$1
num2=$2
operator=$3

Result=$(($1 $3 $2))

echo "numq & num2 is $Result"

if [ "$3" == "+" ]  
then
echo "addition of two numbers: $Result"
elif [ "$3" == "-" ]
then 
echo "subtraction of two numbers: $Result"
elif [ "\$3" == "\*" ]
then
echo "Multiplication of two numbers: $Result"
fi

echo "$$ --PID" 
echo "$0 --Name"
echo "$user --USER"
sleep 5 &
echo "$! --Sleep"
echo "$PWD"
echo "$HOSTNAME --hostname"
echo "$HOME --Home"