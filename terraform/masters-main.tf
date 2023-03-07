resource "proxmox_virtual_environment_vm" "master" {
  count = 3
  name        = "master-0${count.index}"
  description = "K8s Controlplane"
  # tags        = ["terraform"]
  node_name   = "proxmox"

  cpu {
    cores = 2
  }

  memory {
    dedicated = 8192
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"
  }

  disk {
    datastore_id = "local-zfs"
    file_id      = proxmox_virtual_environment_file.debian_cloud_image.id
    interface    = "scsi0"
    size         = 32
  }

  serial_device {} # The Debian cloud image expects a serial port to be present

  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }

  initialization {
    dns {
      server = "192.168.1.69"
    }
    ip_config {
      ipv4 {
        address = "192.168.1.20${count.index}"
      }
    }
  }

  keyboard_layout = "es"

}

resource "proxmox_virtual_environment_vm" "worker" {
  name        = "worker-0${count.index}"
  description = "K8s worker nodes "
  tags        = ["terraform"]
  node_name   = "proxmox"

  cpu {
    cores = 8
  }

  memory {
    dedicated = 16384
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"
  }

  disk {
    datastore_id = "local-zfs"
    file_id      = proxmox_virtual_environment_file.debian_cloud_image.id
    interface    = "scsi0"
    size         = 100
  }

  serial_device {} # The Debian cloud image expects a serial port to be present

  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }

  initialization {
    dns {
      server = "192.168.1.69"
    }
    ip_config {
      ipv4 {
        address = "192.168.1.21${count.index}"
      }
    }
  }

  keyboard_layout = "es"
}
