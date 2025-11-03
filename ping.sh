#!/bin/bash

output_file="active_ips.txt"
> "$output_file"  # Clear the file if it exists

# Ask for the base IP prefix with default
read -p "Enter the base IP prefix (e.g., 192.168.0.): " base_ip
if [ -z "$base_ip" ]; then
  base_ip="192.168.0."
fi

# Ask for the start of the range with default
read -p "Enter the start of the range (e.g., 2): " start_range
if [ -z "$start_range" ]; then
  start_range=2
fi

# Ask for the end of the range with default
read -p "Enter the end of the range (e.g., 254): " end_range
if [ -z "$end_range" ]; then
  end_range=254
fi

# Validate that start and end are numbers and start <= end
if ! [[ "$start_range" =~ ^[0-9]+$ ]] || ! [[ "$end_range" =~ ^[0-9]+$ ]] || [ "$start_range" -gt "$end_range" ]; then
  echo "Invalid range. Start and end must be numbers, and start must be less than or equal to end."
  exit 1
fi

active_ips=()  # Array to store active IPs for listing

total_ips=$((end_range - start_range + 1))
current=0

for i in $(seq "$start_range" "$end_range"); do
  current=$((current + 1))
  ip="${base_ip}${i}"
  
  # Calculate progress
  percentage=$((current * 100 / total_ips))
  bar_width=50
  filled=$((percentage * bar_width / 100))
  unfilled=$((bar_width - filled))
  
  # Build the bar
  bar=$(printf "%${filled}s" | tr ' ' '#')
  bar+=$(printf "%${unfilled}s" | tr ' ' '-')
  
  # Display progress bar with current IP
  printf "\rPinging %s: [%s] %d%%" "$ip" "$bar" "$percentage"
  
  if ping -c 1 -W 1 "$ip" > /dev/null 2>&1; then
    echo "$ip is active" >> "$output_file"
    active_ips+=("$ip")  # Add to array
  fi
done

# Newline after progress bar
echo ""

echo "Scan complete. Active IPs saved to $output_file."

# List the responding IPs
if [ ${#active_ips[@]} -eq 0 ]; then
  echo "No IPs responded."
else
  echo "Responding IPs:"
  for ip in "${active_ips[@]}"; do
    echo "$ip"
  done
fi

# Version 9
