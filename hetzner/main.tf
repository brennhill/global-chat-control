terraform {
  required_providers {
    hcloud = { source = "hetznercloud/hcloud"; version = "~> 1.45" }
  }
}
provider "hcloud" { token = var.hcloud_token }
resource "hcloud_ssh_key" "default" {
  name = "ai-key"; public_key = var.ssh_public_key
}
resource "hcloud_server" "ai_workspace" {
  name = "ai-workspace"; image = "ubuntu-24.04"; server_type = "cpx31"; location = "fsn1"
  ssh_keys = [hcloud_ssh_key.default.id]
  user_data = templatefile("../cloud-init.yaml", {
    tailscale_auth_key = var.tailscale_auth_key, ntfy_topic = var.ntfy_topic
  })
}
variable "hcloud_token" {}
variable "ssh_public_key" {}
variable "tailscale_auth_key" {}
variable "ntfy_topic" {}
