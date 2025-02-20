# GIT

## Global config

```bash
git config --global user.email "some@mail.com"
git config --global user.name "user_name"
```

## Clone

First upload repository

```bash
git clone git@github.com:Ailysom/knowledge.git
```

You can add path to download after repo-url

## Add changes

```bash
git add .
```

Also you can add files separatly

```bash
git add <path_to_file>
```

## Commit changes

Calc diff and write

```bash
git commit changes -m <you_message>
```

## Upload commit to server

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

## Download commits from server

```bash
git pull
```

## Change branch

```bash
git switch <branch_name>
```

## Create branch

```bash
git branch <branch_name>
```

Create and switch to new branch

```bash
git checkout -b <branch_name>
```

## Check current branch and show other

```bash
git branch
```
