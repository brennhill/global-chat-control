# Signal Setup

Signal requires a running client to send messages. The most robust way to do this on your cloud server is using the `signal-cli-rest-api` Docker container.

## 1. Run the Signal Bridge
Add this to your server's `docker-compose.yml`:

```yaml
services:
  signal-api:
    image: bbernhard/signal-cli-rest-api
    ports:
      - "8081:8080"
    volumes:
      - "./signal-data:/var/lib/signal-cli"
    restart: unless-stopped
```

## 2. Register your Number
You must register a phone number with the API once (using a second SIM or your own number). Follow the [official documentation](https://github.com/bbernhard/signal-cli-rest-api#registration) to perform the one-time registration via a `curl` command.

## 3. Update your Notify Script
Once registered, update `/usr/local/bin/notify-agent`:

```bash
#!/bin/bash
curl -X POST -H "Content-Type: application/json" 
     -d "{"message": "$1", "number": "YOUR_NUMBER", "recipients": ["YOUR_NUMBER"]}" 
     http://localhost:8081/v2/send
```

## 4. Why use Signal?
*   **Privacy:** End-to-end encrypted notifications.
*   **Zero 3rd Parties:** Unlike CallMeBot, you aren't sending your agent logs through an intermediary service.
