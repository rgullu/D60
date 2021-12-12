#!/bin/bash
## functions always use before declare.
## So that is the reason always we see functions at the starting stage.
function abc(){
  echo I am a funciton abc
  a=100
  echo a in function = $a
  b=20
  echo First argument in function = $1
}
xyz(){
  echo I am a funciton xyz
}
# Calling main funciton
a=10
abc
echo b in main = $b
xyz

echo First argument in Main program = $1