#! /bin/bash

# Requirements
#
# figlet, lolcat, entr, spinner.sh

# check if running as root/sudo
if [ $(id -u) != 0 ]; then
   echo "This script requires root permissions"
   exit
fi

clear

figlet "Welcome to" | /usr/games/lolcat
figlet "L D X - hack" | /usr/games/lolcat

echo "Press Enter to begin"
read entervar

clear

# create empty log file if needed
touch ./file.log
# set permissions
chmod 777 ./file.log

# main loop
while [ 1 ]
do
  # Enter patient name
  echo "Enter patient name and press Enter.  Enter 'q' to quit."
  read patient
  
  if [ "$patient" = "q" ]
  then
      exit
  fi
  
  # write data to log file
  
  # pad with empty space
  echo "" >> file.log
  echo "" >> file.log
  
  # Write patient name
  echo $patient >> file.log

  # capture data from machine
  ./draw.sh | /usr/games/lolcat
    
  #echo "Ready to run test. Press Enter when test is complete."
  
  # Run listener script in background
  ./listen.sh &
  
  # Do something with Entr here to try to figure out when stuff has been written to the log
  echo "Waiting for capture to complete. Standby."
  
  # use Entr to check for a change in the log file.
  ./waitspinner.sh 2> /dev/null &
  echo "./file.log" | entr -p ps a | grep -m 1 "entr" | cut -d " " -f 2 | xargs kill
  
  sleep 5
  ps a | grep -m 1 "./spinner.sh" | cut -d " " -f 2 | xargs kill 
  ps a | grep -m 1 "sleep 500" | cut -d " " -f 2 | xargs kill
  echo "Capture complete. Press Enter to continue."
  
  read entervar
   
  # Kill listener
  ps a | grep -m 1 "listen.sh" | cut -d " " -f 2 | xargs kill
  ps a | grep -m 1 "cat /dev/ttyUSB0" | cut -d " " -f 2 | xargs kill

  # reset permissions on log file
  chmod 777 ./file.log

  clear

done


