#!/bin/bash

# turn on bash's job control
set -m

# Start the first process
sh /etc/mosdns/my_first_process.sh &
  
# Start the second process
sh /etc/mosdns/my_second_process.sh &

# now we bring the primary process back into the foreground
# and leave it there
fg %1
