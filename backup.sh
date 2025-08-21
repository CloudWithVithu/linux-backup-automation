#!/bin/bash

# -----------------------------
# Linux Backup & Alert Script
# -----------------------------

# Source configuration
source ./config.sh

# Function to send email alert via SendGrid API
send_alert() {
    local MESSAGE="$1"
    if [ -z "$SENDGRID_API_KEY" ]; then
        echo "SendGrid API Key not set. Cannot send email alert."
        return 1
    fi

    curl --silent --request POST \
      --url https://api.sendgrid.com/v3/mail/send \
      --header "Authorization: Bearer $SENDGRID_API_KEY" \
      --header "Content-Type: application/json" \
      --data "{
        \"personalizations\": [{
          \"to\": [{\"email\": \"$EMAIL_TO\"}],
          \"subject\": \"$EMAIL_SUBJECT\"
        }],
        \"from\": {\"email\": \"$EMAIL_FROM\"},
        \"content\": [{
          \"type\": \"text/plain\",
          \"value\": \"$MESSAGE\"
        }]
      }" > /dev/null 2>&1
}

# Get current timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Ensure backup destination exists
mkdir -p "$BACKUP_DEST"

# Check disk space (available in percentage)
AVAILABLE=$(df "$BACKUP_DEST" | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$AVAILABLE" -lt "$DISK_THRESHOLD" ]; then
    echo "[$(date)] WARNING: Low disk space ($AVAILABLE%) in backup destination." >> "$LOG_FILE"
    send_alert "WARNING: Low disk space ($AVAILABLE%) in backup destination."
    exit 1
fi

# Create backup folder
BACKUP_PATH="$BACKUP_DEST/backup_$TIMESTAMP"
mkdir -p "$BACKUP_PATH"

# Start backup
for DIR in $BACKUP_DIRS; do
    if [ -d "$DIR" ]; then
        cp -r "$DIR" "$BACKUP_PATH/"
        if [ $? -eq 0 ]; then
            echo "[$(date)] Backup success: $DIR" >> "$LOG_FILE"
        else
            echo "[$(date)] ERROR: Backup failed for $DIR" >> "$LOG_FILE"
            send_alert "ERROR: Backup failed for $DIR"
        fi
    else
        echo "[$(date)] WARNING: Directory $DIR not found." >> "$LOG_FILE"
        send_alert "WARNING: Directory $DIR not found."
    fi
done

echo "[$(date)] Backup completed to $BACKUP_PATH" >> "$LOG_FILE"
send_alert "Backup completed successfully at $BACKUP_PATH"
