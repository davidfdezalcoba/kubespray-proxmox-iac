 resource "proxmox_virtual_environment_vm" "worker" {
 
   count = 3
 
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
     datastore_id = "local-lvm"
     file_id      = proxmox_virtual_environment_file.debian_cloud_image.id
     interface    = "scsi0"
     size         = 200
   }
 
   serial_device {} # The Debian cloud image expects a serial port to be present
 
   operating_system {
     type = "l26" # Linux Kernel 2.6 - 5.X.
   }
 
   initialization {
 
     datastore_id      = "local-lvm"
     user_data_file_id = proxmox_virtual_environment_file.cloud_config.id
 
     dns {
       server = "192.168.1.69"
     }
 
     ip_config {
       ipv4 {
         address = "192.168.1.21${count.index}/24"
       }
     }
   }
 
   keyboard_layout = "es"
 
 }
 
