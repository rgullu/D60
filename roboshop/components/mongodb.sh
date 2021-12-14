#!/bin/bash
source components/common.sh
MSPACE=$(cat $0 | grep Print | awk -F '"' '{print $2}' | awk '{ print length }'|sort|tail -1)

Print "Download Repo"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG
Stat $?

Print "Install MongoDB"
yum install -y mongodb-org &>>$LOG
Stat $?

Print "Update MongoDB Config"
sed -i -e "s/127.0.0.1/0.0.0.0/g" /etc/mongod.conf &>>$LOG
Stat $?

Print "Starting MongoDB"
systemctl restart mongod &>>$LOG
Stat $?

Print "Enabling MongoDB"
systemctl enable mongod &>>$LOG
Stat $?

DOWNLOAD "/tmp"

Print "Load Schema"
cd /tmp/mongodb-main
mongo < catalogue.js &>>$LOG && mongo < users.js &>>$LOG
Stat $?
