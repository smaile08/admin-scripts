#!/bin/bash

# Define the log directory and retention period (in days)
LOG_DIR="/var/log"
RETENTION_DAYS=7

echo "Cleaning up logs older than $RETENTION_DAYS days in $LOG_DIR..."

# Find and delete log files older than RETENTION_DAYS
find "$LOG_DIR" -type f -name "*.log" -mtime +$RETENTION_DAYS -exec rm -f {} \;

# Verify cleanup
echo "Cleanup complete."
