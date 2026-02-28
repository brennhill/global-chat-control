# 🛡️ IronClaw Setup (Industrial-Grade Security)

[IronClaw](https://github.com/nearai/ironclaw) is the high-security, Rust-based agent framework by **NEAR AI**. It is designed for complex, multi-agent workflows where data privacy and secure tool execution are paramount.

## 1. Why IronClaw?
*   **WASM Sandboxing:** Every tool (Python scripts, shell commands, web scrapers) runs in an isolated WebAssembly container.
*   **Encrypted Vaults:** Your API keys (OpenAI, Anthropic, etc.) are stored in an encrypted vault and are never seen by the agent's logic.
*   **Local-First & Multi-Channel:** Designed to run on your own hardware or cloud server, bridging to Discord, Slack, and Telegram.

## 2. Installation
To install IronClaw on your cloud server:

```bash
# Download and run the official installer
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/nearai/ironclaw/releases/latest/download/ironclaw-installer.sh | sh
```

## 3. The Research & Design Workflow
IronClaw is particularly powerful for **Product Design** and **Web Research** because you can give it complex tools (like Playwright/Gasoline) while knowing they are securely sandboxed.

### Example: The "Visual Design Audit" Tool
You can configure an IronClaw tool that:
1.  Takes a URL.
2.  Launches a sandboxed **Gasoline** instance.
3.  Captures a screenshot and performs an accessibility audit.
4.  Reports the findings back to your Discord channel.

## 4. Comparison: ZeroClaw vs. IronClaw
| Feature | ZeroClaw (The Pro Pick) | IronClaw (The Security Pick) |
| :--- | :--- | :--- |
| **Focus** | Performance & Size | **Security & Sandboxing** |
| **Language** | Rust | **Rust** |
| **Isolation** | Workspace Scoping | **WASM Sandboxing** |
| **Best For** | Personal Workflows | **Enterprise / Sensitive Data** |
