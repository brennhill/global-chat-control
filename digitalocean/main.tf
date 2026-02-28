terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "default" {
  name       = "ai-workspace-key"
  public_key = var.ssh_public_key
}

resource "digitalocean_droplet" "ai_workspace" {
  image  = "ubuntu-24-04-x64"
  name   = "ai-workspace-node"
  region = "nyc3" # New York (Options: sfo3, ams3, fra1, sgp1)
  size   = "s-2vcpu-4gb" # $24/mo. (For 8GB/4vCPU use "s-4vcpu-8gb" @ $48/mo)
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]

  # Inject the Tailscale auth key into our cloud-init template
  user_data = templatefile("${path.module}/cloud-init.yaml", {
    tailscale_auth_key = var.tailscale_auth_key
  })
}

output "droplet_ip" {
  value = digitalocean_droplet.ai_workspace.ipv4_address
}
