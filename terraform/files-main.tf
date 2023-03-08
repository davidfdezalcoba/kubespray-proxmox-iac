resource "proxmox_virtual_environment_file" "debian_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "proxmox"

  source_file {
    path      = var.source-file-url
    file_name = "debian-11-genericcloud-amd64-20230124-1270.img"
    checksum  = var.source-file-sha256sum
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
