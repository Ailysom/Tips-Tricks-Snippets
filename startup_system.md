# Any Tips and Configs for startup system

## UEFI Shell

### Show current config

```UEFI Shell
bcfg boot dump
```

### Add boot record

```UEFI Shell
bcfg boot add 0 FS0:\EFI\grubx65.efi "Grub Boot"
```

- 0 - boot order
- FS0:\EFI\grubx65.efi - path to efi file
- "Grub Boot" - description

## Systemd

### List all services

```bash
systemctl --type=service
```

### Add new demon

Add to `/lib/systemd/system/` conf file ending in .service. Example:

```conf
[Unit]
Description=<description about this service>

[Service]
User=<user e.g. root>
WorkingDirectory=<directory_of_script e.g. /root>
ExecStart=<script which needs to be executed>
# optional items below
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
```

Reload services

```bash
systemctl daemon-reload
```

And run service

```bash
systemctl start your-service.service
```

For enable/disable and start/stop use --now.