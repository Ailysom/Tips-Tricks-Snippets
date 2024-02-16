# CLI (GNU / Linux)

## Archive

Extract tar.gz

```bash
tar -xf <archive_name> -C <path_to_extract>
```

- -x - extract
- -f - file name
- -C - path to extract
- -v - verbose, list files

Create tar.gz

```bash
tar -vcf <archive_name> <path_to_folder>
```

- -c - create
- -f - file name
- -v - verbose, list files

## Process State - ps

- `ps` - processes on current TTY (analog `ps -e | grep tty/1`)
- `ps -e` - All processes
- `ps r` - running processes
- `ps -p <pid>` or `ps -C <command>` - some process
- `ps -G <group_name>` or `ps -g <gid>` - processes by group
- `ps -F` - format all information (UID, PID, PPID, C, CZ, RSS, PSR, STIME, TTY, TIME, CMD).

Example: `ps -eF`

## Users

Get current user

```bash
id
```

## Permissions

Value is summary:

- `4` - read
- `2` - write
- `1` - execute

`<Owner><Group><Any>` - Value position

`chmod <Value position> <some_file>` - Change permissons

## Systemd

List all services

```bash
systemctl --type=service
```

## Pacman

Use `man` for more information.

### Popular operations and operators

Operations:

- `-S` - Synchronize packages. Packages are installed directly from the remote repositories, including all dependencies required to run the packages.
- `-R` - Remove package(s) from the system.
- `-Q` - Query the package database. This operation allows you to view installed packages and their files, as well as meta-information about individual packages (dependencies, conflicts, install date, build date, size).
- `-U` - Upgrade or add package(s) to the system and install the required dependencies from sync repositories.
- `-T` - Check dependencies; this is useful in scripts such as makepkg to check installed packages.

Sync Options (apply to -S):

- `-y` - Download a fresh copy of the master package database.
-`-u` - Upgrades all packages that are out-of-date.
-`-s` - This will search each package in the sync databases for names or descriptions that match regexp.

Remove Options (apply to -R):

- `-s` - Remove each target specified including all of their dependencies, provided that (A) they are not required by other packages; and (B) they were not explicitly installed by the user. This operation is recursive and analogous to a backwards --sync operation, and it helps keep a clean system without orphans. If you want to omit condition (B), pass this option twice.
- `-c` - Remove all target packages, as well as all packages that depend on one or more target packages. This operation is recursive and must be used with care, since it can remove many potentially needed packages.

### Popular pattern of use

To install a single package or list of packages, including dependencies, issue the following command:

```bash
pacman -S <package_name>
```

To remove a package and its dependencies which are not required by any other installed package:

```bash
pacman -Rs <package_name>
```

To remove a package, its dependencies and all the packages that depend on the target package:

```bash
pacman -Rsc <package_name>
```

## SSH

### Settings for ssh client

#### Auth key generation

```bash
mkdir .ssh
cd .ssh
ssh-keygen -f <key_name>
```

`<key_name.pub>` upload to server

#### Auth key config

Into `.ssh` create `config` and write:

```conf
Host <first_server_name_or_ip>
	IdentityFile ~/.ssh/<first_key_name>
Host <second_server_name_or_ip>
	IdentityFile ~/.ssh/<second_key_name>
```

#### Troubleshooting

If key is broken, remove `~/.ssh/known_hosts`  
  
For windows use `C:\Users\username\.ssh` directory.

## GIT

### Global config

```bash
git config --global user.email "some@mail.com"
git config --global user.name "user_name"
```

### Clone

First upload repository

```bash
git clone git@github.com:Ailysom/knowledge.git
```

You can add path to download after repo-url

### Add changes

```bash
git add .
```

Also you can add files separatly

```bash
git add <path_to_file>
```

### Commit changes

Calc diff and write

```bash
git commit changes -m <you_message>
```

### Upload commit to server

```bash
git push
```

If you create new branch, use:

```bash
git push --set-upstream origin <branch_name>
```

Also

```bash
git push <local_branch> <remote_branche>
```

### Download commits from server

```bash
git pull
```

### Change branch

```bash
git switch <branch_name>
```

### Create branch

```bash
git branch <branch_name>
```

Create and switch to new branch

```bash
git checkout -b <branch_name>
```

### Check current branch and show other

```bash
git branch
```
