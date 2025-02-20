# SSH

## Settings for ssh client

### Auth key generation

```bash
mkdir .ssh
cd .ssh
ssh-keygen -f <key_name>
```

`<key_name.pub>` upload to server

### Auth key config

Into `.ssh` create `config` and write:

```conf
Host <first_server_name_or_ip>
	IdentityFile ~/.ssh/<first_key_name>
Host <second_server_name_or_ip>
	IdentityFile ~/.ssh/<second_key_name>
```

or use `-i <path_to_key>`

### Jump over ssh

Config for jump host:

```conf
Host <jump host>
    HostName <server ip or fqdn>
    User <user name>
    Compression yes
    DynamicForward localhost:<some port, for example 16850>
    IdentityFile <path to ssh key>
```

Config for host:

```conf
Host <target host>
        HostName <internal server ip or fqdn>
        ProxyJump <jump host>
```

Or legacy:

```conf
Host <target host>
    HostName <internal server ip or fqdn>
    ProxyCommand ssh -W %h:%p <jump host>
```

### Troubleshooting

If key is broken, remove `~/.ssh/known_hosts`  
  
For windows use `C:\Users\username\.ssh` directory.
