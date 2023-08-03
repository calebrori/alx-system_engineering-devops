#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 {IP_ADDRESS}"
    exit 1
fi

ip_address=$1

# Function to perform the ping
perform_ping() {
    ping -c 5 "$ip_address"
}

perform_ping
