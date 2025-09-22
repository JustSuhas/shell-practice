#!/bin/bash
R="\e[31m"
G="\e[32m"
O="\e[033m"
N="\e[0m"

USERID=$(id -u)

Logs_Folder="/var/log/shell-script"
Script_Name=$( echo $0 | cut -d "." -f1 )
Log_File="$Logs_Folder/$Script_Name.log"

mkdir -p $Logs_Folder 

echo "Script started execution at: $(date)" | tee -a $Log_File

if [ $USERID -ne 0 ]; then
    echo -e "$R Error $N: Run this script with root privelege"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then
        echo -e "$R Error $N: Installing $2 has failed" | tee -a $Log_File
        exit 1
    else
        echo -e "Installation of $2 is $G successful $N" | tee -a $Log_File
    fi
}

dnf list installed mysql &>>$Log_File
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$Log_File
    validate $? "MySQL"
else
    echo -e "MySQL is $O already $N installed" | tee -a $Log_File
fi

dnf list installed nginx &>>$Log_File
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$Log_File
    validate $? "Nginx"
else
    echo -e "Nginx is $O already $N installed" | tee -a $Log_File
fi

dnf list installed python3 &>>$Log_File
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$Log_File
    validate $? "Python3"
else
    echo -e  "Python3 is $O already $N installed" | tee -a $Log_File
fi