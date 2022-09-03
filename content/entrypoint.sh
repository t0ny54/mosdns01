#!/bin/bash

# Start the first process
sh /etc/mosdns/my_first_process.sh &
  
# Start the second process
sh /etc/mosdns/my_second_process.sh &
  
# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?
