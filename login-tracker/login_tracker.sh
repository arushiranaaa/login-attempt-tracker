#!/bin/bash

LOG_FILE="/var/log/auth.log"

if [ ! -f "$LOG_FILE" ]; then
    echo "Auth log file not found at $LOG_FILE"
    exit 1
fi

echo "===== LOGIN ATTEMPT TRACKER ====="

# Total login attempts
total_attempts=$(grep -i "session" $LOG_FILE | wc -c)
echo "Total login attempts: $total_attempts"

# Failed login attempts
failed_attempts=$(grep -i "failed password" $LOG_FILE | wc -l)
echo "Failed login attempts: $failed_attempts"

# Successful logins
success_attempts=$(grep -i "accepted password" $LOG_FILE | wc -l)
echo "Successful login attempts: $success_attempts"

# Unique IP addresses
echo "Unique IPs seen:"
grep -oP "rhost=\K(\S+)" $LOG_FILE | sort | uniq | nl

# Most failed attempts by user
top_user=$(grep -i "failed password" $LOG_FILE | awk '{print $NF}' | sort | uniq -c | sort -nr | head -1)
echo "Most failed attempts by user: $top_user"

# Last 5 login attempts
echo "Last 5 login attempts:"
grep -Ei "failed password|accepted password" $LOG_FILE | tail -5
echo "Suspicious IPs (more than 5 failed attempts):"
grep -i "failed password" $LOG_FILE | awk '{print $(NF-3)}' | sort | uniq -c | awk '$1>5 {print $2}'
