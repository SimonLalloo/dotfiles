if status is-interactive
    # Commands to run in interactive sessions can go here
end

# === Aliases ===
alias :e='nvim'
alias c='clear'
alias eduroam='nmcli device wifi connect eduroam'
alias ssh_school='ssh sila3085@arrhenius.it.uu.se'
alias ll='ls -alF'
alias updateall='sudo pacman -Syu && paru -Syu && flatpak update'

# Git aliases
alias gg='git status'
alias gd='git difftool'

# === Welcome message ===
set fish_greeting

# === Prompt ===
starship init fish | source
