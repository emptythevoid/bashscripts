#! /bin/bash

# Wait for printer information and log it
stty raw -echo < /dev/ttyUSB0; cat /dev/ttyUSB0 >> file.log

# Log with tee
#stty raw -echo < /dev/ttyUSB0; cat -vte /dev/ttyUSB0 | tee -a file.log

# finish
echo "Done"
