#!/bin/bash

# Check for root privileges
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

echo "Updating system packages..."

# Update package lists
apt update -y

# Upgrade installed packages
apt upgrade -y

# Optional: Clean up unused packages and dependencies
apt autoremove -y
apt clean

echo "System update completed."
