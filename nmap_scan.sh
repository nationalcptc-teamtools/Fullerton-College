#!/bin/bash

# Check if an IP address is provided as an argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <IP_ADDRESS>"
  exit 1
fi

# Save IP address into IP_ADDRESS variable
IP_ADDRESS="$1"

# Create a directory with name of IP_ADDRESS
mkdir -p "$IP_ADDRESS"

# Run initial quick nmap port scan (first 1000 ports)
# nmap -p- "$IP_ADDRESS" --min-rate=1000 -o "$IP_ADDRESS/1000_ports.txt"

# Run the second quick nmap port scan  (all ports)
nmap -p- "$IP_ADDRESS" --min-rate=1000 -o "$IP_ADDRESS/ports.txt"

# Extract and format the port numbers
PORTS=$(cat "$IP_ADDRESS/ports.txt" | awk '/^[0-9]+\/tcp/{ printf "%s,", $1 } END { printf "\n" }' | sed 's/\/tcp//g')

# Run the final nmap command using the extracted ports and save the output to nmap.txt
nmap -sCV -p "$PORTS" "$IP_ADDRESS" -o "$IP_ADDRESS/nmap.txt"


