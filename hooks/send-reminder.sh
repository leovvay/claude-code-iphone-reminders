#!/bin/bash
# Sends a macOS Reminder that syncs to iPhone via iCloud
# Triggered by Claude Code's Notification event

TIME=$(date '+%H:%M')

osascript -e "tell application \"Reminders\"
    set newReminder to make new reminder with properties {name:\"Claude Code waiting for input ($TIME)\", due date:(current date)}
    set tag names of newReminder to {\"claude-code\"}
end tell" 2>/dev/null

# Fallback without tags if older macOS
if [ $? -ne 0 ]; then
    osascript -e "tell application \"Reminders\" to make new reminder with properties {name:\"Claude Code waiting for input ($TIME)\", due date:(current date)}"
fi

exit 0
