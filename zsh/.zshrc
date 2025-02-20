# Created by newuser for 5.9
path+=('/usr/local/go/bin')
export PATH
export GOPATH=$HOME/go

setopt interactivecomments # allow comments in interactive mode
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt
autoload -U compinit promptinit
compinit
promptinit
export CLICOLOR=1
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=200000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it

# configure key keybindings
bindkey -e                                        # emacs key bindings
bindkey '^[[3~' delete-char
bindkey ' ' magic-space                           # do historyv expansion on space
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[Z' undo                               # shift + tab undo last action
bindkey '\e[1~' beginning-of-line
bindkey '\e[H' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[F' end-of-line

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR='vim'
export TERM="xterm-256color"

# Promt
color_prompt=yes
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{cyan}──[%f%F{yellow}%b%f%F{cyan}]%f'
RPROMPT='%F{cyan}[%f%F{red}%*%f %F{blue}%D%f%F{cyan}]%f'
PROMPT=$'%F{cyan)}┌──(%f%F{red}%n%f%F{cyan})──[%f%F{blue}%d%f%F{cyan}]%f${vcs_info_msg_0_}'$RPROMT$'\n%F{cyan}└─$ %f'

export PATH="$PATH:/opt/nvim-linux64/bin"
alias h="history 0 | sed 's/\\s*[0-9]*\\s*//'"
alias k="kubectl"
alias v="vim"
alias vi="vim"
alias c="code -n"
alias ci="code -n"
alias cim="code -n"
alias ls='ls --color=auto'
alias ip='ip --color'
alias grep='grep --color'
alias d='sudo docker'
alias dc='sudo docker compose'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
