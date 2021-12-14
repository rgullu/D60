#!/bin/bash
source components/common.sh
MSPACE=$(cat $0 | grep Print | awk -F '"' '{print $2}' | awk '{ print length }'|sort|tail -1)

COMPONENT_NAME=Shipping
COMPONENT=shipping

MAVEN

Print "Checking DB Connection from App"
sleep 15
STAT=$(curl -s -f http://localhost:8080/health)
if [ "$STAT" == "OK" ]; then
  Stat 0
else
  Stat 1
fi


#Download the repo
#$ cd /home/roboshop
#$ curl -s -L -o /tmp/shipping.zip "https://github.com/roboshop-devops-project/shipping/archive/main.zip"
#$ unzip /tmp/shipping.zip
#$ mv shipping-main shipping
#$ cd shipping
#$ mvn clean package
#$ mv target/shipping-1.0.jar shipping.jar
#Update Servers IP address in /home/roboshop/shipping/systemd.service
#
#Copy the service file and start the service.
#
## mv /home/roboshop/shipping/systemd.service /etc/systemd/system/shipping.service
## systemctl daemon-reload
## systemctl start shipping
## systemctl enable shipping