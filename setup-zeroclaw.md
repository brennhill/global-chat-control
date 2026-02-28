# ⚡ ZeroClaw Setup (The Pro Pick)

[ZeroClaw](https://github.com/zeroclaw-labs/zeroclaw) is the high-performance, Rust-based successor to OpenClaw. It provides full bidirectional ChatOps (Discord, Telegram, WhatsApp, Signal) while using **less than 5MB of RAM**.

## 1. Installation
ZeroClaw is a compiled Rust binary. On your cloud server, run:

```bash
# Install the pre-compiled binary (Fastest)
curl -L https://github.com/zeroclaw-labs/zeroclaw/releases/latest/download/zeroclaw-linux-amd64 -o /usr/local/bin/zeroclaw
chmod +x /usr/local/bin/zeroclaw
```

## 2. Configuration (Onboarding)
ZeroClaw features an interactive onboarding process that sets up your AI keys and your chat channel (Discord/Telegram/etc.) in one go:

```bash
zeroclaw onboard interactive
```

## 3. Running as a Persistent Daemon
To keep ZeroClaw listening for your chat commands 24/7, we run it as a systemd service (this is already handled if you use our updated `cloud-init.yaml` logic):

```bash
zeroclaw daemon --workspace /root/agents
```

## 4. Why use ZeroClaw?
*   **Performance:** It is written in Rust. It starts in <10ms and uses zero meaningful resources.
*   **Security:** It features an explicit "allowlist" for commands. It won't run anything you haven't approved.
*   **All-in-One:** It replaces `ntfy`, `CallMeBot`, and `OpenClaw` with a single, secure binary.

## 5. Verdict: ZeroClaw vs. Others
| Metric | ntfy Bridge | OpenClaw | ZeroClaw (Winner) |
| :--- | :--- | :--- | :--- |
| **RAM** | < 5MB | 1GB+ | **< 5MB** |
| **Features** | Notifications Only | Full ChatOps | **Full ChatOps + Security** |
| **Language** | Bash/Python | Node.js | **Rust** |
| **Reliability**| High | Moderate | **Extreme** |
