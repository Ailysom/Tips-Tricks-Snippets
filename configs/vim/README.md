# Vim

## Install Vundle

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

For install plugins use ``:PluginInstall``

## Install YouCompleteMe / ycm

Debian:

```bash
apt install build-essential cmake vim-nox python3-dev
apt install mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
python3 install.py --all
```

Arch:

```bash
pacman -Sy base-devel cmake gcc python3
pacman -Sy mono go nodejs jdk17-openjdk jre17-openjdk npm
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
python3 install.py --all

```

And run ``:PlugInstall``
