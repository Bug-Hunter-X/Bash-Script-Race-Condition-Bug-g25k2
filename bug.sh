#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes simultaneously to modify the same file
(while true; do echo "Process 1" >> file1.txt; sleep 0.1; done) &
(while true; do echo "Process 2" >> file1.txt; sleep 0.1; done) &

# The script will not end due to the race condition