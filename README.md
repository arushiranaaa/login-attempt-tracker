<h1 align="center">🔐 Linux Login Attempt Tracker</h1> <p align="center"><strong>Shell Script • Linux Security • Log Analysis • Threat Detection • IAM Basics • Auth Monitoring</strong></p> <p align="center"> <img src="https://img.shields.io/badge/Language-Bash-blue?logo=gnubash" /> <img src="https://img.shields.io/badge/OS-Ubuntu%20%2F%20Debian-orange?logo=ubuntu" /> <img src="https://img.shields.io/badge/Security-Log%20Analysis-red?logo=linux" /> <img src="https://img.shields.io/badge/Status-Active-brightgreen" /> <img src="https://img.shields.io/badge/Domain-CyberSecurity-purple" /> <img src="https://img.shields.io/badge/Analyzes-/var/log/auth.log-yellow" /> <img src="https://img.shields.io/badge/Threat%20Detection-Basic-success" /> <img src="https://img.shields.io/badge/License-MIT-lightgrey" /> </p>
---
##📌 Overview

A lightweight yet powerful Linux security monitoring tool that analyzes system authentication logs (/var/log/auth.log) to detect login patterns, failed attempts, suspicious behavior, and possible brute-force login attacks.

This project is highly relevant for:
--- 
##🔐 Cybersecurity

🛡 IAM & Authentication Systems

🏢 Security-focused companies

🐧 Linux Administration roles

Built using pure Bash, this tool provides fast, transparent insights into login security events.

✨ Key Features
🔥 Real-Time Authentication Insights

Total login attempts

Failed password attempts

Successful SSH logins

Last 5 login events

--- 
##🕵️ Suspicious Activity Detection

Lists unique IPs hitting the server

Identifies IPs with repeated failures

Finds the user with MOST failed attempts

Optional brute-force detection (5+ failed logins)

--- 
##📊 Clean Log Summaries

Data extracted using:

grep

awk

sort

uniq

Regex pattern matching

--- 
##⚙️ Architecture & Internals
📝 Log Source

The tool parses:

/var/log/auth.log


This file contains:

SSH login attempts

Password failures

PAM authentication logs

User session open/close events

📂 Logic Breakdown

Pattern detection → grep

Counting & grouping → uniq -c, sort -nr

Field extraction → awk

Last activity → tail -5

--- 
##🛠️ Installation & Usage
1️⃣ Clone the Repository
git clone https://github.com/arushiranaaa/login-attempt-tracker.git
cd login-attempt-tracker

2️⃣ Make the Script Executable
chmod +x login_tracker.sh

3️⃣ Run the Tool
sudo ./login_tracker.sh


(Requires sudo because /var/log/auth.log is restricted)

📈 Sample Output
===== LOGIN ATTEMPT TRACKER =====

Total login attempts: 42
Failed login attempts: 14
Successful login attempts: 3

Unique IPs seen:
1  192.168.1.10
2  45.22.10.12

Most failed attempts by user: ubuntu (7 failures)

Last 5 login attempts:
Jan 22 10:15:24 ubuntu sshd[1293]: Failed password...
Jan 22 10:16:05 ubuntu sshd[1301]: Accepted password...

--- 
##🚀 Future Enhancements

Color-coded output (success = green, fail = red)

Export logs to JSON/CSV

Real-time monitoring mode (watch)

Email / Telegram alert system

IP reputation lookup (AbuseIPDB API)



🔐 Security Projects | Linux Internals | IAM | Cloud Basics
