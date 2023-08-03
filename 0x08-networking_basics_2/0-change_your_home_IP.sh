#!/usr/bin/env bash

# Checks script to see if it's running inside Docker
if [ -f "/.dockerenv" ]; then
    echo "Running inside Docker."
else
    echo "Script should run inside Docker. Exiting..."
    exit 1
fi

# Add/update an entry in /etc/hosts
add_to_hosts() {
    hostname=$1
    ip_address=$2
    grep -qF "$ip_address $hostname" /etc/hosts || echo "$ip_address $hostname" | sudo tee -a /etc/hosts > /dev/null
}

# Update localhost resolution
add_to_hosts "localhost" "127.0.0.2"

# Update facebook.com resolution
add_to_hosts "facebook.com" "8.8.8.8"

echo "DNS configuration completed."
