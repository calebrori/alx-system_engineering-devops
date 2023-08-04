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

# Print header
echo "Active Internet connections (only servers)"
echo "Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name"

# Get the list of listening sockets and corresponding PIDs
listening_sockets=$(ss -tlnp 2>/dev/null | grep 'LISTEN')

# If 'ss' command is not available, exit
if [ -z "$listening_sockets" ]; then
    echo "Error: Unable to retrieve listening ports. Make sure 'ss' command is available."
    exit 1
fi

# Loop through each listening socket
while read -r line; do
    proto=$(echo "$line" | awk '{print $1}')
    recv_q=$(echo "$line" | awk '{print $2}')
    send_q=$(echo "$line" | awk '{print $3}')
    local_address=$(echo "$line" | awk '{print $4}')
    foreign_address=$(echo "$line" | awk '{print $5}')
    state=$(echo "$line" | awk '{print $1}' | awk -F ":" '{print $2}')
    pid=$(echo "$line" | awk '{print $NF}' | awk -F "/" '{print $1}')
    program_name=$(get_program_name "$pid")

    echo "$proto $recv_q $send_q $local_address $foreign_address $state $pid/$program_name"
done <<< "$listening_sockets"

# Print a separator for better readability
echo

# Print Active UNIX domain sockets (only servers)
echo "Active UNIX domain sockets (only servers)"
echo "Proto RefCnt Flags       Type       State         I-Node   PID/Program name    Path"

# Get the list of active UNIX domain sockets and corresponding PIDs
unix_sockets=$(ss -lxnp 2>/dev/null | grep 'LISTEN')

# If 'ss' command is not available, exit
if [ -z "$unix_sockets" ]; then
    echo "Error: Unable to retrieve active UNIX domain sockets. Make sure 'ss' command is available."
    exit 1
fi

# Loop through each active UNIX domain socket
while read -r line; do
    proto=$(echo "$line" | awk '{print $1}')
    ref_cnt=$(echo "$line" | awk '{print $2}')
    flags=$(echo "$line" | awk '{print $3}')
    type=$(echo "$line" | awk '{print $4}')
    state=$(echo "$line" | awk '{print $5}')
    inode=$(echo "$line" | awk '{print $6}')
    pid=$(echo "$line" | awk '{print $NF}' | awk -F "/" '{print $1}')
    program_name=$(get_program_name "$pid")
    path=$(echo "$line" | awk '{print $NF}')

    echo "$proto $ref_cnt $flags $type $state $inode $pid/$program_name $path"
done <<< "$unix_sockets"
