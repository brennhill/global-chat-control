# WhatsApp Setup

WhatsApp is more "locked down" than Discord or Telegram. For a personal project, the most effortless way to get notifications is using the **CallMeBot** API.

## 1. Get your API Key
1.  Add `+34 644 20 47 56` (CallMeBot) to your WhatsApp contacts.
2.  Send the message: `I allow callmebot to send me messages`.
3.  Wait for the reply with your **API Key**.

## 2. Update your Notify Script
You can modify `/usr/local/bin/notify-agent` on your server:

```bash
#!/bin/bash
PHONE="YOUR_PHONE_NUMBER" # e.g. +123456789
API_KEY="YOUR_API_KEY"
MESSAGE=$(echo $1 | sed 's/ /%20/g')

curl "https://api.callmebot.com/whatsapp.php?phone=$PHONE&text=$MESSAGE&apikey=$API_KEY"
```

## 3. Alternative: Matrix Bridge
If you want a truly self-hosted solution, you can use a [Matrix-WhatsApp Bridge](https://github.com/mautrix/whatsapp), but it requires running a Matrix homeserver, which is significantly more complex.
