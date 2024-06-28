

resource "proxmox_virtual_environment_vm" "pg-1" {
    count = 1
    provider = proxmox.prox
    node_name = var.prox.node_name

    name        = "PG-${count.index+1}"
    description = "PostgreSQl, managed by tofu"
    tags        = ["PG", "ELMA365"]
    on_boot     = false
    vm_id       = "50${count.index + 1}"


    cpu {
        cores = 4
        type = "host"

    }

    memory {
        dedicated = 4096
    }
    
    network_device {
        bridge = "vmbr0"
    }

    disk {
    datastore_id = "nve"
    file_id      = proxmox_virtual_environment_download_file.debian_12_generic_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 10
    file_format  = "raw"
   }
   
   agent {
    enabled = true
   }

   operating_system {
    type = "l26"

   }

    initialization {
    dns {
      domain  = var.vm_dns.domain
      servers = var.vm_dns.servers
    }
    ip_config {
      ipv4 {
        address = "192.168.1.2${count.index + 1}/24"
        gateway = "192.168.1.1"
      }
    }

    datastore_id = "nve"
    user_data_file_id = proxmox_virtual_environment_file.pg-1.id

    #output "PG_ipv4_address" {
    #    depends_on = [proxmox_virtual_environment_vm.pg-1]
    #    value = proxmox_virtual_environment_vm.pg-1.ipv4_address[1][0]
    #}
    }
}