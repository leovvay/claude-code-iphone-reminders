# claude-code-iphone-reminders

Get **iPhone notifications** when Claude Code is waiting for your input — zero dependencies, pure Apple ecosystem.

## How It Works

1. Claude Code fires a `Notification` event when it needs your input
2. This plugin creates a **macOS Reminder** due now via AppleScript
3. iCloud syncs it instantly to your iPhone
4. You get a push notification on your iPhone (and Apple Watch)

No third-party services. No API keys. No accounts. Just Apple.

## Requirements

- macOS with Reminders app
- iCloud signed in on both Mac and iPhone
- Reminders sync enabled in **Settings > [Your Name] > iCloud > Reminders**

## Installation

### Option A: Plugin (recommended)

Inside a Claude Code session, run:

```
/plugin marketplace add leovvay/claude-code-iphone-reminders
/plugin install claude-code-iphone-reminders
```

### Option B: Manual hook

Add this to your `~/.claude/settings.json`:

```json
{
  "hooks": {
    "Notification": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "/path/to/claude-code-iphone-reminders/hooks/send-reminder.sh"
          }
        ]
      }
    ]
  }
}
```

## Cleanup

Reminders created by this plugin are tagged with `claude-code` (macOS 14+). You can create a Smart List in Reminders to view/bulk-delete them, or just delete them as you go.

## How It Looks

Your iPhone will show a Reminders notification like:

> **Claude Code waiting for input (14:32)**

## Uninstall

Inside a Claude Code session, run:

```
/plugin remove claude-code-iphone-reminders
```

Or remove the hook from `~/.claude/settings.json` if installed manually.

## License

MIT
