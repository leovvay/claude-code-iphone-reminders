#!/bin/bash
# Sends a macOS Reminder that syncs to iPhone via iCloud
# Triggered by Claude Code's Notification event

INPUT=$(cat)
TIME=$(date '+%H:%M')

# Extract message from hook JSON payload
MESSAGE=$(echo "$INPUT" | /usr/bin/python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('message',''))" 2>/dev/null)

# Extract project directory and get folder name
PROJECT=$(echo "$INPUT" | /usr/bin/python3 -c "import sys,json,os; d=json.load(sys.stdin); print(os.path.basename(d.get('cwd','')))" 2>/dev/null)

# Build reminder text
if [ -n "$PROJECT" ] && [ -n "$MESSAGE" ]; then
    TITLE="Claude Code [$PROJECT] — $MESSAGE ($TIME)"
elif [ -n "$PROJECT" ]; then
    TITLE="Claude Code [$PROJECT] waiting for input ($TIME)"
elif [ -n "$MESSAGE" ]; then
    TITLE="Claude Code — $MESSAGE ($TIME)"
else
    TITLE="Claude Code waiting for input ($TIME)"
fi

# Truncate to 255 chars (Reminders limit)
TITLE=$(echo "$TITLE" | cut -c1-255)

osascript -e "tell application \"Reminders\"
    set newReminder to make new reminder with properties {name:\"$TITLE\", due date:(current date)}
    set tag names of newReminder to {\"claude-code\"}
end tell" 2>/dev/null

# Fallback without tags if older macOS
if [ $? -ne 0 ]; then
    osascript -e "tell application \"Reminders\" to make new reminder with properties {name:\"$TITLE\", due date:(current date)}"
fi

exit 0
