# Bash Script Race Condition

This repository demonstrates a race condition bug in a bash script.  Two processes simultaneously write to the same file, resulting in data corruption and unexpected behavior. The solution showcases how to avoid this using file locking mechanisms.

## Bug
The `bug.sh` script creates a race condition by launching two background processes that append to the same file (`file1.txt`). Due to the concurrent writes, the output is unpredictable and incomplete. The script runs indefinitely. 

## Solution
The `bugSolution.sh` demonstrates how to prevent this by using a file lock before writing to file. This ensures exclusive access, eliminating data corruption.