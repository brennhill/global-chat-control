# Cloud-Native ChatOps & Headless Workspace for AI Agents

This document outlines a resilient, persistent, and mobile-accessible architecture for running multiple AI coding agents (Gemini, Claude, Codex) and UI-bound tools (Gasoline/Chrome) 24/7.

## 1. Core Infrastructure (The "Always-On" Engine)
*   **Cloud VPS:** Host on a provider like Hetzner, DigitalOcean, or AWS. Minimum specs: 4 vCPU, 8GB-16GB RAM (Ubuntu 24.04 LTS).
*   **Networking (Tailscale):** Use Tailscale to create a secure, private Zero-Trust network. This allows you to access your server's internal ports (IDE, Terminals, Desktop) from your laptop or phone without exposing them to the public internet.

## 2. Persistence & Session Management
*   **Multiplexing (Tmux/Zellij):** Run all agents inside `tmux` or `Zellij` sessions. If your connection drops, the processes continue.
*   **Remote IDE (Code-Server):** Install [Code-Server](https://github.com/coder/code-server) to have a full VS Code environment in your browser.
*   **Web Terminal (ttyd):** Use `ttyd` to share your terminal sessions over HTTP. When paired with Tailscale, you can securely type into your CLI from a mobile browser.

## 3. The "Smart" Notification Layer
To solve the "waiting for input" problem, use a notification bridge:
*   **Service:** [ntfy.sh](https://ntfy.sh) (Free, open-source, mobile app available).
*   **Wrapper Script Pattern:**
    ```bash
    # Example logic for an agent wrapper
    ./run-agent-gemini | while read line; do
      if [[ $line == *"User input:"* ]]; then
        curl -d "Gemini needs your input on Project X" 
             -H "Click: https://your-tailscale-ip:7681" 
             ntfy.sh/your_secret_topic
      fi
      echo "$line"
    done
    ```
*   **Workflow:** Your phone buzzes -> You tap the notification -> You are instantly in a mobile-optimized terminal session -> You reply and close your phone.

## 4. UI-Bound Automation (Gasoline & Chrome)
Since Gasoline requires a browser context, it cannot run in a standard SSH session alone.
*   **WebTop (Docker):** Use the [LinuxServer Webtop](https://docs.linuxserver.io/images/docker-webtop/) image. It provides a full Ubuntu desktop accessible via browser (NoVNC/WebRTC).
*   **Persistence:** Chrome and Gasoline run inside this virtual desktop. Even if you close the tab, the browser stays open and the agent keeps interacting with it.
*   **Visual Debugging:** You can "dial in" to the desktop from any device to solve CAPTCHAs or visually verify what the agent is seeing.

## 5. Advanced: ChatOps (Discord/Slack)
For a more "native" mobile experience, pipe agent I/O to a Discord channel:
*   **Project Channels:** Create `#project-alpha`, `#project-beta`.
*   **Bot Integration:** Use a simple Discord bot to relay terminal output to the channel and send your messages back to the agent's `stdin`.

---

## Deployment Checklist
1. [ ] Install Tailscale on VPS, Phone, and Laptop.
2. [ ] Deploy `webtop` via Docker Compose for Gasoline/Chrome.
3. [ ] Install `tmux` and `ttyd` for persistent CLI access.
4. [ ] Install `ntfy` app on mobile and configure your secret topic.
5. [ ] (Optional) Set up `code-server` for remote file editing.
