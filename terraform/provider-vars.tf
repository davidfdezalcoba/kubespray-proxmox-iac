# Proxmox Provider - Variables

variable "proxmox-endpoint" {
  type        = string
  description = "Proxmox API URL"
}

variable "proxmox-user" {
  type        = string
  description = "Proxmox User"
}

variable "proxmox-insecure" {
  type        = bool
  description = "Skip TLS verify"
}
