variable "do_token" {
  description = "DigitalOcean Personal Access Token"
  type        = string
}

variable "ssh_public_key" {
  description = "Your local SSH Public Key (e.g., contents of ~/.ssh/id_ed25519.pub)"
  type        = string
}

variable "tailscale_auth_key" {
  description = "Tailscale Auth Key (One-off or Reusable key from Tailscale Admin Panel)"
  type        = string
}

variable "ntfy_topic" {
  description = "A secret string for your ntfy.sh notifications"
  type        = string
}
