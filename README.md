# Linux Backup & Alert Automation Script

A **Bash-based automation script** to perform scheduled backups of important directories on Linux, monitor disk space, and send email alerts for backup success, failures, or low disk space. This project demonstrates skills in **Linux Bash scripting, automation, file management, logging, and API integration**.

---

## Features

- Backup multiple directories to a configurable destination.
- Automatic folder creation for each backup with timestamps.
- Disk space monitoring with alert threshold.
- Logs all backup actions and errors.
- Email alerts via **SendGrid API** for:
  - Low disk space
  - Backup failures
  - (Optional) Successful backup notifications
- Cross-platform compatibility (tested with **WSL on Windows**).

---

## Project Structure
```
linux-backup-automation/
│
├── backup.sh # Main backup and alert script
├── config.sh # Configurable parameters (directories, backup location, thresholds, email)
├── logs/ # Stores backup logs
├── backups/ # Stores backup snapshots
└── send_email_test.sh # Optional script to test email integration
```
---

## Configuration

Edit `config.sh` to customize:

```bash
# Directories to backup (space-separated)
BACKUP_DIRS="/etc /home/user/Documents"

# Backup destination
BACKUP_DEST="$HOME/backups"

# Disk space threshold in percentage
DISK_THRESHOLD=20

# Log file
LOG_FILE="$(pwd)/logs/backup.log"

# Email alert settings
EMAIL_TO="your_email@example.com"
EMAIL_FROM="your_verified_sendgrid_email@example.com"
EMAIL_SUBJECT="Backup Alert"
SENDGRID_API_KEY="YOUR_SENDGRID_API_KEY_HERE" 
```

⚠ Important: EMAIL_FROM must be a verified sender in SendGrid.

Usage

    Run the backup script:
        bash backup.sh

    Check logs:
        cat logs/backup.log

All backups are saved in the backups/ folder with timestamped directories.

Dependencies
   - Linux environment (Ubuntu, WSL, or other)
   - Bash shell
   - curl (for SendGrid API)
   - SendGrid account and verified sender email
```
Example Output

[2025-08-21 19:34:34] Backup success: /mnt/g/Vithushan/MyAzureProjects/linux-backup-automation/testdata
[2025-08-21 19:34:34] Backup completed to /mnt/g/Vithushan/MyAzureProjects/linux-backup-automation/backups/backup_2025-08-21_19-34-34
```

Skills Demonstrated
   - Linux Bash scripting and automation
   - Directory and file management
   - Disk monitoring and alerting
   - Logging best practices
   - Integration with external APIs (SendGrid)
   - Cross-platform scripting (Linux/WSL)

ScreenShots:
    !(screenshots/Screenshot6.png)
    !(screenshots/Screenshot7.png)
    !(screenshots/Screenshot8.png)
    !(screenshots/Screenshot9.png)
Author
    Vithushan Visuvalingam