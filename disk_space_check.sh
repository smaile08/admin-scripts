#!/bin/bash

# Set the threshold for disk usage (in percentage)
THRESHOLD=90

# Get current disk usage of the root partition
USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//')

echo "Current disk usage: $USAGE%"

if [ "$USAGE" -gt "$THRESHOLD" ]; then
  echo "Disk usage is above $THRESHOLD%. Cleaning up..."

  # Run the cleanup_log.sh script
  ./cleanup_logs.sh

  # Optionally run other cleanup tasks, like clearing caches
  # Example: clear systemd journal logs
  journalctl --vacuum-time=7d

  echo "Cleanup complete."
else
  echo "Disk usage is below threshold. No cleanup needed."
fi
