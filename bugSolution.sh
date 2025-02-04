#!/bin/bash

# This script demonstrates a solution to the race condition bug using flock.

# Create two files
touch file1.txt
touch file2.txt

# Use flock to prevent race conditions
while true; do
  flock -x <(echo 1) # Acquire exclusive lock
  echo "Process 1" >> file1.txt
  flock -u <(echo 1) # Unlock file
  sleep 0.1
done &

while true; do
  flock -x <(echo 1) # Acquire exclusive lock
  echo "Process 2" >> file1.txt
  flock -u <(echo 1) # Unlock file
  sleep 0.1
done &

# Let the processes run for a while
sleep 5

# Kill the background processes
killall -TERM bash