#!/bin/bash

USER = $(id -u)
if [ $USER -ne 0 ] 
then
    echo "Please run this script with root access."
    exit 1
else
    dnf update -y
    dnf install nginx -y
    echo "Installation is done"