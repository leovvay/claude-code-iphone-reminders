#!/bin/bash
# Sends a macOS Reminder that syncs to iPhone via iCloud
# Triggered by Claude Code's Notification event

INPUT=$(cat)

# Extract message and project name from hook payload
MESSAGE=$(echo "$INPUT" | /usr/bin/python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('message','Waiting for input'))" 2>/dev/null)
PROJECT=$(echo "$INPUT" | /usr/bin/python3 -c "import sys,json,os; d=json.load(sys.stdin); print(os.path.basename(d.get('cwd','')))" 2>/dev/null)

TITLE="${PROJECT:+$PROJECT: }${MESSAGE:-Waiting for input}"

osascript -e "tell application \"Reminders\"
    set newReminder to make new reminder with properties {name:\"$TITLE\", due date:(current date)}
    set tag names of newReminder to {\"claude-code\"}
end tell" 2>/dev/null || \
osascript -e "tell application \"Reminders\" to make new reminder with properties {name:\"$TITLE\", due date:(current date)}"

exit 0
