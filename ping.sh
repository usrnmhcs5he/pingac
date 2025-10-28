#!/bin/bash

output_file="active_ips.txt"
> "$output_file"  # Clear the file if it exists

for i in {2..254}; do
  ip="192.168.0.$i"
  if ping -c 1 -W 1 "$ip" > /dev/null 2>&1; then
    echo "$ip is active" >> "$output_file"
  fi
done

echo "Scan complete. Active IPs saved to $output_file."

# Version 1
