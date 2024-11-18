#!/bin/bash

# Schedule cleanup logs to run daily at midnight
echo "Scheduling log cleanup..."
(crontab -l 2>/dev/null; echo "0 0 * * * /path/to/cleanup_logs.sh") | crontab -

# Schedule backups to run every Sunday at 2AM
echo "Scheduling backups..."
(crontab -l 2>/dev/null; echo "0 2 * * 0 /path/to/backup_data.sh") | crontab -

# Schedule system update to run every Sunday at 3AM
echo "Scheduling system updates..."
(crontab -l 2>/dev/null; echo "0 3 * * 0 /path/to/update_system.sh") | crontab -

echo "Scheduled tasks complete."
