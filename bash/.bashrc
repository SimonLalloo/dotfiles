#
# ~/.bashrc
#

# Add to PATH
#export PATH="$HOME/thing/bin:$PATH"

# Cargo for rust
export PATH="~/.cargo/bin:$PATH"

# Rebar for Erlang
export PATH="/home/simon/.cache/rebar3/bin:$PATH"

# Doom Emacs
export PATH="~/.config/emacs/bin:$PATH"

# .local/bin
export PATH="~/.local/bin:$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias :e='nvim'
alias e="emacsclient -c -a 'nvim' &" # Currently borked
alias c='clear'
alias eduroam='nmcli device wifi connect eduroam'
alias ssh_school='ssh sila3085@arrhenius.it.uu.se'

alias ls='ls --color=auto'
alias ll='ls -alF'
alias updateall='sudo pacman -Syu && flatpak update'

# Git
alias gg='git status'
alias gd='git difftool'

PS1='[\u@\h \W]\$ '

# Add to path
