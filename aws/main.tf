terraform {
  required_providers {
    aws = { source = "hashicorp/aws"; version = "~> 5.0" }
  }
}
provider "aws" { region = var.region }
resource "aws_key_pair" "default" {
  key_name = "ai-key"; public_key = var.ssh_public_key
}
resource "aws_instance" "ai_workspace" {
  ami           = var.ami_id
  instance_type = "t3.large" # 2 vCPU, 8GB RAM
  key_name      = aws_key_pair.default.key_name
  user_data = templatefile("../cloud-init.yaml", {
    tailscale_auth_key = var.tailscale_auth_key, ntfy_topic = var.ntfy_topic
  })
  tags = { Name = "ai-workspace" }
}
variable "region" { default = "us-east-1" }
variable "ami_id" {}
variable "ssh_public_key" {}
variable "tailscale_auth_key" {}
variable "ntfy_topic" {}
