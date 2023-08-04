#!/usr/bin/env bash

# Check if the script is being run with root privileges (required to see process details)
if [ "$EUID" -ne 0 ]; then
    echo "This script requires root privileges. Please run with sudo or as root."
    exit 1
fi

# Function to get the program name associated with a PID
get_program_name() {
    pid=$1
    ps -p "$pid" -o comm= 2>/dev/null
}

# Get the list of listening sockets and corresponding PIDs
listening_sockets=$(netstat -tlnp 2>/dev/null | grep 'LISTEN')

# If 'netstat' command is not available, exit
if [ -z "$listening_sockets" ]; then
    echo "Error: Unable to retrieve listening ports. Make sure 'netstat' command is available."
    exit 1
fi

# Print header
echo "Listening Ports | PID | Process Name"

# Loop through each listening socket
while read -r line; do
    port=$(echo "$line" | awk '{print $4}' | awk -F ":" '{print $2}')
    pid=$(echo "$line" | awk '{print $7}' | awk -F "/" '{print $1}')
    process_name=$(get_program_name "$pid")

    # If PID is numeric and process name is not empty, print the details
    if [[ $pid =~ ^[0-9]+$ ]] && [ -n "$process_name" ]; then
        echo "$port | $pid | $process_name"
    fi
done <<< "$listening_sockets"
