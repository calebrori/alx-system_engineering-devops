#!/usr/bin/env bash

# Check if the 'nc' command is available
if ! command -v nc &> /dev/null; then
    echo "Error: 'nc' (netcat) command not found. Please install netcat and try again."
    exit 1
fi

#Handles incoming connections
handle_connection() {
    echo "Connection received from: $1"
}

# Listens to port 98 on localhost
nc -l -p 98 | while read -r line; do
    handle_connection "$line"
done
