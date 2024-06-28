# Создаем VM в proxmox  c PostgreSQL при помощи OpenTofu для ELMA365

OpenTofu v1.7.1,

Proxmox 8.2.2

Используется:

- Debian 12 (Bookworm)
- PostgreSQL 15

## Получение API Токена для OpenTofu bpg/proxmox provider

Создаем пользователя

```
pveum user add tofu@pve
```

Создаем роль

```
pveum role add Tofu -privs "Datastore.Allocate Datastore.AllocateSpace Datastore.AllocateTemplate Datastore.Audit Pool.Allocate Sys.Audit Sys.Console Sys.Modify SDN.Use VM.Allocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Migrate VM.Monitor VM.PowerMgmt User.Modify"
```

Назначаем роль

```
pveum aclmod / -user tofu@pve -role Tofu
```

Создаем токен

```
pveum user token add tofu@pve provider --privsep=0
```

```
┌──────────────┬──────────────────────────────────────┐
│ key          │ value                                │
╞══════════════╪══════════════════════════════════════╡
│ full-tokenid │ tofu@pve!provider                    │
├──────────────┼──────────────────────────────────────┤
│ info         │ {"privsep":"0"}                      │
├──────────────┼──────────────────────────────────────┤
│ value        │ <token>                              │
└──────────────┴──────────────────────────────────────┘
```