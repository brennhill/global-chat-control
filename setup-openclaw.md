# OpenClaw Setup (Bidirectional ChatOps)

[OpenClaw](https://github.com/open-claw/openclaw) is an open-source bridge that allows you to control your CLI agents directly from messaging apps (Telegram, Discord, Slack, etc.) without opening a terminal.

## 1. How it works
OpenClaw acts as a "shell wrapper." Instead of running `./agent`, you run `openclaw ./agent`. It then captures the output and sends it to your chat app, and takes your chat replies and sends them to the agent's input.

## 2. Installation on your Cloud Server
Add this to your server setup:

```bash
git clone https://github.com/open-claw/openclaw.git
cd openclaw
npm install
npm run build
```

## 3. Configuration
You will need to create a `.env` file in the openclaw directory with your bot tokens (Telegram/Discord) following their [Configuration Guide](https://github.com/open-claw/openclaw#configuration).

## 4. Running an Agent with OpenClaw
Once configured, you can launch an agent like this:
```bash
openclaw run --command "gemini-cli --task 'build my app'" --channel "telegram"
```

## 5. Comparison: ntfy vs OpenClaw
*   **ntfy (Current Default):** Best for simple "pings." You still use a real terminal to type complex code or see multi-line errors.
*   **OpenClaw:** Best for "Chat-First" control. You never leave your messaging app. It is ideal for high-level commands, but can be "noisy" if an agent outputs a lot of logs.
