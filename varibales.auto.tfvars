prox = {
  node_name = "skynet"
  endpoint  = "https://proxmox.uri"
  insecure  = true
}

prox_auth = {
  username  = "root"
  api_token = "terraform@pve!provider=f54"
}

vm_dns = {
  domain  = "."
  servers = ["192.168.1.9"]
}

vm_user      = "user"
vm_password  = "$5$lWcZacaM0OYFvGex$qAXVHfjE8fJazVjJz1Q5yCJ"
host_pub-key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5S1V5srpJUeAj+csof5nclj0SLGCMpK4WZO4gJAN1VJmsIaRqaF7cgfULiKToL5v7timXXfwbmKJwLWBsMZ4Wcnase448PGk4IyI3ufwOLnIDtcI2SSNn8UsfnVudjfRz65QWXBUmV5BkPS2rOz/XnY/jQtBlBAX5f6LUL4htwDK22lEfsxCUtcOakUyjZA3QwfEhKfhHLEqnrdFBHestOmPaLZhN5myACjgcZ1ReUj6FrF8E93MUEcjk9PbcZptDy0KoG04kujlSdLmR13lVE48B9KnKSMsPnjDS8FSuK0zl/TPvIF/pxXy39NTx2OH0Ijm+ecMIL3RbXcNKKv9csg5fkHv6cZh2ur8lmpYrG12qbPc8crRUsakqS1aqPXn6032rCTCcqWtfDrzgjrpvgrk22anQgsw7aHTIWZz2h12hq0eyWe0KeoWMykRxGvcN8MklOpCg+hRcpU68Kk0hirYKopj4mSXKZKwOJ8o67kPY18fp2K1AOzGQepMOQVU= spa@Varg"
