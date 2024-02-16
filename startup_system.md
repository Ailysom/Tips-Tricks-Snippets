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
