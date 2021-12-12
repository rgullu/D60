#!/bin/bash
COUNT=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=cart" | jq ".Reservations[].Instances[].PrivateIpAddress"|grep -v null|wc -l)
if [ $COUNT -eq 0 ]; then
  aws ec2 run-instances --image-id ami-0855cab4944392d0a --instance-type t3.micro --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$1}]" | jq
else
  echo "Instance already exists"
fi