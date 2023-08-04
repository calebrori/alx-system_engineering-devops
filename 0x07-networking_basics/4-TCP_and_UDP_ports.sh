#!/usr/bin/env bash

# Check if the script is executed with superuser privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root (or using sudo)."
  exit 1
fi

# Function to get program name from PID
get_program_name() {
  local pid=$1
  local program_name=$(ps -p "$pid" -o comm= 2>/dev/null)
  echo "$program_name"
}

# Print header
echo "Active Internet connections (only servers)"
echo "Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name"

# Get listening ports with associated PIDs and program names using netstat
netstat -tulnep | awk '$6 == "LISTEN" && $1 ~ /^(tcp|udp)/ {
  split($4, local_addr, ":");
  pid = substr($NF, 0, index($NF, "/")-1);
  program_name = get_program_name(pid);
  printf "%-4s %-7s %-7s %-24s %-22s %-12s %s\n", $1, $2, $3, $4, $5, $6, pid "/" program_name;
}'

# Print footer
echo "Active UNIX domain sockets (only servers)"
echo "Proto RefCnt Flags       Type       State         I-Node   PID/Program name    Path"

# Get listening UNIX domain sockets with associated PIDs and program names using netstat
netstat -lxnep | awk '$5 == "LISTEN" {
  pid = substr($NF, 0, index($NF, "/")-1);
  program_name = get_program_name(pid);
  printf "%-4s %-8s %-11s %-11s %-12s %-8s %s\n", $1, $2, $3, $4, $5, pid "/" program_name, $9;
}'
