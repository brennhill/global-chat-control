# Telegram Setup

Telegram is a great lightweight alternative for receiving agent notifications on the go.

## 1. Create a Bot
1.  Message [@BotFather](https://t.me/botfather) on Telegram.
2.  Send `/newbot` and follow the instructions to get your **API Token**.

## 2. Get your Chat ID
1.  Message your new bot.
2.  Go to `https://api.telegram.org/bot<YOUR_TOKEN>/getUpdates` in your browser.
3.  Look for the `"chat":{"id":12345678}` field.

## 3. Integration
You can modify the `/usr/local/bin/notify-agent` script on your server to send directly to Telegram:

```bash
#!/bin/bash
TOKEN="YOUR_BOT_TOKEN"
CHAT_ID="YOUR_CHAT_ID"
MESSAGE=$1

curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" 
     -d "chat_id=$CHAT_ID" 
     -d "text=$MESSAGE"
```

## 4. ntfy.sh Alternative
Like Discord, you can use the `ntfy` app on your phone. It is often faster and requires less setup than building a custom Telegram bot.
