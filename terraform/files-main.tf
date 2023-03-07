resource "proxmox_virtual_environment_file" "debian_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "proxmox"

  source_file {
    path      = "https://cdimage.debian.org/cdimage/cloud/bullseye/20230124-1270/debian-11-genericcloud-amd64-20230124-1270.qcow2"
    file_name = "debian-11-genericcloud-amd64-20230124-1270.img"
    checksum  = "7a7a546b9928f0d375c332a39db2d1af56fce3432b8a5dee0d4f71777efa7463a6b1fc797bcf3b12ca7d8f47d66824abbcbf0a0bdc94be5e90e5a90e8628fae6"
  }
}

resource "proxmox_virtual_environment_file" "cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "proxmox"

  source_file {
    path = "cloud-init/user-data.yml"
  }
}
