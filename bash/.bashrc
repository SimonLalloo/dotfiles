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

alias eduroam='nmcli device wifi connect eduroam'

alias ssh-UU='ssh sila3085@arrhenius.it.uu.se'
alias ssh-UPPMAX='ssh -X simonla@rackham.uppmax.uu.se'

alias c='clear'
alias ls='ls --color=auto'
alias ll='ls -alF'

# Git
alias gg='git status'
alias gd='git difftool'

PS1='[\u@\h \W]\$ '

# Autostart tmux
# If tmux exists, and in interactive system, and not in default shell, and not already in tmux
# https://unix.stackexchange.com/questions/43601/how-can-i-set-my-default-shell-to-start-up-tmux
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ linux ]]&& [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux new-session -A -s main
# fi

# Add to path
. "$HOME/.cargo/env"
