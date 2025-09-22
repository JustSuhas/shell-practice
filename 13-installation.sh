#!bin/bash

R="\e[31m"
G="\e[32m"
O="\e[033m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo -e "$R Error $N: Run this script with root privelege"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then
        echo -e "$R Error $N: Installing $2 has failed"
        exit 1
    else
        echo -e "Installation of $2 is $G successful $N"
    fi


}

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    validate $? "MySQL"
else
    echo -e "MySQL is $O already $N installed"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    validate $? "Nginx"
else
    echo -e "Nginx is $O already $N installed"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    validate $? "Python3"
else
    echo -e "Python3 is $O already $N installed"
fi