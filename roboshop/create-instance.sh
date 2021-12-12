#!/bin/bash
aws ec2 run-instances --image-id ami-0855cab4944392d0a --instance-type t3.micro|jq