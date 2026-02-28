terraform {
  required_providers {
    oci = { source = "oracle/oci"; version = "~> 5.0" }
  }
}
provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  user_ocid = var.user_ocid
  fingerprint = var.fingerprint
  private_key_path = var.private_key_path
  region = var.region
}
resource "oci_core_instance" "ai_workspace" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  shape               = "VM.Standard.A1.Flex"
  shape_config {
    ocpus         = 4
    memory_in_gbs = 24
  }
  source_details {
    source_type = "image"
    source_id   = var.image_id
  }
  create_vnic_details {
    subnet_id = var.subnet_id
    assign_public_ip = true
  }
  metadata = {
    user_data = base64encode(templatefile("../cloud-init.yaml", {
      tailscale_auth_key = var.tailscale_auth_key, ntfy_topic = var.ntfy_topic
    }))
    ssh_authorized_keys = var.ssh_public_key
  }
}
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_id" {}
variable "availability_domain" {}
variable "subnet_id" {}
variable "image_id" {}
variable "ssh_public_key" {}
variable "tailscale_auth_key" {}
variable "ntfy_topic" {}
