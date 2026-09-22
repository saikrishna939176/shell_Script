#!/bin/bash

echo "Welcone to script"
num1=$1
num2=$2

Add=$(($num1+$num2))
echo "addition of $num1 and $num2 :  ${Add}"


if [ $Add -gt 20 ]
then
    echo "add value is greater than 20"
else
    echo "add value is not greather than 20"
fi

