#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error: Please run this script with root privelege"
    exit 1
fi

validate(){
    if [ $1 -ne 0]; then
        echo "Error: Installing $2 has failed"
        exit 1
    else
        echo "Installation of $2 is successful"
    fi


}

dnf install mysql -y
validate $? "MySQL"

dnf install nginx -y
validate $? "Nginx"

dnf install mongodb-mongosh -y
validate $? "Mongosh"
