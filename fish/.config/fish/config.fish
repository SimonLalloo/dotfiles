if status is-interactive
    # Commands to run in interactive sessions can go here
end

# === Aliases ===
alias :e='nvim'
alias c='clear'
alias eduroam='nmcli device wifi connect eduroam'
alias ll='ls -alF'
alias updateall='sudo pacman -Syu && flatpak update'

# SSH 
alias ssh_start='eval $(ssh-agent -c)'
alias ssh_school='ssh sila3085@arrhenius.it.uu.se'

# Git aliases
alias gg='git status -sb'
alias gd='git difftool'

# === Welcome message ===
set fish_greeting

# === Prompt ===
starship init fish | source

# === Plugins ===
# Run these in fish
# TODO: Make this part of the config
# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Auto-start tmux
# fisher install budimanjojo/tmux.fish
set -Ux fish_tmux_config $HOME/.config/tmux/tmux.conf
