# 🛠️ Problems & Solutions (QA/UX Guide)

This guide addresses common friction points and provides troubleshooting steps to ensure your AI Control Center is running perfectly.

## 1. "I can't connect to the URLs in the README!"
**Problem:** You ran `terraform apply`, got an IP, but `http://<tailscale-ip>:8080` times out.
**Solution:** 
*   **The 5-Minute Rule:** The server needs time to run the `cloud-init.yaml` script. It is installing Docker, Chrome, and VS Code. Wait 5 minutes.
*   **Check Progress:** SSH into your server (`ssh root@<public-ip>`) and run:
    `tail -f /var/log/cloud-init-output.log`
    Once you see "Cloud-init finished", your services are ready.
*   **Tailscale Status:** Run `tailscale status` on your local machine to ensure the new node (e.g., `ai-workspace`) is visible and connected.

## 2. Oracle Cloud: "Out of Capacity" Error
**Problem:** Oracle refuses to create the `VM.Standard.A1.Flex` instance because they are out of ARM cores in your region.
**Solution:**
*   **Try a different AD:** Change the `availability_domain` in your `terraform.tfvars`.
*   **The "Pay-As-You-Go" Trick:** Upgrading your Oracle account to "Pay-As-You-Go" usually unlocks capacity (you still stay within the free tier limits for the first 4 ARM cores).
*   **Fallback:** If Oracle is persistent, switch to the **Hetzner** or **DigitalOcean** folders for a low-cost ($4-9) reliable alternative.

## 3. Tailscale Key Expired
**Problem:** The server won't show up in your Tailscale dashboard.
**Solution:**
*   Ensure you generated an **Auth Key**, not just a regular key.
*   Use a **Reusable** key if you plan to run `terraform destroy` and `terraform apply` multiple times.
*   If the server is already up but not on Tailscale, SSH in and run `tailscale up` manually.

## 4. Mobile Keyboard Issues (ttyd)
**Problem:** You can't hit `Ctrl+C` or `Tab` easily in the mobile browser terminal.
**Solution:**
*   `ttyd` has a built-in virtual keyboard. Tap the small "keyboard" icon or the "A" icon in the corner of the browser window to reveal helper keys.
*   **Pro Tip:** Use the **Termius** app on mobile for a much better SSH/Terminal experience than a web browser.

## 5. Gasoline/Chrome is slow or crashing
**Problem:** The headless desktop feels sluggish.
**Solution:**
*   **RAM Check:** Ensure your instance has at least **4GB of RAM**. 2GB is insufficient for modern Chrome + AI Agents.
*   **SHM Size:** If Chrome tabs are crashing with "Aw, Snap!", check `cloud-init.yaml`. We set `shm_size: "2gb"` in the Docker config specifically to prevent this.

## 6. How do agents use Gasoline?
**Problem:** Confusion about which browser is being used.
**Solution:**
*   The agents running *on the cloud server* connect to the Chrome instance running in the *Webtop container* on the same server.
*   You do **not** need the Gasoline extension installed on your laptop to make this work; the agent handles the connection internally via DevTools Protocol (CDP).

## 7. ntfy.sh Topic Security
**Problem:** Someone else is getting your notifications.
**Solution:**
*   Do not use a simple topic name like `my-notifications`.
*   Use a long, random UUID: `ntfy.sh/agent-control-a1b2c3d4-e5f6-7890`.
