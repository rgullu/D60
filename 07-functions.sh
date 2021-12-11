#!/bin/bash
## functions always use before declare.
## So that is the reason always we see functions at the starting stage.
function abc(){
  echo I am a funciton abc
}
xyz(){
  echo I am a funciton xyz
}
# Calling main funciton
abc
xyz