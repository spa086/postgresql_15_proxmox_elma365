variable "prox" {
    description = "Proxmox server config"
    type = object({
      node_name = string
      endpoint = string
      insecure = bool 
    })
  }

variable "prox_auth" {
  description = "Proxmox server auth"
  type        = object({
    username  = string
    api_token = string
  })
  sensitive = true
}

variable "vm_dns" {
  description = "DNS config for VMs"
  type = object({
    domain = string
    servers = list(string)
  })
}

variable "vm_user" {
  description = "VM username"
  type        = string
}

variable "vm_password" {
  description = "VM password"
  type        = string
  sensitive   = true
}

variable "host_pub-key" {
  description = "Host public key"
  type        = string
}