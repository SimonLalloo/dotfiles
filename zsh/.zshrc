
# Set zinit and plugin directory
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Make sure zinit is installed and active when the shell starts
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# TODO: This should make the clones happen via ssh, but doesn't seem to work
# zinit ice proto=ssh

# Add zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add snippets, such as plugins from Oh My Zsh
# zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
# zinit snippet OMZP::git
zinit snippet OMZP::sudo

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# Load prompt
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"

# Emacs mode
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Completions styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Aliases
alias c='clear'
alias ls='ls --color=auto'
alias ll='ls -alF'
alias :e='nvim'
alias hx='helix'

alias ssh-UU='ssh sila3085@arrhenius.it.uu.se'
alias ssh-UPPMAX='ssh -X simonla@rackham.uppmax.uu.se'

alias gg='git status'
alias gd='git difftool'
