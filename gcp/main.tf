terraform {
  required_providers {
    google = { source = "hashicorp/google"; version = "~> 5.0" }
  }
}
provider "google" { project = var.project; region = var.region }
resource "google_compute_instance" "ai_workspace" {
  name         = "ai-workspace"
  machine_type = "e2-standard-2" # 2 vCPU, 8GB RAM
  zone         = var.zone
  boot_disk {
    initialize_params { image = "ubuntu-os-cloud/ubuntu-2404-lts-amd64" }
  }
  network_interface { network = "default"; access_config {} }
  metadata = {
    ssh-keys = "root:${var.ssh_public_key}"
    user-data = templatefile("../cloud-init.yaml", {
      tailscale_auth_key = var.tailscale_auth_key, ntfy_topic = var.ntfy_topic
    })
  }
}
variable "project" {}
variable "region" { default = "us-central1" }
variable "zone" { default = "us-central1-a" }
variable "ssh_public_key" {}
variable "tailscale_auth_key" {}
variable "ntfy_topic" {}
