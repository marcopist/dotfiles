HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# Shell behaviour

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT  # sort file10 after file9, not after file1

# Initialize zoxide
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# Load completion system
autoload -Uz compinit

# Initialize completion with cached metadata file
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Enable interactive completion menu selection
zstyle ':completion:*' menu select

# Make completion case-insensitive
# Example: "doc" can complete to "Documents"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # lowercase input matches upper and lower

# Fuzzy finder
command -v fzf &>/dev/null && source <(fzf --zsh 2>/dev/null) 2>/dev/null || true

# Prompt -> Starship
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
else
    if [[ -n "$CONTAINER_ID" ]]; then
        PS1='%n@%m (%F{yellow}'"$CONTAINER_ID"'%f) %1~ %# '
    else
        PS1='%n@%m %1~ %# '
    fi
fi

# Dotfiles management
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# ls -> eza
if command -v eza &>/dev/null; then
    alias ls='eza -lah --git --group-directories-first'
    alias ll='eza -lah --git'
    alias tree='eza --tree'
else
    alias ls='ls -lah'
    alias ll='ls -lah'
fi

# bun completions
[ -s "/home/marcopist/.bun/_bun" ] && source "/home/marcopist/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
