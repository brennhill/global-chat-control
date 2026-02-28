# 💻 Laptop & 📱 Phone Setup Guide

To use Global Chat Control, you need to set up your local devices to securely connect to your cloud-based Mission Control.

---

## 💻 1. Laptop Setup (Admin & Development)

Your laptop is used for the initial deployment and for heavy coding tasks via the remote IDE.

### Step A: Install the Essentials
You need **Terraform** to deploy the infrastructure and **Tailscale** to access it securely.
1.  **Install Terraform:** [Download here](https://developer.hashicorp.com/terraform/install).
2.  **Install Tailscale:** [Download here](https://tailscale.com/download). 
    *   *Why?* Tailscale creates a private "tunnel" to your server. You won't have to open any ports to the public internet.
3.  **Generate SSH Key:** If you don't have one, run:
    `ssh-keygen -t ed25519 -C "your_email@example.com"`
    (You will need the contents of `~/.ssh/id_ed25519.pub` for the Terraform config).

### Step B: Clone & Deploy
1.  Clone your repository: `git clone https://github.com/your-username/global-chat-control.git`
2.  Navigate to your chosen provider: `cd global-chat-control/digitalocean`
3.  Copy `terraform.tfvars.example` to `terraform.tfvars` and fill it in.
4.  Run `terraform init` and `terraform apply`.

### Step C: Messaging Apps (Optional)
If you prefer Discord or Telegram over the default `ntfy` bridge:
1.  **Install Desktop Apps:** Download the [Discord](https://discord.com/download) or [Telegram](https://desktop.telegram.org/) desktop clients.
2.  **Configure Bots/Webhooks:** Follow the [Discord Setup](./setup-discord.md) or [Telegram Setup](./setup-telegram.md) guides to create your bot and get your API keys before deploying.

---

## 📱 2. Phone Setup (Mobile Command)

Your phone is used for receiving instant alerts and replying to agents while you are away from your desk.

### Step A: Install the Apps
1.  **Tailscale (Required):** Install from the App Store/Play Store. Login to the same account as your laptop. Toggle "Connected."
2.  **ntfy (Recommended):** Install the [ntfy app](https://ntfy.sh/).
    *   Click the **+** button to "Subscribe to topic."
    *   Enter the secret topic name you chose in your `terraform.tfvars`.
3.  **Messaging Apps (Alternative):** Install the mobile apps for [Discord](./setup-discord.md), [Telegram](./setup-telegram.md), [WhatsApp](./setup-whatsapp.md), or [Signal](./setup-signal.md) if you are using those bridges.
4.  **Termius (Highly Recommended):** If you want a pro-grade terminal experience on your phone instead of a web browser, install **Termius**.

### Step B: How to Reply to Agents
When an agent needs input, your phone will buzz via your chosen app.
1.  **If using ntfy:** Tap the notification. It will open the `ttyd` web terminal in your mobile browser.
2.  **If using Discord/Telegram/WhatsApp:** You will receive a message from your bot.
    *   **Unidirectional:** Tap the link in the message to open the web terminal.
    *   **Bidirectional (ZeroClaw/OpenClaw):** Simply reply to the message directly in the chat app.
3.  **The Pro Way (Termius):** 
    *   Open Termius and add a new "Host."
    *   Address: Use the **Tailscale IP** of your server.
    *   Username: `root`
    *   Now you can SSH into your server and attach: `tmux attach -t web-agents`.

---

## 🛠️ The "Daily Drive" Workflow

1.  **At your desk:** Open `http://ai-workspace:8080` in your browser for the full VS Code experience.
2.  **On the go:** Wait for an `ntfy` alert. Tap it, type your reply, and put your phone back in your pocket.
3.  **Visual Debugging:** If an agent is stuck on a website, open `http://ai-workspace:3000` on your tablet or laptop to see the actual Chrome browser and solve any CAPTCHAs.
