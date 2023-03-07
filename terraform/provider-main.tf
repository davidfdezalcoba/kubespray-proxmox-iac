terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.13.1"
    }
  }
}

provider "proxmox" {
  virtual_environment {
    endpoint = var.proxmox-endpoint
    username = var.proxmox-user
    insecure = var.proxmox-insecure
  }
}
