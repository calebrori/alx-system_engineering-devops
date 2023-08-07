#!/usr/bin/env bash

# Get the list of network interfaces
interfaces=$(ip addr | grep '^[0-9]' | awk '{print $2}')

# Display all active IPv4 IPs on the machine
for interface in $interfaces; do
    ipv4_addresses=$(ip addr show dev "$interface" | grep 'inet ' | awk '{print $2}')
    echo "Interface: $interface"
    echo "IPv4 Addresses:"
    echo "$ipv4_addresses"
    echo
done
