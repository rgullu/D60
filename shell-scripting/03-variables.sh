#!/bin/bash

a=100
b=abc

echo value of a = $a
echo value of b = $b
echo value of a = ${a}

x=10
y=20
echo ${x}x${y} = 200

#DATE=2021-10-20
DATE=$(date +%F)
echo Good Morning, Welcome, Today date is $DATE

echo COURCE NAME=$COURCE_NAME

