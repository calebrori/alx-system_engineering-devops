#!/usr/bin/env bash

# Get the list of listening sockets and corresponding PIDs
listening_sockets=$(netstat -tlnp 2>/dev/null | grep 'LISTEN')

# Check if netstat command is available, otherwise use ss command (Linux)
if [ -z "$listening_sockets" ]; then
    listening_sockets=$(ss -tlnp 2>/dev/null | grep 'LISTEN')
fi

# If neither netstat nor ss command is available, exit
if [ -z "$listening_sockets" ]; then
    echo "Error: Unaivalable listening ports. Confirm 'netstat' or 'ss' commands are available."
    exit 1
fi

# Print header
echo "Listening Ports | PID | Process Name"

# Loop through each listening socket
while read -r line; do
    port=$(echo "$line" | awk '{print $4}' | awk -F ":" '{print $2}')
    pid=$(echo "$line" | awk '{print $7}' | awk -F "/" '{print $1}')
    process_name=$(echo "$line" | awk '{print $7}' | awk -F "/" '{print $2}')

    # If PID is numeric, get the process name using 'ps' command
    if [[ $pid =~ ^[0-9]+$ ]]; then
        process_name=$(ps -p "$pid" -o comm=)
    fi

    echo "$port | $pid | $process_name"
done <<< "$listening_sockets"
