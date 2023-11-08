#!/bin/bash

# Check if a subnet is provided as an argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <SUBNET>"
  exit 1
fi

# Save the subnet into SUBNET variable
SUBNET="$1"

# Create a directory with the name of the subnet
NETWORK=$(echo "$SUBNET" | cut -d'/' -f1)

mkdir -p "$NETWORK"
cd "$NETWORK"

# Perform an initial ping scan to identify active hosts in the subnet
nmap -sn "$SUBNET" -oG "active_hosts.txt"

# Extract the IP addresses of active hosts
ACTIVE_IPS=$(awk '/Up$/{print $2}' "active_hosts.txt")

# Loop through each active IP and run nmap_scan.sh
for IP in $ACTIVE_IPS; do
  /home/kali/Downloads/nmap_scan.sh "$IP"
done

