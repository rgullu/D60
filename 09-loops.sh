#!/bin/bash

#Loops are two major commands, while & For.
# While loop works on Expressions that we used in if statements.

a=10
while [ $a -gt 0 ]; do
  echo While Loops
  sleep 0.5
  a=$(($a-1))
  done
echo "-------------------------------"
# For loop example.
for fruit in apple banana orange peach ; do
  echo Fruit Name = $fruit
done

# While loop example.
echo -n "Checking connection on port 22 for Host $1"
while true; do
  nc -z $1 22 &>/dev/null
  if [ $? -eq 0 ]; then
    break
  fi
  sleep 1
  echo -n "."
done




