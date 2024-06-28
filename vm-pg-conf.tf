resource "proxmox_virtual_environment_download_file" "debian_12_generic_image" {
  provider = proxmox.prox
  node_name = var.prox.node_name
  content_type = "iso"
  datastore_id = "nas"

  file_name          = "debian-12-generic-amd64-20240201-1644.img"
  url                = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2"
  checksum           = "f7ac3fb9d45cdee99b25ce41c3a0322c0555d4f82d967b57b3167fce878bde09590515052c5193a1c6d69978c9fe1683338b4d93e070b5b3d04e99be00018f25"
  checksum_algorithm = "sha512"
}

resource "proxmox_virtual_environment_file" "pg-1" {
  provider     = proxmox.prox
  node_name    = var.prox.node_name
  content_type = "snippets"
  datastore_id = "nve"

  source_raw {
    data = templatefile("./cloud-init/pg-1.yaml.tftpl", {
      common-config = templatefile("./cloud-init/pg1-common.yaml.tftpl", {
        hostname    = "PG-01"
        username    = var.vm_user
        password    = var.vm_password
        pub-key     = var.host_pub-key
        
      })
      username           = var.vm_user
     
    })
    file_name = "cloud-init-pg-01.yaml"
  }
}