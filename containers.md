# Containers (Linux)

## LXC - Linux Containers

### Templates

List available templates

```bash
ls /usr/share/lxc/templates
```

List all available images from download template

```bash
/usr/share/lxc/templates/lxc-download -l
```

### Container

Path to containers config and filesystem

`
/var/lib/lxc
`

Create container

```bash
lxc-create -n <name> -t debian -- -r stretch
```

Connect to container console (tty)

```bash
lxc-console -n <name>
```

Connect to container bash

```bash
lxc-attach -n <name>
```