# Discord Setup (Recommended)

Discord is the recommended way to manage your AI agents. It allows you to create separate channels for different projects, use threads for specific tasks, and provides a much better mobile experience than raw terminal prompts.

## 1. Create a Discord Server
If you don't have one, create a private server specifically for your AI Control Center.

## 2. Create a Webhook (Easiest Method)
Webhooks allow your agents to send messages to a specific channel.
1.  Right-click a channel (e.g., `#project-alpha`) -> **Edit Channel**.
2.  Go to **Integrations** -> **Webhooks**.
3.  Click **New Webhook**.
4.  Copy the **Webhook URL**.

## 3. Bridge via ntfy.sh
The current setup uses `ntfy.sh` as a lightweight bridge. You can configure `ntfy` to automatically forward alerts to your Discord Webhook.
1.  Go to your `ntfy` topic dashboard (or use their API).
2.  Set up an HTTP action to POST to your Discord Webhook URL whenever a message is received.

## 4. Why Discord is Better
*   **Channels:** Keep your Gemini, Claude, and Codex agents in separate channels.
*   **History:** Scroll back through thousands of lines of logs easily on mobile.
*   **Collaboration:** Add other developers to the server if you are pair-programming with agents.
*   **Rich Media:** Agents can post screenshots from Gasoline directly into the channel.
