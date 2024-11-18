#!/bin/bash

# Define directories to back up and the backup destination
SOURCE_DIRS=("/home/user/documents" "/etc")
BACKUP_DIR="/var/backups"
DATE=$(date +'%Y%m%d%H%M%S')  # Timestamp for backup filename

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Backup each directory
for DIR in "${SOURCE_DIRS[@]}"; do
  BACKUP_FILE="$BACKUP_DIR/$(basename "$DIR")_backup_$DATE.tar.gz"
  echo "Backing up $DIR to $BACKUP_FILE..."
  tar -czf "$BACKUP_FILE" "$DIR"
done

echo "Backup completed."
