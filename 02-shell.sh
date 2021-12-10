#!/bin/bash

# echo message to print the console output.
echo Hello World
echo Welcome

# ESC sequence, \n (new line), \e (new tab).
echo -e "Hello World\nWelcome"

echo -e "word1\tword2"

# Colored output.
echo -e "\e[31mText in Red Color"
echo -e "\e[32mText in Green Color"
echo -e "\e[33mText in Yellow Color"
echo -e "\e[34mText in Blue Color"
echo -e "\e[35mText in Magenta Color"
echo -e "\e[36mText in Cyan Color"

#https://misc.flogisoft.com/bash/tip_colors_and_formatting.

# Color always follows.
echo -e "\e[31mText in red color\e[0m"
echo Text in normal color

