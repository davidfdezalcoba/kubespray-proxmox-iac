# Proxmox Provider - Variables

variable "proxmox-api-url" {
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
