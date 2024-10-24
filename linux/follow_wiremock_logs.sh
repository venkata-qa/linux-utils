#!/bin/bash

# List of server IP addresses or hostnames
servers=("server1.example.com" "server2.example.com" "server3.example.com")

# Path to your SSH private key
ssh_key="~/.ssh/key"

# SSH username (e.g., ec2-user)
ssh_user="ec2-user"

# Log command to follow logs in real time
log_command="journalctl -u wiremock -f"

# Loop through each server and open a new mate-terminal window for dynamic logs
for server in "${servers[@]}"; do
  echo "Opening new terminal for $server logs..."

  # Open a new mate-terminal window and follow logs dynamically
  mate-terminal -- bash -c "ssh -i $ssh_key $ssh_user@$server '$log_command'; exec bash" &
done
