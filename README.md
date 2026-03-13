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

```bash
claude plugin add github:leovvay/claude-code-iphone-reminders
```

## Cleanup

Reminders created by this plugin are tagged with `claude-code` (macOS 14+). You can create a Smart List in Reminders to view/bulk-delete them, or just delete them as you go.

## How It Looks

Your iPhone will show a Reminders notification like:

> **Claude Code waiting for input (14:32)**

## Uninstall

```bash
claude plugin remove claude-code-iphone-reminders
```

## License

MIT
