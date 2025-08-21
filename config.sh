# Directories to backup (space-separated)
BACKUP_DIRS="/mnt/g/Vithushan/MyAzureProjects/linux-backup-automation/testdata"

# Backup destination (inside your home directory for enough space)
BACKUP_DEST="/mnt/g/Vithushan/MyAzureProjects/linux-backup-automation/backups"

# Disk space threshold in percentage
DISK_THRESHOLD=20

# Log file
LOG_DIR="/mnt/g/Vithushan/MyAzureProjects/linux-backup-automation/logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/backup.log"

# Email alert settings
EMAIL_TO="vithushanvisuvalingam@gmail.com"           # Replace you  Email here..........
EMAIL_FROM="vithushanvisuvalingam@gmail.com"
EMAIL_SUBJECT="Backup Alert"

# SendGrid API key
SENDGRID_API_KEY="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"
