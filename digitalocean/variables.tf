variable "do_token" {
  description = "DigitalOcean Personal Access Token"
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  description = "Your local SSH Public Key"
  type        = string
}

variable "tailscale_auth_key" {
  description = "Tailscale Auth Key"
  type        = string
  sensitive   = true
}
