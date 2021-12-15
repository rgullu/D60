#!/bin/bash
CREATE(){
  COUNT=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" | jq ".Reservations[].Instances[].PrivateIpAddress"|grep -v null|wc -l)

  if [ $COUNT -eq 0 ]; then
    aws ec2 run-instances --image-id ami-0760b951ddb0c20c9 --instance-type t2.micro --security-group-ids sg-06a565a11eb44c7bc --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$1}]" | jq &>/dev/null
  else
    echo "$1 Instance already exists"
  fi

  sleep 5

  IP=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" | jq ".Reservations[].Instances[].PrivateIpAddress" | grep -v null|xargs)
  # xargs is used to remove the double quotes for ipaddress. or you can remove xargs here and record.json file IPADDRESS remove the quotes.
  sed -e "s/DNSNAME/$1.roboshop.internal/" -e "s/IPADDRESS/${IP}/" record.json >/tmp/record.json

  aws route53 change-resource-record-sets --hosted-zone-id Z08824272G1CUC58UUD82 --change-batch file:///tmp/record.json | jq &>/dev/null
}

if [ "$1" == "all" ]; then
  ALL=(frontend mongodb catalogue redis user cart mysql shipping rabbitmq payment)
  for component in ${ALL[*]};do
    echo "Creating Instance - $component"
    CREATE $component
  done
else
  CREATE $1
fi