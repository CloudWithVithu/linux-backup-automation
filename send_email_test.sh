#!/bin/bash

EMAIL_TO="vithushanvisuvalingam@gmail.com"
EMAIL_SUBJECT="Test Backup Alert"

curl --silent --request POST \
  --url https://api.sendgrid.com/v3/mail/send \
  --header "Authorization: Bearer $SENDGRID_API_KEY" \
  --header "Content-Type: application/json" \
  --data '{
    "personalizations":[{"to":[{"email":"'"$EMAIL_TO"'"}],"subject":"'"$EMAIL_SUBJECT"'"}],
    "from":{"email":"vithushanvisuvalingam@gmail.com"},
    "content":[{"type":"text/plain","value":"This is a test email from backup script."}]
  }'

