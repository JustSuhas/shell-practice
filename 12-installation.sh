#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error: Please run this script with root privelege"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0]; then
    echo "Error: Installing MySql has failed"
    exit 1
else
    echo "Installation of MySql is successful"
fi

