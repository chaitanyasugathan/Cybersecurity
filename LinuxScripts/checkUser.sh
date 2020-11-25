#!/bin/bash

# check for my_cool_folder
if [ ! -d /research_folder ]
then 
  echo "research_folder isn\'t there!"
fi

# check for my_file.txt
if [ -f /my_file.txt ]
then
  echo "my_file.txt is there"
fi

# if sysadmin is running this script, then run an echo command
if [ $USER != 'sysadmin' ]
then 
  echo "You are not the sysadmin!"
  exit
fi

# if the uid of the user running this script does not equal 1000, run the echo command
if [ $UID -ne 1000 ]
then
  echo "Your UID is wrong"
  exit
fi

# if sysadmin is running this script, run the echo command
if [ $(whoami) = 'sysadmin' ]
then
  echo "You are sysadmin!"
fi